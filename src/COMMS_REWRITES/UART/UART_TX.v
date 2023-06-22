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
    input UART_clk,
    input reset_b,
    input [WORD_SIZE-1:0] TX_Data_in,
    input TX_en,
    input TX_Write_en,

    output wire TX_Data_out,
    output wire TX_Ready_To_Send,
    output reg [WORD_SIZE-1:0] TX_Data_Register
);

    wire Bit_Count_Reached, Bit_Counter_sel;
    wire [1:0] TX_Shift_Register_sel;
    wire TX_Send_Data;
    wire TX_Allow_Write;
    
    assign TX_Send_Data = TX_en && TX_Ready_To_Send;
    assign TX_Allow_Write = TX_Write_en && TX_Ready_To_Send;
    
    always@(posedge clk or negedge reset_b) begin
        if(!reset_b) begin
            TX_Data_Register <= 0;
        end
        else begin
            if(TX_Allow_Write) begin
                TX_Data_Register <= TX_Data_in;
            end
            else begin
                TX_Data_Register <= TX_Data_Register;
            end 
        end
    
    end
    
    UART_TX_DATAPATH #(.WORD_SIZE(WORD_SIZE), .WORD_SIZE_WIDTH(WORD_SIZE_WIDTH)) UART_TX_DATAPATH_inst (
        
        .clk(UART_clk),
        .reset_b(reset_b),
        .Bit_Counter_sel(Bit_Counter_sel),
        .TX_Shift_Register_sel(TX_Shift_Register_sel),
        .TX_Data_in(TX_Data_Register),
        
        .TX_Data_out(TX_Data_out),
        .Bit_Count_Reached(Bit_Count_Reached)               
        
    );
    
    UART_TX_CONTROLLER UART_TX_CONTROLLER_inst (

        .clk(UART_clk),
        .reset_b(reset_b),
        .TX_en(TX_Send_Data),
        .Bit_Count_Reached(Bit_Count_Reached),  

        .TX_Shift_Register_sel(TX_Shift_Register_sel),
        .Bit_Counter_sel(Bit_Counter_sel),
        .TX_Ready_To_Send(TX_Ready_To_Send)
    
    );
    
endmodule
