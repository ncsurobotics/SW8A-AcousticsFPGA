// top level module for testing new UART w/ CDCs

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
                output [3:0] an,
                output [15:0] led
    );
    
assign reset_b = !btnC;

assign cs1 = 1'b0;
assign cs2 = 1'b0;
assign cs3 = 1'b0;
assign cs4 = 1'b0;
assign spi_clk_out1 = 1'b0;
assign spi_clk_out2 = 1'b0;
assign spi_clk_out3 = 1'b0;
assign spi_clk_out4 = 1'b0;
assign data_ready = 1'b0;
assign led = 16'b0;

wire SPI_clk, UART_clk;

    
DATA_clks DATA_clks_inst(

    .clk_in1(clk),
    .SPI_clk(SPI_clk),
    .UART_clk(UART_clk)

); 

wire [7:0] Word_To_Send;
wire rx_ready;

UART UART_inst(	

    .UART_clk(UART_clk),
    .clk(clk),
    .reset_b(reset_b),
	.TX_Data_in(Word_To_Send),
	.TX_en(rx_ready),
	//.TX_Write_en(TX_Write_en),
	.RX_Data_in(RsRx),
				
	.TX_Data_out(RsTx),
	.TX_Ready_To_Send(),
	.RX_Data_out(Word_To_Send),
	.RX_Data_Ready(rx_ready)
	
);


// DISPLAY
reg [15:0] display;
reg [7:0] display_rx;
always @ (posedge clk) begin
    if(rx_ready)
        display_rx <= Word_To_Send;
    else 
        display_rx <= display_rx;
end

always @ (*) begin
    display = {8'b0, display_rx}; // for debug
end

seven_segment seg7(.clk(clk), .btnC(btnC), .decimal_num(display),
                    .segments(seg), .anode(an));

endmodule
