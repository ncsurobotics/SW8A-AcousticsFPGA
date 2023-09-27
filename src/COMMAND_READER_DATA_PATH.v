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
    
    assign Channel_sel = Command[2:0];
    
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
    
    // CDC handling for Timeout
    wire timeout_int;
    xpm_cdc_single #(
        .DEST_SYNC_FF(4),   // DECIMAL; range: 2-10
        .INIT_SYNC_FF(0),   // DECIMAL; 0=disable simulation init values, 1=enable simulation init values
        .SIM_ASSERT_CHK(1), // DECIMAL; 0=disable simulation messages, 1=enable simulation messages
        .SRC_INPUT_REG(1)   // DECIMAL; 0=do not register input, 1=register input
    )
    xpm_cdc_single_inst (
        .dest_out(Timeout), // 1-bit output: src_in synchronized to the destination clock domain. This output is
                               // registered.

        .dest_clk(clk), // 1-bit input: Clock signal for the destination clock domain.
        .src_clk(slow_clk),   // 1-bit input: optional; required when SRC_INPUT_REG = 1
        .src_in(timeout_int)      // 1-bit input: Input signal to be synchronized to dest_clk domain.
    );
    
    // CDC for timer_sel
    integer i;
    (* ASYNC_REG = "TRUE" *) reg [1:0] timer_sel_sync [0:3];
    always @ (posedge slow_clk) begin
        for (i=3; i>0; i=i-1) timer_sel_sync[i] <= timer_sel_sync[i-1];
        timer_sel_sync[0] <= Timer_sel;
    end
    
    GENERAL_COUNTER  #(.COUNT_VAL(23040000), . COUNT_BIT_WIDTH(25)) Timer (
        .clk(slow_clk),
        .reset_b(reset_b),
        .Count_sel(timer_sel_sync[3]),
        .Count_Reached(timeout_int) // timeout internal --> CDC
    );

endmodule
