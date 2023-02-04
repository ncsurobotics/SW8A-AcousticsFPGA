
#vlib work
vlog -reportprogress 300 -work work counter.v
vlog -reportprogress 300 -work work spi-tb.v
vlog -reportprogress 300 -work work SIPO.v
vlog -reportprogress 300 -work work SIPO_controller.v

vsim -gui work.spi_tb
add wave -position insertpoint sim:/spi_tb/dut/*

run -all 