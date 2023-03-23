// March 11 pool test controller
// submodules: SIPO_Controller, counter, Test_State_Machine

module Test_Controller (
                            input clk,
                            input spi_clk,
                            input reset_b,

                        // Test State Machine inputs (from UART)
                            input rx_ready,
                            input [7:0] rx_data,
                            input tx_ready,

                        // Test State Machine outputs
                            output txing,
                            output [1:0] word_to_send_sel,
                            output tx_send,

                        // SIPO Controller outputs
                            output data_logging,
                            output data_ready,
                            output control_signal   // top level module output
);

wire [19:0] counter_value;
wire [1:0] counter_sel;

Test_State_Machine test_sm_inst(.clk(clk),
                                .reset_b(reset_b),
                                .rx_ready(rx_ready),
                                .rx_data(rx_data),
                                .tx_ready(tx_ready),
                                .txing(txing),
                                .word_to_send_sel(word_to_send_sel),
                                .tx_send(tx_send)
                               );

SIPO_controller sipo_ctrl_inst( .clk(spi_clk),
                                .reset_b(reset_b),
                                .counter_value(counter_value),
                                .data_logging(data_logging),
                                .data_ready(data_ready),
                                .counter_sel(counter_sel),
                                .control_signal(control_signal)
                              );

counter SIPO_counter(   .clk(spi_clk),
                        .counter_sel(counter_sel),
                        .reset_b(reset_b),
                        .counter_value(counter_value),
                        .enable(1'b1)
                    );

endmodule


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