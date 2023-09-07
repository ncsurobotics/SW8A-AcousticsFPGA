`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/30/2023 12:05:47 AM
// Design Name: 
// Module Name: top
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


module top(
                input clk, btnC, btnU,

                input adc1,
                input adc2,
                input adc3,
                input adc4,
                
                output cs1,cs2,cs3,cs4,
                output spi_clk_out1,spi_clk_out2,spi_clk_out3,spi_clk_out4,

                output data_ready,

                input RsRx,
                output RsTx,
                output [6:0] seg,
                output [3:0] an
    );
    
    
wire SPI_clk, UART_clk_No_Div;

    
DATA_clks DATA_clks_inst(

    .clk_in1(clk),
    .SPI_clk(SPI_clk),
    .UART_clk(UART_clk_No_Div)

); 


PRIMARY main_level (

    .clk(clk),
    .reset_b(1'b1),
    .btnC(btnC),
    .btnU(btnU),
    .SPI_clk(SPI_clk),
    .UART_clk_No_Div(UART_clk_No_Div),
    .adc1(adc1),
    .adc2(adc2),
    .adc3(adc3),
    .adc4(adc4),
    .data_ready(data_ready),
    .cs1(cs1),
    .cs2(cs2),
    .cs3(cs3),
    .cs4(cs4),
    .RsRx(RsRx),
    .RsTx(RsTx),
    .seg(seg),
    .an(an)

);

assign spi_clk_out1 = SPI_clk;
assign spi_clk_out2 = SPI_clk;
assign spi_clk_out3 = SPI_clk;
assign spi_clk_out4 = SPI_clk;



endmodule
