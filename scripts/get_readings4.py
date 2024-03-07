#!/usr/bin/env python3

import serial
import time

ser = serial.Serial('COM8', 115200, timeout = 1) # open serial port
#print(ser.name)

start_time = time.time()

# initial values
instruction = b'\xd0'
ser.write(instruction)

while True:
    # read angle
    data = ser.read(1)
    print("[{}] ".format(int((time.time() - start_time) * 1000)) + "got raw: " + str(data)) 
    
    time.sleep(0.1)
    
