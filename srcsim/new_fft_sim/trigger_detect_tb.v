/* Trigger Detect Testbench
 * Tests the changes to the Trigger module made on 8/4/2023
 */


module trigger_detect_tb ();
    
reg clk = 1'b0;
reg spi_clk = 1'b0;
reg reset_b = 1'b1;
reg data_ready = 1'b0;
wire triggered;
reg start_cc = 1'b0;
wire ram_overflow;
reg [31:0] ring_buffer_in;
wire [31:0] ring_buffer_to_axi_master;
wire send_frame;
reg [31:0] data_array[0:255];
integer fp_out, fp_fft_in;

wire tb_trigger_fft_tvalid;
wire [31:0] tb_trigger_fft_tdata;
wire tb_trigger_fft_tlast;
wire [31:0] tb_data_into_fft;
wire tb_data_in_valid;
reg ok_to_write = 1'b0;

// For later: ring buffer
RING_BUFFER ring_buffer_inst (
    .clk(clk),
    .reset_b(reset_b),
    .Input_Data(ring_buffer_in),
    .Input_Data_Ready(data_ready),
    .Triggered(triggered),
    .Send_Frame(send_frame),
    .RAM_Overflow(ram_overflow),
    .Output_Data(ring_buffer_to_axi_master)
);

TRIGGER_FFT_v2 dut(

    .clk(clk),
    .SPI_CLK(spi_clk),
    .reset_b(reset_b),
    .data_ready(data_ready),
    .Input_Data(ring_buffer_to_axi_master),
    .Frequency(6'd16),
    .Threshold(16'd45),

    .Send_Frame(send_frame),
    .Trigger(triggered),

    // for debug only
    .tb_trigger_fft_tvalid(tb_trigger_fft_tvalid),
    .tb_trigger_fft_tdata(tb_trigger_fft_tdata),
    .tb_trigger_fft_tlast(tb_trigger_fft_tlast),
    .tb_data_into_fft(tb_data_into_fft),
    .tb_data_in_valid(tb_data_in_valid)

);


always #5 clk = ~clk;
always #70 spi_clk = ~spi_clk;

// load ring buffer
task load_ring_buffer;
    integer index;
    begin
        index = 0;
        
        while(index < 256) begin 
            @(posedge spi_clk);
            ring_buffer_in = data_array[index];
            data_ready = 1'b1;
            @(posedge spi_clk);
            data_ready = 1'b0;
            repeat(12)@(posedge spi_clk);
            index = index + 1;
        end
        data_ready = 1'b0;
    end
endtask



always @(posedge clk) begin
        if(tb_trigger_fft_tvalid && ok_to_write)begin
            $fwrite(fp_out, "%d \n", $signed(tb_trigger_fft_tdata[31:16]));
            $fwrite(fp_out, "%d \n", $signed(tb_trigger_fft_tdata[15:0]));
        end 
        if (tb_data_in_valid && ok_to_write) begin
            $fwrite(fp_fft_in, "%d \n", $signed(tb_data_into_fft));
        end
end

initial begin
    /*#200 ok_to_write = 1'b0;
    while (!ram_overflow) @ (posedge clk);
    ok_to_write = 1'b1;
    #7000 ok_to_write = 1'b0;*/
    ok_to_write = 1'b1;
end

initial begin
    $readmemh("C:/Users/ilena/Documents/apr-private/fpga/SW8A-AcousticsFPGA/srcsim/cc_datasets/trigger.data", data_array);
    fp_out = $fopen("C:/Users/ilena/Documents/apr-private/fpga/SW8A-AcousticsFPGA/srcsim/new_fft_sim/new_trig_out.txt");
    fp_fft_in = $fopen("C:/Users/ilena/Documents/apr-private/fpga/SW8A-AcousticsFPGA/srcsim/new_fft_sim/fft_data_in.txt");
    #10 reset_b = 1'b0;
    #100 reset_b = 1'b1;

// load ring buffer
    #150 load_ring_buffer;

    

end

endmodule