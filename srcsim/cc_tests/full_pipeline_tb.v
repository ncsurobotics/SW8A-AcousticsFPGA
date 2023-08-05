/* Full Pipeline Testbench
 * CC Control Testbench plus the rest of the pipeline. Verify everything's working just by looking at argmax.
 *
 * Criteria for success:
 *      event_tlast_unexpected and event_tlast_missing are never high
 *      for now: select lines go high at the right times
 *      for later: look at zero_pad_verify.py 's plots
 */


module full_pipeline_tb ();
    
integer fp_chx, fp_chy, fp_ifft, fp_chx_slave, fp_chy_slave;
reg [9:0] x_data_array [255:0];
reg [9:0] y_data_array [255:0];

reg clk = 1'b0;
reg reset_b = 1'b1;
reg data_ready = 1'b0;
reg start_cc = 1'b0;
wire ram_overflow;
reg [31:0] x_ring_buffer_in, y_ring_buffer_in;
wire [31:0] x_ring_buffer_out, y_ring_buffer_out;
wire channel_x_send_frame, channel_y_send_frame;
wire [7:0] index_out;

// debug signals out of CC_BLOCK
wire x_m_axis_data_tvalid, y_m_axis_data_tvalid, ifft_m_axis_data_tvalid, x_s_axis_data_tvalid, y_s_axis_data_tvalid;
wire [31:0] x_m_axis_data_tdata, y_m_axis_data_tdata, x_s_axis_data_tdata, y_s_axis_data_tdata;
wire [63:0] ifft_m_axis_data_tdata;

// For later: ring buffer
RING_BUFFER x_ring_buffer (
    .clk(clk),
    .reset_b(reset_b),
    .Input_Data(x_ring_buffer_in),
    .Input_Data_Ready(data_ready),
    .Triggered(1'b1),
    .Send_Frame(channel_x_send_frame),
    .RAM_Overflow(ram_overflow),
    .Output_Data(x_ring_buffer_out)
);

RING_BUFFER y_ring_buffer (
    .clk(clk),
    .reset_b(reset_b),
    .Input_Data(y_ring_buffer_in),
    .Input_Data_Ready(data_ready),
    .Triggered(1'b1),
    .Send_Frame(channel_y_send_frame),
    .RAM_Overflow(ram_overflow),
    .Output_Data(y_ring_buffer_out)
);

CC_BLOCK dut (
    .clk(clk),
    .reset_b(reset_b),
    .Start_CC(start_cc),
    .Channel_X_Ring_Buffer_in(x_ring_buffer_out),
    .Channel_Y_Ring_Buffer_in(y_ring_buffer_out),
    
    .Channel_X_Send_Frame(channel_x_send_frame),
    .Channel_Y_Send_Frame(channel_y_send_frame),

    .Index_out(index_out),

    .Channel_X_FFT_tvalid(x_m_axis_data_tvalid),
    .Channel_X_FFT_tdata(x_m_axis_data_tdata),
    .Channel_Y_FFT_tvalid(y_m_axis_data_tvalid),
    .Channel_Y_FFT_tdata(y_m_axis_data_tdata),
    .IFFT_tvalid(ifft_m_axis_data_tvalid),
    .IFFT_tdata(ifft_m_axis_data_tdata),
    .Channel_X_FFT_in(x_s_axis_data_tdata),
    .Channel_Y_FFT_in(y_s_axis_data_tdata),
    .Channel_X_FFT_in_valid(x_s_axis_data_tvalid),
    .Channel_Y_FFT_in_valid(y_s_axis_data_tvalid)
);

always #5 clk = ~clk;

// load ring buffer
task load_ring_buffer;
    integer index;
    begin
        index = 0;
        
        while(index < 256) begin 
            @(posedge clk);
            x_ring_buffer_in = x_data_array[index];
            y_ring_buffer_in = y_data_array[index];
            data_ready = 1'b1;
            @(posedge clk);
            data_ready = 1'b0;
            @(posedge clk);
            index = index + 1;
        end
        data_ready = 1'b0;
    end
endtask

// save the s_axis_datas to files
always @(posedge clk) begin
        if(ifft_m_axis_data_tvalid)begin
            $fwrite(fp_ifft, "%d \n", $signed(ifft_m_axis_data_tdata[63:32]));
            $fwrite(fp_ifft, "%d \n", $signed(ifft_m_axis_data_tdata[31:0]));
        end 
        if (x_m_axis_data_tvalid)begin
            $fwrite(fp_chx, "%d \n", $signed(x_m_axis_data_tdata[31:16]));
            $fwrite(fp_chx, "%d \n", $signed(x_m_axis_data_tdata[15:0]));
        end
        if (y_m_axis_data_tvalid)begin
            $fwrite(fp_chy, "%d \n", $signed(y_m_axis_data_tdata[31:16]));
            $fwrite(fp_chy, "%d \n", $signed(y_m_axis_data_tdata[15:0]));
        end
        if (x_s_axis_data_tvalid)begin
            $fwrite(fp_chx_slave, "%d \n", $signed(x_s_axis_data_tdata[31:16]));
            $fwrite(fp_chx_slave, "%d \n", $signed(x_s_axis_data_tdata[15:0]));
        end
        if (y_s_axis_data_tvalid)begin
            $fwrite(fp_chy_slave, "%d \n", $signed(y_s_axis_data_tdata[31:16]));
            $fwrite(fp_chy_slave, "%d \n", $signed(y_s_axis_data_tdata[15:0]));
        end
end

initial begin

    $readmemh("C:/Users/ilena/Documents/apr-private/fpga/SW8A-AcousticsFPGA/srcsim/cc_datasets/trigger_rshift.data", y_data_array);
    $readmemh("C:/Users/ilena/Documents/apr-private/fpga/SW8A-AcousticsFPGA/srcsim/cc_datasets/trigger.data", x_data_array);
    fp_chx = $fopen("C:/Users/ilena/Documents/apr-private/fpga/SW8A-AcousticsFPGA/srcsim/cc_datasets/full_pipeline_chx.txt");
    fp_chy = $fopen("C:/Users/ilena/Documents/apr-private/fpga/SW8A-AcousticsFPGA/srcsim/cc_datasets/full_pipeline_chy.txt");
    fp_ifft = $fopen("C:/Users/ilena/Documents/apr-private/fpga/SW8A-AcousticsFPGA/srcsim/cc_datasets/full_pipeline_ifft.txt");
    fp_chx_slave = $fopen("C:/Users/ilena/Documents/apr-private/fpga/SW8A-AcousticsFPGA/srcsim/cc_datasets/full_pipeline_chx_slave.txt");
    fp_chy_slave = $fopen("C:/Users/ilena/Documents/apr-private/fpga/SW8A-AcousticsFPGA/srcsim/cc_datasets/full_pipeline_chy_slave.txt");

    #10 reset_b = 1'b0;
    #40 reset_b = 1'b1;

// load ring buffer
    #150 load_ring_buffer;
    #10 start_cc = 1'b1;
    #50 start_cc = 1'b0;
end

endmodule