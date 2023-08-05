`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/20/2023 07:50:51 PM
// Design Name: 
// Module Name: COMMAND_READER
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


module COMMAND_READER(
    input clk,
    input reset_b,
    input slow_clk,
    input [7:0] Command,
    input Rx_Ready,
    input RsTx,
    input Tx_Ready,
    input Trigger,
    input FFT_Data_Ready,
    input [9:0] Max_Value,
    
    output Set_Threshold_sel,
    output Set_Frequency_sel,
    output [1:0] RAM_Read_Offset,
    output [7:0] Word_To_Send,
    output [2:0] Channel_sel,
    output TX_en,
    output TX_Write_en

);

    wire [1:0] Word_To_Send_sel,Timer_sel;
    wire Timeout;
    
    COMMAND_READER_CONTROLLER COMM_READ_CONT_inst(
    
        .clk(clk),
        .reset_b(reset_b),
        .Rx_Ready(Rx_Ready),
        .RsTx(RsTx),
        .Tx_Ready(Tx_Ready),
        .Trigger(Trigger),
        .FFT_Data_Ready(FFT_Data_Ready),
        .Command(Command),
        .Timeout(Timeout),
        .Timer_sel(Timer_sel),
        .Word_To_Send_sel(Word_To_Send_sel),
        .Set_Threshold_sel(Set_Threshold_sel),
        .Set_Frequency_sel(Set_Frequency_sel),
        .RAM_Read_Offset(RAM_Read_Offset),
        .TX_en(TX_en),
        .TX_Write_en(TX_Write_en)
        
    );

    COMMAND_READER_DATA_PATH COMM_READ_DATA_PATH_inst(
        .clk(clk),
        .reset_b(reset_b),
        .slow_clk(slow_clk),
        .Command(Command),
        .Max_Value(Max_Value),
        .Word_To_Send_sel(Word_To_Send_sel),
        .Timer_sel(Timer_sel),
        .Word_To_Send(Word_To_Send),
        .Channel_sel(Channel_sel),
        .Timeout(Timeout)

    
    );

endmodule
