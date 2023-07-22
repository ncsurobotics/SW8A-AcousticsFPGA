// TRIGGER FFT Testbench -- July 20, 2023
// Simulates the entire top-level module with new TRIGGER_FFT and RING_BUFFER modules

`timescale 1ns / 1ps


module TRIGGER_FFT_tb();

reg clk = 1'b0;
reg reset_b = 1'b1;

reg data_ready = 1'b0;
reg [9:0] data_array [0:255];
reg [9:0] input_data;

//reg send_frame = 1'b0;
wire send_frame;
wire fft_output_RAM_ready;
wire RAM_overflow;
wire [9:0] output_data;

integer index = 0;
event assert_data_ready;

initial
$readmemh("/home/cpmori/Documents/AquaPack/SW8A-AcousticsFPGA/srcsim/TRIGGER_FFT_tb_input.data", data_array);


always begin // assert_data_ready
    @(assert_data_ready);
    data_ready = 1'b1;
    input_data = data_array[index];
    index = index + 1;
    #140 data_ready = 1'b0;
end

always #1960 -> assert_data_ready;

always #5 clk = ~clk;

RING_BUFFER dut1(.clk(clk),
                .reset_b(reset_b),
                .Input_Data(input_data),
                .Input_Data_Ready(data_ready),
                .Send_Frame(send_frame),
                .RAM_Overflow(RAM_overflow),
                .Output_Data(output_data)
);

TRIGGER_FFT dut2(   .clk(clk),
                .reset_b(reset_b),
                .trigger_fft_enable(1'b1),
                .data_ready(data_ready), // from SPI
                .fft_real_data_in(output_data), // from RAM --> FFT
                .fft_output_RAM_addr(),
                .send_frame(send_frame),
                .fft_output_RAM_data(output_data),
                .fft_output_RAM_ready(fft_output_RAM_ready)
);


initial begin
#30 reset_b = 1'b0;
#30 reset_b = 1'b1;

//#510000 send_frame = 1;
//#630 send_frame = 0;
end

endmodule
