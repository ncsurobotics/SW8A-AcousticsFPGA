// MARCH 4 TOP LEVEL MODULE (OLD)
`timescale 1ns / 1ps

module top (
    input clk, btnC, btnU,
    input adc1, 
    input RsRx,
    output RsTx, 
    output cs,
    output [6:0] seg,
    output [3:0] an,
    output spi_clk_out
);

reg [15:0] display; // changed to reg
wire spi_clk;

wire reset_button_out, reset_b;
wire data_logging, data_ready, button_out;
wire [9:0] sipo0_out, ram_out;

wire [7:0] rx_data_out; // uart rx
wire rx_ready;

wire tx_send;
wire tx_ready;
wire txing;
wire [1:0] word_to_send_sel;
reg [7:0] word_to_send;

wire [19:0] counter_SIPO_value;
wire [1:0] counter_SIPO_sel;

//active low reset for counters
assign reset_b = 1'b1; // for now

clk_7_2_MHz clk_7_2_MHz_inst(
                                .clk_in1(clk), 
                                .spi_clk(spi_clk)
                            );
                            
assign spi_clk_out = spi_clk;

//button handler to remedy bounce on reset signal button
button_handler reset_signal(
                                .clk(clk), 
                                .reset_b(reset_b),
                                .button_pressed(btnC), 
                                //.counter_val(counter_500_ms_value),
                                //.counter_sel(counter_500_ms_sel),
                                .button_out(reset_button_out)
                            );              

Test_Controller controller(.clk(clk),
                            .reset_b(reset_b),
                            .rx_ready(rx_ready),
                            .rx_data(rx_data_out),
                            .tx_ready(tx_ready),
                            .txing(txing),
                            .word_to_send_sel(word_to_send_sel),
                            .tx_send(tx_send)
                        );

counter SIPO_counter(
                    .clk(spi_clk),
                    .counter_sel(counter_SIPO_sel),
                    .reset_b(reset_b),
                    .counter_value(counter_SIPO_value),
                    .enable(1'b1)
                    );

SIPO_controller sipo_controller0(   
                                    .clk(spi_clk),
                                    .control_signal(cs),    // SIPO_controller output
                                    .reset_b(reset_b),
                                    .counter_value(counter_SIPO_value),
                                    .data_logging(data_logging),
                                    .data_ready(data_ready),
                                    .counter_sel(counter_SIPO_sel)
                                );

SIPO sipo0( .clk(spi_clk),
            .data_in(adc1),
            .reset_b(reset_b),
            .data_logging(data_logging),
            .data_out(sipo0_out)
            );

reg [9:0] data_buffer;
reg [9:0] tx_data_buffer;
always @ (posedge clk) begin
    data_buffer <= (data_ready) ? sipo0_out : data_buffer;
    tx_data_buffer <= (txing) ? tx_data_buffer : data_buffer;
end

always @ (*) begin
    case (word_to_send_sel) 
        2'b00: word_to_send <= 8'h00;
        2'b01: word_to_send <= 8'h41;
        2'b10: word_to_send <= {3'b100, tx_data_buffer[4:0]};
        2'b11: word_to_send <= {3'b110, tx_data_buffer[9:5]};
        default: word_to_send <= 8'h00;
    endcase
end

uart_rx #(10'd868, 8) rx_inst( .clk(clk),
                        .reset(reset_b),
                        .rx(RsRx),
                        .rx_data(rx_data_out),
                        .ready(rx_ready)
                      );

// reg [7:0] word_to_send = 8'h41; // ascii A

uart_tx #(10'd868, 8) tx_inst(  .clk(clk),
                                .tx_send(tx_send),  // btnU
                                .data_in(word_to_send),
                                .tx(RsTx),
                                .ready(tx_ready)
                             );

always @ (posedge clk) begin
    if (rx_ready) begin
        display <= {8'hAA, rx_data_out};
        // word_to_send <= rx_data_out;
        // tx_send <= 1'b1;
    end 
    else begin
       display <= display;
       // tx_send <= 1'b0;
       // word_to_send <= word_to_send; 
    end
end

seven_segment seg7(.clk(clk), .btnC(btnC), .decimal_num(display),
                    .segments(seg), .anode(an));

endmodule