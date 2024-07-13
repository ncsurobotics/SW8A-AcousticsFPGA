
`timescale 1ns / 1ps

module PRIMARY (
                input clk, btnU, btnC, SPI_clk, UART_clk,

                input adc1,
                input adc2,
                input adc3,
                input adc4,
                input reset_b,
                output data_ready,
                output cs1,cs2,cs3,cs4,
                input RsRx,
                output RsTx,

                output [6:0] seg,
                output [3:0] an,
                output [15:0] led,

                // for debug only
                output tb_trigger_fft_tvalid,
                output [31:0] tb_trigger_fft_tdata,
                output tb_trigger_fft_tlast

);



//wire UART_clk;

// peripherals
wire reset_button_out;
reg [15:0] display;

wire [9:0] ADC_Channel_1,ADC_Channel_2,ADC_Channel_3, ADC_Channel_4;
reg [9:0] ADC_Channel_1_reg,ADC_Channel_2_reg,ADC_Channel_3_reg, ADC_Channel_4_reg;
wire ADC_CH1_Ready,ADC_CH2_Ready,ADC_CH3_Ready,ADC_CH4_Ready;

wire SPI_en;

wire Hold_Data_sel, Byte_To_Send_sel;

//wire Cmd_Reader_TX_Write_en, Cmd_Reader_TX_en, CC_TX_Write_en, CC_TX_en;
wire Cmd_Reader_TX_en, CC_TX_en;
wire /*TX_Write_en,*/ TX_en;

wire [7:0] Word_To_Send, Cmd_Reader_Word_To_Send, CC_Block_Word_To_Send;
wire [7:0] rx_data;

(* mark_debug = "true" *) wire [15:0] Threshold;
wire [6:0] Frequency;

wire Trigger, Trigger_Persistant;
wire Start_CC, CC_Done;

wire Channel_1_Send_Frame, Channel_2_Send_Frame;
wire CC_ChX_Send_Frame, Trigger_Send_Frame;

wire [31:0] Channel_1_Ring_Buffer_out, Channel_2_Ring_Buffer_out;
wire [9:0]fft_output_RAM_data;
wire [9:0] fft_real_data_in;
wire fft_output_RAM_ready;                    
wire [5:0] fft_output_RAM_addr;

wire [1:0] offset;
wire FFT_Data_Ready;
wire fourth_sample_reached;

wire [3:0] cmd_state_debug; // for debug only

            
                    
RING_BUFFER RING_BUFFER_channel_1_inst(

    .clk(clk),
    .reset_b(reset_b),
    .Input_Data({22'd0, ADC_Channel_1}),
    .Input_Data_Ready(ADC_CH1_Ready),
    .Triggered(Trigger_Persistant),
    .Send_Frame(Channel_1_Send_Frame),
    .RAM_Overflow(),
    .Output_Data(Channel_1_Ring_Buffer_out)

);
assign Channel_1_Send_Frame = Trigger_Send_Frame | CC_ChX_Send_Frame;

RING_BUFFER RING_BUFFER_channel_2_inst(

    .clk(clk),
    .reset_b(reset_b),
    .Input_Data({22'd0, ADC_Channel_2}),
    .Input_Data_Ready(ADC_CH2_Ready),
    .Triggered(Trigger_Persistant),
    .Send_Frame(Channel_2_Send_Frame),
    .RAM_Overflow(),
    .Output_Data(Channel_2_Ring_Buffer_out)

);

/*
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
*/
                                  
//button handler to remedy bounce on reset signal button
button_handler reset_signal(    
    
    .clk(clk), 
    .button_pressed(btnU), 
    .button_out(reset_button_out)
   
);

//assign reset_b = 1'b1;

assign data_ready = ADC_CH1_Ready;

SPI Channel_1_SPI (

    .clk(clk),
    .SPI_clk(SPI_clk),
    .reset_b(reset_b),
    .SPI_Data_in(adc1),
    .SPI_en(SPI_en),
    
    .SPI_Data_out(ADC_Channel_1),
    .Data_Ready(ADC_CH1_Ready),
    .CS(cs1)
);

SPI Channel_2_SPI (

    .clk(clk),
    .SPI_clk(SPI_clk),
    .reset_b(reset_b),
    .SPI_Data_in(adc2),
    .SPI_en(SPI_en),
    
    .SPI_Data_out(ADC_Channel_2),
    .Data_Ready(ADC_CH2_Ready),
    .CS(cs2)
);

SPI Channel_3_SPI (

    .clk(clk),
    .SPI_clk(SPI_clk),
    .reset_b(reset_b),
    .SPI_Data_in(adc3),
    .SPI_en(SPI_en),
    
    .SPI_Data_out(ADC_Channel_3),
    .Data_Ready(ADC_CH3_Ready),
    .CS(cs3)
);

SPI Channel_4_SPI (

    .clk(clk),
    .SPI_clk(SPI_clk),
    .reset_b(reset_b),
    .SPI_Data_in(adc4),
    .SPI_en(SPI_en),
    
    .SPI_Data_out(ADC_Channel_4),
    .Data_Ready(ADC_CH4_Ready),
    .CS(cs4)
);

wire[2:0] Max_Value_Channel_sel;
wire[9:0] Max_Value;
assign Max_Value = 10'b0;
reg[7:0] OP_Code;


assign TX_en = Cmd_Reader_TX_en | CC_TX_en;
//assign TX_Write_en = Cmd_Reader_TX_Write_en | CC_TX_Write_en;

assign Word_To_Send = (Cmd_Reader_TX_en) ? Cmd_Reader_Word_To_Send : CC_Block_Word_To_Send;

UART UART_inst(	

    .UART_clk(UART_clk),
    .clk(clk),
    .reset_b(reset_b),
	.TX_Data_in(Word_To_Send),
	.TX_en(TX_en),
	//.TX_Write_en(TX_Write_en),
	.RX_Data_in(RsRx),
				
	.TX_Data_out(RsTx),
	.TX_Ready_To_Send(tx_ready),
	.RX_Data_out(rx_data),
	.RX_Data_Ready(rx_ready)
	
);

// DISPLAY
reg [7:0] display_rx;
reg [7:0] display_spi;
always @ (posedge clk) begin
    display_rx <= rx_ready ? rx_data : display_rx;
    display_spi <= ADC_CH1_Ready ? ADC_Channel_1[9:2] : display_spi;
end

always @ (*) begin
    display = {cmd_state_debug, 4'b0, display_spi}; // for debug
end

seven_segment seg7(.clk(clk), .btnC(btnC), .decimal_num(display),
                    .segments(seg), .anode(an));
endmodule