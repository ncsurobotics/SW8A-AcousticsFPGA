import pandas as pd
import numpy as np
from matplotlib import pyplot as plt
import argparse

# parse filename argument
parser = argparse.ArgumentParser()
parser.add_argument('filename')
args = parser.parse_args()

# read in csv and extract the columns we want
f = pd.read_csv(args.filename)
columns = [
    'Sample in Buffer',
    'main_level/cc_block_inst/Channel_Y_CC_AXI_Master/s_axis_data_tdata[31:0]',
    'main_level/cc_block_inst/Channel_X_CC_AXI_Master/s_axis_data_tdata[31:0]',
    'main_level/cc_block_inst/Channel_X_CC_AXI_Master/s_axis_data_tvalid',
    'main_level/cc_block_inst/Channel_Y_CC_AXI_Master/s_axis_data_tvalid',
    'main_level/Trigger'
]
columns_dict = {
    'Sample in Buffer':                                                             't',
    'main_level/Trigger':                                                           'trigger', 
    'main_level/cc_block_inst/Channel_Y_CC_AXI_Master/s_axis_data_tdata[31:0]':     'y_data' , 
    'main_level/cc_block_inst/Channel_X_CC_AXI_Master/s_axis_data_tdata[31:0]':     'x_data' ,   
    'main_level/cc_block_inst/Channel_X_CC_AXI_Master/s_axis_data_tvalid':          'x_valid',
    'main_level/cc_block_inst/Channel_Y_CC_AXI_Master/s_axis_data_tvalid':          'y_valid', 
}
f = f[columns]
f.rename(columns=columns_dict, inplace=True)
#print(f.head())

# extract channels X and Y
chx = f.loc[f['x_valid'] == '1']
chx = chx['x_data']
chx = chx.iloc[128:] # Channel X zero-pads in the first 128 samples

chy = f.loc[f['y_valid'] == '1']
chy = chy['y_data']
chy = chy.iloc[:-128] # Channel Y zero-pads in the last 128 samples

def convert(df):        # yes i know this sucks i'm sorry
    range = np.zeros(128)
    i = 0
    for rows in df:
        range[i] = int(rows, 16)
        i = i + 1
        if (i==127):
            break
    return range

chxx = convert(chx)
chyy = convert(chy)

x_axis = np.arange(0, 128, 1)

plt.plot(x_axis, chxx, x_axis, chyy)
plt.show()


