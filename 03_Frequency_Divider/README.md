# Frequency Divider

This folder contains the Verilog files for a counter-based Frequency Divider.

## Table of Contents
- [File Structure](#file-structure)
- [Simulation Details](#simulation-details)
- [Behavior](#behavior)

## File Structure
- `FREQ_DIV.v`: Verilog file containing the verilog model of the Frequency Divider.

- `FREQ_DIV_tb.v`: Verilog file containing the testbench for the Frequency Divider.

- `run.tcl`: Script that automates the running of the testbench.

## Simulation Details
To run the simulation, you can run the simulation with the TCL script in your terminal:

```bash
./run.tcl
```

## Behavior
The Frequency Divider is a counter-based divider that divides the input frequency, `M` is a 3-bits division factor that can be set 1 ~ 7. The output clock is `REF_CLK / M`. The simulation waveform is shown in Fig. 1.

<img src="./img/waveform.png">
Fig. 1: Waveform of the Frequency Divider