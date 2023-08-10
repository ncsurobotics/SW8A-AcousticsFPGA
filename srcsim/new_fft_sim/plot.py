from matplotlib import pyplot as plt
import numpy as np

fft = np.loadtxt("new_trig_out.txt")
plt.plot(fft[1::2])
plt.show()

data = np.loadtxt("fft_data_in.txt")
plt.plot(data)
plt.show()

npfft = np.fft.fft((1/64)*data[0:len(data)])
plt.plot(npfft)
plt.show()