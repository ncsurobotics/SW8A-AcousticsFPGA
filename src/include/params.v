// clock periods parameter -- use `include params.v at the top of files you need this
// IF YOU CHANGE THE CLOCK GENERATOR YOU NEED TO CHANGE THIS FILE (and vice versa)

parameter CLK_PERIOD = 12; // round this to the nearest integer, e.g. 80 MHz --> 12 ns
parameter UART_SAMPLE_PERIOD = 9370; // this only changes if you change the baud rate

