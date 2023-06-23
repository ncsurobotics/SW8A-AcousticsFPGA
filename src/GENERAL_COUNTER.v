`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/22/2023 10:19:02 PM
// Design Name: 
// Module Name: GENERAL_COUNTER
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


module GENERAL_COUNTER #(COUNT_VAL=0, COUNT_BIT_WIDTH=0)(

    input clk,
    input reset_b,
    input [1:0] Count_sel,
    
    output Count_Reached

);

    parameter [1:0] 
        ZERO = 2'b00,
        HOLD = 2'b10,
        COUNT = 2'b11;

    reg [COUNT_BIT_WIDTH-1:0] Counter_Value_reg, Counter_Value_Next;
    
    always@(posedge clk or negedge reset_b) begin
        if(!reset_b) begin 
            Counter_Value_reg <= 0;
        end
        else begin
            Counter_Value_reg <= Counter_Value_Next;
        end    
    end

    always@(*) begin
        case(Count_sel) 
            ZERO: begin
                Counter_Value_Next <= 0;
            end
            HOLD: begin
                Counter_Value_Next <= Counter_Value_reg;
            end
            COUNT: begin
                Counter_Value_Next <= Counter_Value_reg + 1;
            end
            default: begin
                Counter_Value_Next <= 0;
            end
        endcase 
    end
    
    assign Count_Reached = (Counter_Value_reg == COUNT_VAL);
    

endmodule
