// UART rx top level module

module UART_rx (    input clk,
                    input reset,
                    input rx_in,

                    output [7:0] UART_rx_data_out,
                    output rx_ready
);

wire baud_mid_compare_val;
wire bit_counter_compare_val;
wire shift_rx_sel;
wire [1:0] UART_baud_counter_sel;
wire [1:0] bit_counter_sel;
wire baud_mid_compare_sel;

UART_rx_controller C1(  .clk(clk),
                        .reset_b(reset),
                        .baud_mid_compare_val(baud_mid_compare_val),
                        .bit_counter_compare_val(bit_counter_compare_val),
                        .shift_rx_sel(shift_rx_sel),
                        .UART_baud_counter_sel(UART_baud_counter_sel),
                        .bit_counter_sel(bit_counter_sel),
                        .baud_mid_compare_sel(baud_mid_compare_sel),
                        .data_ready(rx_ready)
                    );

UART_RX_DATAPATH DP1(   .clk(clk),
                        .reset_b(reset),
                        .UART_rx_in(rx_in),
                        .shift_rx_sel(shift_rx_sel),
                        .baud_mid_compare_sel(baud_mid_compare_sel),
                        .UART_baud_counter_sel(UART_baud_counter_sel),
                        .bit_counter_sel(bit_counter_sel),
                        .baud_mid_compare_val(baud_mid_compare_val),
                        .bit_counter_compare_val(bit_counter_compare_val),
                        .UART_rx_data_out(UART_rx_data_out)
                    );

endmodule