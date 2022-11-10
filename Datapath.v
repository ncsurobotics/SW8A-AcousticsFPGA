// acoustic data collection with FPGA

//
// clock counter, enable is active low, after 14 clock cycles, toggle enable
module Datapath(
                    input clk,
                    input reset_b,
                    
                    input [1:0] data_input_sel,
                    input fft_en_sel,
                    input cross_correlation_en_sel,
                    input [1:0] UART_input_sel

                    output reg triggered,
                    output reg cross_correlation_done,
                    output reg UART_transmission_done,
                    output reg sample_counter_14,
                    output reg buffer_counter_full
); 

endmodule


 //Datapath include:
 //     4 buffer modules
 //     1 FFT TRIGGER block
 //     2 cross correlato blocks
 //     1 UART block
 //           