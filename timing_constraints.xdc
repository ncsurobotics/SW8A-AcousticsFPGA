set_false_path -setup -rise -reset_path -from [get_clocks sys_clk_pin] -to [get_clocks -of_objects [get_pins DATA_clks_inst/inst/mmcm_adv_inst/CLKOUT1]]

set_false_path -setup -rise -reset_path -from [get_clocks -of_objects [get_pins DATA_clks_inst/inst/mmcm_adv_inst/CLKOUT1]] -to [get_clocks sys_clk_pin]
set_false_path -hold -rise -reset_path -from [get_clocks -of_objects [get_pins DATA_clks_inst/inst/mmcm_adv_inst/CLKOUT1]] -to [get_clocks sys_clk_pin]
set_false_path -hold -rise -reset_path -from [get_clocks sys_clk_pin] -to [get_clocks -of_objects [get_pins DATA_clks_inst/inst/mmcm_adv_inst/CLKOUT1]]
