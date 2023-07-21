import numpy as np

ints = np.arange(0,256,1)
print(ints[63])

#hexs = hex(ints)[2:]
#hexs = np.zeros(64)
#for i in ints:
#    hexs[i] = "{:03x}".format(ints[i])
#    print(hexs[i])
#print(hexs[63])

# write input data to a file
with open("TRIGGER_FFT_tb_input.data", mode="wt") as f:
	for i in ints:
		s = "{:03x}".format(ints[i])
		#print(s)
		f.write(s)
		f.write('\n')