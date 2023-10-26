`timescale 1ns / 100ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/22/2023 10:06:37 AM
// Design Name: 
// Module Name: Full_Sys_tb
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


module Full_Sys_tb;


reg clk = 1'b0;
wire SPI_clk, UART_clk;
reg adc1, adc2;

reg [9:0] x_data_array [255:0];
reg [9:0] y_data_array [255:0];
reg [7:0] arr_index = 8'b0; // overflow

reg [7:0] tb_word_to_send;
reg tb_tx_en;
wire RsTx, RsRx, tb_tx_r2s;
wire [7:0] tb_word_received;
wire tb_rx_data_ready;

wire cs;

reg reset_b = 1'b1;

wire tb_trigger_fft_tvalid;
wire [31:0] tb_trigger_fft_tdata;
wire tb_trigger_fft_tlast;

initial begin
    reset_b = 1'b0;
    #100
    reset_b = 1'b1;
end

integer index;

task drive_adc;
    input reg [9:0]                x_data;
    input reg [9:0]                y_data;


    begin
        index = 9;
        adc1 = 1'b0;
        adc2 = 1'b0;
        repeat(5)@(posedge spi_clk);
        while (index >= 0) begin
            adc1 = x_data[index];
            adc2 = y_data[index];
            index = index - 1;
            @ (posedge spi_clk);
        end
    end
endtask

task drive_uart_tx;
    input reg [7:0] w2s;

    begin
        while (!tb_tx_r2s) @(posedge clk);
        tb_word_to_send = w2s;
        tb_tx_en = 1'b1;
        while (RsRx) @(posedge clk);
        tb_tx_en = 1'b0;
    end
endtask

always @ (negedge cs) begin
    drive_adc(x_data_array[arr_index], y_data_array[arr_index]);
    arr_index = arr_index + 1;
end

// Clocks
always #5 clk = ~clk;


DATA_clks DATA_clks_inst(
        .clk_in1(clk),
        .SPI_clk(SPI_clk),
        .UART_clk(UART_clk)
);


integer fp_trig_out;
reg ok_to_write = 1'b0;
//always @ (posedge tb_trigger_fft_tvalid) fp_trig_out = $fopen("C:/Users/ilena/Documents/apr-private/fpga/SW8A-AcousticsFPGA/srcsim/trig_out.txt");
//always @ (negedge tb_trigger_fft_tlast) $fclose(fp_trig_out);
always @ (posedge clk) begin
    if (tb_trigger_fft_tvalid && ok_to_write) begin
        //$fwrite(fp_trig_out, "%d \n", $signed(tb_trigger_fft_tdata[31:16]));
        $fwrite(fp_trig_out, "%d \n", $signed(tb_trigger_fft_tdata[15:0]));
    end
end


UART UART_inst(	
    .UART_clk(UART_clk),
    .clk(clk),
    .reset_b(reset_b),
	.TX_Data_in(tb_word_to_send),
	.TX_en(tb_tx_en),
	.RX_Data_in(RsTx),
				
	.TX_Data_out(RsRx),
	.TX_Ready_To_Send(tb_tx_r2s),
	.RX_Data_out(tb_word_received),
	.RX_Data_Ready(tb_rx_data_ready)
);

PRIMARY dut(
    .clk(clk),
    .reset_b(reset_b),
    .btnU(1'b0),
    .btnC(1'b0),
    .SPI_clk(spi_clk),
    .UART_clk(UART_clk),
    .adc1(adc1),
    .adc2(adc2),
    .cs1(cs),
    .RsRx(RsRx),
    .RsTx(RsTx),
    .tb_trigger_fft_tvalid(tb_trigger_fft_tvalid),
    .tb_trigger_fft_tdata(tb_trigger_fft_tdata),
    .tb_trigger_fft_tlast(tb_trigger_fft_tlast)
);

initial begin
    #272000000 $stop;
end

initial begin
    $readmemh("C:/Users/ilena/Documents/apr-private/fpga/SW8A-AcousticsFPGA/srcsim/cc_datasets/trigger_rshift.data", y_data_array);
    $readmemh("C:/Users/ilena/Documents/apr-private/fpga/SW8A-AcousticsFPGA/srcsim/cc_datasets/trigger.data", x_data_array);
    fp_trig_out = $fopen("C:/Users/ilena/Documents/apr-private/fpga/SW8A-AcousticsFPGA/srcsim/trig_out.txt");
    #100 drive_uart_tx(8'h41); // send max ch1
    //#100 drive_uart_tx(8'hd0); // trigger detect

    //#276500 ok_to_write = 1'b1;
    //@ (negedge tb_trigger_fft_tlast) ok_to_write = 1'b0;
    while (arr_index < 255) @(posedge clk);
    ok_to_write = 1'b1;
    @ (negedge tb_trigger_fft_tlast) ok_to_write = 1'b0;
end

endmodule
