# FPGA Communication Spec

This document outlines the complete specification for talking to the FPGA over UART.

#### General
Baud rate: 115200, 8 data bits/no parity/1 stop bit (8n1)

#### Configuring Threshold & Frequency
The trigger frequency and trigger threshold are both configurable over UART. 

###### Frequency
Value on startup: 0x10 = 16

###### Threshold 
Value on startup: 0x16 = 22
Size: 16-bit value, but only the lower 7 bits are configurable. 

The threshold message is a single 8-bit word, structured as follows:
            [ (MSB) 1 ] [ (7 LSB) 7-bit threshold value ]


#### Max Value