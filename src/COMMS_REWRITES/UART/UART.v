//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/11/2023 05:28:27 PM
// Design Name: 
// Module Name: UART
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


module UART #(parameter WORD_SIZE=8, parameter WORD_SIZE_WIDTH=4) (

    input clk,
    input UART_clk,
    input reset_b,
    input [WORD_SIZE-1:0] TX_Data_in,
    input TX_en,
    input TX_Write_en,
    input RX_Data_in,
    
    output wire TX_Data_out,
    output wire TX_Ready_To_Send,
    output reg [WORD_SIZE-1:0] RX_Data_out,
    output wire RX_Data_Ready
    

);
    wire [WORD_SIZE-1:0] RX_Data_Captured;
    integer i;
    always@(posedge clk or negedge reset_b) begin
        if(!reset_b) begin
            for( i = 0 ; i < WORD_SIZE ; i = i + 1)  RX_Data_out[i] <= 1'b1;
        end
        else begin
            if(RX_Data_Ready) RX_Data_out <= RX_Data_Captured;
            else RX_Data_out <= RX_Data_out;
        end 
    
    end


    UART_TX #(.WORD_SIZE(WORD_SIZE), .WORD_SIZE_WIDTH(WORD_SIZE_WIDTH)) UART_TX_inst(
        
        .clk(clk),
        .UART_clk(UART_clk),
        .reset_b(reset_b),
        .TX_Data_in(TX_Data_in),
        .TX_en(TX_en),
        .TX_Write_en( ~ (TX_Data_in && TX_Data_Captured)),
        
        .TX_Data_out(TX_Data_out),
        .TX_Ready_To_Send(TX_Ready_To_Send),
        .TX_Data_Register(TX_Data_Captured)
        
    );
    
    wire [WORD_SIZE-1:0] TX_Data_Captured;
    
    
    UART_RX #(.WORD_SIZE(WORD_SIZE), .WORD_SIZE_WIDTH(WORD_SIZE_WIDTH)) UART_RX_inst(
    
        .clk(clk),
        .reset_b(reset_b),
        .RX_Data_in(RX_Data_in),
        
        .RX_Data_out(RX_Data_Captured),
        .RX_Data_Ready(RX_Data_Ready)
        
    );
    
  
endmodule
