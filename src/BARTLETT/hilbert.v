`timescale 1ns / 1ps

parameter FWD = 1;
parameter INV = 0;

parameter [1:0]
    GET_FROM_RAM = 0,
    GET_FROM_FB = 1,
    SEND_TO_R = 2,
    IDLE = 3;

module hilbert #(FFT_SIZE = 32) ( input clk,
                input reset_b,
                input start,

                input ram_tvalid,
                input [9:0] ram_tdata,
                input ram_tlast,
                output ram_tready;

                output tf_tvalid,
                output tf_tlast,
                output [31:0] tf_tdata,
                input tf_tready;
);

wire s_axis_config_tvalid, config_fwd_inv, s_axis_config_tready;
wire m_axis_data_tlast;
wire [1:0] hilbert_stage_sel;

hilbert_datapath #(.FFT_SIZE(FFT_SIZE)) ( .clk(clk),
                                    .reset_b(reset_b),
                                    .ram_tvalid(ram_tvalid),
                                    .ram_tlast(ram_tlast),
                                    .ram_tdata(ram_tdata),
                                    .ram_tready(ram_tready),
                                    .tf_tvalid(tf_tvalid),
                                    .tf_tlast(tf_tlast),
                                    .tf_tready(tf_tready),
                                    .s_axis_config_tvalid(s_axis_config_tvalid),
                                    .config_fwd_inv(config_fwd_inv),
                                    .s_axis_config_tready(s_axis_config_tready),
                                    .m_axis_data_tlast(m_axis_data_tlast),
                                    .hilbert_stage_sel(hilbert_stage_sel)
);

hilbert_controller #(.FFT_SIZE(FFT_SIZE)) (.clk(clk),
                                    .reset_b(reset_b),
                                    .start(start),
                                    .s_axis_config_tready(s_axis_config_tready),
                                    .s_axis_config_tvalid(s_axis_config_tvalid),
                                    .config_fwd_inv(config_fwd_inv),
                                    .ram_tlast(ram_tlast),
                                    .m_axis_data_tlast(m_axis_data_tlast),
                                    .hilbert_stage_sel(hilbert_stage_sel)
);

endmodule

module hilbert_datapath #(FFT_SIZE = 32, TUSER_SIZE = 8)
(               input clk, reset_b,
                
                input ram_tvalid, ram_tlast,
                input [9:0] ram_tdata,

                output ram_tready,

                output tf_tvalid, tf_tlast,
                output [31:0] tf_tdata,
                input tf_tready,

                input s_axis_config_tvalid,
                input config_fwd_inv,
                output s_axis_config_tready,

                output m_axis_data_tlast,

                input [1:0] hilbert_stage_sel;
);

// assemble config_tdata
wire [7:0] s_axis_config_tdata;
assign s_axis_config_tdata = {7'b0, config_fwd_inv}; // FWD = 1, INV = 0

// assemble s_axis_data and m_axis_data channels
reg s_axis_data_tvalid, s_axis_data_tlast;
reg [31:0] s_axis_data_tdata;

wire m_axis_data_tvalid;
wire [31:0] m_axis_data_tdata;
wire [TUSER_SIZE-1:0] m_axis_data_tuser;
wire [7:0] index; // may be < 8 bits when FFT size < 128
reg m_axis_data_tready;

assign index = m_axis_data_tuser[7:0];

always @ (*) begin
    case (hilbert_stage_sel)
        GET_FROM_RAM: begin
            s_axis_data_tvalid = ram_tvalid;
            s_axis_data_tlast = ram_tlast;
            s_axis_data_tdata = {22'b0, ram_tdata};
            ram_tready = s_axis_data_tready;

            m_axis_data_tready = 0;
            tf_tvalid = 0;
            tf_tlast = 0;
            tf_tdata = 32'b0;
        end
        GET_FROM_FB: begin
            s_axis_data_tvalid = m_axis_data_tvalid;
            s_axis_data_tlast = m_axis_data_tlast;
            s_axis_data_tdata = (index >= (FFT_SIZE / 2)) ? m_axis_data_tdata : 32'b0; // check timing and maybe convert to moore machine
            ram_tready = 0;

            m_axis_data_tready = s_axis_data_tready;
            tf_tvalid = 0;
            tf_tlast = 0;
            tf_tdata = 32'b0;
        end
        SEND_TO_R: begin
            s_axis_data_tvalid = 0;
            s_axis_data_tlast = 0;
            s_axis_data_tdata = 32'b0;
            ram_tready = 0;

            m_axis_data_tready = tf_tready;
            tf_tvalid = m_axis_data_tvalid;
            tf_tlast = 0;
            tf_tdata = 32'b0;
        end
        default: begin // IDLE and 2'bxx
            s_axis_data_tvalid = 0;
            s_axis_data_tlast = 0;
            s_axis_data_tdata = 32'b0;
            ram_tready = 0;

            m_axis_data_tready = 0;
            tf_tvalid = 0;
            tf_tlast = 0;
            tf_tdata = 32'b0;
        end
    endcase
end

xfft_0 fft (
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
  .m_axis_data_tuser(m_axis_data_tuser),                      // output wire [7 : 0] m_axis_data_tuser
  .m_axis_data_tvalid(m_axis_data_tvalid),                    // output wire m_axis_data_tvalid
  .m_axis_data_tready(m_axis_data_tready),                    // input wire m_axis_data_tready
  .m_axis_data_tlast(m_axis_data_tlast)                       // output wire m_axis_data_tlast
);

    
endmodule

module hilbert_controller #(FFT_SIZE = 32,) 
(               input clk, reset_b,
                input start,
                
                input s_axis_config_tready,
                output reg s_axis_config_tvalid,
                output reg config_fwd_inv,

                input ram_tlast,
                input m_axis_data_tlast,
                
                output reg hilbert_stage_sel    
);

parameter [2:0]
    IDLE = 3'b000,
    //WAIT_1 = 3'b001,
    FWD_CONFIG = 3'b010,
    FWD_DATA = 3'b011,
    //WAIT_2 = 3'b100,
    INV_CONFIG = 3'b101,
    INV_DATA_IN = 3'b110,
    DATA_OUT = 3'b111;

reg [2:0] state, next_state;

always @ (posedge clk or negedge reset_b) begin
    if (!reset_b) state <= IDLE;
    else state <= next_state;
end

always @ (*) begin
    case (state)
        IDLE: begin
            s_axis_config_tvalid    = 1'b0;
            config_fwd_inv          = FWD;
            hilbert_stage_sel       = IDLE;

            if (start) next_state = FWD_CONFIG;
            else next_state = IDLE;
        end
        FWD_CONFIG: begin
            s_axis_config_tvalid    = 1'b1;
            config_fwd_inv          = FWD;
            hilbert_stage_sel       = IDLE;

            if (s_axis_config_tready) next_state = FWD_DATA;
            else next_state = FWD_CONFIG;
        end
        FWD_DATA: begin
            s_axis_config_tvalid    = 1'b0;
            config_fwd_inv          = INV;
            hilbert_stage_sel       = GET_FROM_RAM;

            if (ram_tlast) next_state = INV_CONFIG; // doesn't matter if RAM data is double-buffered here
            else next_state = FWD_DATA;             // (which it probably should be) - can re-config in the middle of a frame
                                                    // without interrupting frame processing

        end
        INV_CONFIG: begin
            s_axis_config_tvalid    = 1'b1;
            config_fwd_inv          = INV;
            hilbert_stage_sel       = GET_FROM_RAM; // for safety in case we add RAM data double-buffering

            if (s_axis_config_tready) next_state = INV_DATA_IN;
            else next_state = INV_CONFIG;
        end
        INV_DATA_IN: begin
            s_axis_config_tvalid    = 1'b0;
            config_fwd_inv          = FWD;
            hilbert_stage_sel       = GET_FROM_FB;
            
            if (m_axis_data_tlast) next_state = DATA_OUT;
            else next_state = INV_DATA_IN;
        end
        DATA_OUT: begin
            s_axis_config_tvalid    = 1'b0;
            config_fwd_inv          = FWD;
            hilbert_stage_sel       = SEND_TO_R;

            if (m_axis_data_tlast) next_state = IDLE;
            else next_state = DATA_OUT;
        end
        default: begin
            s_axis_config_tvalid    = 1'b0;
            config_fwd_inv          = FWD;
            hilbert_stage_sel       = IDLE;
            
            next_state = IDLE;
        end
    endcase
end

endmodule