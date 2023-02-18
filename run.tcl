
#vlib work
vlog -reportprogress 300 -work work counter.v
vlog -reportprogress 300 -work work spi-tb.v
vlog -reportprogress 300 -work work SIPO.v
vlog -reportprogress 300 -work work SIPO_controller.v

vsim -gui work.spi_tb
add wave -position insertpoint sim:/spi_tb/clk
add wave -position insertpoint sim:/spi_tb/spi_clk
add wave -position insertpoint sim:/spi_tb/sipo_controller0/*
add wave -position insertpoint sim:/spi_tb/adc_in
add wave -position insertpoint sim:/spi_tb/adc_out
add wave -position insertpoint sim:/spi_tb/sipo0_out


run -all 