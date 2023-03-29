import serial

ser = serial.Serial('COM6', 115200, timeout = 1) # open serial port
print(ser.name)

# Send 'A' to the FPGA to tell it to give you data
get_data = b'\x41'
ser.write(get_data)

# each channel reading is a 10 bit number. the FPGA sends a channel
# reading in 3 bytes:
#   1st byte: channel ID: 'A', 'B', 'C', or 'D' -- right now only 'A'
#   2nd byte: 3'b100 + 5 LSB
#   3rd byte: 3'b110 + 5 MSB

# read 1 channel, so 3 bytes
data = ser.read(3)

print("got: ") 
print(data)
