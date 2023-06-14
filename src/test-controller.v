// March 11 pool test controller
// submodules: SIPO_Controller, counter, Test_State_Machine

module Test_Controller (
                            input clk,
                            input spi_clk,
                            input reset_b,

                        // Test State Machine inputs (from UART)
                            input rx_ready,
                            input [7:0] rx_data,
                            input tx_ready,

                        // Test State Machine outputs
                            output txing,
                            output [1:0] word_to_send_sel,
                            output tx_send,

                        // SIPO Controller outputs
                            output data_logging,
                            output data_ready,
                            output control_signal   // top level module output
);

wire [19:0] counter_value;
wire [1:0] counter_sel;

SIPO_controller sipo_ctrl_inst( .clk(spi_clk),
                                .reset_b(reset_b),
                                .counter_value(counter_value),
                                .data_logging(data_logging),
                                .data_ready(data_ready),
                                .counter_sel(counter_sel),
                                .control_signal(control_signal)
                              );

counter SIPO_counter(   .clk(spi_clk),
                        .counter_sel(counter_sel),
                        .reset_b(reset_b),
                        .counter_value(counter_value),
                        .enable(1'b1)
                    );

endmodule