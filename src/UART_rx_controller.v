// UART tx and rx modules 



module UART_rx_controller ( input clk,
                            input reset_b,
                            input baud_mid_compare_val,
                            input bit_counter_compare_val,

                            output reg shift_rx_sel,
                            output reg [1:0] UART_baud_counter_sel,
                            output reg [1:0] bit_counter_sel,
                            output reg baud_mid_compare_sel,
                            output reg data_ready
);

// parameters ---------------------------------------------------------
parameter [2:0] // states
    S0: 3'b000, // idle/reset
    S1: 3'b001, // count to middle of 1st data bit
    S2: 3'b010, // shift in new data
    S3: 3'b011, // check whether got 8 data bits
    S4: 3'b100, // count to middle of next data bit
    S5: 3'b101; // data ready

parameter [1:0] // macros for counter_sel outputs
    ZERO: 2'b00,
    HOLD: 2'b01,
    COUNT: 2'b11;

reg [2:0] state, next_state;

always @ (posedge clk or negedge reset_b) begin
    if (!reset_b) state = S0;
    else state = next_state;
end

always @ (*) begin
    case (state)
        S0: begin   // idle/reset
            shift_rx_sel <= 1'b0;
            UART_baud_counter_sel <= ZERO;
            bit_counter_sel <= ZERO;
            baud_mid_compare_sel <= 1'b1;       // 1.5 bits value -- count until middle of 1st bit
            data_ready <= 1'b0;

            if (!rx) next_state <= S1;  // transition to S1 @ start bit
            else next_state <= S0;
        end

        S1: begin
            shift_rx_sel <= 1'b0;
            UART_baud_counter_sel <= COUNT;
            bit_counter_sel <= ZERO;
            baud_mid_compare_sel <= 1'b0;
            data_ready <= 1'b0;

            if (baud_mid_compare_val) next_state <= S2;
            else next_state <= S1;
        end

        S2: begin
            shift_rx_sel <= 1'b1;
            UART_baud_counter_sel <= HOLD;
            bit_counter_sel <= COUNT;
            baud_mid_compare_sel <= 1'b0;
            data_ready <= 1'b0;

            next_state <= S3;
        end

        S3: begin
            shift_rx_sel <= 1'b0;
            UART_baud_counter_sel <= HOLD;
            bit_counter_sel <= HOLD;
            baud_mid_compare_sel <= 1'b1;
            data_ready <= 1'b0;

            if (bit_counter_compare_val) next_state <= S5;
            else next_state <= S4;
        end

        S4: begin
            shift_rx_sel <= 1'b0;
            UART_baud_counter_sel <= COUNT;
            bit_counter_sel <= HOLD;
            baud_mid_compare_sel <= 1'b1;
            data_ready <= 1'b0;

            if (baud_mid_compare_val) next_state <= S2;
            else next_state <= S4;
        end

        S5: begin
            shift_rx_sel <= 1'b0;
            UART_baud_counter_sel <= ZERO;
            bit_counter_sel <= ZERO;
            baud_mid_compare_sel <= 1'b0;
            data_ready <= 1'b1;

            next_state <= S0;
        end
    endcase
end
    
endmodule

