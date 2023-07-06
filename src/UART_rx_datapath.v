//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/11/2023 04:29:05 PM
// Design Name: 
// Module Name: UART_RX_DATAPATH
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


module UART_RX_DATAPATH #(parameter WORD_SIZE=8, parameter WORD_SIZE_WIDTH=4)(

    input clk,
    input reset_b,
    input Bit_Counter_sel,
    input RX_Shift_Register_sel,
    input RX_Data_in,
    
    output wire[WORD_SIZE-1:0] RX_Data_out,
    output wire Bit_Count_Reached
    
);

    RX_SHIFT_REGISTER #(.WORD_SIZE(WORD_SIZE)) RX_SHIFT_REGISTER_inst (
    
        .clk(clk),
        .reset_b(reset_b),
        .RX_Shift_Register_sel(RX_Shift_Register_sel),
        .RX_Data_in(RX_Data_in),
        .RX_Data_out(RX_Data_out)
    
    );
    
    BIT_COUNTER #(.WORD_SIZE(WORD_SIZE-1),.WORD_SIZE_WIDTH(WORD_SIZE_WIDTH)) BIT_COUNTER_inst (
    
        .clk(clk),
        .reset_b(reset_b),
        .Bit_Counter_sel(Bit_Counter_sel),
        .Bit_Count_Reached(Bit_Count_Reached)
    
    ); 
    
endmodule
