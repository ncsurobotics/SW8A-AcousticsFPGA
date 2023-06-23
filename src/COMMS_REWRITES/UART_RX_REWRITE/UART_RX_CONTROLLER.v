module UART_RX_CONTROLLER #(
    
) (
    input clk,
    input reset_b,
    input RX_Data_in,
    input Bit_Count_Reached, // count == 8
    input Baud_Count_Reached, // count == 55

    output reg RX_Shift_Register_sel,
    output reg [1:0] Bit_Counter_sel, // counter to 8
    output reg [1:0] Baud_Counter_sel, // counter to 55: hold, increment, reset
    output reg RX_Data_Ready
);

parameter [1:0] // state localparams
    IDLE = 2'b00,
    COUNT_TO_54 = 2'b01,
    SAMPLE = 2'b10,
    WAIT_FOR_STOP_BIT = 2'b11;

parameter [1:0] // counter to 55 localparams
    HOLD_CTR = 2'b10,
    COUNT = 2'b11 ,
    ZERO = 2'b00;

parameter
    HOLD = 1'b0,
    SHIFT = 1'b1;

parameter
    FALSE =  1'b0,
    TRUE =  1'b1;

reg [1:0] current_state, next_state;

always @ (posedge clk or negedge reset_b) begin
    if (!reset_b) begin
        current_state <= IDLE;
    end
    else current_state <= next_state;
end

always @ (*) begin
    case (current_state)
        IDLE: begin
            RX_Shift_Register_sel   <= HOLD;
            Bit_Counter_sel         <= ZERO;
            RX_Data_Ready           <= FALSE;
            Baud_Counter_sel        <= ZERO;

            if (!RX_Data_in) next_state <= COUNT_TO_54;
            else next_state             <= IDLE;
        end 

        COUNT_TO_54: begin
            RX_Shift_Register_sel   <= HOLD;
            Bit_Counter_sel         <= HOLD_CTR;
            RX_Data_Ready           <= FALSE;
            Baud_Counter_sel        <= INCREMENT_CTR;

            if (Baud_Count_Reached) next_state <= SAMPLE;
            else next_state             <= COUNT_TO_54;
        end

        SAMPLE: begin
            RX_Shift_Register_sel   <= SHIFT;
            Bit_Counter_sel         <= INCREMENT_CTR;
            RX_Data_Ready           <= FALSE;
            Baud_Counter_sel        <= ZERO_CTR;

            if (Bit_Count_Reached) next_state <= WAIT_FOR_STOP_BIT;
            else next_state <= COUNT_TO_54;
        end

        WAIT_FOR_STOP_BIT: begin
            RX_Shift_Register_sel   <= HOLD;
            Bit_Counter_sel         <= ZERO_CTR;
            RX_Data_Ready           <= TRUE;
            Baud_Counter_sel        <= ZERO_CTR;

            if (RX_Data_in) next_state <= IDLE;
            else next_state <= WAIT_FOR_STOP_BIT;
        end

        default: begin
            RX_Shift_Register_sel   <= HOLD;
            Bit_Counter_sel         <= ZERO_CTR;
            RX_Data_Ready           <= FALSE;
            Baud_Counter_sel        <= ZERO_CTR;

            next_state <= IDLE;
        end
    endcase 
end

endmodule