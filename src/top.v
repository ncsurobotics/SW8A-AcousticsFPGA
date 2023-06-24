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


/*parameter[1:0]
    IDLE=2'b00,
    TX_EN=2'b01,
    SENDING=2'b10;

parameter[7:0]
    ONE=8'b00110001,
    TWO=8'b00110010,
    THREE=8'b00110011,
    FOUR=8'b00110100,
    CHANNEL_1_OP_CODE =8'b01000001,
    CHANNEL_2_OP_CODE =8'b01000010,
    CHANNEL_3_OP_CODE =8'b01000011,
    CHANNEL_4_OP_CODE =8'b01000100;
    
wire[2:0] Max_Value_Channel_sel;
wire[9:0] Max_Value;
reg[7:0] OP_Code;

SPI_MAX_VALUE_CACHE_datapath CACHE_dp_inst(
    .clk(clk),
    .Slow_clk(UART_clk),
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
    .OP_Code(OP_Code),
    .TX_READY(tx_ready),

    .Max_Value_Channel_sel(Max_Value_Channel_sel)
);

always @ (*) begin
    case(rx_data)
        ONE: OP_Code <= CHANNEL_1_OP_CODE;
        TWO: OP_Code <= CHANNEL_2_OP_CODE;
        THREE: OP_Code <= CHANNEL_3_OP_CODE;
        FOUR: OP_Code <= CHANNEL_4_OP_CODE;
        default: OP_Code <= 8'b00000000;
    endcase
end*/


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

/*
always @ (posedge clk) begin
    if (rx_ready) Word_To_Send <= rx_data;
    else Word_To_Send <= Word_To_Send;
end

always @ (*) begin
    
    case(current_state)
        IDLE: begin
            next_state <= rx_ready ? TX_EN : IDLE;
            TX_en <= 1'b0;
            TX_Write_en <= 1'b0;
            //Word_To_Send <= 8'h41;
        end
        TX_EN: begin
            next_state <= tx_ready ? TX_EN : SENDING;
            TX_en <= 1'b1;
            TX_Write_en <= 1'b1;
            //Word_To_Send <= rx_data;
        end
        SENDING: begin
            next_state <= (tx_ready && ~rx_ready) ? IDLE : SENDING;
            TX_en <= 1'b0;
            TX_Write_en <= 1'b1;
            //Word_To_Send <= rx_data;
        end
        default: begin
            next_state <= IDLE;
            TX_en <= 1'b0;
            TX_Write_en <= 1'b0;
            //Word_To_Send <= 8'h41;
        end
    endcase
end */



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