`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/30/2023 12:23:49 AM
// Design Name: 
// Module Name: FULL_SIM
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


module FULL_SIM(

    );
    
    
    wire UART_clk;
    
    UART_CLK_DIVIDER UART_CLK_DIVIDER_inst(

        .UART_clk_in(UART_clk_No_Div),
        .reset_b(reset_b),
        .UART_clk_out(UART_clk)    

    );         
    
    wire sendOP;
    
    reg reset_b = 0;
    reg clk = 0, SPI_clk = 0, UART_clk_No_Div = 0;
    reg adc1, adc2, adc3, adc4;
    reg RsRx;
    
    wire [8:0] opcode= 9'b001000010;
    
    always #4 clk = ~clk;
    always #96 SPI_clk = ~SPI_clk;
    always #868 UART_clk_No_Div = ~UART_clk_No_Div;
    
    integer i; 
    always@(posedge UART_clk)begin
        if(!sendOP) begin
            RsRx = 1'b1;
        end
        else begin
            if(i < 9) RsRx = opcode[i];
            else RsRx = 1'b1;
            i = i + 1;
        end 
    end
    
    
    initial begin
        i = 0;
        reset_b = 1'b1;
        #5 reset_b = 1'b0;
        #5 reset_b = 1'b1;  
        #5 sendOP= 1'b1;
         
    end
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
endmodule
