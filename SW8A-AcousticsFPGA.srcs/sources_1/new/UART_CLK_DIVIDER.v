`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/17/2023 12:26:03 PM
// Design Name: 
// Module Name: UART_CLK_DIVIDER
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


module UART_CLK_DIVIDER (

    input UART_clk_in,
    input reset_b,
    
    output reg UART_clk_out
    
);

    parameter [1:0]
        CLK_ZERO        = 2'b00,
        CLK_ONE         = 2'b11,
        RESET_ZERO      = 2'b10,
        RESET_ONE       = 2'b01;

    reg [1:0] current_state;
    reg [1:0] next_state;
    
    wire Bit_Count_Reached;
    reg Bit_Counter_sel;
    
    BIT_COUNTER #(.WORD_SIZE(24), . WORD_SIZE_WIDTH(5)) BIT_COUNTER_inst (
    
        .clk(UART_clk_in),
        .reset_b(reset_b),
        .Bit_Counter_sel(Bit_Counter_sel),
        
        .Bit_Count_Reached(Bit_Count_Reached)
    
    );
    
    always@(posedge UART_clk_in or negedge reset_b) begin
        if(!reset_b) begin
            current_state = CLK_ZERO;
        end
        
        else begin
            current_state = next_state;
        end
    end
    
    always@(*) begin
        case(current_state)
            CLK_ZERO: begin
                UART_clk_out <= 1'b0;
                Bit_Counter_sel <= 1'b1;
                if(Bit_Count_Reached) next_state <= RESET_ONE;
                else next_state <= CLK_ZERO;
            end
            CLK_ONE: begin
                UART_clk_out <= 1'b0;
                Bit_Counter_sel <= 1'b1;
                if(Bit_Count_Reached) next_state <= RESET_ZERO;
                else next_state <= CLK_ONE;
            end
            RESET_ONE: begin
                UART_clk_out <= 1'b0;
                Bit_Counter_sel <= 1'b0;
                next_state <= CLK_ONE;
            end
            RESET_ZERO: begin
                UART_clk_out <= 1'b1;
                Bit_Counter_sel <= 1'b0;
                next_state <= CLK_ZERO;
            end 
            default:begin
                UART_clk_out <= 1'b1;
                Bit_Counter_sel <= 1'b0;
                next_state <= CLK_ZERO;
            end 
        endcase
    end
    
    
    
    
    
    
    
    
    
    


endmodule
