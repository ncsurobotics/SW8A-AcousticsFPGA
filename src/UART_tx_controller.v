

module UART_tx_controller ( input clk,
                            input reset, 
                            input tx_en,
                            input baud_compare_val,
                            input bit_counter_compare_val,

                            output reg [1:0] shift_tx_sel,
                            output reg [1:0] tx_out_sel,
                            output reg [1:0] UART_baud_counter_sel,
                            output reg [1:0] bit_counter_sel,
                            output reg ready_to_send
);

// parameters ---------------------------------------------------------
parameter [2:0] // states
    S0: 3'b000, // idle/reset
    S1: 3'b001, // shift in tx_data_in word to send
    S2: 3'b010, // send start bit
    S3: 3'b011, // increment bit counter
    S4: 3'b100, // send a bit, count to 868
    S5: 3'b101, // check if 8 bits have been sent
    S6: 3'b110; // send stop bit

parameter [1:0]
    ZERO: 2'b00,    // counter select lines
    HOLD: 2'b01,
    COUNT: 2'b11,

    SHIFT: 2'b10,   // shift register select lines -- also uses ZERO and HOLD
    DATA_IN: 2'b11,

    START_BIT: 2'b00,   // tx_out_sel vals
    STOP_BIT: 2'b10,
    DATA_BIT: 2'b11;

reg [2:0] state, next_state;

always @ (posedge clk or negedge reset_b) begin
    if (!reset) state = S0;
    else state = next_state;
end
    
always @ (*) begin
    case (state)
        S0: begin   // idle/reset
            shift_tx_sel <= ZERO;
            tx_out_sel <= STOP_BIT;
            UART_baud_counter_sel <= ZERO;
            bit_counter_sel <= ZERO;
            ready_to_send <= 1'b1;

            if (tx_en) next_state <= S1;
            else next_state <= S0;    
        end

        S1: begin   // shift in tx_data_in
            shift_tx_sel <= DATA_BIT;
            tx_out_sel <= STOP_BIT;
            UART_baud_counter_sel <= ZERO;
            bit_counter_sel <= ZERO;
            ready_to_send <= 1'b0;

            next_state <= S2;  
        end

        S2: begin   // send start bit
            shift_tx_sel <= HOLD;
            tx_out_sel <= START_BIT;
            UART_baud_counter_sel <= COUNT;
            bit_counter_sel <= ZERO;
            ready_to_send <= 1'b0;

            if (baud_compare_val) next_state <= S3;
            else next_state <= S2; 
        end

        S3: begin   // increment bit counter
            shift_tx_sel <= HOLD;
            tx_out_sel <= DATA_BIT;
            UART_baud_counter_sel <= ZERO;
            bit_counter_sel <= COUNT;
            ready_to_send <= 1'b0;

            next_state <= S4;  
        end

        S4: begin   // send a bit, count to 868
            shift_tx_sel <= HOLD;
            tx_out_sel <= DATA_BIT;
            UART_baud_counter_sel <= COUNT;
            bit_counter_sel <= HOLD;
            ready_to_send <= 1'b0;

            if (baud_compare_val) next_state <= S5;
            else next_state <= S4; 
        end

        S5: begin   // check if 8 data bits have been sent, shift tx shift reg
            shift_tx_sel <= SHIFT;
            tx_out_sel <= DATA_BIT;
            UART_baud_counter_sel <= ZERO;
            bit_counter_sel <= HOLD;
            ready_to_send <= 1'b0;

            if (bit_counter_compare_val) next_state <= S6;
            else next_state <= S3; 
        end

        S6: begin   // shift in tx_data_in
            shift_tx_sel <= ZERO;
            tx_out_sel <= STOP_BIT;
            UART_baud_counter_sel <= COUNT;
            bit_counter_sel <= ZERO;
            ready_to_send <= 1'b0;

            if (baud_compare_val) next_state <= S0;
            else next_state <= S6;
        end
    endcase
end

endmodule