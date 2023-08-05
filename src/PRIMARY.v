
`timescale 1ns / 1ps

module PRIMARY (
                input clk, btnU,btnC, SPI_clk, UART_clk_No_Div,

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

                // for debug only
                output tb_trigger_fft_tvalid,
                output [31:0] tb_trigger_fft_tdata,
                output tb_trigger_fft_tlast

);



wire UART_clk;

// peripherals
wire reset_button_out, reset_b;
reg [15:0] display;

wire [9:0] ADC_Channel_1,ADC_Channel_2,ADC_Channel_3, ADC_Channel_4;
reg [9:0] ADC_Channel_1_reg,ADC_Channel_2_reg,ADC_Channel_3_reg, ADC_Channel_4_reg;
wire ADC_CH1_Ready,ADC_CH2_Ready,ADC_CH3_Ready,ADC_CH4_Ready;

wire SPI_en;

wire Hold_Data_sel, Byte_To_Send_sel;

wire Cmd_Reader_TX_Write_en, Cmd_Reader_TX_en, CC_TX_Write_en, CC_TX_en;
wire TX_Write_en, TX_en;

wire [7:0] Word_To_Send, Cmd_Reader_Word_To_Send, CC_Block_Word_To_Send;
wire [7:0] rx_data;

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


COMMAND_READER cmd(

    .clk(clk),
    .reset_b(reset_b),
    .slow_clk(UART_clk_No_Div),
    .Command(rx_data),
    .Rx_Ready(rx_ready),
    .RsTx(RsTx),
    .Tx_Ready(tx_ready),
    .Trigger(Trigger),
    .FFT_Data_Ready(FFT_Data_Ready),
    .Max_Value(Max_Value),
    .Set_Threshold_sel(Set_Threshold_sel),
    .Set_Frequency_sel(Set_Frequency_sel),
    .RAM_Read_Offset(offset),
    .Word_To_Send(Cmd_Reader_Word_To_Send),
    .Channel_sel(Max_Value_Channel_sel),
    .TX_en(Cmd_Reader_TX_en),
    .TX_Write_en(Cmd_Reader_TX_Write_en)


);
/*
always@(posedge clk or negedge reset_b) begin
    if(!reset_b) begin
        Frequency<=0;
    end
    else begin
        Frequency <= Set_Frequency_sel ? rx_data[3:0] : Frequency;
    end
end

always@(posedge clk or negedge reset_b)begin 
    if(!reset_b) begin
        Threshold <= 0;
    end
    else begin
        Threshold <= Set_Threshold_sel ? rx_data[3:0] : Threshold;
    end
end 
*/




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
    .Triggered(Trigger_Persistant),
    .Send_Frame(Channel_1_Send_Frame),
    .RAM_Overflow(),
    .Output_Data(Channel_1_Ring_Buffer_out)

);
assign Channel_1_Send_Frame = Trigger_Send_Frame | CC_ChX_Send_Frame;

RING_BUFFER RING_BUFFER_channel_2_inst(

    .clk(clk),
    .reset_b(reset_b),
    .Input_Data(ADC_Channel_2),
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
                                  
CC_PIPELINE_CONTROLLER cc_pipeline_controller_inst(
    .clk(clk),
    .slow_clk(UART_clk_No_Div),
    .reset_b(reset_b),
    .Trigger(Trigger),
    .CC_Done(CC_Done),
    .Tx_Ready(tx_ready),
    .RsTx(RsTx),
    
    .Trigger_Persistant(Trigger_Persistant),
    .Start_CC(Start_CC),
    .TX_en(CC_TX_en),
    .TX_Write_en(CC_TX_Write_en),
    .SPI_en(SPI_en)
);

 

TRIGGER_FFT_v2 trigger_fft_inst(

    .clk(clk),
    .SPI_CLK(SPI_clk),
    .reset_b(reset_b),
    .data_ready(ADC_CH1_Ready),
    .Input_Data(Channel_1_Ring_Buffer_out),
    .Offset(offset),
    .Frequency(6'd16),
    .Threshold(16'd100),
    .Send_Frame(Trigger_Send_Frame),
    .FFT_Data_Ready(FFT_Data_Ready),
    .Trigger(Trigger),
    
    // for debug only
    .tb_trigger_fft_tdata(tb_trigger_fft_tdata),
    .tb_trigger_fft_tlast(tb_trigger_fft_tlast),
    .tb_trigger_fft_tvalid(tb_trigger_fft_tvalid)
);  

CC_BLOCK cc_block_inst(
    .clk(clk),
    .reset_b(reset_b),
    .Start_CC(Start_CC),
    .Channel_X_Ring_Buffer_in(Channel_1_Ring_Buffer_out),
    .Channel_Y_Ring_Buffer_in(Channel_2_Ring_Buffer_out),
    .Channel_X_Send_Frame(CC_ChX_Send_Frame), // OR'd with Trigger_Send_Frame
    .Channel_Y_Send_Frame(Channel_2_Send_Frame), // directly into Ring Buffer
    .Index_out(CC_Block_Word_To_Send),
    .CC_Done(CC_Done)
);

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



assign TX_en = Cmd_Reader_TX_en | CC_TX_en;
assign TX_Write_en = Cmd_Reader_TX_Write_en | CC_TX_Write_en;

assign Word_To_Send = (Cmd_Reader_TX_Write_en) ? Cmd_Reader_Word_To_Send : CC_Block_Word_To_Send;

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
