# Smart Digital Lock System Using Verilog

## Overview

The Smart Digital Lock System is a security-based digital design implemented using Verilog HDL. The system grants access only when the correct four-digit password is entered. It is designed using Finite State Machine (FSM) concepts and verified through simulation using Xilinx ISE.

## Features

* Four-digit password authentication.
* Unlock signal for correct password entry.
* Wrong-attempt counter.
* Alarm activation after three consecutive incorrect attempts.
* Reset functionality to clear the system state.
* Simulation-based verification using waveforms.

## Software Requirements

* Xilinx ISE Design Suite
* ISim Simulator

## Files Included

1. `smartdigitallock.v` – Main Verilog design file.
2. `smartdigitallock_tb.v` – Testbench file for simulation.
3. Simulation waveform screenshots (optional).

## Inputs

| Signal       | Description                                 |
| ------------ | ------------------------------------------- |
| `clk`        | System clock signal                         |
| `reset`      | Resets the entire system                    |
| `enter`      | Indicates digit entry                       |
| `digit[3:0]` | Four-bit input representing password digits |

## Outputs

| Signal   | Description                                       |
| -------- | ------------------------------------------------- |
| `unlock` | Becomes HIGH when the correct password is entered |
| `alarm`  | Becomes HIGH after three incorrect attempts       |

## Working Principle

1. The user enters a four-digit password.
2. Each digit is stored sequentially.
3. After receiving four digits, the system compares the entered password with the stored password.
4. If the password is correct, the `unlock` signal becomes HIGH.
5. If the password is incorrect, the wrong-attempt counter increments.
6. After three wrong attempts, the `alarm` signal is activated.
7. The `reset` signal clears all stored data and returns the system to its initial state.

## Simulation

1. Add both Verilog files to a Xilinx ISE project.
2. Set `smartdigitallock_tb` as the top module.
3. Run "Simulate Behavioral Model".
4. Observe the waveforms for `clk`, `reset`, `digit`, `enter`, `unlock`, and `alarm`.

## Future Enhancements

* Keypad interfacing for password entry.
* Seven-segment display integration.
* FPGA hardware implementation.
* Biometric authentication support.

## Author

Project developed for educational purposes to demonstrate digital system design using Verilog HDL.
