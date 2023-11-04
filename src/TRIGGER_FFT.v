// TRIGGER FFT -- contains the FFT used for triggering as well as a driver for the AXI inputs & outputs

`timescale 1ns / 1ps

module TRIGGER_FFT_v2(

    input clk,
    //input SPI_CLK,
    input reset_b,
    input data_ready,
    input [9:0] Input_Data,
    input [1:0] Offset,
    input [5:0] Frequency,
    input [15:0] Threshold,

    output Send_Frame,
    output FFT_Data_Ready,
    output Trigger,

    // for debug only
    output tb_trigger_fft_tvalid,
    output [31:0] tb_trigger_fft_tdata,
    output tb_trigger_fft_tlast,
    output [31:0] tb_data_into_fft,
    output tb_data_in_valid

);

    assign tb_trigger_fft_tvalid = fft_m_axis_data_tvalid;
    assign tb_trigger_fft_tdata = fft_m_axis_data_tdata;
    assign tb_trigger_fft_tlast = fft_m_axis_data_tlast;
    assign tb_data_into_fft = FFT_Input_Data;
    assign tb_data_in_valid = fft_s_axis_data_tvalid;

    
    wire fft_s_axis_config_tready;
    wire fft_s_axis_config_tvalid;
    wire fft_configure_complete;
    wire [31:0] fft_s_axis_data_tdata;
    wire fft_s_axis_data_tvalid;
    wire fft_s_axis_data_tready;
    wire fft_s_axis_data_tlast; // tied to AXI_MASTER Count_Reached output
    (* mark_debug = "true" *) wire fft_m_axis_data_tvalid;                // FFT Master Axis Data Channel
    wire [31:0] fft_m_axis_data_tdata;
    wire fft_m_axis_data_tlast;
    wire fft_m_axis_data_tready;
    wire [15:0] fft_m_axis_data_tuser;


// PARAMETERS -------------------------------------------------------------------------------------
    localparam [1:0]                        // Counter Sel
        ZERO = 2'b00,
        HOLD = 2'b10,
        COUNT = 2'b11;
    
    localparam CONFIG_ZERO_PAD = 1'b0;      // FFT Config Data
    localparam [5:0] SCALE_SCHEDULE = 6'b101011;
    localparam FWD = 1'b1;


    GENERAL_COUNTER #(.COUNT_VAL(0), .COUNT_BIT_WIDTH(2)) fourth_sample_counter (
        
        .clk(clk),
        .reset_b(reset_b),
        .Count_sel({1'b1,data_ready}),
        .Count_Reached(fourth_sample_reached)
    
    );

    reg [1:0] current_state, next_state;
    reg trigger_en;
    always @ (posedge clk or negedge reset_b) begin
        if (!reset_b) current_state <= 2'b00;
        else current_state <= next_state;
    end
    always @ (*) begin
        case (current_state)
            2'b00: begin
                trigger_en <= 1'b0;
                if (fourth_sample_reached) next_state <= 2'b01;
                else next_state <= 2'b00;
            end
            2'b01: begin
                trigger_en <= 1'b1;
                next_state <= 2'b10;
            end
            2'b10: begin
                trigger_en <= 1'b0;
                if (!fourth_sample_reached) next_state <= 2'b00;
                else next_state <= 2'b10;
            end
            default: begin
                trigger_en <= 1'b0;
                next_state <= 2'b00;
            end
        endcase
    end
    
    wire [31:0] FFT_Input_Data;
    
    AXI_MASTER RAM_to_FFT_DRIVER(
        .clk(clk),
        .reset_b(reset_b),
        .Input_Data({22'b0, Input_Data}),
        .T_READY(fft_s_axis_data_tready),
        .Fourth_Sample_Ready(trigger_en),
        .Send_Frame(Send_Frame),
        .T_VALID(fft_s_axis_data_tvalid),
        .T_DATA(FFT_Input_Data),
        .Count_Reached(fft_s_axis_data_tlast)
    );

    
    FFT_CONTROLLER TRIGGER_FFT_CONTROLLER_inst(
    
        .clk(clk),
        .reset_b(reset_b),
        .Config_T_Ready(s_axis_config_tready),
        .FFT_Configure_tvalid(fft_s_axis_config_tvalid),
        .FFT_Configure_Complete(fft_configure_complete)
    );
    
    wire m_axis_status_tdata;
    wire m_axis_status_tvalid;
    wire m_axis_status_tready;
    wire ovflo;

    xfft_trigger trigger_fft (
    
        .aclk(clk),                                                             // input wire aclk
        .aresetn(reset_b),                                                      // input wire aresetn
        .s_axis_config_tdata({CONFIG_ZERO_PAD, SCALE_SCHEDULE, FWD}),           // input wire [7 : 0] s_axis_config_tdata
        .s_axis_config_tvalid(fft_s_axis_config_tvalid),                        // input wire s_axis_config_tvalid
        .s_axis_config_tready(s_axis_config_tready),                                                          // output wire s_axis_config_tready
        .s_axis_data_tdata(FFT_Input_Data),                                                                      // input wire [31 : 0] s_axis_data_tdata
        .s_axis_data_tvalid(fft_s_axis_data_tvalid),                                                                      // input wire s_axis_data_tvalid
        .s_axis_data_tready(fft_s_axis_data_tready),                                                                      // output wire s_axis_data_tready
        .s_axis_data_tlast(fft_s_axis_data_tlast),                              // input wire s_axis_data_tlast
        .m_axis_data_tdata(fft_m_axis_data_tdata),                                                                      // output wire [31 : 0] m_axis_data_tdata
        .m_axis_data_tuser(fft_m_axis_data_tuser),                                                   // output wire [15 : 0] m_axis_data_tuser
        .m_axis_data_tvalid(fft_m_axis_data_tvalid),                                                                  // output wire m_axis_data_tvalid
        .m_axis_data_tready(fft_m_axis_data_tready),                                                                      // input wire m_axis_data_tready
        .m_axis_data_tlast(fft_m_axis_data_tlast),                              // output wire m_axis_data_tlast
        .m_axis_status_tdata(m_axis_status_tdata),                                                 // output wire [7 : 0] m_axis_status_tdata
        .m_axis_status_tvalid(m_axis_status_tvalid),                                                // output wire m_axis_status_tvalid
        .m_axis_status_tready(1'b1),                                                 // input wire m_axis_status_tready
        .event_fft_overflow(ovflo)
    );
    
    
    TRIGGER_DETECT TRIGGER_DETECT_inst(
    
        .clk(clk),
        .reset_b(reset_b),
        .T_DATA(fft_m_axis_data_tdata),
        .T_VALID(fft_m_axis_data_tvalid),
        .Threshold(Threshold),
        .Frequency(Frequency),
        .Offset(Offset),
        .t_user(fft_m_axis_data_tuser),
        .T_READY(fft_m_axis_data_tready),
        .Trigger(Trigger),
        .FFT_Data_Ready(FFT_Data_Ready)
    
    );
    
    

endmodule




























































