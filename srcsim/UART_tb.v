`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/05/2023 08:08:32 PM
// Design Name: 
// Module Name: UART_tb
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


module UART_tb();

    reg clk = 1'b0, reset_b = 1'b1;
    reg [7:0] word_to_send;
    reg TX_Write_en;
    wire UART_clk;
    wire TX_out_tb;
    wire TX_ready_to_send_tb;
    wire[7:0] RX_out_tb;
    wire RX_data_ready_tb;
    
   DATA_clks DATA_clks_inst(

    .clk_in1(clk),
    .SPI_clk(SPI_clk),
    .UART_clk(UART_clk_No_Div)

    );
    UART_CLK_DIVIDER UART_CLK_DIVIDER_inst(

    .UART_clk_in(UART_clk_No_Div),
    .reset_b(reset_b),
    
    .UART_clk_out(UART_clk)    

    );               
         
   
   
   UART UART_inst(	

    .UART_clk(UART_clk),
    .clk(clk),
    .Slow_clk(UART_clk_No_Div),
    .reset_b(reset_b),
	.TX_Data_in(rx_data),
	.TX_en(1'b0),
	.TX_Write_en(1'b0),
	.RX_Data_in(RsRx),
				
	.TX_Data_out(RsTx),
	.TX_Ready_To_Send(tx_ready),
	.RX_Data_out(rx_data),
	.RX_Data_Ready(rx_ready)
	
    );

     
     always #(5) clk = ~clk;
     
     initial begin
        
        #4  reset_b = 1'b0;
        #5  reset_b = 1'b1;
            word_to_send = 8'h44;
        #5  TX_en_tb = 1'b1;
        while(TX_ready_to_send_tb)
        begin
            #1;
        end
        TX_en_tb = 1'b0;
        while(!TX_ready_to_send_tb)
        begin
            #1;
        end
        
        #5;
                    word_to_send = 8'h31;
        #5  TX_en_tb = 1'b1;
        while(TX_ready_to_send_tb)
        begin
            #1;
        end
        TX_en_tb = 1'b0;
        while(!TX_ready_to_send_tb)
        begin
            #1;
        end
        
        #2;
                    word_to_send = 8'h29;
        #5  TX_en_tb = 1'b1;
        while(TX_ready_to_send_tb)
        begin
            #1;
        end
        TX_en_tb = 1'b0;
        while(!TX_ready_to_send_tb)
        begin
            #1;
        end
        $stop;
        end

endmodule
