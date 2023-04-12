module uart_rx_datapath(
                            input clk,
                            input UART_rx_in,
                            input shift_rx_sel,
                            input baud_mid_counter_sel,
                            input UART_baud_counter_sel,
                            input bit_counter_sel,
                            output baud_mid_compare_val,
                            output bit_counter_compare_sel,
                            output [7:0] UART_rx_data_out


);




endmodule