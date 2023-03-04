// Datapath for March 11 pool test

module Test_Datapath(
                        input clk,
                        input spi_clk,
                        input reset_b,

                    // SIPO inputs
                        input [3:0] adc_in,
                        input data_logging,
                        input data_ready,

                    // UART i/o from top-level module
                        input rx,
                        output tx,

                    // UART i/o from controller 
                        input txing,
                        input [1:0] word_to_send_sel,
                        input [1:0] channel_number,
                        input tx_send,

                        output rx_ready,
                        output [7:0] rx_data,
                        output tx_ready
);

parameter [1:0] 
    CHANNEL_A = 2'b00,
    CHANNEL_B = 2'b01,
    CHANNEL_C = 2'b10,
    CHANNEL_D = 2'b11;

wire [9:0] sipo_out0, sipo_out1, sipo_out2, sipo_out3; // make 4 bits
reg [9:0] data_buffer0, data_buffer1, data_buffer2, data_buffer3;
reg [9:0] tx_data_buffer0, tx_data_buffer1, tx_data_buffer2, tx_data_buffer3; 
                                // SIPOs continue sampling, but tx_data_buffer
                                // holds a stable value while tx'ing. see always block

reg [9:0] channel_data;
reg [7:0] word_to_send;

SIPO sipo0( .clk(spi_clk),
            .reset_b(reset_b),
            .data_in(adc_in[0]),   
            .data_logging(data_logging),
            .data_out(sipo_out0)
          );

SIPO sipo1( .clk(spi_clk),
            .reset_b(reset_b),
            .data_in(adc_in[1]),   // make 4 bits
            .data_logging(data_logging),
            .data_out(sipo_out1)
          );

SIPO sipo2( .clk(spi_clk),
            .reset_b(reset_b),
            .data_in(adc_in[2]),   // make 4 bits
            .data_logging(data_logging),
            .data_out(sipo_out2)
          );

SIPO sipo3( .clk(spi_clk),
            .reset_b(reset_b),
            .data_in(adc_in[3]),   // make 4 bits
            .data_logging(data_logging),
            .data_out(sipo_out3)
          );


always @ (posedge clk) begin
    data_buffer0 <= (data_ready) ? sipo_out0 : data_buffer0;
    data_buffer1 <= (data_ready) ? sipo_out1 : data_buffer1;
    data_buffer2 <= (data_ready) ? sipo_out2 : data_buffer2;
    data_buffer3 <= (data_ready) ? sipo_out3 : data_buffer3;

    tx_data_buffer0 <= (txing) ? tx_data_buffer0 : data_buffer0;
    tx_data_buffer1 <= (txing) ? tx_data_buffer1 : data_buffer1;
    tx_data_buffer2 <= (txing) ? tx_data_buffer2 : data_buffer2;
    tx_data_buffer3 <= (txing) ? tx_data_buffer3 : data_buffer3;

end

always @ (*) begin
    case (channel_number)
        CHANNEL_A: channel_data <= tx_data_buffer0;
        CHANNEL_B: channel_data <= tx_data_buffer1;
        CHANNEL_C: channel_data <= tx_data_buffer2;
        CHANNEL_D: channel_data <= tx_data_buffer3;
    endcase

    case (word_to_send_sel) 
        2'b00: word_to_send <= 8'h00;
        2'b01: word_to_send <= {4'b0100, (4'b0001 + channel_number)}; // A, B, C, or D
        2'b10: word_to_send <= {3'b100, channel_data[4:0]};
        2'b11: word_to_send <= {3'b100, channel_data[9:5]};
        default: word_to_send <= 8'h00;
    endcase
end

uart_rx #(10'd868, 8) rx_inst(  .clk(clk),
                                .reset(reset_b),
                                .rx(rx),
                                .rx_data(rx_data),
                                .ready(rx_ready)
                             );

uart_tx #(10'd868, 8) tx_inst(  .clk(clk),
                                .tx_send(tx_send),
                                .data_in(word_to_send),
                                .tx(tx),
                                .ready(tx_ready)
                             );

endmodule