import serial

def open_port(port):
    ser = serial.Serial(port, 115200, timeout = 5)
    print("Opened serial port:" + ser.name)
    return ser

def set_threshold(ser, thres):
    if (thres < 0) or (thres > 127):
        print("threshold cannot exceed 127 (7 bits)")
        return 1
        
    thres += 128
    thres = thres.to_bytes(1, 'big')

    ser.write(thres)
    return 0

def set_threshold_from_input(ser):
    while True:
        thres = int(input("threshold?"))

        if set_threshold(ser, thres) == 0:
            break

def stream(ser):
    try:
        while True:
            num_to_read = ser.inWaiting() 
            out = ser.read(num_to_read)
            for i in out:
                print(i)
    except KeyboardInterrupt:
        pass

port = input("Type port name exactly, case sensitive:")
ser = open_port(port)

while True:
    set_threshold_from_input(ser)

    stream(ser)

    run_again = input("run again? (y/n)")
    if run_again in ("n", "N"):
        break

