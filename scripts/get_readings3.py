#!/usr/bin/env python3

import serial
import time
import keyboard # pip install keyboard

#port = input("enter port name: ")

ser = serial.Serial('COM6', 115200, timeout = 1) # open serial port
print(ser.name)

start_time = time.time()

# initial values
instruction = b'x41'


while True:

    # Send 'A' to the FPGA to tell it to give you data
    ser.write(instruction)

    # read 1 channel (2 bytes)
    data = ser.read(2)

    # convert to voltage
    data_list = list(data)
    data_16bit = data_list[1] + data_list[0]
    data_int = int(data_16bit)

    volts = (data_int * 5.0) / 1023.0

    print("[{}] ".format(int((time.time() - start_time) * 1000)) + "got raw: " + str(data) + ", voltage = " + str(volts)) 

    check_input = input()
    if check_input in ("stop"):
        break
    else if check_input in ("1"):
        instruction = b'x41'
    else if check_input in ("2"):
        instruction = b'x42'
    else if check_input in ("3"):
        instruction = b'x43'
    else if check_input in ("4"):
        instruction = b'x44'
    
    time.sleep(0.1)
