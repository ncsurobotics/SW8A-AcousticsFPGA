// SPI Testbench for FPGA-ADC interface
// includes ADC emulator

// ADC emulator -- emulates LTC1197, sending 10-bit test data
// Unlike the actual ADC, the data changes exactly at the clock edge. Use delays in tb:
// clock period: 140 ns, delay value: 68 ns

// send MSB first
module adc_emulator (
    input clk, cs, reset_b,
    input [9:0] word_to_send,
    output reg data_out
);

// states: wait for CS, got CS = start counting, send zeroes, send data
parameter [1:0] 
            WAIT_FOR_CS = 2'b00,
            START = 2'b01,
            ZEROES = 2'b10,
            SEND_DATA = 2'b11;

// $readmemb
reg data_reg;
// reg [3:0] bit_index = 4'b0;
reg cs_flag;
reg [1:0] state, next_state;

// count to 13
reg [1:0] counter_sel;
wire [19:0] counter_value;

counter count_13(   .counter_sel(counter_sel), 
                    .reset_b(reset_b),
                    .clk(clk),
                    .counter_value(counter_value)
                );

always @ (*) begin
    case (state) 
        WAIT_FOR_CS: begin  // state is WAIT_FOR_CS on startup, and cycles back here after transmission is done
                            // transmission can't be interrupted by cs since cs_flag isn't read anywhere else
            data_reg <= 1'bz;
            counter_sel <= 2'b00;
            if (!cs_flag) begin
                next_state <= START;
            end
            else next_state <= WAIT_FOR_CS;
        end

        START: begin
            data_reg <= 1'bz;
            counter_sel <= 2'b11;
            if (counter_value == 1)  next_state <= ZEROES; // on LTC1197 datasheet, 0s start @ ~negedge clk 2
                                                            // here, fall @ posedge clk 1 with ~1/2 clk period delay
            else next_state <= START;
        end

        ZEROES: begin
            data_reg <= 1'b0;
            counter_sel <= 2'b11;
            if (counter_value == 3) next_state <= SEND_DATA;
            else next_state <= ZEROES;
        end

        SEND_DATA: begin
            data_reg <= word_to_send[12-counter_value]; // works in sim
            counter_sel <= 2'b11;
            if (counter_value == 13) next_state <= WAIT_FOR_CS;
            else next_state <= SEND_DATA;
        end
    endcase
end

always @ (negedge cs) begin
    cs_flag <= 1'b0;
end

always @ (posedge clk or negedge reset_b) begin
        if (!reset_b) begin
            state <= WAIT_FOR_CS;
            cs_flag <= 1'b1;
        end
        else begin
            state <= next_state;
            cs_flag <= 1'b1;
        end

        #68 data_out <= data_reg; // 68 ns delay -- typical delay of LTC1197
end


endmodule



module spi_tb();

reg clk; // spi_clk w/ period 140 ns
reg reset_b;
wire cs;
wire adc_out;

wire [19:0] counter_SIPO_value;
wire [1:0] counter_SIPO_sel;

wire data_logging, data_ready;
wire [9:0] sipo0_out;


counter SIPO_counter(
                    .clk(clk),
                    .counter_sel(counter_SIPO_sel),
                    .reset_b(reset_b),
                    .counter_value(counter_SIPO_value)
                    );

SIPO_controller sipo_controller0(   
                                    .clk(clk),
                                    .control_signal(cs),    // SIPO_controller output
                                    .reset_b(reset_b),
                                    .counter_value(counter_SIPO_value),
                                    .data_logging(data_logging),
                                    .data_ready(data_ready),
                                    .counter_sel(counter_SIPO_sel)
                                ); 

SIPO dut( .clk(clk),
            .data_in(adc_out),
            .reset_b(reset_b),
            .data_logging(data_logging),
            .data_out(sipo0_out)
            );               

adc_emulator adc(.clk(clk), .cs(cs), .data_out(adc_out));

always #70 clk = !clk;

initial begin
    #0  clk = 1'b1;
        reset_b = 1'b0;
    
    #210 reset_b = 1'b1;

    #2300 $stop; 

end

endmodule