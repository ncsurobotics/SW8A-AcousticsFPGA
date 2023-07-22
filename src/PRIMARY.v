
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
wire TX_Write_en, TX_en;

wire ADC_CH1_Ready,ADC_CH2_Ready,ADC_CH3_Ready,ADC_CH4_Ready;

wire [7:0] Word_To_Send;
wire [7:0] rx_data;


TRIGGER_DETECT TRIGGER_DETECT_inst();


COMMAND_READER cmd(

    .clk(clk),
    .reset_b(reset_b),
    .slow_clk(UART_clk_No_Div),
    .Command(rx_data),
    .Rx_Ready(rx_ready),
    .RsTx(RsTx),
    .Tx_Ready(tx_ready),
    .Trigger(),
    .FFT_Data_Ready(),
    .Max_Value(Max_Value),
    .Set_Threshold_sel(Set_Threshold_sel),
    .Set_Frequency_sel(Set_Frequency_sel),
    .RAM_Read_Offset(),
    .Word_To_Send(Word_To_Send),
    .Channel_sel(Max_Value_Channel_sel),
    .TX_en(TX_en),
    .TX_Write_en(TX_Write_en)


);




UART_CLK_DIVIDER UART_CLK_DIVIDER_inst(

    .UART_clk_in(UART_clk_No_Div),
    .reset_b(reset_b),
    
    .UART_clk_out(UART_clk)    

);               
                    
RING_BUFFER RING_BUFFER_channel_1_inst(

    .clk(clk),
    .reset_b(reset_b),
    .Input_Data(ADC_Channel_1),
    .Input_Data_Ready(ADC_CH1_Ready),
    .Send_Frame(Send_Frame),
    .RAM_Overflow(),
    .Output_Data(fft_real_data_in)

);

RING_BUFFER RING_BUFFER_channel_2_inst(

    .clk(clk),
    .reset_b(reset_b),
    .Input_Data(ADC_Channel_2),
    .Input_Data_Ready(ADC_CH2_Ready),
    .Send_Frame(),
    .RAM_Overflow(),
    .Output_Data()

);

RING_BUFFER RING_BUFFER_channel_3_inst(

    .clk(clk),
    .reset_b(reset_b),
    .Input_Data(ADC_Channel_3),
    .Input_Data_Ready(ADC_CH3_Ready),
    .Send_Frame(),
    .RAM_Overflow(),
    .Output_Data()

);

RING_BUFFER RING_BUFFER_channel_4_inst(

    .clk(clk),
    .reset_b(reset_b),
    .Input_Data(ADC_Channel_4),
    .Input_Data_Ready(ADC_CH4_Ready),
    .Send_Frame(),
    .RAM_Overflow(),
    .Output_Data()

);
                    
                    
wire Send_Frame;
wire [9:0]fft_output_RAM_data;
wire [9:0] fft_real_data_in;
wire fft_output_RAM_ready;                    
wire [5:0] fft_output_RAM_addr;                          
                          
TRIGGER_FFT trigger_fft_inst(

    .clk(clk),
    .reset_b(reset_b),
    .trigger_fft_enable(1'b1),
    .data_ready(data_ready),
    .fft_real_data_in(fft_real_data_in),
    .fft_output_RAM_addr(fft_output_RAM_addr),
    .send_frame(Send_Frame),
    .fft_output_RAM_data(fft_output_RAM_data),
    .fft_output_RAM_ready(fft_output_RAM_ready)

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
        display <= {1};
    else 
        display<= display;
end

seven_segment seg7(.clk(clk), .btnC(btnC), .decimal_num(display),
                    .segments(seg), .anode(an));
endmodule


/*
reg [1:0] current_state, next_state;
always@(posedge clk or negedge reset_b) begin
    if(!reset_b) begin
        current_state <= 2'b00;
    end
    else begin
        current_state <= next_state;
    end
end

*/




/*
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

*/
