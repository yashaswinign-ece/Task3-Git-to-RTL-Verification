# V3: Terminal Count Counter

## Project Overview
Designed and simulated a parameterized 4-bit Up/Down Counter with parallel load and terminal count detection using Verilog HDL.

This version extends the previous counter designs by adding a terminal count flag to identify the maximum and minimum counter values.

## Features
- **Synchronous Active-Low Reset:** Resets the counter to zero when `rst_n` is low at the positive clock edge.
- **Parallel Load:** Loads the input value directly into the counter when `load` is high.
- **Up Counting:** Increments the counter when `up_down` is high and `enable` is high.
- **Down Counting:** Decrements the counter when `up_down` is low and `enable` is high.
- **Terminal Count Detection:** Indicates the maximum count (15) during up-counting and minimum count (0) during down-counting.
- **Hold Operation:** Maintains the previous count when enable and load are low.

## Verification
The design was verified using a Verilog testbench with the following test cases:

1. Synchronous reset.
2. Parallel loading of decimal 14.
3. Up-counting to 15.
4. Holding the counter at 15.
5. Parallel loading of decimal 1.
6. Down-counting to 0.
7. Holding the counter at 0.
8. Reset verification.

The EPWave waveform was inspected to verify the counter values and terminal count output.

## Repository Contents
- `counterv3.sv` – RTL source code.
- `testbenchv3.sv` – Testbench for functional verification.
- `waveformv3.png` – EPWave simulation waveform screenshot.
- `README.md` – Project documentation.

## Tools Used
- **HDL:** Verilog
- **Simulator:** Icarus Verilog
- **Simulation Platform:** EDA Playground
- **Waveform Viewer:** EPWave
- **Version Control:** Git and GitHub

## Expected Outcome
Successfully designed, simulated, and verified a parameterized Up/Down Counter with parallel loading and terminal count detection.
