# not done dont use

import comms_functions
import serial

ser = None

while True:
    str = input("what do you want to do? type 'help' for a list of commands.")
    
    if str in ('open port', 'op'):
        port = input("Type port name exactly, case sensitive: ")
        ser = open_port(port)
    
    elif str in ('help'):
        print('open port: opens serial port\n' +
              'read [n]: reads n bytes from serial port'
              )
        

    else:
        if ser == None:
            print('No serial port open.')
        else:

