# Parameterized ALU with Status Flags (Verilog)

## Overview
This project implements a parameterized Arithmetic Logic Unit (ALU) in Verilog.

The ALU supports multiple arithmetic and logical operations selected using a 3-bit control signal. It also generates basic status flags:

- Zero Flag (Z)
- Negative Flag (N)

The design is parameterized, allowing the data width to be changed easily without modifying the core logic.

---

## Features

### Operations Supported

| Select | Operation |
|----------|----------|
| 000 | Addition (A + B) |
| 001 | Subtraction (A - B) |
| 010 | Bitwise AND |
| 011 | Bitwise OR |
| 100 | Bitwise XOR |
| 101 | Bitwise NOT (~A) |
| 110 | Greater Than (A > B) |
| 111 | Clear Output |

---

## Status Flags

### Zero Flag (Z)
Set to 1 when the output is zero.

### Negative Flag (N)
Represents the MSB (Most Significant Bit) of the output.

---

## Parameterization

Default width:

```verilog
parameter n = 4;
