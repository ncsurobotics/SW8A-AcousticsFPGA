// March 4 top-level module with controller & datapath
`timescale 1ns / 1ps

module top (
                input clk, btnC,

                input adc1,
                input adc2,
                input adc3,
                input adc4,
                
                output cs,
                output spi_clk_out,

                input RsRx,
                output RsTx,

                output [2:0] rx_state_debug, // **included for debug

                output [6:0] seg,
                output [3:0] an
);

// 7.2 MHz clock for SPI
wire SPI_clk; assign spi_clk_out = SPI_clk;
wire UART_clk_No_Div;
wire UART_clk;

// peripherals
wire reset_button_out, reset_b;
reg [15:0] display;

wire [9:0] ADC_Channel_1,ADC_Channel_2,ADC_Channel_3, ADC_Channel_4;
reg [9:0] ADC_Channel_1_reg,ADC_Channel_2_reg,ADC_Channel_3_reg, ADC_Channel_4_reg;

wire Hold_Data_sel, Byte_To_Send_sel;

wire ADC_CH1_Ready,ADC_CH2_Ready,ADC_CH3_Ready,ADC_CH4_Ready;

wire [7:0] Word_To_Send;

DATA_clks DATA_clks_inst(

    .clk_in1(clk),
    .SPI_clk(SPI_clk),
    .UART_clk(UART_clk_No_Div)

); 
       
UART_IP UART_inst(

    .s_axi_aclk(clk),
    .s_axi_aresetn(reset_b),
    .s_axi_awaddr(0),
    .s_axi_awvalid(1),
    .s_axi_wdata(),
    .s_axi_wstrb(),
    .s_axi_wvalid(),
    .s_axi_bready(),
    .s_axi_araddr(),
    .s_axi_arvalid(),
    .s_axi_rready(),
    .rx(RsRx),
    
    .interrupt(),
    .s_axi_awready(),
    .s_axi_wready(),
    .s_axi_bresp(),
    .s_axi_bvalid(),
    .s_axi_arready(),
    .s_axi_rdata(),
    .s_axi_rresp(),
    .s_axi_rvalid(),
    .tx(RsTx)
    
);      
       
       
       
       
       
       
       
       
  
                       
FOUR_CHANNEL_SPI FOUR_CHANNEL_SPI_inst(

    .clk(clk),
    .SPI_clk(SPI_clk),
    .reset_b(reset_b),
    .SPI_en(1'b1),
    .adc1(adc1),
    .adc2(adc2),
    .adc3(adc3),
    .adc4(adc4),
    
    .ADC_Channel_1(ADC_Channel_1),
    .ADC_Channel_2(ADC_Channel_2),
    .ADC_Channel_3(ADC_Channel_3),
    .ADC_Channel_4(ADC_Channel_4),
    .ADC_CH1_Ready(ADC_CH1_Ready),
    .ADC_CH2_Ready(ADC_CH2_Ready),
    .ADC_CH3_Ready(ADC_CH3_Ready),
    .ADC_CH4_Ready(ADC_CH4_Ready),
    .cs(cs)

);                               

//button handler to remedy bounce on reset signal button
button_handler reset_signal(    
    
    .clk(clk), 
    .button_pressed(btnC), 
    .button_out(reset_button_out)
   
);

assign reset_b = ~reset_button_out;

























// DISPLAY
always @ (posedge clk) begin
    if (rx_ready) display <= {24'h000, rx_data};
    else display <= display;
end

seven_segment seg7(.clk(clk), .btnC(btnC), .decimal_num(display),
                    .segments(seg), .anode(an));
endmodule