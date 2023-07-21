`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/20/2023 07:50:51 PM
// Design Name: 
// Module Name: COMMAND_READER_DATA_PATH
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


module COMMAND_READER_DATA_PATH(

    input [7:0] Command,
    input FFT_Triggered,
    input [7:0] Max_Value,
    
    output [7:0] Word_To_Send,
    output [3:0] Channel_sel

);


    assign Channel_sel = Command[3:0];










endmodule
