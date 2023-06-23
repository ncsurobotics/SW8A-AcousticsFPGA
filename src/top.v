// March 4 top-level module with controller & datapath
`timescale 1ns / 1ps

module top (
                input clk, btnC, /*SPI_clk, UART_clk_No_Div,*/

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
reg TX_Write_en, TX_en;

wire ADC_CH1_Ready,ADC_CH2_Ready,ADC_CH3_Ready,ADC_CH4_Ready;

reg [7:0] Word_To_Send;
wire [7:0] rx_data;



DATA_clks DATA_clks_inst(

    .clk_in1(clk),
    .SPI_clk(SPI_clk),
    .UART_clk(UART_clk_No_Div)

); 

UART_CLK_DIVIDER UART_CLK_DIVIDER_inst(

    .UART_clk_in(UART_clk_No_Div),
    .reset_b(reset_b),
    
    .UART_clk_out(UART_clk)    

);               
                       
                                

//button handler to remedy bounce on reset signal button
button_handler reset_signal(    
    
    .clk(clk), 
    .button_pressed(btnC), 
    .button_out(reset_button_out)
   
);

assign reset_b = ~reset_button_out;


SPI Channel_1_SPI (

    .clk(clk),
    .SPI_clk(SPI_clk),
    .reset_b(reset_b),
    .SPI_Data_in(adc1),
    .SPI_en(1'b1),
    
    .SPI_Data_out(ADC_Channel_1),
    .Data_Ready(ADC_CH1_Ready),
    .CS(cs)
    
);

SPI Channel_2_SPI (

    .clk(clk),
    .SPI_clk(SPI_clk),
    .reset_b(reset_b),
    .SPI_Data_in(adc2),
    .SPI_en(1'b1),
    
    .SPI_Data_out(ADC_Channel_2),
    .Data_Ready(ADC_CH2_Ready)
    

);

SPI Channel_3_SPI (

    .clk(clk),
    .SPI_clk(SPI_clk),
    .reset_b(reset_b),
    .SPI_Data_in(adc3),
    .SPI_en(1'b1),
    
    .SPI_Data_out(ADC_Channel_3),
    .Data_Ready(ADC_CH3_Ready)
    

);

SPI Channel_4_SPI (

    .clk(clk),
    .SPI_clk(SPI_clk),
    .reset_b(reset_b),
    .SPI_Data_in(adc4),
    .SPI_en(1'b1),
    
    .SPI_Data_out(ADC_Channel_4),
    .Data_Ready(ADC_CH4_Ready)
    

);


reg [1:0] current_state, next_state;
always@(posedge clk or negedge reset_b) begin
    if(!reset_b) begin
        current_state <= 2'b00;
    end
    else begin
        current_state <= next_state;
    end

end

always@(*) begin
    case(current_state)
        2'b00:begin
            if(rx_ready) begin
                next_state <= 2'b10;
            end
            else next_state <= 2'b00;
            Word_To_Send <= 0;
            TX_en <= 0;
            TX_Write_en <= 0;
        end
        2'b10:begin
            Word_To_Send <= rx_data;
            TX_en <= 1'b1;
            TX_Write_en <= 1'b1;
            if(!RsTx) next_state <= 2'b11;
            else next_state <= 2'b10;
        end
        2'b11:begin
            Word_To_Send <= rx_data;
            TX_en <= 1'b0;
            TX_Write_en <= 1'b0;
            if(tx_ready) next_state <= 2'b00;
            else next_state <= 2'b11;
        end
        default: begin
            Word_To_Send <= 0;
            TX_en <= 0;
            TX_Write_en <= 0;
            next_state <= 2'b00;
        end
    endcase
end



UART UART_inst(	

    .UART_clk(UART_clk),
    .clk(clk),
    .Slow_clk(UART_clk_No_Div),
    .reset_b(reset_b),
	.TX_Data_in(rx_data),
	.TX_en(TX_en),
	.TX_Write_en(TX_Write_en),
	.RX_Data_in(RsRx),
				
	.TX_Data_out(RsTx),
	.TX_Ready_To_Send(tx_ready),
	.RX_Data_out(rx_data),
	.RX_Data_Ready(rx_ready)
	
);



// DISPLAY
always @ (posedge clk) begin
    if(rx_ready)
        display <= {8'b0, rx_data};
    else 
        display<= display;
end

seven_segment seg7(.clk(clk), .btnC(btnC), .decimal_num(display),
                    .segments(seg), .anode(an));
endmodule