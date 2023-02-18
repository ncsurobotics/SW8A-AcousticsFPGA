// UART Receiver & Transmitter modules
// Tested in Sim

//  UART Receiver Module
//  at instantiation, set param BIT_COUNT to clock frequency / baud rate
//  default value = 100_000_000 / 115_200 = 868, max value = 1023
//
//  8 data bits (configurable), 1 stop bit, no parity  

module uart_rx #(   parameter [9:0] BIT_COUNT = 10'd868, parameter DATA_BITS = 8)
                (   input clk, 
                    input reset, 
                    input rx,   // serial in    
                    output reg [DATA_BITS-1:0] rx_data, 
                    output reg ready   // high for 1 clock cycle when data is ready
                );

// states
parameter [2:0] 
    S_IDLE = 3'b000,
    S_START_BIT = 3'b001,
    S_DATA_BITS = 3'b010,
    S_STOP_BIT = 3'b011,
    S_READY = 3'b100;

reg [9:0] sample_counter;
reg [3:0] bit_counter;
reg [DATA_BITS-1:0] data;

reg [2:0] state = S_IDLE;

always @ (posedge clk) begin
    if (!reset) state <= S_IDLE;

    case (state)

        S_IDLE: begin
            sample_counter <= 10'b0;
            bit_counter <= 4'b0;
            data <= data;
            rx_data <= rx_data;
            ready <= 1'b0;

            if (!rx) state <= S_START_BIT;
            else state <= S_IDLE;
        end

        S_START_BIT: begin
            sample_counter <= sample_counter + 1;
            bit_counter <= 4'b0;
            data <= data;
            rx_data <= rx_data;
            ready <= 1'b0;

            // transition to S_DATA_BITS in middle of start bit
            if (sample_counter > (BIT_COUNT >> 1'b1)) begin
                if (rx == 1'b0) begin
                    sample_counter <= 10'b0;
                    state <= S_DATA_BITS;
                end
                else state <= S_IDLE;
            end
            else state <= S_START_BIT;
        end

        S_DATA_BITS: begin

            // wait for new bit, then capture data
            if (sample_counter >= BIT_COUNT-1) begin
                sample_counter <= 10'b0;
                bit_counter <= bit_counter + 1;
                data <= {rx, data[DATA_BITS-1:1]};
            end
            else begin
                sample_counter <= sample_counter + 1;
                bit_counter <= bit_counter;
                data <= data;
            end

            rx_data <= rx_data;
            ready <= 1'b0;

            // transition to S_STOP_BIT after collecting DATA_BITS bits
            if (bit_counter == DATA_BITS) state <= S_STOP_BIT;
            else state <= S_DATA_BITS;

        end

        S_STOP_BIT: begin

            if (sample_counter >= BIT_COUNT-1) begin
                sample_counter <= 10'b0;
                state <= S_READY;
            end
            else begin
                sample_counter <= sample_counter + 1;
                state <= S_STOP_BIT;
            end

            bit_counter <= 4'b0;
            data <= data;
            rx_data <= rx_data;
            ready <= 1'b0;

        end

        S_READY: begin
            rx_data <= data;
            ready <= 1'b1;
            state <= S_IDLE;
        end

    endcase

end

endmodule


//  UART Transmitter Module
//  at instantiation, set param BIT_COUNT to clock frequency / baud rate
//  default value = 100_000_000 / 115_200 = 868, max value = 1023
//  input clock, data to send, and active high "tx_send" start signal
// 
//  8 data bits (configurable), 1 stop bit, no parity
//  

module uart_tx #(   parameter [9:0] BIT_COUNT = 10'd868, parameter DATA_BITS = 8)
                (   input clk, 
                    input tx_send, // active low
                    input [DATA_BITS-1:0] data_in,
                    output reg tx,
                    output reg ready
                );


parameter [1:0]
    // states
    S_IDLE = 2'b00,
    S_START_BIT = 2'b01,
    S_DATA_BITS = 2'b10,
    S_STOP_BIT = 2'b11;

reg [1:0] state; 
reg [1:0] next_state = S_IDLE;
reg [9:0] clock_counter;
reg [3:0] bit_index;
reg [3:0] bit_index_reg;
reg cc_sel;
reg tx_reg;


always @ (posedge clk) begin
    state <= next_state;
    tx <= tx_reg;
    clock_counter <= (cc_sel) ? clock_counter + 1 : 10'b0;
    bit_index <= bit_index_reg;
end


always @ (*) begin
    case (state)
        S_IDLE: begin
            tx_reg = 1'b1; // stop bit
            bit_index_reg = 4'b0;
            cc_sel = 1'b0;
            ready = 1'b1;   // module is idle, can send another character 

            next_state = (tx_send) ? S_START_BIT : S_IDLE;
        end

        S_START_BIT: begin
            tx_reg = 1'b0; // start bit
            bit_index_reg = 4'b0;
            ready = 1'b0;

            if (clock_counter >= BIT_COUNT-1) begin
                next_state = S_DATA_BITS;
                cc_sel = 1'b0; // reset clock counter
            end
            else begin
                next_state = S_START_BIT;
                cc_sel = 1'b1;
            end 
        end

        S_DATA_BITS: begin
            tx_reg = data_in[bit_index];
            ready = 1'b0;

            if (clock_counter >= BIT_COUNT-1) begin
                cc_sel = 1'b0; // reset clock counter
                bit_index_reg = bit_index + 1;                          // ** TEST
                if (bit_index >= DATA_BITS-1) next_state = S_STOP_BIT;
                else next_state = S_DATA_BITS;
            end
            else begin
                cc_sel = 1'b1;
                bit_index_reg = bit_index;
                next_state = S_DATA_BITS;
            end
        end

        S_STOP_BIT: begin 
            tx_reg = 1'b1; // stop bit
            bit_index_reg = 4'b0;
            ready = 1'b0;
            
            if (clock_counter >= BIT_COUNT-1) begin
                next_state = S_IDLE;
                cc_sel = 1'b0; // reset clock counter
            end
            else begin
                next_state = S_STOP_BIT;
                cc_sel = 1'b1;
            end   
        end

        default: begin
            tx_reg = 1'b1;
            bit_index_reg = 4'b0;
            ready = 1'b0;
            next_state = S_IDLE;
            cc_sel = 1'b0;
        end

    endcase
end

endmodule
