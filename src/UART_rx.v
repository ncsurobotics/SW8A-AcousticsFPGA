//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/11/2023 05:28:27 PM
// Design Name: 
// Module Name: UART_RX
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


module UART_RX #(parameter WORD_SIZE=8, parameter WORD_SIZE_WIDTH=4)(
    input clk,
    input reset_b,
    input RX_Data_in,

    output wire[WORD_SIZE-1:0] RX_Data_out,
    output wire RX_Data_Ready

);
    
    wire Bit_Count_Reached, RX_Shift_Register_sel, Bit_Counter_sel;
    
    
    UART_RX_DATAPATH #(.WORD_SIZE(WORD_SIZE), .WORD_SIZE_WIDTH(WORD_SIZE_WIDTH)) UART_RX_DATAPATH_inst (
        
        .clk(clk),
        .reset_b(reset_b),
        .Bit_Counter_sel(Bit_Counter_sel),
        .RX_Shift_Register_sel(RX_Shift_Register_sel),
        .RX_Data_in(RX_Data_in),
        
        .RX_Data_out(RX_Data_out),
        .Bit_Count_Reached(Bit_Count_Reached)               
        
    );
    
    UART_RX_CONTROLLER UART_RX_CONTROLLER_inst (

        .clk(clk),
        .reset_b(reset_b),
        .RX_Data_in(RX_Data_in),
        .Bit_Count_Reached(Bit_Count_Reached),  

        .RX_Shift_Register_sel(RX_Shift_Register_sel),
        .Bit_Counter_sel(Bit_Counter_sel),
        .RX_Data_Ready(RX_Data_Ready)
    
    );
    
    
endmodule
