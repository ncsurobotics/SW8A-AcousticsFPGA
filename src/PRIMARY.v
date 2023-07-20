
`timescale 1ns / 1ps

module PRIMARY (
                input clk, btnU,btnC, SPI_clk, UART_clk_No_Div,

                input adc1,
                input adc2,
                input adc3,
                input adc4,
                
                output data_ready,
                output cs1,cs2,cs3,cs4,
                input RsRx,
                output RsTx,

                output [6:0] seg,
                output [3:0] an
);



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


UART_CLK_DIVIDER UART_CLK_DIVIDER_inst(

    .UART_clk_in(UART_clk_No_Div),
    .reset_b(reset_b),
    
    .UART_clk_out(UART_clk)    

);               
                       
                                

//button handler to remedy bounce on reset signal button
button_handler reset_signal(    
    
    .clk(clk), 
    .button_pressed(btnU), 
    .button_out(reset_button_out)
   
);

assign reset_b = 1'b1;

assign data_ready = ADC_CH1_Ready;

SPI Channel_1_SPI (

    .clk(clk),
    .SPI_clk(SPI_clk),
    .reset_b(reset_b),
    .SPI_Data_in(adc1),
    .SPI_en(1'b1),
    
    .SPI_Data_out(ADC_Channel_1),
    .Data_Ready(ADC_CH1_Ready),
    .CS(cs1)
    
);

SPI Channel_2_SPI (

    .clk(clk),
    .SPI_clk(SPI_clk),
    .reset_b(reset_b),
    .SPI_Data_in(adc2),
    .SPI_en(1'b1),
    
    .SPI_Data_out(ADC_Channel_2),
    .Data_Ready(ADC_CH2_Ready),
    .CS(cs2)

);

SPI Channel_3_SPI (

    .clk(clk),
    .SPI_clk(SPI_clk),
    .reset_b(reset_b),
    .SPI_Data_in(adc3),
    .SPI_en(1'b1),
    
    .SPI_Data_out(ADC_Channel_3),
    .Data_Ready(ADC_CH3_Ready),
    .CS(cs3)
    

);

SPI Channel_4_SPI (

    .clk(clk),
    .SPI_clk(SPI_clk),
    .reset_b(reset_b),
    .SPI_Data_in(adc4),
    .SPI_en(1'b1),
    
    .SPI_Data_out(ADC_Channel_4),
    .Data_Ready(ADC_CH4_Ready),
    .CS(cs4)
    

);


parameter[1:0]
    IDLE=2'b00,
    TX_EN=2'b01,
    SENDING=2'b10;



wire[2:0] Max_Value_Channel_sel;
wire[9:0] Max_Value;
reg[7:0] OP_Code;

SPI_MAX_VALUE_CACHE_datapath CACHE_dp_inst(
    .clk(clk),
    .Slow_clk(UART_clk_No_Div),
    .reset_b(reset_b),
    .SPI_Data_1(ADC_Channel_1),
    .SPI_Data_2(ADC_Channel_2),
    .SPI_Data_3(ADC_Channel_3),
    .SPI_Data_4(ADC_Channel_4),
    .Max_Value_Channel_sel(Max_Value_Channel_sel),

    .Max_Value(Max_Value)
);

SPI_MAX_VALUE_CACHE_controller CACHE_ctrl_inst(
    .clk(clk),
    .reset_b(reset_b),
    .OP_Code(rx_data),
    .TX_READY(tx_ready),

    .Max_Value_Channel_sel(Max_Value_Channel_sel)
);

TRIGGER_FFT trigger_fft_inst(
);

UART UART_inst(	

    .UART_clk(UART_clk),
    .clk(clk),
    .Slow_clk(UART_clk_No_Div),
    .reset_b(reset_b),
	.TX_Data_in(Word_To_Send),
	.TX_en(TX_en),
	.TX_Write_en(TX_Write_en),
	.RX_Data_in(RsRx),
				
	.TX_Data_out(RsTx),
	.TX_Ready_To_Send(tx_ready),
	.RX_Data_out(rx_data),
	.RX_Data_Ready(rx_ready)
	
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
            Word_To_Send <= Max_Value[9:2];
            TX_en <= 1'b1;
            TX_Write_en <= 1'b1;
            if(!RsTx) next_state <= 2'b11;
            else next_state <= 2'b10;
        end
        2'b11:begin
            Word_To_Send <= Max_Value[9:2];
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






// DISPLAY
always @ (posedge clk) begin
    if(rx_ready)
        display <= {Max_Value[9:2], rx_data};
    else 
        display<= display;
end

seven_segment seg7(.clk(clk), .btnC(btnC), .decimal_num(display),
                    .segments(seg), .anode(an));
endmodule