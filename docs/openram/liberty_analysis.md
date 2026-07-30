# OpenRAM Liberty Timing Analysis

## Overview

OpenRAM generated Liberty timing models for the final **task4_sram_16x16** SRAM macro using the SKY130A technology.

The Liberty files provide timing, interface, operating condition, and power information required for synthesis, timing analysis, and integration into digital implementation flows.

---

## Generated Liberty Files

| File | Process Corner | Voltage | Temperature |
|------|----------------|----------|-------------|
| task4_sram_16x16_TT_1p8V_25C.lib | TT | 1.8 V | 25 °C |
| task4_sram_16x16_FF_1p8V_25C.lib | FF | 1.8 V | 25 °C |
| task4_sram_16x16_SS_1p8V_25C.lib | SS | 1.8 V | 25 °C |

---

## Operating Conditions

| Parameter | Value |
|-----------|-------|
| Technology | SKY130A |
| Memory Type | Single-Port SRAM |
| Delay Model | NLDM (Non-Linear Delay Model) |
| Supply Voltage | 1.8 V |
| Temperature | 25 °C |

---

## Generated Memory Configuration

| Parameter | Value |
|-----------|-------|
| Macro Name | task4_sram_16x16 |
| Word Size | 16 bits |
| Number of Words | 16 |
| Total Capacity | 256 bits |
| Read/Write Ports | 1 RW Port |

---

## AI-Assisted Verification

The generated Liberty models were reviewed using an AI-assisted verification workflow and compared against:

- Generated Verilog model
- SPICE netlist
- OpenRAM HTML report
- Compiler log
- Configuration file

The following items were verified:

- Library generation
- Memory organization
- Interface consistency
- Timing model generation
- Power pin consistency
- Process corner naming

---

## Multi-Corner Generation

OpenRAM successfully generated Liberty timing models for:

- Typical-Typical (TT)
- Fast-Fast (FF)
- Slow-Slow (SS)

These files provide timing information for representative operating corners.

No manual modifications were made to the generated Liberty models.

---

## Limitations

The generated Liberty files were reviewed for consistency with the generated OpenRAM outputs.

Comprehensive transistor-level timing validation against silicon measurements was outside the scope of this internship project.

---

## Conclusion

OpenRAM successfully generated Liberty timing models for the final **task4_sram_16x16** SRAM macro at TT, FF, and SS process corners.

The generated timing libraries were verified against the corresponding Verilog, SPICE, HTML, and configuration files to ensure interface and implementation consistency.