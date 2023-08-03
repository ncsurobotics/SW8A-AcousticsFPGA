/* CC Control Testbench
 * Tests the configuration and data into the CC FFT.
 * CC_Block_Controller + FFT_Controller (config) + AXI_Master + CC FFT
 * Eventually there will be 2 of these, one each for channels X and Y
 *
 * Criteria for success:
 *      event_tlast_unexpected and event_tlast_missing are never high
 *      for now: select lines go high at the right times
 *      for later: look at zero_pad_verify.py 's plots
 */


module cc_control_tb ();
    
reg clk = 1'b0;
reg reset_b = 1'b1;

// For later: ring buffer

// Wires to FFT, ring buffer
wire s_axis_config_tready, s_axis_config_tvalid, s_axis_data_tready, s_axis_data_tvalid, s_axis_data_tlast; 
wire [31:0] s_axis_data_tdata;
wire send_frame;

localparam [6:0] CONFIG_ZERO_PAD = 7'b0;
localparam [15:0] SCALE_SCHEDULE = 16'b01_01_01_01_01_01_01_10;
localparam FWD = 1'b1;

CC_AXI_MASTER #(.ZERO_PAD(0))dut(
    .clk(clk),
    .reset_b(reset_b),
    .Start_CC(1'b1),
    .Config_tready(s_axis_config_tready),
    .Config_tvalid(s_axis_config_tvalid),
    .Data_tready(s_axis_data_tready),
    .Data_tvalid(s_axis_data_tvalid),
    .Data_tdata(s_axis_data_tdata),
    .Data_tlast(s_axis_data_tlast),
    .Ring_Buffer_Input_Data(32'd5),
    .Send_Frame(send_frame)
);

// downstream FFT wires -- unused
wire [31 : 0] m_axis_data_tdata;
wire [15 : 0] m_axis_data_tuser;
wire m_axis_data_tvalid;
wire m_axis_data_tready;
wire m_axis_data_tlast;
wire [7 : 0] m_axis_status_tdata;
wire m_axis_status_tvalid;
wire m_axis_status_tready;
wire event_frame_started;
wire event_tlast_unexpected;
wire event_tlast_missing;
wire event_fft_overflow;
wire event_status_channel_halt;
wire event_data_in_channel_halt;
wire event_data_out_channel_halt;

xfft_cc your_instance_name (
  .aclk(clk),                                                // input wire aclk
  .aresetn(reset_b),                                          // input wire aresetn
  .s_axis_config_tdata({CONFIG_ZERO_PAD, SCALE_SCHEDULE, FWD}),                  // input wire [23 : 0] s_axis_config_tdata
  .s_axis_config_tvalid(s_axis_config_tvalid),                // input wire s_axis_config_tvalid
  .s_axis_config_tready(s_axis_config_tready),                // output wire s_axis_config_tready
  .s_axis_data_tdata(s_axis_data_tdata),                      // input wire [31 : 0] s_axis_data_tdata
  .s_axis_data_tvalid(s_axis_data_tvalid),                    // input wire s_axis_data_tvalid
  .s_axis_data_tready(s_axis_data_tready),                    // output wire s_axis_data_tready
  .s_axis_data_tlast(s_axis_data_tlast),                      // input wire s_axis_data_tlast
  .m_axis_data_tdata(m_axis_data_tdata),                      // output wire [31 : 0] m_axis_data_tdata
  .m_axis_data_tuser(m_axis_data_tuser),                      // output wire [15 : 0] m_axis_data_tuser
  .m_axis_data_tvalid(m_axis_data_tvalid),                    // output wire m_axis_data_tvalid
  .m_axis_data_tready(1'b1),                    // input wire m_axis_data_tready
  .m_axis_data_tlast(m_axis_data_tlast),                      // output wire m_axis_data_tlast
  .m_axis_status_tdata(m_axis_status_tdata),                  // output wire [7 : 0] m_axis_status_tdata
  .m_axis_status_tvalid(m_axis_status_tvalid),                // output wire m_axis_status_tvalid
  .m_axis_status_tready(1'b1),                // input wire m_axis_status_tready
  .event_frame_started(event_frame_started),                  // output wire event_frame_started
  .event_tlast_unexpected(event_tlast_unexpected),            // output wire event_tlast_unexpected
  .event_tlast_missing(event_tlast_missing),                  // output wire event_tlast_missing
  .event_fft_overflow(event_fft_overflow),                    // output wire event_fft_overflow
  .event_status_channel_halt(event_status_channel_halt),      // output wire event_status_channel_halt
  .event_data_in_channel_halt(event_data_in_channel_halt),    // output wire event_data_in_channel_halt
  .event_data_out_channel_halt(event_data_out_channel_halt)   // output wire event_data_out_channel_halt
);

always #5 clk = ~clk;

initial begin
    #10 reset_b = 1'b0;
    #40 reset_b = 1'b1;
end

endmodule