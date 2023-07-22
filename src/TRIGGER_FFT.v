// TRIGGER FFT -- contains the FFT used for triggering as well as a driver for the AXI inputs & outputs

`timescale 1ns / 1ps



/*module TRIGGER_FFT( input clk,
                    input reset_b,
                    input trigger_fft_enable,

                    input data_ready, // from SPI
                    input [9:0] fft_real_data_in, // from RAM --> FFT

                    input [5:0] fft_output_RAM_addr,

                    output send_frame,
                    output [9:0] fft_output_RAM_data,
                    output fft_output_RAM_ready
);

// PARAMETERS -------------------------------------------------------------------------------------
localparam [1:0]                        // Counter Sel
    ZERO = 2'b00,
    HOLD = 2'b10,
    COUNT = 2'b11;

localparam CONFIG_ZERO_PAD = 1'b0;      // FFT Config Data
localparam [5:0] SCALE_SCHEDULE = 6'b101011;
localparam FWD = 1'b1;

// WIRES ------------------------------------------------------------------------------------------
wire [1:0] fourth_sample_counter_sel;
wire [1:0] samples_sent_counter_sel;
wire fourth_sample_reached;
wire samples_sent_count_reached;

wire s_axis_config_tvalid;              // FFT Config Channel
wire [7:0] s_axis_config_tdata;
wire s_axis_config_tready;

wire s_axis_data_tvalid;                // FFT Slave Axis Data Channel
wire [31:0] s_axis_data_tdata;
wire s_axis_data_tlast;
wire s_axis_data_tready;

wire m_axis_data_tvalid;                // FFT Master Axis Data Channel
wire [31:0] m_axis_data_tdata;
wire m_axis_data_tlast;
wire m_axis_data_tready;
wire [15:0] m_axis_data_tuser; // contains the index of current sample 
wire [9:0] fft_real_data_out; // 10 bits of real data extracted from m_axis_data_tdata

wire wea;                               // RAM wires
reg [5:0] addra;
wire [9:0] dina;

// SPI data_ready counter -- when 4 reached, start the FFT

GENERAL_COUNTER #(.COUNT_VAL(3), .COUNT_BIT_WIDTH(2)) fourth_sample_counter (
    .clk(clk),
    .reset_b(reset_b),
    .Count_sel(fourth_sample_counter_sel),
    .Count_Reached(fourth_sample_reached)
);



wire ok_to_start_frame;
assign ok_to_start_frame = trigger_fft_enable & fourth_sample_reached;
// State Machine
FFT_CONTROLLER trigger_fft_controller(  .clk(clk),
                                        .reset_b(reset_b),
                                        .data_ready(data_ready),
                                        .fourth_sample_reached(fourth_sample_reached),
                                        .s_axis_config_tready(s_axis_config_tready),
                                        .enable(ok_to_start_frame),
                                        .samples_sent_count_reached(samples_sent_count_reached),
                                        
                                        .s_axis_config_tvalid(s_axis_config_tvalid),
                                        .s_axis_data_tvalid(s_axis_data_tvalid),
                                        .s_axis_data_tlast(s_axis_data_tlast),
                                        .samples_sent_counter_sel(samples_sent_counter_sel),
                                        .fourth_sample_counter_sel(fourth_sample_counter_sel),
                                        //.start_frame(start_frame),
                                        //.end_frame(end_frame),
                                        .send_frame(send_frame)
);

// FFT
assign s_axis_config_tdata = {CONFIG_ZERO_PAD, SCALE_SCHEDULE, FWD};
assign s_axis_data_tdata = {16'b0, 6'b0, fft_real_data_in}; // {imaginary data, zero padding, real data}
assign m_axis_data_tready = 1'b1;
assign fft_real_data_out = m_axis_data_tdata[9:0];

xfft_trigger trigger_fft (

  .aclk(clk),                                                // input wire aclk
  .aresetn(reset_b),                                          // input wire aresetn
  .s_axis_config_tdata(s_axis_config_tdata),                  // input wire [7 : 0] s_axis_config_tdata
  .s_axis_config_tvalid(s_axis_config_tvalid),                // input wire s_axis_config_tvalid
  .s_axis_config_tready(s_axis_config_tready),                // output wire s_axis_config_tready
  .s_axis_data_tdata(s_axis_data_tdata),                      // input wire [31 : 0] s_axis_data_tdata
  .s_axis_data_tvalid(s_axis_data_tvalid),                    // input wire s_axis_data_tvalid
  .s_axis_data_tready(s_axis_data_tready),                    // output wire s_axis_data_tready
  .s_axis_data_tlast(s_axis_data_tlast),                      // input wire s_axis_data_tlast
  .m_axis_data_tdata(m_axis_data_tdata),                      // output wire [31 : 0] m_axis_data_tdata
  .m_axis_data_tuser(m_axis_data_tuser),                      // output wire [15 : 0] m_axis_data_tuser
  .m_axis_data_tvalid(m_axis_data_tvalid),                    // output wire m_axis_data_tvalid
  .m_axis_data_tready(m_axis_data_tready),                    // input wire m_axis_data_tready
  .m_axis_data_tlast(m_axis_data_tlast),                      // output wire m_axis_data_tlast
  .m_axis_status_tdata(m_axis_status_tdata),                  // output wire [7 : 0] m_axis_status_tdata
  .m_axis_status_tvalid(m_axis_status_tvalid),                // output wire m_axis_status_tvalid
  .m_axis_status_tready(1'b1)                                 // input wire m_axis_status_tready
  
);

// Write FFT output to RAM
assign wea = m_axis_data_tvalid;
assign fft_output_RAM_ready = ~m_axis_data_tvalid; // not writing to fft_output_RAM
//assign addra = m_axis_data_tuser[5:0];
integer i;
always @ (*) begin
    for (i=0; i<6; i=i+1) begin
        addra[i] = m_axis_data_tuser[5-i];
    end
end
assign dina = m_axis_data_tdata[9:0];
dual_port_ram_10x64 fft_output_RAM (
  .clka(clk),    // input wire clka
  .ena(1'b1),      // input wire ena
  .wea(wea),      // input wire [0 : 0] wea
  .addra(addra),  // input wire [5 : 0] addra
  .dina(dina),    // input wire [9 : 0] dina
  .douta(douta),  // output wire [9 : 0] douta
  .clkb(clk),    // input wire clkb
  .enb(1'b1),      // input wire enb
  .web(1'b0),      // input wire [0 : 0] web
  .addrb(fft_output_RAM_addr),  // input wire [5 : 0] addrb
  .dinb(10'b0),    // input wire [9 : 0] dinb
  .doutb(fft_output_RAM_data)  // output wire [9 : 0] doutb
);

// unused RAM wires
wire [9:0] douta;

endmodule */












































module TRIGGER_FFT_v2(

    input clk,
    input SPI_CLK,
    input reset_b,
    input data_ready,
    input [9:0] Input_Data,
    input [1:0] Offset,
    input [3:0] Frequency,
    input [3:0] Threshold,
    input fft_s_axis_data_tlast,

    output Send_Frame,
    output FFT_Data_Ready,
    output Trigger

);



    
    wire fft_s_axis_config_tready;
    wire fft_s_axis_config_tvalid;
    wire fft_configure_complete;
    wire [31:0] fft_s_axis_data_tdata;
    wire fft_s_axis_data_tvalid;
    wire fft_s_axis_data_tready;
    wire fft_m_axis_data_tvalid;                // FFT Master Axis Data Channel
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
        
        .clk(SPI_CLK),
        .reset_b(reset_b),
        .Count_sel({1'b1,data_ready}),
        .Count_Reached(fourth_sample_reached)
    
    );
    
    wire [9:0] FFT_Input_Data;
    
    AXI_MASTER RAM_to_FFT_DRIVER(
    
        .clk(clk),
        .reset_b(reset_b),
        .Input_Data(Input_Data),
        .T_READY(fft_s_axis_data_tready),
        .Fourth_Sample_Ready(fourth_sample_reached),
        .Send_Frame(Send_Frame),
        .T_VALID(fft_s_axis_data_tvalid),
        .T_DATA(FFT_Input_Data)
    
    );

    
    TRIGGER_FFT_CONTROLLER TRIGGER_FFT_CONTROLLER_inst(
    
        .clk(clk),
        .reset_b(reset_b),
        .Config_T_Ready(s_axis_config_tready),
        .FFT_Configure_tvalid(fft_s_axis_config_tvalid),
        .FFT_Configure_Complete(fft_configure_complete)
    );
    
    wire m_axis_status_tdata;
    wire m_axis_status_tvalid;
    wire m_axis_status_tready;

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
        .m_axis_data_tuser(),                                                   // output wire [15 : 0] m_axis_data_tuser
        .m_axis_data_tvalid(fft_m_axis_data_tvalid),                                                                  // output wire m_axis_data_tvalid
        .m_axis_data_tready(fft_m_axis_data_tready),                                                                      // input wire m_axis_data_tready
        .m_axis_data_tlast(fft_m_axis_data_tlast),                              // output wire m_axis_data_tlast
        .m_axis_status_tdata(m_axis_status_tdata),                                                 // output wire [7 : 0] m_axis_status_tdata
        .m_axis_status_tvalid(m_axis_status_tvalid),                                                // output wire m_axis_status_tvalid
        .m_axis_status_tready(1'b1)                                                 // input wire m_axis_status_tready
      
    );
    
    
    TRIGGER_DETECT TRIGGER_DETECT_inst(
    
        .clk(clk),
        .reset_b(reset_b),
        .T_DATA(fft_m_axis_data_tdata),
        .T_VALID(fft_m_axis_data_tvalid),
        .Threshold(Threshold),
        .Frequency(Frequency),
        .Offset(Offset),
        .T_READY(fft_m_axis_data_tready),
        .Trigger(Trigger),
        .FFT_Data_Ready(FFT_Data_Ready)
    
    );
    
    

endmodule




























































