`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/20/2023 07:50:51 PM
// Design Name: 
// Module Name: COMMAND_READER_DATA_PATH
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


module COMMAND_READER_DATA_PATH(
    
    input clk,
    input reset_b,
    input slow_clk,
    input [7:0] Command,
    input [9:0] Max_Value,
    input [1:0] Word_To_Send_sel,
    input [1:0] Timer_sel,
    
    output reg [7:0] Word_To_Send,
    output [2:0] Channel_sel,
    output Timeout

);

    parameter [2:0]
        HOLD_VALUE = 2'b00,
        MAX_VALUE = 2'b01,
        TRUE = 2'b10,
        FALSE = 2'b11;
    

    
    reg [7:0] Next_Word_To_Send;
    
    assign Channel_sel = Command[3:0];
    
    always@(posedge clk or negedge reset_b) begin
        if(!reset_b)begin
            Word_To_Send <= 8'b0;
        end
        else begin
            Word_To_Send <= Next_Word_To_Send;
        end
        
    end
    
    always@(*) begin
        case(Word_To_Send_sel)
            HOLD_VALUE:begin
                Next_Word_To_Send <= Word_To_Send;
            end
            MAX_VALUE:
            begin
                Next_Word_To_Send <= Max_Value[9:2];
            end
            TRUE:
            begin
                Next_Word_To_Send <= 8'h30;
            end
            FALSE:
            begin
                Next_Word_To_Send <= 8'h31;
            end
        endcase
    end
    
    GENERAL_COUNTER  #(.COUNT_VAL(23040000), . COUNT_BIT_WIDTH(25)) Timer (
        .clk(slow_clk),
        .reset_b(reset_b),
        .Count_sel(Timer_sel),
        .Count_Reached(Timeout)
    );
    
    
    
    
    

endmodule
