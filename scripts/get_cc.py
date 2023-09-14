#!/usr/bin/env python3

import serial
import time
import keyboard # pip install keyboard
import sys

#port = input("enter port name: ")

port = sys.argv[1]
ser = serial.Serial(port, 115200, timeout = 1) # open serial port
print(ser.name)

start_time = time.time()

# initial values
instruction = b'x41'


while True:

    check_input = input()
    if check_input in ("stop"):
        break
    elif (check_input in ("1")):
        instruction = bytes.fromhex('41')
    elif (check_input in ("2")):
        instruction = b'B'
    elif (check_input in ("3")):
        instruction = b'C'
    elif (check_input in ("4")):
        instruction = b'D'
    elif (check_input in("5")):
        instruction = bytes.fromhex('D0')
    
    # Send 'A' to the FPGA to tell it to give you data
    print(int.from_bytes(instruction, 'big'))
    ser.write(instruction)

    # read 1 channel (2 bytes)
    data = ser.read(1)

    # convert to voltage
    data_8b = int.from_bytes(data, 'big')
    print("[{}] ".format(int((time.time() - start_time) * 1000)) + "got raw: " + str(data))
    
    time.sleep(0.1)
    
