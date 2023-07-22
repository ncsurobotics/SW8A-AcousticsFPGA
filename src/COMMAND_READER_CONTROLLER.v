`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/20/2023 07:50:51 PM
// Design Name: 
// Module Name: COMMAND_READER_CONTROLLER
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


module COMMAND_READER_CONTROLLER(

    input clk,
    input reset_b,
    input Rx_Ready,
    input RsTx,
    input Tx_Ready,
    input Trigger,
    input FFT_Data_Ready,
    input [7:0]Command,
    input Timeout,
    
    output reg [1:0] Timer_sel,
    output reg [1:0] Word_To_Send_sel,
    output reg Set_Threshold_sel,
    output reg Set_Frequency_sel,
    output reg [1:0] RAM_Read_Offset,
    output reg TX_en,
    output reg TX_Write_en

);
    parameter 
        HOLD = 1'b0,
        SET = 1'b1;
        
    parameter [1:0] 
        ZERO = 2'b00,
        HOLD_COUNT = 2'b10,
        COUNT = 2'b11;
        
    parameter [2:0]
        HOLD_VALUE = 2'b00,
        MAX_VALUE = 2'b01,
        TRUE = 2'b10,
        FALSE = 2'b11;
    
    parameter [3:0]
        IDLE = 4'b0000,
        INTERPERET_OP = 4'b0001,
        SET_FREQUENCY = 4'b0010,
        SET_THRESHOLD = 4'b0011,
        SEND_MAX = 4'b0100,
        TRIGGER_DETECT = 4'b0101,
        TX_EN = 4'b0110,
        TX_SEND = 4'b0111,
        READ_0 = 4'b1000,
        READ_1 = 4'b1001,
        READ_2 = 4'b1010,
        WRITE_TRUE = 4'b1011,
        WRITE_FALSE = 4'b1100,
        LOAD_0 = 4'b1101;
    
    reg [3:0] current_state, next_state;
    
    always@(posedge clk or negedge reset_b) begin
        if(!reset_b) begin
            current_state <= IDLE;
        end
        else begin
            current_state <= next_state;
        end
    end  
        
    always@(*)begin   
        if(Timeout) begin
            next_state <= WRITE_FALSE;
            Timer_sel <= COUNT;
            Word_To_Send_sel <= ZERO;
            Set_Threshold_sel <= HOLD;
            Set_Frequency_sel <= HOLD; 
            RAM_Read_Offset <= 2'b01; 
            TX_en <= 0;
            TX_Write_en <= 0; 
        end
        else 
        case(current_state) 
            IDLE:begin
                if(Rx_Ready)begin
                    next_state <= INTERPERET_OP;
                end
                else begin
                    next_state <= IDLE;
                end 
                Timer_sel <= ZERO;
                Word_To_Send_sel <= HOLD_VALUE;
                Set_Threshold_sel <= HOLD;
                Set_Frequency_sel <= HOLD;
                RAM_Read_Offset <= 2'b00;   
                TX_en <= 0;
                TX_Write_en <= 0;  
            end
            INTERPERET_OP:begin
                case(Command[3:0])
                    4'hf:begin
                        next_state <= SET_FREQUENCY;
                    end
                    4'h7:begin
                        next_state <= SET_THRESHOLD;
                    end
                    4'h4:begin
                        next_state <= SEND_MAX;
                    end
                    4'hd:begin
                        next_state <= TRIGGER_DETECT;
                    end
                    default:begin
                        next_state <= IDLE;
                    end
                endcase
                Timer_sel <= ZERO;
                Word_To_Send_sel <= HOLD_VALUE;
                Set_Threshold_sel <= HOLD;
                Set_Frequency_sel <= HOLD;   
                RAM_Read_Offset <= 2'b00; 
                TX_en <= 0;
                TX_Write_en <= 0;   
            end
            SET_FREQUENCY:begin
                next_state <= IDLE;
                Timer_sel <= ZERO;
                Word_To_Send_sel <= HOLD_VALUE;
                Set_Threshold_sel <= HOLD;
                Set_Frequency_sel <= SET; 
                RAM_Read_Offset <= 2'b00;  
                TX_en <= 0;
                TX_Write_en <= 0; 
            end
            SET_THRESHOLD:begin
                next_state <= IDLE;
                Timer_sel <= ZERO;
                Word_To_Send_sel <= HOLD_VALUE;
                Set_Threshold_sel <= SET;
                Set_Frequency_sel <= HOLD; 
                RAM_Read_Offset <= 2'b00; 
                TX_en <= 0;
                TX_Write_en <= 0; 
            end
            SEND_MAX:begin
                next_state <= TX_EN;
                Timer_sel <= ZERO;
                Word_To_Send_sel <= MAX_VALUE;
                Set_Threshold_sel <= HOLD;
                Set_Frequency_sel <= HOLD;
                RAM_Read_Offset <= 2'b00;    
                TX_en <= 1'b1;
                TX_Write_en <= 1'b1;
            end
            TRIGGER_DETECT:begin
                if(FFT_Data_Ready) next_state <= READ_0;
                else next_state <= TRIGGER_DETECT;
                Timer_sel <= COUNT;
                Word_To_Send_sel <= HOLD_VALUE;
                Set_Threshold_sel <= HOLD;
                Set_Frequency_sel <= HOLD; 
                RAM_Read_Offset <= 2'b00;  
                TX_en <= 0;
                TX_Write_en <= 0; 
            end
            LOAD_0: begin
                next_state <= READ_0;
                Timer_sel <= COUNT;
                Word_To_Send_sel <= HOLD_VALUE;
                Set_Threshold_sel <= HOLD;
                Set_Frequency_sel <= HOLD; 
                RAM_Read_Offset <= 2'b00; 
                TX_en <= 0;
                TX_Write_en <= 0; 
            
            end
            READ_0:begin
                if(!Trigger) next_state <= READ_1;
                else next_state <= WRITE_TRUE;
                Timer_sel <= COUNT;
                Word_To_Send_sel <= HOLD_VALUE;
                Set_Threshold_sel <= HOLD;
                Set_Frequency_sel <= HOLD; 
                RAM_Read_Offset <= 2'b00; 
                TX_en <= 0;
                TX_Write_en <= 0; 
            end
            READ_1:begin
                if(!Trigger) next_state <= READ_2;
                else next_state <= WRITE_TRUE;
                Timer_sel <= COUNT;
                Word_To_Send_sel <= HOLD_VALUE;
                Set_Threshold_sel <= HOLD;
                Set_Frequency_sel <= HOLD; 
                RAM_Read_Offset <= 2'b01;  
                TX_en <= 0;
                TX_Write_en <= 0; 
            end
            READ_2:begin
                if(!Trigger) next_state <= TRIGGER_DETECT;
                else next_state <= WRITE_TRUE;
                Timer_sel <= COUNT;
                Word_To_Send_sel <= HOLD_VALUE;
                Set_Threshold_sel <= HOLD;
                Set_Frequency_sel <= HOLD; 
                RAM_Read_Offset <= 2'b10;  
                TX_en <= 0;
                TX_Write_en <= 0; 
            end
            WRITE_TRUE:begin
                next_state <= TX_EN;
                Timer_sel <= ZERO;
                Word_To_Send_sel <= TRUE;
                Set_Threshold_sel <= HOLD;
                Set_Frequency_sel <= HOLD; 
                RAM_Read_Offset <= 2'b00;  
                TX_en <= 1'b1;
                TX_Write_en <= 1'b1; 
            end
            WRITE_FALSE:begin
                next_state <= TX_EN;
                Timer_sel <= ZERO;
                Word_To_Send_sel <= FALSE;
                Set_Threshold_sel <= HOLD;
                Set_Frequency_sel <= HOLD; 
                RAM_Read_Offset <= 2'b00;  
                TX_en <= 1'b0;
                TX_Write_en <= 1'b0; 
            end
            TX_EN:begin 
                if(RsTx) next_state <= TX_EN;
                else next_state <= TX_SEND;
                Timer_sel <= ZERO;
                Word_To_Send_sel <= HOLD_VALUE;
                Set_Threshold_sel <= HOLD;
                Set_Frequency_sel <= HOLD; 
                RAM_Read_Offset <= 2'b00;  
                TX_en <= 1'b1;
                TX_Write_en <= 1'b1; 
            end
            TX_SEND:begin
                if(Tx_Ready) next_state <= IDLE;
                else next_state <= TX_SEND;
                Timer_sel <= ZERO;
                Word_To_Send_sel <= HOLD_VALUE;
                Set_Threshold_sel <= HOLD;
                Set_Frequency_sel <= HOLD; 
                RAM_Read_Offset <= 2'b00;  
                TX_en <= 1'b0;
                TX_Write_en <= 1'b0; 
            end
            default:begin
                next_state <= IDLE;
                Timer_sel <= ZERO;
                Word_To_Send_sel <= HOLD_VALUE;
                Set_Threshold_sel <= HOLD;
                Set_Frequency_sel <= HOLD;
                RAM_Read_Offset <= 2'b00;   
                TX_en <= 0;
                TX_Write_en <= 0;  
            end
        endcase
        

    end
      
      
      
      
endmodule
