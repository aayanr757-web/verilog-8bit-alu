# 8-Bit Arithmetic Logic Unit (ALU) | Verilog

An 8-bit combinational Arithmetic Logic Unit designed in Verilog, with automated functional verification using Icarus Verilog and waveform visualization in EPWave.

## Features

- 8 operations: addition, subtraction, bitwise AND, OR, XOR, logical left shift, logical right shift, and less-than comparison.
- 8-bit operands and output.
- 3-bit operation selector.
- Zero-result flag.
- Automated testbench with 16 passing test cases.

## Verification

**Results: 16 passed, 0 failed.**

Simulated using Icarus Verilog on EDA Playground. Waveforms inspected using EPWave.

## Files

- `alu.v` — ALU hardware design.
- `alu_tb.v` — automated verification testbench.

## Run Locally

With Icarus Verilog installed:

```bash
iverilog -o alu_sim alu.v alu_tb.v
vvp alu_sim
```

## Skills Demonstrated

Verilog HDL, digital logic design, combinational circuits, hardware simulation, automated testing, and waveform analysis.

## Author

Aayan Raza | BEng (Hons) Robotics, Autonomous & Interactive Systems | Heriot-Watt University