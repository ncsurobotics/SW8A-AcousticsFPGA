// ADC emulator -- emulates LTC1197, sending 10-bit test data
// Sends HI-Z until clock cycle 3 (4 on datasheet) 
//      instead of HI-Z followed by null bits
// spi clock period: 140 ns, delay value: 68 ns

// send MSB first

module ADC_EMULATOR(
    input spi_clk, cs, reset_b,
    input [9:0] data_in,
    output reg data_out
);

parameter
    IDLE = 1'b0,
    SHIFT = 1'b1;

reg current_state, next_state;
reg [13:0] shift_register;

always @ (posedge clk or negedge reset_b) begin
    if (!reset_b) begin
        current_state <= IDLE;
        shift_
    end
end


endmodule

module adc_emulator_old (
    input clk, spi_clk, cs, reset_b,
    input [9:0] data_in,
    output reg data_out
);

parameter [1:0]
            WAIT_FOR_CS = 2'b00,
            SEND_HIZ    = 2'b01,
            SEND_DATA   = 2'b10;

reg [1:0] state, next_state;
reg [9:0] word_to_send;
reg data_reg;


// count to 13
reg [1:0] counter_sel;
wire [19:0] counter_value;
reg counter_enable;
counter count_13(   .counter_sel(counter_sel), 
                    .reset_b(reset_b),
                    .clk(spi_clk),
                    .counter_value(counter_value),
                    .enable(counter_enable)
                );

// State change @ system clk
always @ (posedge clk or negedge reset_b or posedge cs) begin
    if (!reset_b) begin
        state <= WAIT_FOR_CS;
    end
    if(cs) state<= WAIT_FOR_CS;
    else state <= next_state;
end

// Set / Reset "ADC input" @ negedge CS
always @ (posedge cs or negedge cs) begin
    if (!cs) word_to_send <= data_in;
    else word_to_send <= 10'bz;
end

// Data reg & next state logic
always @ (*) begin
    case (state)
        WAIT_FOR_CS: begin
            data_reg <= 1'bz;
            counter_sel <= 2'b00;   // hold counter @ 0
            counter_enable <= 1'b0;
            if (!cs) next_state <= SEND_HIZ;
            else next_state <= WAIT_FOR_CS;
        end

        SEND_HIZ: begin
            data_reg <= 1'bz; 
            counter_sel <= 2'b11; // start counting
            counter_enable <= 1'b1;
            if (counter_value == 3) next_state <= SEND_DATA;
            else next_state <= SEND_HIZ;
        end

        SEND_DATA: begin
            data_reg <= word_to_send[12-counter_value];
            counter_sel <= 2'b11;
            counter_enable <= 1'b1;
            next_state <= SEND_DATA;
        end

        default: begin
            data_reg <= 1'bz;
            counter_sel <= 2'b11;
            counter_enable <= 1'b0;
            next_state <= WAIT_FOR_CS;
        end
    endcase
end

// Data out delayed by 68 ns (see LTC1197 datasheet)
always @ (posedge spi_clk) begin
    #68 data_out <= data_reg;
end

endmodule