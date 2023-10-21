`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/12/2023 10:10:14 PM
// Design Name: 
// Module Name: SPI
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


module SPI #(parameter WIDTH=10, parameter TOTAL_BITS=14) (

    input clk,
    input SPI_clk,
    input reset_b,
    input SPI_Data_in,
    input SPI_en,
    
    output wire [WIDTH-1:0] SPI_Data_out,
    output wire Data_Ready,
    output wire CS

);

    wire Data_Ready_Internal;
    wire SPI_Data_out_Internal;
    wire Bit_Count_Reached;
    wire RX_Shift_Register_sel, Bit_Counter_sel;
    assign Data_Ready = Data_Ready_Internal;

    SPI_DATAPATH #(.WIDTH(WIDTH) , .TOTAL_BITS(TOTAL_BITS)) SPI_DATAPATH_inst(
    
        //.clk(clk),
        .SPI_clk(SPI_clk),
        .reset_b(reset_b),
        .SPI_Data_in(SPI_Data_in),
        .Bit_Counter_sel(Bit_Counter_sel),
        .Data_Ready(Data_Ready_Internal),
        .RX_Shift_Register_sel(RX_Shift_Register_sel),
        
        .SPI_Data_out(SPI_Data_out_Internal),
        .Bit_Count_Reached(Bit_Count_Reached)
    
    );
    
    SPI_CONTROLLER SPI_CONTROLLER_inst(
    
        .clk(SPI_clk),
        .reset_b(reset_b),
        .SPI_en(SPI_en),
        .Bit_Count_Reached(Bit_Count_Reached),
        
        .RX_Shift_Register_sel(RX_Shift_Register_sel),
        .Bit_Counter_sel(Bit_Counter_sel),
        .Data_Ready(Data_Ready_Internal),
        .CS(CS)
    
    );

endmodule
