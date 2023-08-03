`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/25/2023 10:33:38 PM
// Design Name: 
// Module Name: AXI_STREAM_tb
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


module AXI_STREAM_tb;

reg clk = 1'b0;
reg reset_b = 1'b1;
wire RAM_overflow;
reg [31:0] data_array [0:255];
reg [31:0] input_data = 0;
wire [31:0] output_data;
reg data_ready = 1'b0;
reg fourth_sample = 1'b0;
wire send;
wire t_valid;
wire [31:0] t_data;

integer index = 0;
event assert_data_ready;

initial
//$readmemh("/home/cpmori/Documents/AquaPack/SW8A-AcousticsFPGA/srcsim/TRIGGER_FFT_tb_input.data", data_array);
$readmemh("C:/Users/ilena/Documents/apr-private/fpga/SW8A-AcousticsFPGA/srcsim/TRIGGER_FFT_tb_input.data", data_array);
always begin // assert_data_ready
    @(assert_data_ready);
    data_ready = 1'b1;
    input_data = data_array[index];
    if(index % 4 == 0) fourth_sample = 1'b1;
    else fourth_sample = 1'b0;
    index = index + 1;


    
    
    
    #140 data_ready = 1'b0;
        fourth_sample = 1'b0;
end

always #1960 -> assert_data_ready;

always #5 clk = ~clk;


RING_BUFFER dut1(.clk(clk),
                .reset_b(reset_b),
                .Input_Data(input_data),
                .Input_Data_Ready(data_ready),
                .Send_Frame(send),
                .RAM_Overflow(RAM_overflow),
                .Output_Data(output_data)
);

AXI_MASTER dut_axi_master(

    .clk(clk),
    .reset_b(reset_b),
    .Input_Data(output_data),
    .T_READY(t_ready),
    .Fourth_Sample_Ready(fourth_sample),
    .Send_Frame(send),
    .T_VALID(t_valid),
    .T_DATA(t_data)

);




wire [31:0] slave_Next_RAM_Data;
wire slave_Write_Address_sel;
wire [31:0] slave_RAM_out;
wire [5:0] slave_Read_Address_BR;
wire [5:0] slave_Read_Address_With_Offset;
wire [5:0] slave_Write_Address;
wire t_ready;
assign slave_Read_Address_With_Offset = 21;
assign slave_Read_Address_BR = {slave_Read_Address_With_Offset[0],slave_Read_Address_With_Offset[1],slave_Read_Address_With_Offset[2],slave_Read_Address_With_Offset[3],slave_Read_Address_With_Offset[4],slave_Read_Address_With_Offset[5]};    

AXI_SLAVE dut_axi_slave(

    .clk(clk),
    .reset_b(reset_b),
    .T_DATA(t_data),
    .T_VALID(t_valid),
    .Write_Address_sel(slave_Write_Address_sel),
    .T_READY(t_ready),
    .Next_RAM_Data(slave_Next_RAM_Data),
    .Write_Address(slave_Write_Address)


);

BLOCK_RAM_32x64 dut_trigger_ram(

    .clka(clk),
    .wea(slave_Write_Address_sel),
    .addra(slave_Write_Address),
    .dina(slave_Next_RAM_Data),
    .clkb(clk),
    .enb(1'b1),
    .addrb(slave_Read_Address_BR),
    .doutb(slave_RAM_out)

);

wire m_axis_status_tdata;
wire m_axis_status_tvalid;
wire m_axis_status_tready;
wire s_axis_config_tready;
wire fft_s_axis_config_tvalid;


FFT_CONTROLLER TRIGGER_FFT_CONTROLLER_inst(
    
        .clk(clk),
        .reset_b(reset_b),
        .Config_T_Ready(s_axis_config_tready),
        .FFT_Configure_tvalid(fft_s_axis_config_tvalid),
        .FFT_Configure_Complete(fft_configure_complete)
);
    

xfft_trigger trigger_fft (
    
    .aclk(clk),                                                             // input wire aclk
    .aresetn(reset_b),                                                      // input wire aresetn
    .s_axis_config_tdata({CONFIG_ZERO_PAD, SCALE_SCHEDULE, FWD}),           // input wire [7 : 0] s_axis_config_tdata
    .s_axis_config_tvalid(fft_s_axis_config_tvalid),                        // input wire s_axis_config_tvalid
    .s_axis_config_tready(s_axis_config_tready),                                                          // output wire s_axis_config_tready
    .s_axis_data_tdata(FFT_Input_Data),                                                                      // input wire [31 : 0] s_axis_data_tdata
    .s_axis_data_tvalid(fft_s_axis_data_tvalid),                                                                      // input wire s_axis_data_tvalid
    .s_axis_data_tready(fft_s_axis_data_tready),                                                                      // output wire s_axis_data_tready
    .s_axis_data_tlast(fft_s_axis_data_tlast),                              // input wire s_axis_data_tlast
    .m_axis_data_tdata(fft_m_axis_data_tdata),                                                                      // output wire [31 : 0] m_axis_data_tdata
    .m_axis_data_tuser(),                                                   // output wire [15 : 0] m_axis_data_tuser
    .m_axis_data_tvalid(fft_m_axis_data_tvalid),                                                                  // output wire m_axis_data_tvalid
    .m_axis_data_tready(fft_m_axis_data_tready),                                                                      // input wire m_axis_data_tready
    .m_axis_data_tlast(fft_m_axis_data_tlast),                              // output wire m_axis_data_tlast
    .m_axis_status_tdata(m_axis_status_tdata),                                                 // output wire [7 : 0] m_axis_status_tdata
    .m_axis_status_tvalid(m_axis_status_tvalid),                                                // output wire m_axis_status_tvalid
    .m_axis_status_tready(1'b1)                                                 // input wire m_axis_status_tready
      
    );





initial begin
#30 reset_b = 1'b0;
#30 reset_b = 1'b1;
#5 data_ready = 1'b0;
//#510000 send_frame = 1;
//#630 send_frame = 0;
end







endmodule
