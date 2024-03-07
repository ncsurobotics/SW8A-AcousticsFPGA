`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/12/2023 10:10:14 PM
// Design Name: 
// Module Name: SPI_CONTROLLER
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


module SPI_CONTROLLER (

    input clk,
    input reset_b,
    input SPI_en,
    input Bit_Count_Reached,
    
    output reg RX_Shift_Register_sel,
    output reg Bit_Counter_sel,
    output reg Data_Ready,
    output reg CS
    
);

    parameter 
        ZERO            =   1'b0,
        INCREMENT       =   1'b1;
    parameter 
        HOLD = 1'b0,
        SHIFT = 1'b1;
    parameter
        FALSE            =   1'b0,
        TRUE            =   1'b1;
        
    parameter [1:0]
        IDLE            =   2'b00,
        CONTROL_PULSE   =   2'b01,
        DATA_LOGGING    =   2'b10,
        SAVE_DATA       =   2'b11;
        
        
    reg [1:0] current_state, next_state;
    
    always@(posedge clk or negedge reset_b) begin
        if(!reset_b) begin
            current_state <= IDLE;
        end
        else begin
            current_state <= next_state;
        end   
    end 
     
    always@(*) begin
        case(current_state)
            IDLE: begin
                Bit_Counter_sel     <=      ZERO;
                Data_Ready          <=      FALSE;
                RX_Shift_Register_sel <=    HOLD;
                CS                  <=      1'b1;
                if(SPI_en)      next_state <= CONTROL_PULSE;
                else            next_state <= IDLE;
            end
            CONTROL_PULSE:begin
                Bit_Counter_sel     <=      ZERO;
                Data_Ready          <=      FALSE;
                RX_Shift_Register_sel <=    HOLD;
                CS                  <=      1'b1;
                next_state <= DATA_LOGGING;
            end
            DATA_LOGGING:begin
                Bit_Counter_sel     <=      INCREMENT;
                Data_Ready          <=      FALSE;
                RX_Shift_Register_sel <=    SHIFT;
                CS                  <=      1'b0;
                if(Bit_Count_Reached)   next_state <= SAVE_DATA;
                else                    next_state <= DATA_LOGGING;
            end
            SAVE_DATA:begin
                Bit_Counter_sel     <=      ZERO;
                Data_Ready          <=      TRUE;
                RX_Shift_Register_sel <=    HOLD;
                CS                  <=      1'b0;
                if(SPI_en)  next_state <=       CONTROL_PULSE;
                else        next_state <=       IDLE;
            end
            
        endcase 
    
    end   
        
endmodule
