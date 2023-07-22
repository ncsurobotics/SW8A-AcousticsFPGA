`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/19/2023 08:18:36 PM
// Design Name: 
// Module Name: TRIGGER_DETECT
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


module TRIGGER_DETECT(

    input clk,
    input reset_b,
    input [31:0] T_DATA,
    input T_VALID,
    input [15:0] Threshold,
    input [5:0] Frequency,  
    input [1:0] Offset,
    
    output T_READY,
    output Trigger,
    output FFT_Data_Ready

);

    wire [31:0] Next_RAM_Data;
    wire Write_Address_sel;
    wire [5:0] Read_Address_BR;
    wire [5:0] Read_Address_With_Offset;
    wire [31:0] FFT_Data;
    
    
    assign Read_Address_With_Offset = (Frequency-1) + Offset;
    assign Read_Address_BR = Read_Address_With_Offset[0:5];
    

    BLOCK_RAM_32x64 FFT_TRIGGER_RAM(
    
        .clka(clk),
        .wea(Write_Address_sel),
        .addra(Write_Address),
        .dina(Next_RAM_Data),
        .clkb(clk),
        .enb(1'b1),
        .addrb(Read_Address_BR),
        .doutb(FFT_Data)
    
    );
    
    AXI_SLAVE AXI_SLAVE_inst(
    
        .clk(clk),
        .reset_b(reset_b),
        .T_DATA(T_DATA),
        .T_VALID(T_VALID),
        .Write_Address_sel(Write_Address_sel),
        .T_READY(T_READY),
        .Next_RAM_Data(Next_RAM_Data),
        .Write_Address(Write_Address)
    
    );
    
    GENERAL_COUNTER #(.COUNT_VAL(63), . COUNT_BIT_WIDTH(5)) SAMPLE_COUNTER(
    
        .clk(clk),
        .reset_b(reset_b),
        .Count_sel({1'b1,T_VALID}),
        .Count_Reached(FFT_Data_Ready)
    
    );
    
    
    
    
    
    
    
    
    
    
    
    
endmodule
