// UART transmit testbench using Test_Controller module used in March 2023

module tb_;
reg clk = 1'b0;
reg reset_b = 1'b1;

reg rx_ready;
reg [7:0] rx_data;
wire tx_ready;
wire [1:0] word_to_send_sel;
wire txing;
wire tx_send;
wire tx_out;

reg [7:0] word_to_send;
always @ (*) begin
    case (word_to_send_sel) 
        2'b00: word_to_send <= 8'h00;
        2'b01: word_to_send <= 8'h41;
        2'b10: word_to_send <= 8'h7F;
        2'b11: word_to_send <= 8'h01;
        default: word_to_send <= 8'h00;
    endcase
end

localparam CLK_PERIOD = 10;
always #(CLK_PERIOD/2) clk=~clk;


Test_Controller dut(.clk(clk),
                    .reset_b(reset_b),
                    .rx_ready(rx_ready),
                    .rx_data(rx_data),
                    .tx_ready(tx_ready),
                    .txing(txing),
                    .word_to_send_sel(word_to_send_sel),
                    .tx_send(tx_send));

uart_tx #(10'd16, 8) tx_inst(.clk(clk),
                                .tx_send(tx_send),
                                .data_in(word_to_send),
                                .tx(tx_out),
                                .ready(tx_ready));

initial begin
    #(CLK_PERIOD) rx_data = 8'h41;
    #(CLK_PERIOD) rx_ready = 1'b1;

    #(CLK_PERIOD*16*5) $stop;
end

endmodule
