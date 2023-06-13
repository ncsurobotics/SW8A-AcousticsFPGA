// UART tx top level module

module UART_tx (    input clk,
                    input reset,
                    input [7:0] tx_in,
                    input tx_en,

                    output UART_tx_data_out,
                    output ready_to_send
);

wire        baud_compare_val;  
wire        bit_counter_compare_val;
wire [1:0]  shift_tx_sel;
wire [1:0]  tx_out_sel;
wire [1:0]  UART_baud_counter_sel;
wire [1:0]  bit_counter_sel;

UART_TX_CONTROLLER C1 ( .clk(clk),
                        .reset(reset),
                        .tx_en(tx_en),
                        .baud_compare_val(baud_compare_val),
                        .bit_counter_compare_val(bit_counter_compare_val),

                        .shift_tx_sel(shift_tx_sel),
                        .tx_out_sel(tx_out_sel),
                        .UART_baud_counter_sel(UART_baud_counter_sel),
                        .bit_counter_sel(bit_counter_sel),
                        .ready_to_send(ready_to_send)
                    );

UART_TX_DATAPATH DP1  ( .clk(clk),
                        .reset(reset),
                        .UART_tx_in(tx_in),
                        .shift_tx_sel(shift_tx_sel),
                        .tx_out_sel(tx_out_sel),
                        .UART_Baud_Counter_sel(UART_baud_counter_sel),
                        .bit_counter_sel(bit_counter_sel),
                        
                        .baud_compare_val(baud_compare_val),
                        .tx_out(UART_tx_data_out),
                        .bit_counter_compare_val(bit_counter_compare_val)
                    );
                    
endmodule