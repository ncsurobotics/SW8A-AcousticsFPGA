// Cross Correlation Pipeline
// 2x AXI Master to Ring Buffers --> 2x 256 pt FFTs --> Complex multiplier --> 256 pt IFFT --> Argmax

module CC_BLOCK (
    input clk,
    input reset_b,

    input Start_CC,

    input [31:0] Channel_X_Ring_Buffer_in,
    input [31:0] Channel_Y_Ring_Buffer_in,

    output Channel_X_Send_Frame,
    output Channel_Y_Send_Frame,    

    output [7:0] Index_out, // holds the max value; should be persistant after FFT stops
    output CC_Done, // signal to send Index_out over UART

    // Signals for debug only
    output Channel_X_FFT_tvalid,
    output [31:0] Channel_X_FFT_tdata,
    output Channel_Y_FFT_tvalid,
    output [31:0] Channel_Y_FFT_tdata,
    output IFFT_tvalid,
    output [63:0] IFFT_tdata,
    output [31:0] Channel_X_FFT_in,
    output Channel_X_FFT_in_valid,
    output [31:0] Channel_Y_FFT_in,
    output Channel_Y_FFT_in_valid
);

// Parameters & Interconnects -------------------------------------------------------------------------------------
localparam [6:0] CONFIG_ZERO_PAD = 7'b0;
localparam [15:0] SCALE_SCHEDULE = 16'b01_01_01_01_01_01_01_10;
localparam FWD = 1'b1;
localparam REV = 1'b0;

wire [23:0] ifft_s_axis_config_tdata, fft_s_axis_config_tdata;
assign fft_s_axis_config_tdata = {CONFIG_ZERO_PAD, SCALE_SCHEDULE, FWD};
assign ifft_s_axis_config_tdata = {CONFIG_ZERO_PAD, SCALE_SCHEDULE, REV};

wire x_s_axis_config_tready, y_s_axis_config_tready, ifft_s_axis_config_tready;
wire x_s_axis_config_tvalid, y_s_axis_config_tvalid, ifft_s_axis_config_tvalid;

wire x_s_axis_data_tready, y_s_axis_data_tready, ifft_s_axis_data_tready;
wire x_s_axis_data_tvalid, y_s_axis_data_tvalid, ifft_s_axis_data_tvalid;
wire [31:0] x_s_axis_data_tdata, y_s_axis_data_tdata;
wire [63:0] ifft_s_axis_data_tdata;
wire x_s_axis_data_tlast, y_s_axis_data_tlast, ifft_s_axis_data_tlast;

wire x_m_axis_data_tready, y_m_axis_data_tready, ifft_m_axis_data_tready;
wire x_m_axis_data_tvalid, y_m_axis_data_tvalid, ifft_m_axis_data_tvalid;
wire [31:0] x_m_axis_data_tdata, y_m_axis_data_tdata;
wire [63:0] ifft_m_axis_data_tdata;
wire x_m_axis_data_tlast, y_m_axis_data_tlast, ifft_m_axis_data_tlast;
wire [15:0] x_m_axis_data_tuser, y_m_axis_data_tuser, ifft_m_axis_data_tuser;

wire [7:0] argmax_index_in;
wire [31:0] argmax_value_in;

// for debug only
assign Channel_X_FFT_tvalid = x_m_axis_data_tvalid;
assign Channel_X_FFT_tdata = x_m_axis_data_tdata;
assign Channel_Y_FFT_tvalid = y_m_axis_data_tvalid;
assign Channel_Y_FFT_tdata = y_m_axis_data_tdata;
assign IFFT_tvalid = ifft_m_axis_data_tvalid;
assign IFFT_tdata = ifft_m_axis_data_tdata;
assign Channel_X_FFT_in = x_s_axis_data_tdata;
assign Channel_Y_FFT_in = y_s_axis_data_tdata;
assign Channel_X_FFT_in_valid = x_s_axis_data_tvalid;
assign Channel_Y_FFT_in_valid = y_s_axis_data_tvalid;

// Configure the IFFT -------------------------------------------------------------------------
FFT_CONTROLLER cc_ifft_controller(
    .clk(clk),
    .reset_b(reset_b),
    .Config_T_Ready(ifft_s_axis_config_tready),
    .FFT_Configure_tvalid(ifft_s_axis_config_tvalid),
    .FFT_Configure_Complete(ifft_configure_complete)
);

// CC AXI MASTERs -------------------------------------------------------------------------------------
localparam
    FRONT_PAD = 1'b0,
    BACK_PAD = 1'b1;

CC_AXI_MASTER #(.ZERO_PAD(FRONT_PAD)) Channel_X_CC_AXI_Master(
    .clk(clk),
    .reset_b(reset_b),
    .Start_CC(Start_CC),

    .Config_tready(x_s_axis_config_tready),
    .Config_tvalid(x_s_axis_config_tvalid),
    .Data_tready(x_s_axis_data_tready),
    .Data_tvalid(x_s_axis_data_tvalid),
    .Data_tdata( x_s_axis_data_tdata),
    .Data_tlast( x_s_axis_data_tlast),

    .Input_Data_From_Ring_Buffer(Channel_X_Ring_Buffer_in),
    .Send_Frame(Channel_X_Send_Frame)
);

CC_AXI_MASTER #(.ZERO_PAD(BACK_PAD)) Channel_Y_CC_AXI_Master(
    .clk(clk),
    .reset_b(reset_b),
    .Start_CC(Start_CC),

    .Config_tready(y_s_axis_config_tready),
    .Config_tvalid(y_s_axis_config_tvalid),
    .Data_tready(y_s_axis_data_tready),
    .Data_tvalid(y_s_axis_data_tvalid),
    .Data_tdata( y_s_axis_data_tdata),
    .Data_tlast( y_s_axis_data_tlast),

    .Input_Data_From_Ring_Buffer(Channel_Y_Ring_Buffer_in),
    .Send_Frame(Channel_Y_Send_Frame)
);

// FFT INSTANCES ----------------------------------------------------------
xfft_cc channel_x_fft (
  .aclk(clk),                                                 // input wire aclk
  .aresetn(reset_b),                                          // input wire aresetn
  .s_axis_config_tdata(       fft_s_axis_config_tdata),                  // input wire [23 : 0] s_axis_config_tdata
  .s_axis_config_tvalid(        x_s_axis_config_tvalid),                // input wire s_axis_config_tvalid
  .s_axis_config_tready(        x_s_axis_config_tready),                // output wire s_axis_config_tready

  .s_axis_data_tdata(           x_s_axis_data_tdata),                      // input wire [31 : 0] s_axis_data_tdata
  .s_axis_data_tvalid(          x_s_axis_data_tvalid),                    // input wire s_axis_data_tvalid
  .s_axis_data_tready(          x_s_axis_data_tready),                    // output wire s_axis_data_tready
  .s_axis_data_tlast(           x_s_axis_data_tlast),                      // input wire s_axis_data_tlast

  .m_axis_data_tdata(           x_m_axis_data_tdata),                      // output wire [31 : 0] m_axis_data_tdata
  .m_axis_data_tuser(           x_m_axis_data_tuser),                      // output wire [15 : 0] m_axis_data_tuser
  .m_axis_data_tvalid(          x_m_axis_data_tvalid),                    // output wire m_axis_data_tvalid
  .m_axis_data_tready(          x_m_axis_data_tready),                    // input wire m_axis_data_tready
  .m_axis_data_tlast(           x_m_axis_data_tlast),                      // output wire m_axis_data_tlast
  .m_axis_status_tready(        1'b1)                                     // Unused status channel
);

xfft_cc channel_y_fft (
  .aclk(clk),                                                 // input wire aclk
  .aresetn(reset_b),                                          // input wire aresetn
  .s_axis_config_tdata(       fft_s_axis_config_tdata),                  // input wire [23 : 0] s_axis_config_tdata
  .s_axis_config_tvalid(        y_s_axis_config_tvalid),                // input wire s_axis_config_tvalid
  .s_axis_config_tready(        y_s_axis_config_tready),                // output wire s_axis_config_tready

  .s_axis_data_tdata(           y_s_axis_data_tdata),                      // input wire [31 : 0] s_axis_data_tdata
  .s_axis_data_tvalid(          y_s_axis_data_tvalid),                    // input wire s_axis_data_tvalid
  .s_axis_data_tready(          y_s_axis_data_tready),                    // output wire s_axis_data_tready
  .s_axis_data_tlast(           y_s_axis_data_tlast),                      // input wire s_axis_data_tlast

  .m_axis_data_tdata(           y_m_axis_data_tdata),                      // output wire [31 : 0] m_axis_data_tdata
  .m_axis_data_tuser(           y_m_axis_data_tuser),                      // output wire [15 : 0] m_axis_data_tuser
  .m_axis_data_tvalid(          y_m_axis_data_tvalid),                    // output wire m_axis_data_tvalid
  .m_axis_data_tready(          y_m_axis_data_tready),                    // input wire m_axis_data_tready
  .m_axis_data_tlast(           y_m_axis_data_tlast),                      // output wire m_axis_data_tlast
  .m_axis_status_tready(                       1'b1)                      // Unused status channel
);


// MULTIPLIER --------------------------------------------------------------------------------------------------------
wire [31:0] channel_y_conjugated;
wire [15:0] channel_y_imag_conjugated;
assign channel_y_imag_conjugated = ~(y_m_axis_data_tdata[31:16]) + 1;
assign channel_y_conjugated = {channel_y_imag_conjugated, y_m_axis_data_tdata[15:0]};

complex_multiplier complex_mult_inst (
  .aclk(clk),                              // input wire aclk
  .aresetn(reset_b),                        // input wire aresetn
  .s_axis_a_tvalid(     x_m_axis_data_tvalid),        // input wire s_axis_a_tvalid
  .s_axis_a_tready(     x_m_axis_data_tready),        // output wire s_axis_a_tready
  .s_axis_a_tlast(      x_m_axis_data_tlast),          // input wire s_axis_a_tlast
  .s_axis_a_tdata(      x_m_axis_data_tdata),          // input wire [31 : 0] s_axis_a_tdata

  .s_axis_b_tvalid(     y_m_axis_data_tvalid),        // input wire s_axis_b_tvalid
  .s_axis_b_tready(     y_m_axis_data_tready),        // output wire s_axis_b_tready
  .s_axis_b_tlast(      y_m_axis_data_tlast),          // input wire s_axis_b_tlast
  .s_axis_b_tdata(      channel_y_conjugated),          // input wire [31 : 0] s_axis_b_tdata

  .m_axis_dout_tvalid(  ifft_s_axis_data_tvalid),  // output wire m_axis_dout_tvalid
  .m_axis_dout_tready(  ifft_s_axis_data_tready),  // input wire m_axis_dout_tready
  .m_axis_dout_tlast(   ifft_s_axis_data_tlast),    // output wire m_axis_dout_tlast
  .m_axis_dout_tdata(   ifft_s_axis_data_tdata)    // output wire [63 : 0] m_axis_dout_tdata
);
    
// IFFT ----------------------------------------------------------------------------------------------------------
xfft_256pt_64bit inverse_fft (
  .aclk(clk),                                                 // input wire aclk
  .aresetn(reset_b),                                          // input wire aresetn
  .s_axis_config_tdata(         ifft_s_axis_config_tdata),                  // input wire [23 : 0] s_axis_config_tdata
  .s_axis_config_tvalid(        ifft_s_axis_config_tvalid),                // input wire s_axis_config_tvalid
  .s_axis_config_tready(        ifft_s_axis_config_tready),                // output wire s_axis_config_tready

  .s_axis_data_tdata(           ifft_s_axis_data_tdata),                      // input wire [31 : 0] s_axis_data_tdata
  .s_axis_data_tvalid(          ifft_s_axis_data_tvalid),                    // input wire s_axis_data_tvalid
  .s_axis_data_tready(          ifft_s_axis_data_tready),                    // output wire s_axis_data_tready
  .s_axis_data_tlast(           ifft_s_axis_data_tlast),                      // input wire s_axis_data_tlast

  .m_axis_data_tdata(           ifft_m_axis_data_tdata),                      // output wire [31 : 0] m_axis_data_tdata
  .m_axis_data_tuser(           ifft_m_axis_data_tuser),                      // output wire [15 : 0] m_axis_data_tuser
  .m_axis_data_tvalid(          ifft_m_axis_data_tvalid),                    // output wire m_axis_data_tvalid
  .m_axis_data_tready(                            1'b1),                    // input wire m_axis_data_tready
  .m_axis_data_tlast(           ifft_m_axis_data_tlast),                      // output wire m_axis_data_tlast
  .m_axis_status_tready(                          1'b1)                     // Unused status channel
);

// ARGMAX --------------------------------------------------------------------------------------------------------

assign argmax_index_in = ifft_m_axis_data_tuser[7:0];
assign argmax_value_in = ifft_m_axis_data_tdata[31:0]; // discard imaginary component

ARGMAX argmax(  .clk(clk),
                .reset_b(reset_b),
                .Frame_Start(Start_CC), // high -> clear out current max
                .Value_in(argmax_value_in),
                .Index_in(argmax_index_in),
                .Max_Index(Index_out)
);

assign CC_Done = ifft_m_axis_data_tlast;

endmodule

