// UART testbench

module uart_tb();

reg clk = 1'b0;
reg reset = 1'b1;
reg tx_send;
reg [7:0] data_to_send;

wire tx_out, tx_ready;
wire [7:0] rx_out;
wire rx_ready;

UART_rx #(10'd16, 8) dut_r (clk, reset, tx_out, rx_out, rx_ready);
UART_tx #(10'd16, 8) dut_t (clk, tx_send, data_to_send, tx_out, tx_ready);

always #(2) clk = ~clk;

initial begin

    #5  data_to_send = 8'b00110011;
        tx_send = 1;

    #2  tx_send = 0;

    #100 $display(rx_out);

end

endmodule