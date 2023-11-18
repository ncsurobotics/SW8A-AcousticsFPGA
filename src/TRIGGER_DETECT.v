`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/19/2023 08:18:36 PM
// Design Name: 
// Module Name: TRIGGER_DETECT
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


module TRIGGER_DETECT(

    input clk,
    input reset_b,
    input [31:0] T_DATA,
    input T_VALID,
    input [15:0] Threshold,
    input [5:0] Frequency,  
    input [1:0] Offset,
    input [15:0] t_user,
    
    output T_READY,
    (* mark_debug = "true" *) output reg Trigger,
    output FFT_Data_Ready

);

    wire [31:0] Next_RAM_Data;
    wire Write_Address_sel;
    wire [5:0] Read_Address_With_Offset;
    wire [31:0] FFT_Data;
    
    (* mark_debug = "true" *) wire [7:0] FFT_index;
    
    assign FFT_index = t_user[7:0];
    assign Read_Address_With_Offset = Frequency + Offset;
    
    // verbose for debug
    (* mark_debug = "true" *) wire [15:0] val_to_compare;
    assign val_to_compare = (T_DATA[15] == 1'b0) ? T_DATA[15:0] : (~(T_DATA[15:0]) + 1); // magnitude of signed 2'sC int
    
    always@(*) begin
        if(FFT_index == 16 || FFT_index == 17 || FFT_index == 18) begin
            //Trigger = (T_DATA[15:0] > Threshold) && (T_DATA[15] != 1'b1);
            //if (T_DATA[15] == 1'b0) Trigger = T_DATA[15:0] > Threshold;
            //else Trigger = (~(T_DATA[15:0])+1) > Threshold;
            Trigger = val_to_compare > Threshold;
        end
        else Trigger = 1'b0;
    end


    AXI_SLAVE AXI_SLAVE_inst(
    
        .clk(clk),
        .reset_b(reset_b),
        .T_DATA(T_DATA),
        .T_VALID(T_VALID),
        .Write_Address_sel(Write_Address_sel),
        .T_READY(T_READY),
        .Next_RAM_Data(Next_RAM_Data),
        .Write_Address(Write_Address)
    
    );
    
    GENERAL_COUNTER #(.COUNT_VAL(63), . COUNT_BIT_WIDTH(6)) SAMPLE_COUNTER(
    
        .clk(clk),
        .reset_b(reset_b),
        .Count_sel({1'b1,T_VALID}),
        .Count_Reached(FFT_Data_Ready)
    
    );
    
    
    
    
    
    
    
    
    
    
    
    
endmodule
