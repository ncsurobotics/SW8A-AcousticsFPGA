//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/11/2023 05:28:27 PM
// Design Name: 
// Module Name: UART_TX
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


module UART_TX #(parameter WORD_SIZE=8, parameter WORD_SIZE_WIDTH=4) (
    input clk,
    input reset_b,
    input [WORD_SIZE-1:0] TX_Data_in,
    input TX_en,

    output wire TX_Data_out,
    output wire TX_Ready_To_Send
);

    wire Bit_Count_Reached, Bit_Counter_sel;
    wire [1:0] TX_Shift_Register_sel;
    
    
    UART_TX_DATAPATH #(.WORD_SIZE(WORD_SIZE), .WORD_SIZE_WIDTH(WORD_SIZE_WIDTH)) UART_TX_DATAPATH_inst (
        
        .clk(clk),
        .reset_b(reset_b),
        .Bit_Counter_sel(Bit_Counter_sel),
        .TX_Shift_Register_sel(TX_Shift_Register_sel),
        .TX_Data_in(TX_Data_in),
        
        .TX_Data_out(TX_Data_out),
        .Bit_Count_Reached(Bit_Count_Reached)               
        
    );
    
    UART_TX_CONTROLLER UART_TX_CONTROLLER_inst (

        .clk(clk),
        .reset_b(reset_b),
        .TX_en(TX_en),
        .Bit_Count_Reached(Bit_Count_Reached),  

        .TX_Shift_Register_sel(TX_Shift_Register_sel),
        .Bit_Counter_sel(Bit_Counter_sel),
        .TX_Ready_To_Send(TX_Ready_To_Send)
    
    );
    
endmodule
