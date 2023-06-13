import csv
import math

# Set the parameters for the signals
frequency = 35000  # 40 kHz
amplitude = 9.0  # Max amplitude of the sine wave
phase_offset = math.pi / 6  # pi/6 radians

# Define the number of data points you want to generate
num_data_points = 1000

# Create a list to store the data
data = []

# Generate the data for each signal
for i in range(num_data_points):
    time = i / frequency  # Time in seconds
    signal1 = amplitude * math.sin(2 * math.pi * frequency * time)
    signal2 = amplitude * math.sin(2 * math.pi * frequency * time + phase_offset)
    signal3 = amplitude * math.sin(2 * math.pi * frequency * time + 2 * phase_offset)
    signal4 = amplitude * math.sin(2 * math.pi * frequency * time + 3 * phase_offset)

    # Scale the signals to the range 0-1023, centered at 511
    signal1_scaled = int((signal1 / 9.0) * 511 + 511)
    signal2_scaled = int((signal2 / 9.0) * 511 + 511)
    signal3_scaled = int((signal3 / 9.0) * 511 + 511)
    signal4_scaled = int((signal4 / 9.0) * 511 + 511)

    # Truncate values below 0 and above 1023
    signal1_scaled = max(0, min(1023, signal1_scaled))
    signal2_scaled = max(0, min(1023, signal2_scaled))
    signal3_scaled = max(0, min(1023, signal3_scaled))
    signal4_scaled = max(0, min(1023, signal4_scaled))

    data.append([time, signal1, signal2, signal3, signal4])

# Write the data to a CSV file
filename = 'generated_data.csv'
with open(filename, 'w', newline='') as file:
    writer = csv.writer(file)
    writer.writerow(['Time', 'Signal 1', 'Signal 2', 'Signal 3', 'Signal 4'])
    writer.writerows(data)

print(f"CSV file '{filename}' generated successfully!")