// Test State Machine: state machine for March 11 pool test
// looks for an incoming request for data from PC -> uart_rx
// then sends each channel's latest reading

module Test_State_Machine (
    input clk,
    input reset_b,
    input rx_ready, // from uart_rx
    input [7:0] rx_data, // from uart_rx
    input tx_ready, // from uart_tx

    output reg txing,
    output reg [1:0] word_to_send_sel,
    output reg tx_send 
);

// PARAMETERS -------------------------------------------------

parameter [2:0] 
    S_IDLE      = 3'b000,
    S_RX_CHECK  = 3'b001,
    S_TX_0      = 3'b010,
    S_WAIT_0    = 3'b011,
    S_TX_1      = 3'b100,
    S_WAIT_1    = 3'b101,
    S_TX_2      = 3'b110,
    S_WAIT_2    = 3'b111;

parameter [1:0]
    SEND_IDLE = 2'b00,
    SEND_LABEL = 2'b01,
    SEND_LSB = 2'b10,
    SEND_MSB = 2'b11;


// REGS -------------------------------------------------------
reg [2:0] state, next_state;


// STATE MACHINE ----------------------------------------------

always @ (posedge clk or negedge reset_b) begin
    if (!reset_b) state = S_IDLE;
    else state = next_state;
end

always @ (*) begin
    
    case (state)
        S_IDLE: begin
            txing <= 1'b0;
            word_to_send_sel <= SEND_IDLE;
            tx_send <= 1'b0;

            next_state <= (rx_ready) ? S_RX_CHECK : S_IDLE;
        end

        S_RX_CHECK: begin
            txing <= 1'b0;
            word_to_send_sel <= SEND_IDLE;
            tx_send <= 1'b0;

            if (rx_data == 8'h41) next_state <= S_TX_0;
            else next_state <= S_IDLE;
        end 

        S_TX_0: begin
            txing <= 1'b1;
            word_to_send_sel <= SEND_LABEL;
            tx_send <= 1'b1;

            next_state <= S_WAIT_0;
        end

        S_WAIT_0: begin
            txing <= 1'b1;
            word_to_send_sel <= SEND_LABEL;
            tx_send <= 1'b0;

            next_state <= (tx_ready) ? S_TX_1 : S_WAIT_0;
        end

        S_TX_1: begin
            txing <= 1'b1;
            word_to_send_sel <= SEND_LSB;
            tx_send <= 1'b1;

            next_state <= S_WAIT_1;
        end

        S_WAIT_1: begin
            txing <= 1'b1;
            word_to_send_sel <= SEND_LSB;
            tx_send <= 1'b0;

            next_state <= (tx_ready) ? S_TX_2 : S_WAIT_1;
        end

        S_TX_2: begin
            txing <= 1'b1;
            word_to_send_sel <= SEND_MSB;
            tx_send <= 1'b1;

            next_state <= S_WAIT_2;
        end

        S_WAIT_2: begin
            txing <= 1'b1;
            word_to_send_sel <= SEND_MSB;
            tx_send <= 1'b0;

            next_state <= (tx_ready) ? S_IDLE : S_WAIT_2;
        end

        default: begin
            txing <= 1'b1;
            word_to_send_sel <= SEND_IDLE;
            tx_send <= 1'b0;
            next_state <= S_IDLE;
        end
        
    endcase

end


endmodule