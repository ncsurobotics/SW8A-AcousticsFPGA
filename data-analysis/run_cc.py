# alternate method of plotting AD2 data using numpy - requires manually edited CSV file, see right_trimmed.csv for sample

import numpy as np
from matplotlib import pyplot as plt
from scipy.fft import fft, fftfreq, ifft

file = 'C:/Users/ilena/Documents/apr-private/fpga/SW8A-AcousticsFPGA/data-analysis/right_trimmed.csv' # output generated by the FFT IP core

N = 512 # 256 point FFT
Fs = 446000

t_step = (1/Fs)
freq = 30000
t = np.arange(N)

# do a SciPy FFT on the input dataset and plot it
'''input_data = np.loadtxt(fft_input_file, dtype='int32', converters={_:lambda s: int(s, 16) for _ in range(1)})
scipy_fft = fft(input_data) ** 2
scipy_fft_freq = fftfreq(N, t_step)
plt.subplot(311)
plt.stem(scipy_fft_freq, scipy_fft)
plt.title('SciPy FFT')
plt.xlabel('f, Hz')
'''

# load in the data
data = np.loadtxt(file, delimiter=",", dtype = str)
#print(data)

chx = data[1:,2::4].flatten().astype(np.int32)  
chy = data[1:,3::4].flatten().astype(np.int32)
#print(chx)
plt.plot(chx)
plt.yticks()
plt.plot(chy)
plt.show()

plt.plot(np.imag(ifft(fft(chy)*np.conj(fft(chx)))))
plt.show()


#print(data)