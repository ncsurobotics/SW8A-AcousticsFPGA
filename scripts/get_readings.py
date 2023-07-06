import serial
#import readline

ser = serial.Serial('COM6', 115200, timeout = 5) # open serial port
print(ser.name)

while True:

    # Send 'A' to the FPGA to tell it to give you data
    get_data = b'\x41'
    ser.write(get_data)

    # each channel reading is a 10 bit number. the FPGA sends a channel
    # reading in 3 bytes:
    #   1st byte: channel ID: 'A', 'B', 'C', or 'D' -- right now only 'A'
    #   2nd byte: 3'b100 + 5 LSB
    #   3rd byte: 3'b100 + 5 MSB

    # read 1 channel, so 3 bytes
    data = ser.read(3)

    # convert to voltage
    data_list = list(data)
    data_10bit = ((data_list[2] & 0b00011111) << 5) | (data_list[1] & 0b00011111)
    data_int = int(data_10bit)

    volts = (data_int * 5.0) / 1023.0

    print("got raw: " + str(data) + ", voltage = " + str(volts)) 

    run_again = input("run again? (y/n)")
    if run_again in ("n", "N"):
        break
