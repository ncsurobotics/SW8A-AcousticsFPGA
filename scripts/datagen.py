# Trigger FFT Data Generation
# Generates a 30 kHz sine wave, scaled to integer values from 0 to 1023 centered at 512
# Sampled at 500 ks/sec 

import numpy as np
from matplotlib import pyplot as plt

# natural ordering does what?
t_step = (1/446000)
freq = 30000
t = np.arange(128)

raw_sine = 0.5 * np.sin(2*np.pi * freq * t * t_step ) # generate sine wave
bias = np.ones(128) * 0.5                             # generate 0.5 bias
data_floats = np.add(bias, raw_sine)*1023             # scale to between 0 and 1023
data = np.rint(data_floats)                           # round to nearest integer

plt.plot(data)
plt.show()

