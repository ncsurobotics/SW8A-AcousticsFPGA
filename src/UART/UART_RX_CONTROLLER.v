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

parameter [2:0] // state localparams
    IDLE                = 3'b000,
    COUNT_TO_54         = 3'b001,
    SAMPLE              = 3'b010,
    WAIT_FOR_STOP_BIT   = 3'b011,
    DATA_READY          = 3'b100;

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

reg [2:0] current_state, next_state;

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
            Baud_Counter_sel        <= COUNT;
            if(Bit_Count_Reached) next_state <= WAIT_FOR_STOP_BIT;
            if (Baud_Count_Reached) next_state <= SAMPLE;
            else next_state             <= COUNT_TO_54;
        end

        SAMPLE: begin
            
            Bit_Counter_sel         <= COUNT;
            RX_Data_Ready           <= FALSE;
            Baud_Counter_sel        <= ZERO;

            if (Bit_Count_Reached) begin 
                next_state <= WAIT_FOR_STOP_BIT;
                RX_Shift_Register_sel   <= HOLD; 
            end
            else begin
                next_state <= COUNT_TO_54;
                RX_Shift_Register_sel   <= SHIFT;
            end
        end

        WAIT_FOR_STOP_BIT: begin
            RX_Shift_Register_sel   <= HOLD;
            Bit_Counter_sel         <= ZERO;
            RX_Data_Ready           <= FALSE;
            Baud_Counter_sel        <= ZERO;

            if (RX_Data_in) next_state <= DATA_READY;
            else next_state <= WAIT_FOR_STOP_BIT;
        end

        DATA_READY: begin
            RX_Shift_Register_sel   <= HOLD;
            Bit_Counter_sel         <= ZERO;
            RX_Data_Ready           <= TRUE;
            Baud_Counter_sel        <= ZERO;
            
            next_state              <= IDLE;
        end

        default: begin
            RX_Shift_Register_sel   <= HOLD;
            Bit_Counter_sel         <= ZERO;
            RX_Data_Ready           <= FALSE;
            Baud_Counter_sel        <= ZERO;

            next_state <= IDLE;
        end
    endcase 
end

endmodule