## This file is a general .xdc for the Basys3 rev B board
## To use it in a project:
## - uncomment the lines corresponding to used pins
## - rename the used ports (in each line, after get_ports) according to the top level signal names in the project

## Clock signal
set_property -dict {PACKAGE_PIN W5 IOSTANDARD LVCMOS33} [get_ports clk]
create_clock -period 10.000 -name sys_clk_pin -waveform {0.000 5.000} -add [get_ports clk]

## Switches
#set_property -dict { PACKAGE_PIN V17   IOSTANDARD LVCMOS33 } [get_ports {sw[0]}]
#set_property -dict { PACKAGE_PIN V16   IOSTANDARD LVCMOS33 } [get_ports {sw[1]}]
#set_property -dict { PACKAGE_PIN W16   IOSTANDARD LVCMOS33 } [get_ports {sw[2]}]
#set_property -dict { PACKAGE_PIN W17   IOSTANDARD LVCMOS33 } [get_ports {sw[3]}]
#set_property -dict { PACKAGE_PIN W15   IOSTANDARD LVCMOS33 } [get_ports {sw[4]}]
#set_property -dict { PACKAGE_PIN V15   IOSTANDARD LVCMOS33 } [get_ports {sw[5]}]
#set_property -dict { PACKAGE_PIN W14   IOSTANDARD LVCMOS33 } [get_ports {sw[6]}]
#set_property -dict { PACKAGE_PIN W13   IOSTANDARD LVCMOS33 } [get_ports {sw[7]}]
#set_property -dict { PACKAGE_PIN V2    IOSTANDARD LVCMOS33 } [get_ports {sw[8]}]
#set_property -dict { PACKAGE_PIN T3    IOSTANDARD LVCMOS33 } [get_ports {sw[9]}]
#set_property -dict { PACKAGE_PIN T2    IOSTANDARD LVCMOS33 } [get_ports {sw[10]}]
#set_property -dict { PACKAGE_PIN R3    IOSTANDARD LVCMOS33 } [get_ports {sw[11]}]
#set_property -dict { PACKAGE_PIN W2    IOSTANDARD LVCMOS33 } [get_ports {sw[12]}]
#set_property -dict { PACKAGE_PIN U1    IOSTANDARD LVCMOS33 } [get_ports {sw[13]}]
#set_property -dict { PACKAGE_PIN T1    IOSTANDARD LVCMOS33 } [get_ports {sw[14]}]
#set_property -dict { PACKAGE_PIN R2    IOSTANDARD LVCMOS33 } [get_ports {sw[15]}]


## LEDs
set_property -dict {PACKAGE_PIN U16 IOSTANDARD LVCMOS33} [get_ports {led[0]}]
set_property -dict {PACKAGE_PIN E19 IOSTANDARD LVCMOS33} [get_ports {led[1]}]
set_property -dict {PACKAGE_PIN U19 IOSTANDARD LVCMOS33} [get_ports {led[2]}]
set_property -dict {PACKAGE_PIN V19 IOSTANDARD LVCMOS33} [get_ports {led[3]}]
set_property -dict {PACKAGE_PIN W18 IOSTANDARD LVCMOS33} [get_ports {led[4]}]
set_property -dict {PACKAGE_PIN U15 IOSTANDARD LVCMOS33} [get_ports {led[5]}]
set_property -dict {PACKAGE_PIN U14 IOSTANDARD LVCMOS33} [get_ports {led[6]}]
set_property -dict {PACKAGE_PIN V14 IOSTANDARD LVCMOS33} [get_ports {led[7]}]
set_property -dict {PACKAGE_PIN V13 IOSTANDARD LVCMOS33} [get_ports {led[8]}]
set_property -dict {PACKAGE_PIN V3 IOSTANDARD LVCMOS33} [get_ports {led[9]}]
set_property -dict {PACKAGE_PIN W3 IOSTANDARD LVCMOS33} [get_ports {led[10]}]
set_property -dict {PACKAGE_PIN U3 IOSTANDARD LVCMOS33} [get_ports {led[11]}]
set_property -dict {PACKAGE_PIN P3 IOSTANDARD LVCMOS33} [get_ports {led[12]}]
set_property -dict {PACKAGE_PIN N3 IOSTANDARD LVCMOS33} [get_ports {led[13]}]
set_property -dict {PACKAGE_PIN P1 IOSTANDARD LVCMOS33} [get_ports {led[14]}]
set_property -dict {PACKAGE_PIN L1 IOSTANDARD LVCMOS33} [get_ports {led[15]}]


##7 Segment Display
set_property -dict {PACKAGE_PIN W7 IOSTANDARD LVCMOS33} [get_ports {seg[0]}]
set_property -dict {PACKAGE_PIN W6 IOSTANDARD LVCMOS33} [get_ports {seg[1]}]
set_property -dict {PACKAGE_PIN U8 IOSTANDARD LVCMOS33} [get_ports {seg[2]}]
set_property -dict {PACKAGE_PIN V8 IOSTANDARD LVCMOS33} [get_ports {seg[3]}]
set_property -dict {PACKAGE_PIN U5 IOSTANDARD LVCMOS33} [get_ports {seg[4]}]
set_property -dict {PACKAGE_PIN V5 IOSTANDARD LVCMOS33} [get_ports {seg[5]}]
set_property -dict {PACKAGE_PIN U7 IOSTANDARD LVCMOS33} [get_ports {seg[6]}]

#set_property -dict { PACKAGE_PIN V7   IOSTANDARD LVCMOS33 } [get_ports dp]

set_property -dict {PACKAGE_PIN U2 IOSTANDARD LVCMOS33} [get_ports {an[0]}]
set_property -dict {PACKAGE_PIN U4 IOSTANDARD LVCMOS33} [get_ports {an[1]}]
set_property -dict {PACKAGE_PIN V4 IOSTANDARD LVCMOS33} [get_ports {an[2]}]
set_property -dict {PACKAGE_PIN W4 IOSTANDARD LVCMOS33} [get_ports {an[3]}]


##Buttons
set_property -dict {PACKAGE_PIN U18 IOSTANDARD LVCMOS33} [get_ports btnC]
set_property -dict {PACKAGE_PIN T18 IOSTANDARD LVCMOS33} [get_ports btnU]
#set_property -dict { PACKAGE_PIN W19   IOSTANDARD LVCMOS33 } [get_ports btnL]
#set_property -dict { PACKAGE_PIN T17   IOSTANDARD LVCMOS33 } [get_ports btnR]
#set_property -dict { PACKAGE_PIN U17   IOSTANDARD LVCMOS33 } [get_ports btnD]


##Pmod Header JA
set_property -dict {PACKAGE_PIN J1 IOSTANDARD LVCMOS33} [get_ports data_ready]
#set_property -dict { PACKAGE_PIN L2   IOSTANDARD LVCMOS33 } [get_ports {rx_state_debug[1]}];#Sch name = JA2
#set_property -dict { PACKAGE_PIN J2   IOSTANDARD LVCMOS33 } [get_ports {rx_state_debug[2]}];#Sch name = JA3
#set_property -dict { PACKAGE_PIN G2   IOSTANDARD LVCMOS33 } [get_ports {JA[3]}];#Sch name = JA4
#set_property -dict { PACKAGE_PIN H1   IOSTANDARD LVCMOS33 } [get_ports {JA[4]}];#Sch name = JA7
#set_property -dict { PACKAGE_PIN K2   IOSTANDARD LVCMOS33 } [get_ports {JA[5]}];#Sch name = JA8
#set_property -dict { PACKAGE_PIN H2   IOSTANDARD LVCMOS33 } [get_ports {JA[6]}];#Sch name = JA9
#set_property -dict { PACKAGE_PIN G3   IOSTANDARD LVCMOS33 } [get_ports {JA[7]}];#Sch name = JA10

##Pmod Header JB
#set_property -dict { PACKAGE_PIN A14   IOSTANDARD LVCMOS33 } [get_ports {RsTx}];#Sch name = JB1
set_property -dict {PACKAGE_PIN A16 IOSTANDARD LVCMOS33} [get_ports spi_clk_out4]
set_property -dict {PACKAGE_PIN B15 IOSTANDARD LVCMOS33} [get_ports adc4]
set_property -dict {PACKAGE_PIN B16 IOSTANDARD LVCMOS33} [get_ports cs4]
#set_property -dict { PACKAGE_PIN A15   IOSTANDARD LVCMOS33 } [get_ports {JB[4]}];#Sch name = JB7
set_property -dict {PACKAGE_PIN A17 IOSTANDARD LVCMOS33} [get_ports spi_clk_out3]
set_property -dict {PACKAGE_PIN C15 IOSTANDARD LVCMOS33} [get_ports adc3]
set_property -dict {PACKAGE_PIN C16 IOSTANDARD LVCMOS33} [get_ports cs3]

##Pmod Header JC
#set_property -dict { PACKAGE_PIN K17   IOSTANDARD LVCMOS33 } [get_ports {JC[0]}];#Sch name = JC1
set_property -dict {PACKAGE_PIN M18 IOSTANDARD LVCMOS33} [get_ports spi_clk_out1]
set_property -dict {PACKAGE_PIN N17 IOSTANDARD LVCMOS33} [get_ports adc1]
set_property -dict {PACKAGE_PIN P18 IOSTANDARD LVCMOS33} [get_ports cs1]
#set_property -dict { PACKAGE_PIN L17   IOSTANDARD LVCMOS33 } [get_ports {JC[4]}];#Sch name = JC7
set_property -dict {PACKAGE_PIN M19 IOSTANDARD LVCMOS33} [get_ports spi_clk_out2]
set_property -dict {PACKAGE_PIN P17 IOSTANDARD LVCMOS33} [get_ports adc2]
set_property -dict {PACKAGE_PIN R18 IOSTANDARD LVCMOS33} [get_ports cs2]

##Pmod Header JXADC
#set_property -dict { PACKAGE_PIN J3   IOSTANDARD LVCMOS33 } [get_ports {adc1}];#Sch name = XA1_P    was JXADC[0]
#set_property -dict { PACKAGE_PIN L3   IOSTANDARD LVCMOS33 } [get_ports {JXADC[1]}];#Sch name = XA2_P
#set_property -dict { PACKAGE_PIN M2   IOSTANDARD LVCMOS33 } [get_ports {JXADC[2]}];#Sch name = XA3_P
#set_property -dict { PACKAGE_PIN N2   IOSTANDARD LVCMOS33 } [get_ports {JXADC[3]}];#Sch name = XA4_P
#set_property -dict { PACKAGE_PIN K3   IOSTANDARD LVCMOS33 } [get_ports {JXADC[4]}];#Sch name = XA1_N
#set_property -dict { PACKAGE_PIN M3   IOSTANDARD LVCMOS33 } [get_ports {JXADC[5]}];#Sch name = XA2_N
#set_property -dict { PACKAGE_PIN M1   IOSTANDARD LVCMOS33 } [get_ports {JXADC[6]}];#Sch name = XA3_N
#set_property -dict { PACKAGE_PIN N1   IOSTANDARD LVCMOS33 } [get_ports {JXADC[7]}];#Sch name = XA4_N


##VGA Connector
#set_property -dict { PACKAGE_PIN G19   IOSTANDARD LVCMOS33 } [get_ports {vgaRed[0]}]
#set_property -dict { PACKAGE_PIN H19   IOSTANDARD LVCMOS33 } [get_ports {vgaRed[1]}]
#set_property -dict { PACKAGE_PIN J19   IOSTANDARD LVCMOS33 } [get_ports {vgaRed[2]}]
#set_property -dict { PACKAGE_PIN N19   IOSTANDARD LVCMOS33 } [get_ports {vgaRed[3]}]
#set_property -dict { PACKAGE_PIN N18   IOSTANDARD LVCMOS33 } [get_ports {vgaBlue[0]}]
#set_property -dict { PACKAGE_PIN L18   IOSTANDARD LVCMOS33 } [get_ports {vgaBlue[1]}]
#set_property -dict { PACKAGE_PIN K18   IOSTANDARD LVCMOS33 } [get_ports {vgaBlue[2]}]
#set_property -dict { PACKAGE_PIN J18   IOSTANDARD LVCMOS33 } [get_ports {vgaBlue[3]}]
#set_property -dict { PACKAGE_PIN J17   IOSTANDARD LVCMOS33 } [get_ports {vgaGreen[0]}]
#set_property -dict { PACKAGE_PIN H17   IOSTANDARD LVCMOS33 } [get_ports {vgaGreen[1]}]
#set_property -dict { PACKAGE_PIN G17   IOSTANDARD LVCMOS33 } [get_ports {vgaGreen[2]}]
#set_property -dict { PACKAGE_PIN D17   IOSTANDARD LVCMOS33 } [get_ports {vgaGreen[3]}]
#set_property -dict { PACKAGE_PIN P19   IOSTANDARD LVCMOS33 } [get_ports Hsync]
#set_property -dict { PACKAGE_PIN R19   IOSTANDARD LVCMOS33 } [get_ports Vsync]


##USB-RS232 Interface
set_property -dict {PACKAGE_PIN B18 IOSTANDARD LVCMOS33} [get_ports RsRx]
set_property -dict {PACKAGE_PIN A18 IOSTANDARD LVCMOS33} [get_ports RsTx]


##USB HID (PS/2)
#set_property -dict { PACKAGE_PIN C17   IOSTANDARD LVCMOS33   PULLUP true } [get_ports PS2Clk]
#set_property -dict { PACKAGE_PIN B17   IOSTANDARD LVCMOS33   PULLUP true } [get_ports PS2Data]


##Quad SPI Flash
##Note that CCLK_0 cannot be placed in 7 series devices. You can access it using the
##STARTUPE2 primitive.
#set_property -dict { PACKAGE_PIN D18   IOSTANDARD LVCMOS33 } [get_ports {QspiDB[0]}]
#set_property -dict { PACKAGE_PIN D19   IOSTANDARD LVCMOS33 } [get_ports {QspiDB[1]}]
#set_property -dict { PACKAGE_PIN G18   IOSTANDARD LVCMOS33 } [get_ports {QspiDB[2]}]
#set_property -dict { PACKAGE_PIN F18   IOSTANDARD LVCMOS33 } [get_ports {QspiDB[3]}]
#set_property -dict { PACKAGE_PIN K19   IOSTANDARD LVCMOS33 } [get_ports QspiCSn]


## Configuration options, can be used for all designs
set_property CONFIG_VOLTAGE 3.3 [current_design]
set_property CFGBVS VCCO [current_design]

## SPI configuration mode options for QSPI boot, can be used for all designs
set_property BITSTREAM.GENERAL.COMPRESS TRUE [current_design]
set_property BITSTREAM.CONFIG.CONFIGRATE 33 [current_design]
set_property CONFIG_MODE SPIx4 [current_design]








set_property MARK_DEBUG true [get_nets main_level/data_ready]
set_property MARK_DEBUG true [get_nets {main_level/ADC_Channel_1[0]}]
set_property MARK_DEBUG true [get_nets {main_level/ADC_Channel_1[2]}]
set_property MARK_DEBUG true [get_nets {main_level/ADC_Channel_1[3]}]
set_property MARK_DEBUG true [get_nets {main_level/ADC_Channel_1[6]}]
set_property MARK_DEBUG true [get_nets {main_level/ADC_Channel_1[9]}]
set_property MARK_DEBUG true [get_nets {main_level/ADC_Channel_1[1]}]
set_property MARK_DEBUG true [get_nets {main_level/ADC_Channel_1[4]}]
set_property MARK_DEBUG true [get_nets {main_level/ADC_Channel_1[5]}]
set_property MARK_DEBUG true [get_nets {main_level/ADC_Channel_1[7]}]
set_property MARK_DEBUG true [get_nets {main_level/ADC_Channel_1[8]}]
connect_debug_port u_ila_0/probe1 [get_nets [list {main_level/trigger_fft_inst/val_to_compare1[0]} {main_level/trigger_fft_inst/val_to_compare1[1]} {main_level/trigger_fft_inst/val_to_compare1[2]} {main_level/trigger_fft_inst/val_to_compare1[3]} {main_level/trigger_fft_inst/val_to_compare1[4]} {main_level/trigger_fft_inst/val_to_compare1[5]} {main_level/trigger_fft_inst/val_to_compare1[6]} {main_level/trigger_fft_inst/val_to_compare1[7]} {main_level/trigger_fft_inst/val_to_compare1[8]} {main_level/trigger_fft_inst/val_to_compare1[9]} {main_level/trigger_fft_inst/val_to_compare1[10]} {main_level/trigger_fft_inst/val_to_compare1[11]} {main_level/trigger_fft_inst/val_to_compare1[12]} {main_level/trigger_fft_inst/val_to_compare1[13]} {main_level/trigger_fft_inst/val_to_compare1[14]} {main_level/trigger_fft_inst/val_to_compare1[15]}]]





create_debug_core u_ila_0 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_0]
set_property ALL_PROBE_SAME_MU_CNT 4 [get_debug_cores u_ila_0]
set_property C_ADV_TRIGGER true [get_debug_cores u_ila_0]
set_property C_DATA_DEPTH 8192 [get_debug_cores u_ila_0]
set_property C_EN_STRG_QUAL true [get_debug_cores u_ila_0]
set_property C_INPUT_PIPE_STAGES 0 [get_debug_cores u_ila_0]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_0]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_0]
set_property port_width 1 [get_debug_ports u_ila_0/clk]
connect_debug_port u_ila_0/clk [get_nets [list clk_IBUF_BUFG]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe0]
set_property port_width 32 [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list {main_level/cc_block_inst/Channel_Y_CC_AXI_Master/s_axis_data_tdata[0]} {main_level/cc_block_inst/Channel_Y_CC_AXI_Master/s_axis_data_tdata[1]} {main_level/cc_block_inst/Channel_Y_CC_AXI_Master/s_axis_data_tdata[2]} {main_level/cc_block_inst/Channel_Y_CC_AXI_Master/s_axis_data_tdata[3]} {main_level/cc_block_inst/Channel_Y_CC_AXI_Master/s_axis_data_tdata[4]} {main_level/cc_block_inst/Channel_Y_CC_AXI_Master/s_axis_data_tdata[5]} {main_level/cc_block_inst/Channel_Y_CC_AXI_Master/s_axis_data_tdata[6]} {main_level/cc_block_inst/Channel_Y_CC_AXI_Master/s_axis_data_tdata[7]} {main_level/cc_block_inst/Channel_Y_CC_AXI_Master/s_axis_data_tdata[8]} {main_level/cc_block_inst/Channel_Y_CC_AXI_Master/s_axis_data_tdata[9]} {main_level/cc_block_inst/Channel_Y_CC_AXI_Master/s_axis_data_tdata[10]} {main_level/cc_block_inst/Channel_Y_CC_AXI_Master/s_axis_data_tdata[11]} {main_level/cc_block_inst/Channel_Y_CC_AXI_Master/s_axis_data_tdata[12]} {main_level/cc_block_inst/Channel_Y_CC_AXI_Master/s_axis_data_tdata[13]} {main_level/cc_block_inst/Channel_Y_CC_AXI_Master/s_axis_data_tdata[14]} {main_level/cc_block_inst/Channel_Y_CC_AXI_Master/s_axis_data_tdata[15]} {main_level/cc_block_inst/Channel_Y_CC_AXI_Master/s_axis_data_tdata[16]} {main_level/cc_block_inst/Channel_Y_CC_AXI_Master/s_axis_data_tdata[17]} {main_level/cc_block_inst/Channel_Y_CC_AXI_Master/s_axis_data_tdata[18]} {main_level/cc_block_inst/Channel_Y_CC_AXI_Master/s_axis_data_tdata[19]} {main_level/cc_block_inst/Channel_Y_CC_AXI_Master/s_axis_data_tdata[20]} {main_level/cc_block_inst/Channel_Y_CC_AXI_Master/s_axis_data_tdata[21]} {main_level/cc_block_inst/Channel_Y_CC_AXI_Master/s_axis_data_tdata[22]} {main_level/cc_block_inst/Channel_Y_CC_AXI_Master/s_axis_data_tdata[23]} {main_level/cc_block_inst/Channel_Y_CC_AXI_Master/s_axis_data_tdata[24]} {main_level/cc_block_inst/Channel_Y_CC_AXI_Master/s_axis_data_tdata[25]} {main_level/cc_block_inst/Channel_Y_CC_AXI_Master/s_axis_data_tdata[26]} {main_level/cc_block_inst/Channel_Y_CC_AXI_Master/s_axis_data_tdata[27]} {main_level/cc_block_inst/Channel_Y_CC_AXI_Master/s_axis_data_tdata[28]} {main_level/cc_block_inst/Channel_Y_CC_AXI_Master/s_axis_data_tdata[29]} {main_level/cc_block_inst/Channel_Y_CC_AXI_Master/s_axis_data_tdata[30]} {main_level/cc_block_inst/Channel_Y_CC_AXI_Master/s_axis_data_tdata[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
set_property port_width 32 [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list {main_level/cc_block_inst/Channel_X_CC_AXI_Master/s_axis_data_tdata[0]} {main_level/cc_block_inst/Channel_X_CC_AXI_Master/s_axis_data_tdata[1]} {main_level/cc_block_inst/Channel_X_CC_AXI_Master/s_axis_data_tdata[2]} {main_level/cc_block_inst/Channel_X_CC_AXI_Master/s_axis_data_tdata[3]} {main_level/cc_block_inst/Channel_X_CC_AXI_Master/s_axis_data_tdata[4]} {main_level/cc_block_inst/Channel_X_CC_AXI_Master/s_axis_data_tdata[5]} {main_level/cc_block_inst/Channel_X_CC_AXI_Master/s_axis_data_tdata[6]} {main_level/cc_block_inst/Channel_X_CC_AXI_Master/s_axis_data_tdata[7]} {main_level/cc_block_inst/Channel_X_CC_AXI_Master/s_axis_data_tdata[8]} {main_level/cc_block_inst/Channel_X_CC_AXI_Master/s_axis_data_tdata[9]} {main_level/cc_block_inst/Channel_X_CC_AXI_Master/s_axis_data_tdata[10]} {main_level/cc_block_inst/Channel_X_CC_AXI_Master/s_axis_data_tdata[11]} {main_level/cc_block_inst/Channel_X_CC_AXI_Master/s_axis_data_tdata[12]} {main_level/cc_block_inst/Channel_X_CC_AXI_Master/s_axis_data_tdata[13]} {main_level/cc_block_inst/Channel_X_CC_AXI_Master/s_axis_data_tdata[14]} {main_level/cc_block_inst/Channel_X_CC_AXI_Master/s_axis_data_tdata[15]} {main_level/cc_block_inst/Channel_X_CC_AXI_Master/s_axis_data_tdata[16]} {main_level/cc_block_inst/Channel_X_CC_AXI_Master/s_axis_data_tdata[17]} {main_level/cc_block_inst/Channel_X_CC_AXI_Master/s_axis_data_tdata[18]} {main_level/cc_block_inst/Channel_X_CC_AXI_Master/s_axis_data_tdata[19]} {main_level/cc_block_inst/Channel_X_CC_AXI_Master/s_axis_data_tdata[20]} {main_level/cc_block_inst/Channel_X_CC_AXI_Master/s_axis_data_tdata[21]} {main_level/cc_block_inst/Channel_X_CC_AXI_Master/s_axis_data_tdata[22]} {main_level/cc_block_inst/Channel_X_CC_AXI_Master/s_axis_data_tdata[23]} {main_level/cc_block_inst/Channel_X_CC_AXI_Master/s_axis_data_tdata[24]} {main_level/cc_block_inst/Channel_X_CC_AXI_Master/s_axis_data_tdata[25]} {main_level/cc_block_inst/Channel_X_CC_AXI_Master/s_axis_data_tdata[26]} {main_level/cc_block_inst/Channel_X_CC_AXI_Master/s_axis_data_tdata[27]} {main_level/cc_block_inst/Channel_X_CC_AXI_Master/s_axis_data_tdata[28]} {main_level/cc_block_inst/Channel_X_CC_AXI_Master/s_axis_data_tdata[29]} {main_level/cc_block_inst/Channel_X_CC_AXI_Master/s_axis_data_tdata[30]} {main_level/cc_block_inst/Channel_X_CC_AXI_Master/s_axis_data_tdata[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
set_property port_width 4 [get_debug_ports u_ila_0/probe2]
connect_debug_port u_ila_0/probe2 [get_nets [list {main_level/cmd/COMM_READ_CONT_inst/current_state[0]} {main_level/cmd/COMM_READ_CONT_inst/current_state[1]} {main_level/cmd/COMM_READ_CONT_inst/current_state[2]} {main_level/cmd/COMM_READ_CONT_inst/current_state[3]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe3]
set_property port_width 8 [get_debug_ports u_ila_0/probe3]
connect_debug_port u_ila_0/probe3 [get_nets [list {main_level/trigger_fft_inst/TRIGGER_DETECT_inst/FFT_index[0]} {main_level/trigger_fft_inst/TRIGGER_DETECT_inst/FFT_index[1]} {main_level/trigger_fft_inst/TRIGGER_DETECT_inst/FFT_index[2]} {main_level/trigger_fft_inst/TRIGGER_DETECT_inst/FFT_index[3]} {main_level/trigger_fft_inst/TRIGGER_DETECT_inst/FFT_index[4]} {main_level/trigger_fft_inst/TRIGGER_DETECT_inst/FFT_index[5]} {main_level/trigger_fft_inst/TRIGGER_DETECT_inst/FFT_index[6]} {main_level/trigger_fft_inst/TRIGGER_DETECT_inst/FFT_index[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe4]
set_property port_width 16 [get_debug_ports u_ila_0/probe4]
connect_debug_port u_ila_0/probe4 [get_nets [list {main_level/trigger_fft_inst/TRIGGER_DETECT_inst/val_to_compare[0]} {main_level/trigger_fft_inst/TRIGGER_DETECT_inst/val_to_compare[1]} {main_level/trigger_fft_inst/TRIGGER_DETECT_inst/val_to_compare[2]} {main_level/trigger_fft_inst/TRIGGER_DETECT_inst/val_to_compare[3]} {main_level/trigger_fft_inst/TRIGGER_DETECT_inst/val_to_compare[4]} {main_level/trigger_fft_inst/TRIGGER_DETECT_inst/val_to_compare[5]} {main_level/trigger_fft_inst/TRIGGER_DETECT_inst/val_to_compare[6]} {main_level/trigger_fft_inst/TRIGGER_DETECT_inst/val_to_compare[7]} {main_level/trigger_fft_inst/TRIGGER_DETECT_inst/val_to_compare[8]} {main_level/trigger_fft_inst/TRIGGER_DETECT_inst/val_to_compare[9]} {main_level/trigger_fft_inst/TRIGGER_DETECT_inst/val_to_compare[10]} {main_level/trigger_fft_inst/TRIGGER_DETECT_inst/val_to_compare[11]} {main_level/trigger_fft_inst/TRIGGER_DETECT_inst/val_to_compare[12]} {main_level/trigger_fft_inst/TRIGGER_DETECT_inst/val_to_compare[13]} {main_level/trigger_fft_inst/TRIGGER_DETECT_inst/val_to_compare[14]} {main_level/trigger_fft_inst/TRIGGER_DETECT_inst/val_to_compare[15]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe5]
set_property port_width 10 [get_debug_ports u_ila_0/probe5]
connect_debug_port u_ila_0/probe5 [get_nets [list {main_level/ADC_Channel_1[0]} {main_level/ADC_Channel_1[1]} {main_level/ADC_Channel_1[2]} {main_level/ADC_Channel_1[3]} {main_level/ADC_Channel_1[4]} {main_level/ADC_Channel_1[5]} {main_level/ADC_Channel_1[6]} {main_level/ADC_Channel_1[7]} {main_level/ADC_Channel_1[8]} {main_level/ADC_Channel_1[9]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe6]
set_property port_width 1 [get_debug_ports u_ila_0/probe6]
connect_debug_port u_ila_0/probe6 [get_nets [list main_level/data_ready]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe7]
set_property port_width 1 [get_debug_ports u_ila_0/probe7]
connect_debug_port u_ila_0/probe7 [get_nets [list main_level/trigger_fft_inst/fft_m_axis_data_tvalid]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe8]
set_property port_width 1 [get_debug_ports u_ila_0/probe8]
connect_debug_port u_ila_0/probe8 [get_nets [list main_level/cmd/COMM_READ_CONT_inst/Rx_Ready]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe9]
set_property port_width 1 [get_debug_ports u_ila_0/probe9]
connect_debug_port u_ila_0/probe9 [get_nets [list main_level/cmd/Timeout]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe10]
set_property port_width 1 [get_debug_ports u_ila_0/probe10]
connect_debug_port u_ila_0/probe10 [get_nets [list main_level/trigger_fft_inst/TRIGGER_DETECT_inst/Trigger]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe11]
set_property port_width 1 [get_debug_ports u_ila_0/probe11]
connect_debug_port u_ila_0/probe11 [get_nets [list main_level/cc_block_inst/Channel_X_CC_AXI_Master/s_axis_data_tvalid]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe12]
set_property port_width 1 [get_debug_ports u_ila_0/probe12]
connect_debug_port u_ila_0/probe12 [get_nets [list main_level/cc_block_inst/Channel_Y_CC_AXI_Master/s_axis_data_tvalid]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets clk_IBUF_BUFG]
