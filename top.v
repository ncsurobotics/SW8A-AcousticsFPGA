module top(
    



);
/*
    Outputs of the controller to the datapath
    ////To define what is what later

*/
wire chip_select;
wire fft_en_sel;
wire cross_correlation_en_sel;
wire[1:0] data_input_sel;
wire[1:0] UART_input_sel;

wire triggered;
wire cross_correltaion_done;
wire UART_transmission_done;
wire sample_counter_14;
wire buffer_counter_full;
wire data_in;

Controller C1(
    .clk                        (       clk                         ),
    .reset_b                    (       reset_b                     ),
    .triggered                  (       triggered                   ),
    .cross_correlation_done     (       cross_correlation_done      ),
    .UART_transmission_done     (       UART_transmission_done      ),
    .sample_counter_14          (       sample_counter_14           ),
    .buffer_full_counter        (       buffer_full_counter         ),
    .chip_select                (       chip_select                 ),
    .data_input_sel             (       data                        ),
    .fft_en_sel                 (       fft_en_sel                  ),
    .cross_correlation_en_sel   (       cross_correlation_en_sel    ),
    .UART_input_sel             (       UART_input_sel              )
);

Datapath DP1();



endmodule