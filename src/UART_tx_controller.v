module UART_TX_CONTROLLER (

    input clk,
    input reset_b,
    input TX_en,
    input Bit_Count_Reached,
    
    output reg [1:0] TX_Shift_Register_sel,
    output reg Bit_Counter_sel,
    output reg TX_Ready_To_Send

);

    parameter [1:0] 
        IDLE = 2'b00,
        LOAD_DATA = 2'b01,
        SEND_DATA = 2'b10;
    
    parameter [1:0]
        CLEAR = 2'b00,
        SHIFT = 2'b01,
        LOAD = 2'b10;
        
    parameter
        ZERO = 1'b0,
        INCREMENT = 1'b1;
    parameter
        FALSE = 1'b0,
        TRUE = 1'b1;
        
    reg [1:0] current_state, next_state;    
        
    always@(posedge clk or negedge reset_b)begin
        if(!reset_b)begin
            current_state <= IDLE;
        end
        else begin
            current_state <= next_state;
        end
    end
    
    always@(*)begin
        case(current_state)
            IDLE: begin
                TX_Shift_Register_sel   <= CLEAR;
                Bit_Counter_sel         <= ZERO;
                TX_Ready_To_Send        <= TRUE;
                if(TX_en) next_state    <= LOAD_DATA;
                else next_state         <= IDLE;
            end
            LOAD_DATA:begin
                TX_Shift_Register_sel   <= LOAD;
                Bit_Counter_sel         <= ZERO;
                TX_Ready_To_Send        <= FALSE;
                next_state              <= SEND_DATA;
            end
            SEND_DATA:begin
                TX_Shift_Register_sel   <= SHIFT;
                Bit_Counter_sel         <= INCREMENT;
                TX_Ready_To_Send        <= FALSE;
                if(Bit_Count_Reached)
                begin
                    next_state          <= IDLE;
                end
                else next_state         <= SEND_DATA;
            end
            default: begin
                TX_Shift_Register_sel   <= CLEAR;
                Bit_Counter_sel         <= ZERO;
                TX_Ready_To_Send        <= FALSE;
                next_state              <= IDLE;
            end
        endcase
    end
endmodule