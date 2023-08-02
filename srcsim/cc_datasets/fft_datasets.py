# Generates multiple datasets to use for FFT testing:
#       cos.data -- simple 30 kHz cosine
#       trigger.data -- dataset we expect to trigger on; 64 points of flat 2.5V, 192 points of cosine
#       trigger_rshift.data -- trigger.data but shifted left; 64+16 pts nothing, 192-16 pts cosine
#       ** for later: make these but noisy
# All of these are created in ../datasets

import numpy as np
from matplotlib import pyplot as plt

N = 256 # 256 data points
Fs = 446000 # ADC sample frequency, no decimation
prop_zeros=0.25 # determines number of 0s in trigger.data and trigger_lshift.data
right_shift = 1 # number of points to left shift trigger_lshift.data by

t_step = (1/Fs)
freq = 30000
t = np.arange(N)

# make 256 points of cosine & scale to 0-1023
raw_cos = 0.1 * np.sin(2*np.pi * freq * t * t_step ) + 0.5 +np.random.normal(loc=0,scale=0.04,size=256) # generate sine wave
cos_floats = raw_cos*1023
cos_ints = np.rint(cos_floats)
cos_ints = cos_ints.astype(int)

# write & plot cos.data
with open("sin.data", mode="wt") as f:
	for i in range(len(cos_ints)):
		#print(i)
		s = "{:03x}".format(cos_ints[i])
		f.write(s)
		f.write('\n')
		
plt.subplot(311)
plt.plot(t*t_step, cos_ints)
		
# create, write & plot trigger.data
num_zeros = int(prop_zeros * N)
num_data = N - num_zeros
data = np.append(np.zeros(num_zeros) + 511, cos_ints[0:num_data])
data = data.astype(int)
f = open("trigger.data", mode="w+")
for i in range(len(data)):
	s = "{:03x}".format(data[i])
	f.write(s)
	#print(s)
	f.write('\n')
f.flush()
f.close()

#with open("trigger.data", mode="w+") as f:
#	for i in range(len(data)-1):
#		s = "{:03x}".format(data[i])
#		f.write(s)
#		print(s)
#		#f.write(str(int(i)))
#	    f.write('\n')
	
plt.subplot(312)
plt.plot(t*t_step, data)

# create, write & plot trigger_lshift.data
num_zeros = num_zeros + right_shift
if (num_zeros > (N-1)):
	raise Exception("num_zeros too large -- check prop_zeros")
num_data = N - num_zeros
data = np.append(np.zeros(num_zeros) + 511, cos_ints[0:num_data])
data = data.astype(int)
f = open("trigger_rshift.data", mode="w+")
for i in range(len(data)):
	s = "{:03x}".format(data[i])
	f.write(s)
	f.write('\n')
f.flush()
f.close()

#with open("trigger_rshift.data", mode="w+") as f:
#	for i in range(len(data)-1):
#		s = "{:03x}".format(data[i])
#        #f.write(str(int(i)))
#		f.write('\n')

plt.subplot(313)
plt.plot(t*t_step, data)

plt.show()

#sin_check = np.loadtxt("sin.data")
#trig_check = np.loadtxt("trigger.data")
#rshift_check = np.loadtxt("trigger_rshift.data")
#
#plt.subplot(311)
#plt.plot(sin_check)
#plt.title("im going insane")
#plt.subplot(312)
#plt.plot(trig_check)
#plt.subplot(313)
#plt.plot(rshift_check)
#plt.show()


