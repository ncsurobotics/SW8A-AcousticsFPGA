# generates 2 channels of sample "ping" for AD2 wavegen
# instructions:
#   - call this script with frequency & num samples to right-shift ch2 by (can be negative)
#       TODO: change this to an angle in degrees
#       example: "python3 gen_ad2_wavegen.py ad2-wavegen-data/filename.csv 30000 -5" 
#           will generate a file called filename.csv with two 30 kHz signals where CH1 starts 5 samples earlier than CH2
#   - import into Waveforms

import argparse
import numpy as np
from matplotlib import pyplot as plt

# parse arguments
parser = argparse.ArgumentParser()
parser.add_argument('filename')
parser.add_argument('freq')
parser.add_argument('shift')
args = parser.parse_args()

