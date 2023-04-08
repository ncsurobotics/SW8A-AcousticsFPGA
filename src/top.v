// March 4 top-level module with controller & datapath
`timescale 1ns / 1ps

module top (
                input clk, btnC,

                input adc1,
                output cs,
                output spi_clk_out,

                input RsRx,
                output RsTx,

                output [6:0] seg,
                output [3:0] an
);

// 7.2 MHz clock for SPI
wire spi_clk;

// peripherals
wire reset_button_out, reset_b;
reg [15:0] display;

// controller <--> datapath
wire data_logging;
wire data_ready;
wire control_signal;

wire txing;
wire [1:0] word_to_send_sel;
wire tx_send;

wire rx_ready;
wire [7:0] rx_data;
wire tx_ready;



// SUBMODULES -----------------------------------------------
clk_7_2_MHz clk_7_2_MHz_inst(
                                .clk_in1(clk), 
                                .spi_clk(spi_clk)
                            );    
assign spi_clk_out = spi_clk;

//button handler to remedy bounce on reset signal button
assign reset_b = 1'b1;
button_handler reset_signal(    .clk(clk), 
                                .reset_b(reset_b),
                                .button_pressed(btnC), 
                                .button_out(reset_button_out)
                            );

// CONTROLLER -----------------------------------------------
Test_Controller test_ctrl_inst( .clk(clk),
                                .spi_clk(spi_clk),
                                .reset_b(reset_b),
                                .rx_ready(rx_ready),
                                .rx_data(rx_data),
                                .tx_ready(tx_ready),
                                .txing(txing),
                                .word_to_send_sel(word_to_send_sel),
                                .tx_send(tx_send),
                                .data_logging(data_logging),
                                .data_ready(data_ready),
                                .control_signal(cs)
                              );

// DATAPATH -------------------------------------------------
Test_Datapath test_dp_inst(     .clk(clk),
                                .spi_clk(spi_clk),
                                .reset_b(reset_b),
                                .adc_in(adc1),
                                .data_logging(data_logging),
                                .data_ready(data_ready),
                                .rx(RsRx),
                                .tx(RsTx),
                                .txing(txing),
                                .word_to_send_sel(word_to_send_sel),
                                .tx_send(tx_send),
                                .rx_ready(rx_ready),
                                .rx_data(rx_data),
                                .tx_ready(tx_ready)
                          );

// DISPLAY
always @ (posedge clk) begin
    if (rx_ready) display <= {8'hCC, rx_data};
    else display <= display;
end

seven_segment seg7(.clk(clk), .btnC(btnC), .decimal_num(display),
                    .segments(seg), .anode(an));

endmodule