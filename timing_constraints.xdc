set_false_path -setup -rise -from [get_clocks sys_clk_pin] -to [get_clocks -of_objects [get_pins DATA_clks_inst/inst/mmcm_adv_inst/CLKOUT1]]

<<<<<<< HEAD
set_false_path -setup -rise -reset_path -from [get_clocks -of_objects [get_pins DATA_clks_inst/inst/mmcm_adv_inst/CLKOUT1]] -to [get_clocks sys_clk_pin]
set_false_path -hold -rise -reset_path -from [get_clocks -of_objects [get_pins DATA_clks_inst/inst/mmcm_adv_inst/CLKOUT1]] -to [get_clocks sys_clk_pin]
set_false_path -hold -rise -reset_path -from [get_clocks sys_clk_pin] -to [get_clocks -of_objects [get_pins DATA_clks_inst/inst/mmcm_adv_inst/CLKOUT1]]

set_false_path -to [get_pins main_level/UART_inst/UART_TX_inst/TX_en_576_reg/D]
set_false_path -to [get_pins {main_level/UART_inst/UART_TX_inst/TX_Data_in_576_reg[0]/D}]
set_false_path -to [get_pins {main_level/UART_inst/UART_TX_inst/TX_Data_in_576_reg[1]/D}]
set_false_path -to [get_pins {main_level/UART_inst/UART_TX_inst/TX_Data_in_576_reg[2]/D}]
set_false_path -to [get_pins {main_level/UART_inst/UART_TX_inst/TX_Data_in_576_reg[3]/D}]
set_false_path -to [get_pins {main_level/UART_inst/UART_TX_inst/TX_Data_in_576_reg[4]/D}]
set_false_path -to [get_pins {main_level/UART_inst/UART_TX_inst/TX_Data_in_576_reg[5]/D}]
set_false_path -to [get_pins {main_level/UART_inst/UART_TX_inst/TX_Data_in_576_reg[6]/D}]
set_false_path -to [get_pins {main_level/UART_inst/UART_TX_inst/TX_Data_in_576_reg[7]/D}]
=======
set_false_path -setup -rise -from [get_clocks -of_objects [get_pins DATA_clks_inst/inst/mmcm_adv_inst/CLKOUT1]] -to [get_clocks sys_clk_pin]
set_false_path -hold -rise -from [get_clocks -of_objects [get_pins DATA_clks_inst/inst/mmcm_adv_inst/CLKOUT1]] -to [get_clocks sys_clk_pin]
set_false_path -hold -rise -from [get_clocks sys_clk_pin] -to [get_clocks -of_objects [get_pins DATA_clks_inst/inst/mmcm_adv_inst/CLKOUT1]]

set_false_path -from [get_pins main_level/UART_inst/UART_TX_inst/TX_en_100_reg/C] -to [get_pins main_level/UART_inst/UART_TX_inst/TX_en_576_reg/D]
set_false_path -from [get_pins {main_level/UART_inst/UART_TX_inst/TX_Data_in_100_reg[0]/C}] -to [get_pins {main_level/UART_inst/UART_TX_inst/TX_Data_in_576_reg[0]/D}]
set_false_path -from [get_pins {main_level/UART_inst/UART_TX_inst/TX_Data_in_100_reg[1]/C}] -to [get_pins {main_level/UART_inst/UART_TX_inst/TX_Data_in_576_reg[1]/D}]
set_false_path -from [get_pins {main_level/UART_inst/UART_TX_inst/TX_Data_in_100_reg[2]/C}] -to [get_pins {main_level/UART_inst/UART_TX_inst/TX_Data_in_576_reg[2]/D}]
set_false_path -from [get_pins {main_level/UART_inst/UART_TX_inst/TX_Data_in_100_reg[3]/C}] -to [get_pins {main_level/UART_inst/UART_TX_inst/TX_Data_in_576_reg[3]/D}]
set_false_path -from [get_pins {main_level/UART_inst/UART_TX_inst/TX_Data_in_100_reg[4]/C}] -to [get_pins {main_level/UART_inst/UART_TX_inst/TX_Data_in_576_reg[4]/D}]
set_false_path -from [get_pins {main_level/UART_inst/UART_TX_inst/TX_Data_in_100_reg[5]/C}] -to [get_pins {main_level/UART_inst/UART_TX_inst/TX_Data_in_576_reg[5]/D}]
set_false_path -from [get_pins {main_level/UART_inst/UART_TX_inst/TX_Data_in_100_reg[6]/C}] -to [get_pins {main_level/UART_inst/UART_TX_inst/TX_Data_in_576_reg[6]/D}]
set_false_path -from [get_pins {main_level/UART_inst/UART_TX_inst/TX_Data_in_100_reg[7]/C}] -to [get_pins {main_level/UART_inst/UART_TX_inst/TX_Data_in_576_reg[7]/D}]

set_false_path -from [get_pins {main_level/cmd/COMM_READ_DATA_PATH_inst/timer_sel_100_reg[0]/C}] -to [get_pins {main_level/cmd/COMM_READ_DATA_PATH_inst/timer_sel_sync_reg[0][0]/D}]
set_false_path -from [get_pins {main_level/cmd/COMM_READ_DATA_PATH_inst/timer_sel_100_reg[1]/C}] -to [get_pins {main_level/cmd/COMM_READ_DATA_PATH_inst/timer_sel_sync_reg[0][1]/D}]
set_false_path -from [get_pins main_level/UART_inst/UART_TX_inst/TX_Ready_576_reg/C] -to [get_pins main_level/UART_inst/UART_TX_inst/TX_Ready_reg/D]
>>>>>>> 8a2dd0e21909eee2f711505d3c4d84d141833ac5
