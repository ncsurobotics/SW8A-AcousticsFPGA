#!/usr/bin/env python3

import serial
import time
import keyboard # pip install keyboard

#port = input("enter port name: ")

ser = serial.Serial('COM4', 115200, timeout = 1) # open serial port
print(ser.name)

start_time = time.time()

# initial values
instruction = b'x41'


while True:

    check_input = input()
    if check_input in ("stop"):
        break
    elif (check_input in ("1")):
        instruction = b'A'
    elif (check_input in ("2")):
        instruction = b'B'
    elif (check_input in ("3")):
        instruction = b'C'
    elif (check_input in ("4")):
        instruction = b'D'

    # Send 'A' to the FPGA to tell it to give you data
    ser.write(instruction)

    # read 1 channel (2 bytes)
    data = ser.read(1)

    # convert to voltage
    data_8b = int.from_bytes(data, 'big')
    data_int = data_8b << 2

    volts = (data_int * 5.0) / 1023.0

    print("[{}] ".format(int((time.time() - start_time) * 1000)) + "got raw: " + str(data) + ", voltage = " + str(volts)) 
    
    time.sleep(0.1)
    
