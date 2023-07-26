// TRIGGER FFT Testbench -- July 20, 2023
// Simulates the entire top-level module with Chris' rewritten TRIGGER_FFT_v2 and RING_BUFFER modules

`timescale 1ns / 1ps


module TRIGGER_FFT_tb();

reg clk = 1'b0;
reg spi_clk = 1'b0;
reg reset_b = 1'b1;

reg [3:0] frequency = 4'd18;
reg [3:0] threshold = 4'b0;
reg [1:0] offset = 2'b0;

reg data_ready = 1'b0;
reg [9:0] data_array [0:255];
reg [9:0] input_data = 0;

//reg send_frame = 1'b0;
wire send_frame;
wire fft_output_RAM_ready;
wire RAM_overflow;
wire [9:0] output_data;

wire fft_data_ready;
wire trigger;

integer index = 0;
event assert_data_ready;

initial
$readmemh("/home/cpmori/Documents/AquaPack/SW8A-AcousticsFPGA/srcsim/TRIGGER_FFT_tb_input.data", data_array);
//$readmemh("C:/Users/ilena/Documents/apr-private/SW8A-AcousticsFPGA/srcsim/TRIGGER_FFT_tb_input.data", data_array);

always begin // assert_data_ready
    @(assert_data_ready);
    data_ready = 1'b1;
    input_data = data_array[index];
    index = index + 1;
    #140 data_ready = 1'b0;
end

always #1960 -> assert_data_ready;

always #5 clk = ~clk;
always #70 spi_clk = ~spi_clk;

RING_BUFFER dut1(.clk(clk),
                .reset_b(reset_b),
                .Input_Data(input_data),
                .Input_Data_Ready(data_ready),
                .Send_Frame(send_frame),
                .RAM_Overflow(RAM_overflow),
                .Output_Data(output_data)
);

TRIGGER_FFT_v2 dut2(   .clk(clk),
                .SPI_CLK(spi_clk),
                .reset_b(reset_b),
                .data_ready(data_ready), // from SPI
                .Input_Data(output_data), // from RAM --> FFT
                .Offset(offset),
                .Frequency(frequency),
                .Threshold(threshold),

                .Send_Frame(send_frame),
                .FFT_Data_Ready(fft_data_ready),
                .Trigger(trigger)
);


initial begin
#30 reset_b = 1'b0;
#30 reset_b = 1'b1;

//#510000 send_frame = 1;
//#630 send_frame = 0;
end

endmodule

