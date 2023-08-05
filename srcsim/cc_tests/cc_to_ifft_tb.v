// Tests whether the input data is correctly zero-padded. Verified with zero_pad_tb_verify.py
// For now, just zero padding in testbench; later, will add AXI_MASTER + state machine
// References Farbius' testbench here -> https://github.com/farbius/dsp_xilinx_ip/blob/main/rtl_tb/fft_tb.v

module cc_to_ifft_tb ();

wire [800:0] workspace_path;
header h(.workspace_path(workspace_path));

// TEST PARAMS -- Set the input data here! --------------------------------------------------------
reg [29*8-1:0] x_file_in = "/srcsim/datasets/trigger.data";
reg [36*8-1:0] y_file_in = "/srcsim/datasets/trigger_rshift.data";
//reg [25*8-1:0] x_file_in = "/srcsim/datasets/cos.data";
//reg [36*8-1:0] x_file_in = "/srcsim/datasets/trigger_rshift.data"; // copy this line and change it to x/y 
//reg [29*8-1:0] x_file_in = "/srcsim/datasets/trigger.data";        // to use this file for input data 

reg [36*8-1:0] file_out = "/srcsim/datasets/just_fft_tb_out.txt";

// Params & Regs ----------------------------------------------------------------------------------
reg clk = 1'b0;
reg reset_b = 1'b1; // must be held low for 2 clks to reset
reg [9:0] x_data_array [255:0];
reg [9:0] y_data_array [255:0];

localparam [6:0] CONFIG_ZERO_PAD = 7'b0;
localparam [15:0] SCALE_SCHEDULE = 16'b01_01_01_01_01_01_01_10;
localparam FWD = 1'b1;
localparam REV = 1'b0;

integer fp_out;
integer fp_chx_pre;
integer fp_chy_pre;
reg [1200:0] x_full_path;
reg [1200:0] file_out_full_path;

// I/O Ports --------------------------------------------------------------------------------------
reg aclken = 1; // clock enable -- drive low to pause the core

// CONFIG
reg [23:0] s_axis_config_tdata = {CONFIG_ZERO_PAD, SCALE_SCHEDULE, FWD};
reg [23:0] ifft_s_axis_config_tdata = {CONFIG_ZERO_PAD, SCALE_SCHEDULE, REV};
reg s_axis_config_tvalid = 1'b0;
wire x_s_axis_config_tready; // fft out out
wire y_s_axis_config_tready;
wire ifft_s_axis_config_tready;

// SLAVE AXIS DATA
reg [31:0] x_s_axis_data_tdata = 32'b0;
reg [31:0] y_s_axis_data_tdata = 32'b0;
reg s_axis_data_tvalid = 1'b0;
wire x_s_axis_data_tready; // fft out
wire y_s_axis_data_tready;
reg s_axis_data_tlast = 1'b0;

// MASTER AXIS DATA
wire [31:0] x_m_axis_data_tdata;
wire [31:0] y_m_axis_data_tdata;
wire x_m_axis_data_tvalid;
wire y_m_axis_data_tvalid;
wire x_m_axis_data_tready; // from mult to fft
wire y_m_axis_data_tready;
wire x_m_axis_data_tlast;
wire y_m_axis_data_tlast;

wire [15:0] x_m_axis_data_tuser; // xk_index?
wire [15:0] y_m_axis_data_tuser;

// EVENTS (all fft out)
wire x_event_frame_started;
wire x_event_tlast_unexpected;
wire x_event_tlast_missing;
wire x_event_status_channel_halt;
wire x_event_data_in_channel_halt;
wire x_event_data_out_channel_halt;
wire x_event_fft_overflow;
wire y_event_frame_started;
wire y_event_tlast_unexpected;
wire y_event_tlast_missing;
wire y_event_status_channel_halt;
wire y_event_data_in_channel_halt;
wire y_event_data_out_channel_halt;
wire y_event_fft_overflow;
wire ifft_event_frame_started;
wire ifft_event_tlast_unexpected;
wire ifft_event_tlast_missing;
wire ifft_event_status_channel_halt;
wire ifft_event_data_in_channel_halt;
wire ifft_event_data_out_channel_halt;
wire ifft_event_fft_overflow;

// STATUS (unused)
wire [7:0] x_m_axis_status_tdata;
wire x_m_axis_status_tvalid;
wire [7:0] y_m_axis_status_tdata;
wire y_m_axis_status_tvalid;
wire [7:0] ifft_m_axis_status_tdata;
wire ifft_m_axis_status_tvalid;
reg m_axis_status_tready = 1'b1;

// FFT INSTANCE -----------------------------------------------------------------------------------
xfft_cc channel_x_fft (
  .aclk(clk),                                                 // input wire aclk
  .aresetn(reset_b),                                          // input wire aresetn
  .s_axis_config_tdata(           s_axis_config_tdata),                  // input wire [23 : 0] s_axis_config_tdata
  .s_axis_config_tvalid(          s_axis_config_tvalid),                // input wire s_axis_config_tvalid
  .s_axis_config_tready(        x_s_axis_config_tready),                // output wire s_axis_config_tready

  .s_axis_data_tdata(           x_s_axis_data_tdata),                      // input wire [31 : 0] s_axis_data_tdata
  .s_axis_data_tvalid(            s_axis_data_tvalid),                    // input wire s_axis_data_tvalid
  .s_axis_data_tready(          x_s_axis_data_tready),                    // output wire s_axis_data_tready
  .s_axis_data_tlast(             s_axis_data_tlast),                      // input wire s_axis_data_tlast

  .m_axis_data_tdata(           x_m_axis_data_tdata),                      // output wire [31 : 0] m_axis_data_tdata
  .m_axis_data_tuser(           x_m_axis_data_tuser),                      // output wire [15 : 0] m_axis_data_tuser
  .m_axis_data_tvalid(          x_m_axis_data_tvalid),                    // output wire m_axis_data_tvalid
  .m_axis_data_tready(          x_m_axis_data_tready),                    // input wire m_axis_data_tready
  .m_axis_data_tlast(           x_m_axis_data_tlast),                      // output wire m_axis_data_tlast

  .m_axis_status_tdata(         x_m_axis_status_tdata),                  // output wire [7 : 0] m_axis_status_tdata
  .m_axis_status_tvalid(        x_m_axis_status_tvalid),                // output wire m_axis_status_tvalid
  .m_axis_status_tready(          m_axis_status_tready),                // input wire m_axis_status_tready
  .event_frame_started(         x_event_frame_started),                  // output wire event_frame_started
  .event_tlast_unexpected(      x_event_tlast_unexpected),            // output wire event_tlast_unexpected
  .event_tlast_missing(         x_event_tlast_missing),                  // output wire event_tlast_missing
  .event_fft_overflow(          x_event_fft_overflow),                    // output wire event_fft_overflow
  .event_status_channel_halt(   x_event_status_channel_halt),      // output wire event_status_channel_halt
  .event_data_in_channel_halt(  x_event_data_in_channel_halt),    // output wire event_data_in_channel_halt
  .event_data_out_channel_halt( x_event_data_out_channel_halt)  // output wire event_data_out_channel_halt
);

xfft_cc channel_y_fft (
  .aclk(clk),                                                 // input wire aclk
  .aresetn(reset_b),                                          // input wire aresetn
  .s_axis_config_tdata(           s_axis_config_tdata),                  // input wire [23 : 0] s_axis_config_tdata
  .s_axis_config_tvalid(          s_axis_config_tvalid),                // input wire s_axis_config_tvalid
  .s_axis_config_tready(        y_s_axis_config_tready),                // output wire s_axis_config_tready

  .s_axis_data_tdata(           y_s_axis_data_tdata),                      // input wire [31 : 0] s_axis_data_tdata
  .s_axis_data_tvalid(            s_axis_data_tvalid),                    // input wire s_axis_data_tvalid
  .s_axis_data_tready(          y_s_axis_data_tready),                    // output wire s_axis_data_tready
  .s_axis_data_tlast(             s_axis_data_tlast),                      // input wire s_axis_data_tlast

  .m_axis_data_tdata(           y_m_axis_data_tdata),                      // output wire [31 : 0] m_axis_data_tdata
  .m_axis_data_tuser(           y_m_axis_data_tuser),                      // output wire [15 : 0] m_axis_data_tuser
  .m_axis_data_tvalid(          y_m_axis_data_tvalid),                    // output wire m_axis_data_tvalid
  .m_axis_data_tready(          y_m_axis_data_tready),                    // input wire m_axis_data_tready
  .m_axis_data_tlast(           y_m_axis_data_tlast),                      // output wire m_axis_data_tlast

  .m_axis_status_tdata(         y_m_axis_status_tdata),                  // output wire [7 : 0] m_axis_status_tdata
  .m_axis_status_tvalid(        y_m_axis_status_tvalid),                // output wire m_axis_status_tvalid
  .m_axis_status_tready(          m_axis_status_tready),                // input wire m_axis_status_tready
  .event_frame_started(         y_event_frame_started),                  // output wire event_frame_started
  .event_tlast_unexpected(      y_event_tlast_unexpected),            // output wire event_tlast_unexpected
  .event_tlast_missing(         y_event_tlast_missing),                  // output wire event_tlast_missing
  .event_fft_overflow(          y_event_fft_overflow),                    // output wire event_fft_overflow
  .event_status_channel_halt(   y_event_status_channel_halt),      // output wire event_status_channel_halt
  .event_data_in_channel_halt(  y_event_data_in_channel_halt),    // output wire event_data_in_channel_halt
  .event_data_out_channel_halt( y_event_data_out_channel_halt)  // output wire event_data_out_channel_halt
);

wire mult_m_axis_dout_tvalid;
wire mult_m_axis_dout_tready;
wire mult_m_axis_dout_tlast;
wire [63:0] mult_m_axis_dout_tdata;

wire [31:0] channel_y_conjugated;
wire [15:0] channel_y_imag_conjugated;
assign channel_y_imag_conjugated = ~(y_m_axis_data_tdata[31:16]) + 1;
assign channel_y_conjugated = {channel_y_imag_conjugated, y_m_axis_data_tdata[15:0]};

// Multiplier
complex_multiplier your_instance_name (
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

  .m_axis_dout_tvalid(  mult_m_axis_dout_tvalid),  // output wire m_axis_dout_tvalid
  .m_axis_dout_tready(  /*mult_m_axis_dout_tready*/1'b1),  // input wire m_axis_dout_tready
  .m_axis_dout_tlast(   mult_m_axis_dout_tlast),    // output wire m_axis_dout_tlast
  .m_axis_dout_tdata(   mult_m_axis_dout_tdata)    // output wire [63 : 0] m_axis_dout_tdata
);

// IFFT master axis
wire [63:0] ifft_m_axis_data_tdata;
wire ifft_m_axis_data_tvalid;
wire ifft_m_axis_data_tlast;
wire [15:0] ifft_m_axis_data_tuser;

wire [7:0] argmax_index_in;
wire [31:0] argmax_value_in;
assign argmax_index_in = ifft_m_axis_data_tuser[7:0];
assign argmax_value_in = ifft_m_axis_data_tdata[31:0]; // discard imaginary component



xfft_256pt_64bit inverse_fft (
  .aclk(clk),                                                 // input wire aclk
  .aresetn(reset_b),                                          // input wire aresetn
  .s_axis_config_tdata(       ifft_s_axis_config_tdata),                  // input wire [23 : 0] s_axis_config_tdata
  .s_axis_config_tvalid(          s_axis_config_tvalid),                // input wire s_axis_config_tvalid
  .s_axis_config_tready(     ifft_s_axis_config_tready),                // output wire s_axis_config_tready

  .s_axis_data_tdata(           mult_m_axis_dout_tdata),                      // input wire [31 : 0] s_axis_data_tdata
  .s_axis_data_tvalid(          mult_m_axis_dout_tvalid),                    // input wire s_axis_data_tvalid
  .s_axis_data_tready(          mult_m_axis_dout_tready),                    // output wire s_axis_data_tready
  .s_axis_data_tlast(           mult_m_axis_dout_tlast),                      // input wire s_axis_data_tlast

  .m_axis_data_tdata(           ifft_m_axis_data_tdata),                      // output wire [31 : 0] m_axis_data_tdata
  .m_axis_data_tuser(           ifft_m_axis_data_tuser),                      // output wire [15 : 0] m_axis_data_tuser
  .m_axis_data_tvalid(          ifft_m_axis_data_tvalid),                    // output wire m_axis_data_tvalid
  .m_axis_data_tready(                            1'b1),                    // input wire m_axis_data_tready
  .m_axis_data_tlast(           ifft_m_axis_data_tlast),                      // output wire m_axis_data_tlast

  .m_axis_status_tdata(         ifft_m_axis_status_tdata),                  // output wire [7 : 0] m_axis_status_tdata
  .m_axis_status_tvalid(        ifft_m_axis_status_tvalid),                // output wire m_axis_status_tvalid
  .m_axis_status_tready(         m_axis_status_tready),                // input wire m_axis_status_tready
  .event_frame_started(         ifft_event_frame_started),                  // output wire event_frame_started
  .event_tlast_unexpected(      ifft_event_tlast_unexpected),            // output wire event_tlast_unexpected
  .event_tlast_missing(         ifft_event_tlast_missing),                  // output wire event_tlast_missing
  .event_fft_overflow(          ifft_event_fft_overflow),                    // output wire event_fft_overflow
  .event_status_channel_halt(   ifft_event_status_channel_halt),      // output wire event_status_channel_halt
  .event_data_in_channel_halt(  ifft_event_data_in_channel_halt),    // output wire event_data_in_channel_halt
  .event_data_out_channel_halt( ifft_event_data_out_channel_halt)  // output wire event_data_out_channel_halt
);

wire [7:0] max_index;

ARGMAX argmax(  .clk(clk),
                .reset_b(reset_b),
                .Frame_Start(1'b0),
                .Value_in(argmax_value_in),
                .Index_in(argmax_index_in),
                .Max_Index(max_index)
);


// TASKS ------------------------------------------------------------------------------------------
// All of these have been modified to process/control data for 2 channels

// Send a sample of data according to AXI Stream protocol:
// set TVALID, wait until TREADY is set, then clear TVALID
task drive_sample;
    input reg [31:0]                x_data;
    input reg [31:0]                y_data;
    input reg                       last;
    begin
        x_s_axis_data_tdata <= x_data;
        y_s_axis_data_tdata <= y_data;
        s_axis_data_tlast <= last;
        
        s_axis_data_tvalid <= 1;
        
        @(posedge clk);
        while(x_s_axis_data_tready == 0 ) @(posedge clk);
        s_axis_data_tvalid <= 0;
    end
 endtask

// send data into the FFT block
// zero-pads the first 128 samples
task drive_frame;
   input integer N;

   reg sample_last;
   integer index;
   reg [15:0] x_re;
   reg [15:0] y_re;
   reg [15:0] im; // we are using 0s for imaginary data
   begin
        index = 0;
        sample_last = 0;
        x_re = 16'b0; y_re = 16'b0; im = 16'b0;
        while(index < N)begin 
            x_re = (index < N/2) ? 16'd512 : x_data_array[index - N/2];           
			y_re = (index < N/2) ? y_data_array[index] : 16'd512;
            sample_last = (index == N - 1) ? 1 : 0;
            drive_sample({im, x_re}, {im, y_re}, sample_last);    
            index = index + 1;
       end
   end
endtask

// assert FFTs out of sync
wire s_axis_config_err, s_axis_data_err, m_axis_data_valid_err, m_axis_data_last_err;
wire [3:0] sync_err;
assign s_axis_config_err = (x_s_axis_config_tready != y_s_axis_config_tready);
assign s_axis_data_err = (x_s_axis_data_tready != y_s_axis_data_tready);
assign m_axis_data_valid_err = (x_m_axis_data_tvalid != y_m_axis_data_tvalid);
assign m_axis_data_last_err = (x_m_axis_data_tlast != y_m_axis_data_tlast);
assign sync_err = {s_axis_config_err, s_axis_data_err, m_axis_data_valid_err, m_axis_data_last_err};

// save the s_axis_datas to files
always @(posedge clk) begin
        if(ifft_m_axis_data_tvalid)begin
            $fwrite(fp_out, "%d \n", $signed(ifft_m_axis_data_tdata[63:32]));
            $fwrite(fp_out, "%d \n", $signed(ifft_m_axis_data_tdata[31:0]));
        end 
        if (x_m_axis_data_tvalid)begin
            $fwrite(fp_chx_pre, "%d \n", $signed(x_m_axis_data_tdata[31:16]));
            $fwrite(fp_chx_pre, "%d \n", $signed(x_m_axis_data_tdata[15:0]));
        end
        if (y_m_axis_data_tvalid)begin
            $fwrite(fp_chy_pre, "%d \n", $signed(y_m_axis_data_tdata[31:16]));
            $fwrite(fp_chy_pre, "%d \n", $signed(y_m_axis_data_tdata[15:0]));
        end
end

always #5 clk = ~clk;

// INITIAL BEGIN ----------------------------------------------------------------------------------
initial begin
x_full_path = {workspace_path, x_file_in};
file_out_full_path = {workspace_path, file_out};
$readmemh("C:/Users/ilena/Documents/apr-private/fpga/SW8A-AcousticsFPGA/srcsim/cc_datasets/trigger_rshift.data", y_data_array);
$readmemh("C:/Users/ilena/Documents/apr-private/fpga/SW8A-AcousticsFPGA/srcsim/cc_datasets/trigger.data", x_data_array);
fp_out = $fopen("C:/Users/ilena/Documents/apr-private/fpga/SW8A-AcousticsFPGA/srcsim/cc_datasets/cc_to_ifft_out.txt");
fp_chx_pre = $fopen("C:/Users/ilena/Documents/apr-private/fpga/SW8A-AcousticsFPGA/srcsim/cc_datasets/cc_to_ifft_chx.txt");
fp_chy_pre = $fopen("C:/Users/ilena/Documents/apr-private/fpga/SW8A-AcousticsFPGA/srcsim/cc_datasets/cc_to_ifft_chy.txt");


// reset
#10
reset_b = 0;
#20
reset_b = 1;
#10

// config
s_axis_config_tvalid = 1'b1;
#10
while(x_s_axis_config_tready == 0 ) begin
    @(posedge clk);
end
s_axis_config_tvalid = 1'b0;

// send the data in
drive_frame(256);
@(posedge clk);

// wait for master tlast
@(posedge x_m_axis_data_tlast);
repeat(10)@(posedge clk);    
//$fclose(fp_out);   
end

endmodule