# OpenRAM Flow

## Introduction

OpenRAM is an open-source SRAM compiler used to generate custom SRAM macros for ASIC design flows. Instead of manually designing large SRAM arrays, engineers specify memory requirements through a configuration file, and OpenRAM automatically generates the required circuit, timing, physical, and layout views.

In this project, OpenRAM is used together with the SKY130 PDK to generate a 1024 × 32 SRAM macro (4 KB SRAM).

---

## Memory Specification

The target memory in the reference repository is:

```text
Word Size  = 32 bits
Num Words  = 1024
```

Memory size calculation:

```text
Total Bits = Word Size × Num Words

           = 32 × 1024

           = 32768 bits
```

Converting to bytes:

```text
32768 / 8 = 4096 Bytes = 4 KB
```

Address width:

```text
log2(1024) = 10 bits
```

Therefore:

```text
1024 × 32 SRAM
=
32768 bits
=
4 KB SRAM
```

---

## OpenRAM Configuration Files

The reference repository contains two main configuration files:

### myconfig_sky130.py

Main SRAM configuration.

Target:

```text
1024 × 32 SRAM
```

Important parameters:

```python
word_size = 32
num_words = 1024
tech_name = "sky130A"
process_corners = ["SS","TT","FF"]
supply_voltages = [1.8]
```

---

### myconfig_sky130_2.py

Small test SRAM configuration.

Target:

```text
16 × 2 SRAM
```

Used for:

* Learning OpenRAM flow
* Faster debugging
* Verifying installation

---

## Important Configuration Parameters

| Parameter       | Description                                  |
| --------------- | -------------------------------------------- |
| word_size       | Number of bits accessed per memory operation |
| num_words       | Total addressable memory words               |
| tech_name       | Technology node used by OpenRAM              |
| process_corners | Timing characterization corners              |
| supply_voltages | Operating voltage                            |
| output_path     | Output directory                             |
| output_name     | Generated SRAM macro name                    |

---

## Complete OpenRAM Flow

The OpenRAM flow used in this project can be summarized as:

```text
Memory Specification
        ↓
OpenRAM Configuration
        ↓
SKY130 Technology Files
        ↓
Custom SRAM Cells
        ↓
OpenRAM Compiler
        ↓
Characterization
        ↓
Generated Outputs
```

---

## Step 1: Memory Specification

The designer defines:

* Memory size
* Word width
* Number of words
* Technology node

Example:

```text
1024 × 32 SRAM
```

Output:

```text
Memory requirements
```

---

## Step 2: OpenRAM Configuration

The configuration file converts memory requirements into OpenRAM inputs.

Example:

```text
word_size = 32
num_words = 1024
```

Output:

```text
Compiler-ready memory specification
```

---

## Step 3: SKY130 Technology Setup

OpenRAM loads SKY130 technology information.

Examples:

```text
tech.py
SPICE models
Layer definitions
Design rules
```

Output:

```text
Technology-aware SRAM generation
```

---

## Step 4: Custom Cell Libraries

OpenRAM uses predefined SRAM support cells.

Examples:

```text
6T Bitcell
Sense Amplifier
Write Driver
D Flip-Flop
Tri-State Buffer
Replica Cells
```

Output:

```text
Building blocks for SRAM construction
```

---

## Step 5: OpenRAM Compiler Execution

Execution command:

```bash
python3 openram.py myconfig_sky130.py
```

The compiler automatically generates:

```text
Bitcell Array
Row Decoder
Wordline Drivers
Column Multiplexer
Precharge Circuit
Sense Amplifiers
Write Drivers
Control Logic
```

---

## Physical Organization

The logical memory specification is:

```text
1024 × 32
```

However, OpenRAM reorganizes the memory internally.

Repository log:

```text
Rows = 128
Columns = 256
Words Per Row = 8
```

This means:

```text
128 Physical Rows
256 Physical Columns
```

instead of:

```text
1024 Rows
32 Columns
```

Advantages:

* Reduced bitline length
* Lower capacitance
* Faster read operations
* Faster write operations
* Improved layout efficiency

---

## Characterization

OpenRAM generates timing and power models across different operating conditions.

Examples:

```text
TT (Typical)
SS (Slow)
FF (Fast)
```

Used for:

* Timing analysis
* Power estimation
* Performance comparison

---

## Generated Outputs

OpenRAM generates multiple views of the same SRAM macro.

### Verilog (.v)

Purpose:

```text
Functional simulation model
```

Used by:

```text
RTL Designers
Verification Engineers
```

---

### SPICE (.sp)

Purpose:

```text
Circuit-level netlist
```

Used by:

```text
Circuit Designers
Characterization Engineers
```

---

### LEF (.lef)

Purpose:

```text
Physical abstract view
```

Used by:

```text
Physical Design Engineers
```

---

### LIB (.lib)

Purpose:

```text
Timing and power model
```

Used by:

```text
Static Timing Analysis
Synthesis Tools
```

---

### GDS (.gds)

Purpose:

```text
Final physical layout database
```

Used by:

```text
Layout Engineers
Foundry Flow
```

---

### LOG (.log)

Purpose:

```text
Flow execution record
```

Contains:

* Compiler information
* Warnings
* Errors
* Generated files
* Physical organization details

---

## Common Errors and Debugging

Typical issues:

### Technology Path Errors

Cause:

```text
Incorrect OPENRAM_TECH path
```

Fix:

```text
Verify environment variables
```

---

### Missing Custom Cells

Cause:

```text
Missing GDS or SPICE files
```

Fix:

```text
Check custom cell libraries
```

---

### Configuration Errors

Cause:

```text
Invalid word size or memory dimensions
```

Fix:

```text
Verify configuration parameters
```

---

### Characterization Failures

Cause:

```text
Missing SPICE models
```

Fix:

```text
Verify SKY130 model files
```

---

## Key Learnings

* OpenRAM converts a high-level memory specification into ASIC-ready SRAM views.
* One SRAM macro generates multiple output files for different engineering teams.
* Logical memory organization differs from physical memory organization.
* Custom cells and technology files are essential for SRAM generation.
* OpenRAM simplifies SRAM development while maintaining compatibility with ASIC design flows.

---

## Summary

OpenRAM is an open-source SRAM compiler that transforms memory specifications into complete SRAM macros. Using SKY130 technology files and custom SRAM cells, it generates functional, circuit-level, timing, physical, and layout views required throughout the ASIC design flow.
