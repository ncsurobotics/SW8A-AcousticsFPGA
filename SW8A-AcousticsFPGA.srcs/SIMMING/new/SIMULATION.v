`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/23/2023 12:09:28 AM
// Design Name: 
// Module Name: SIMULATION
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


module SIMULATION(

    );
    integer i; 
    reg clk = 1'b0;
    reg btnC = 1'b0;
    reg UART_clk_tb = 1'b0;
    reg UART_tb = 1'b0;
    reg [13:0] receiver_data = 14'b11110010010011;
    top DUT(
        .clk(clk),
        .UART_clk_No_Div(UART_clk_tb),
        .btnC(btnC),
        .RsRx(RsRx),
        .RsTx(RsTx)
       
    );
    wire RsTx;
    reg RsRx = 1'b1;
    

    always #88 UART_clk_tb = ~UART_clk_tb; 
    always #5 clk = ~clk;
    always #4340 UART_tb = ~UART_tb;
    initial 
        begin 
            i = 0;
            #5 btnC = 1'b1;
            #5 btnC = 1'b0; 
    end

    
    always@(posedge UART_tb) begin
        if( i < 13) begin
            RsRx = receiver_data[i]; i = i + 1;
        end
        else RsRx = 1'b1;
    end
    
endmodule





