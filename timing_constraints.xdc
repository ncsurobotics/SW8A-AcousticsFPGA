#set_false_path -setup -rise -from [get_clocks sys_clk_pin] -to [get_clocks -of_objects [get_pins DATA_clks_inst/inst/mmcm_adv_inst/CLKOUT1]]

#set_false_path -setup -rise -reset_path -from [get_clocks -of_objects [get_pins DATA_clks_inst/inst/mmcm_adv_inst/CLKOUT1]] -to [get_clocks sys_clk_pin]
#set_false_path -hold -rise -reset_path -from [get_clocks -of_objects [get_pins DATA_clks_inst/inst/mmcm_adv_inst/CLKOUT1]] -to [get_clocks sys_clk_pin]
#set_false_path -hold -rise -reset_path -from [get_clocks sys_clk_pin] -to [get_clocks -of_objects [get_pins DATA_clks_inst/inst/mmcm_adv_inst/CLKOUT1]]

#set_false_path -setup -rise -from [get_clocks -of_objects [get_pins DATA_clks_inst/inst/mmcm_adv_inst/CLKOUT1]] -to [get_clocks sys_clk_pin]
#set_false_path -hold -rise -from [get_clocks -of_objects [get_pins DATA_clks_inst/inst/mmcm_adv_inst/CLKOUT1]] -to [get_clocks sys_clk_pin]
#set_false_path -hold -rise -from [get_clocks sys_clk_pin] -to [get_clocks -of_objects [get_pins DATA_clks_inst/inst/mmcm_adv_inst/CLKOUT1]]

set_false_path -from [get_pins {main_level/cmd/COMM_READ_DATA_PATH_inst/timer_sel_100_reg[0]/C}] -to [get_pins {main_level/cmd/COMM_READ_DATA_PATH_inst/timer_sel_sync_reg[0][0]/D}]
set_false_path -from [get_pins {main_level/cmd/COMM_READ_DATA_PATH_inst/timer_sel_100_reg[1]/C}] -to [get_pins {main_level/cmd/COMM_READ_DATA_PATH_inst/timer_sel_sync_reg[0][1]/D}]

set_false_path -from [get_pins main_level/cc_pipeline_controller_inst/spi_en_int_ff_reg/C] -to [get_pins {main_level/cc_pipeline_controller_inst/spi_en_sync_reg[3]/D}]
