`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/20/2022 01:45:26 AM
// Design Name: 
// Module Name: blinky
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module top (
    input clk, btnU, btnC,
    input adc1, 
    output cs,
    output [6:0] seg,
    output [3:0] an,
    output spi_clk
);

wire [15:0] display;
// wire clk2;
wire reset_button_output, reset_b, control_signal;
wire data_logging, data_ready, button_out;
wire [9:0] sipo0_out, ram_out;

wire [19:0]counter_cs_value;
wire [1:0] counter_cs_sel;

wire [19:0] counter_500_ms_value;
wire [1:0] counter_500_ms_sel;

wire [19:0] counter_SIPO_value;
wire [1:0] counter_SIPO_sel;


// clock_div sclk(clk, 1'b1, clk2);
clk_7_2_MHz clk_7_2_MHz_inst(
                                .clk_in1(clk), 
                                .spi_clk(spi_clk)
                            );
//button handler to remedy bounce on control signal button
button_handler control_signal_button(
                                .clk(clk), 
                                .button_pressed(btnU), 
                                .counter_val(counter_cs_value),
                                .counter_sel(counter_cs_sel),
                                .button_out(control_signal)
                            );
assign cs = control_signal;
//button handler to remedy bounce on reset signal button
button_handler reset_signal(
                                .clk(clk), 
                                .button_pressed(btnC), 
                                .counter_val(counter_500_ms_value),
                                .counter_sel(counter_500_ms_sel),
                                .button_out(reset_button_output)
                            );
//active low reset
assign reset_b = ~reset_button_output;



counter counter_500_ms(
                        .clk(clk),
                        .counter_sel(counter_500_ms_sel),
                        .reset_b(reset_b),
                        .counter_value(counter_500_ms_value)
                    );
                    

counter counter_cs(
                        .clk(clk),
                        .counter_sel(counter_cs_sel),
                        .reset_b(reset_b),
                        .counter_value(counter_cs_value)
                    );                   


counter SIPO_counter(
                    .clk(clk),
                    .counter_sel(counter_SIPO_sel),
                    .reset_b(reset_b),
                    .counter_value(counter_SIPO_value)
                    );

SIPO_controller sipo_controller0(   
                                    .clk(spi_clk),
                                    .control_signal(control_signal),
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

ram_test #(10) ram(   .clk(clk), 
                .write_en(data_ready),
                .address(4'b0),
                .data_in(sipo0_out),
                .data_out(ram_out)
);

assign display = {6'b0, ram_out};
seven_segment seg7(.clk(clk), .btnC(btnC), .decimal_num(display),
                    .segments(seg), .anode(an));

endmodule