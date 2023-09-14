import numpy as np

ints = np.arange(0,256,1)
print(ints[63])

#hexs = hex(ints)[2:]
#hexs = np.zeros(64)
f = open("TRIGGER_FFT_tb_input.data", mode = "w+")
for i in ints:
    #hexs[i] = "{:03x}".format(ints[i])
    s = "{:03x}".format(i)
    f.write(s)
    f.write('\n')
    #print(s)
f.flush()
#print(hexs[63])
#print('\n')
#print(ints[255])

# write input data to a file
#with open("TRIGGER_FFT_tb_input.data", mode="wt") as f:
#	for i in ints:
#		s = "{:03x}".format(ints[i])
#		#print(s)
#		f.write(s)
#		f.write('\n')