//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/11/2023 04:29:05 PM
// Design Name: 
// Module Name: UART_RX_CONTROLLER
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


module UART_RX_CONTROLLER (

    input clk,
    input reset_b,
    input RX_Data_in,
    input Bit_Count_Reached,
    
    output reg RX_Shift_Register_sel,
    output reg Bit_Counter_sel,
    output reg RX_Data_Ready

);

    parameter 
        ZERO = 1'b0,
        INCREMENT = 1'b1;
        
    parameter 
        HOLD = 1'b0,
        SHIFT = 1'b1;
    parameter [1:0]
        IDLE = 2'b00,
        DATA_INCOMING = 2'b01,
        DATA_READY = 2'b11;
    parameter
        FALSE = 1'b0,
        TRUE = 1'b1;
              
    reg current_state, next_state;
    
    always@(posedge clk or negedge reset_b) begin
        if(!reset_b) begin
            current_state <= IDLE;
        end
        else begin
            current_state <= next_state;
        end
    end
    
    always@(*)begin
        case(current_state)
            IDLE: begin
                RX_Shift_Register_sel           <= HOLD;
                Bit_Counter_sel                 <= ZERO;
                RX_Data_Ready                   <= FALSE;
                if(RX_Data_in == 1'b0) next_state    <= DATA_INCOMING;
                else next_state                 <= IDLE;
            end
            DATA_INCOMING: begin
                RX_Shift_Register_sel           <= SHIFT;
                Bit_Counter_sel                 <= INCREMENT;
                RX_Data_Ready                   <= FALSE;
                if(Bit_Count_Reached)
                begin
                    next_state                  <= DATA_READY;
                end
                else next_state                 <= DATA_INCOMING;
            end
            DATA_READY: begin
                RX_Shift_Register_sel           <= HOLD;
                Bit_Counter_sel                 <= ZERO;
                RX_Data_Ready                   <= TRUE;
                next_state                      <= IDLE;
            end
            default: begin
                RX_Shift_Register_sel           <= HOLD;
                Bit_Counter_sel                 <= ZERO;
                RX_Data_Ready                   <= FALSE;
                next_state                      <= IDLE;
            end
            
        endcase
    end
    

endmodule