import numpy as np
from matplotlib import pyplot as plt

N = 256 # 256 point FFT
Fs = 446000
t_step = (1/Fs)
freq = 30000
t = np.arange(N)

chx = np.loadtxt("zero_pad_chx_out.txt")
chy = np.loadtxt("zero_pad_chy_out.txt")

plt.subplot(311)
plt.plot(chx)

plt.subplot(312)
plt.plot(chy)

plt.show()