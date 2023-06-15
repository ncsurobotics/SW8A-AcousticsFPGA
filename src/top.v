// March 4 top-level module with controller & datapath
`timescale 1ns / 1ps

module top (
                input clk, btnC,

                input adc1,
                output cs,
                output spi_clk_out,

                input RsRx,
                output RsTx,

                output [2:0] rx_state_debug, // **included for debug

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

wire [7:0] word_to_send



clk_7_2_MHz clk_7_2_MHz_inst(
                                .clk_in1(clk), 
                                .spi_clk(spi_clk)
                            );
                                
assign spi_clk_out = spi_clk;

//button handler to remedy bounce on reset signal button
assign reset_b = 1'b1;
button_handler reset_signal(    
    
    .clk(clk), 
    .reset_b(reset_b),
    .button_pressed(btnC), 
    .button_out(reset_button_out)
   
);

Test_Datapath Test_Datapath_inst(

    .clk(clk),
    .reset_b(reset_b),
    .ADC_Channel_1(),
    .ADC_Channel_2(),
    .ADC_Channel_3(),
    .ADC_Channel_4(),
    .UART_Rx_Data_in(),
    .Hold_Data_sel(),
    .Byte_To_Send_sel(),
    
    .Word_To_Send()

);

Test_Controller Test_Controller_inst(

    

);	  

UART UART_inst(	.clk(clk),
				.reset_b(reset_b),
				.TX_Data_in(word_to_send),
				.TX_en(tx_send),
				.RX_Data_in(RsRx),
				
				.TX_Data_out(RsTx),
				.TX_Ready_To_Send(tx_ready),
				.RX_Data_out(rx_data),
				.RX_Data_Ready(rx_ready)
			  );

// DISPLAY
always @ (posedge clk) begin
    if (rx_ready) display <= {8'hCC, rx_data};
    else display <= display;
end

seven_segment seg7(.clk(clk), .btnC(btnC), .decimal_num(display),
                    .segments(seg), .anode(an));
endmodule