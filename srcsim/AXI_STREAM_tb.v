`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/25/2023 10:33:38 PM
// Design Name: 
// Module Name: AXI_STREAM_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module AXI_STREAM_tb;

reg clk = 1'b0;
reg reset_b = 1'b1;
wire RAM_overflow;
reg [31:0] data_array [0:255];
reg [31:0] input_data = 0;
wire [31:0] output_data;
reg data_ready = 1'b0;
reg fourth_sample = 1'b0;
wire send;
wire t_valid;
wire [31:0] t_data;

integer index = 0;
event assert_data_ready;

initial
$readmemh("/home/cpmori/Documents/AquaPack/SW8A-AcousticsFPGA/srcsim/TRIGGER_FFT_tb_input.data", data_array);

always begin // assert_data_ready
    @(assert_data_ready);
    data_ready = 1'b1;
    input_data = data_array[index];
    if(index % 4 == 0) fourth_sample = 1'b1;
    else fourth_sample = 1'b0;
    index = index + 1;


    
    
    
    #140 data_ready = 1'b0;
        fourth_sample = 1'b0;
end

always #1960 -> assert_data_ready;

always #5 clk = ~clk;


RING_BUFFER dut1(.clk(clk),
                .reset_b(reset_b),
                .Input_Data(input_data),
                .Input_Data_Ready(data_ready),
                .Send_Frame(send),
                .RAM_Overflow(RAM_overflow),
                .Output_Data(output_data)
);

AXI_MASTER dut_axi(

    .clk(clk),
    .reset_b(reset_b),
    .Input_Data(output_data),
    .T_READY(1'b1),
    .Fourth_Sample_Ready(fourth_sample),
    .Send_Frame(send),
    .T_VALID(t_valid),
    .T_DATA(t_data)

);









endmodule
