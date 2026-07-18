# OpenRAM Liberty Timing Analysis

## Overview

OpenRAM automatically generated Liberty timing models for the synthesized SRAM macro.

Generated characterization files:

- TT (Typical-Typical)
- FF (Fast-Fast)
- SS (Slow-Slow)

These files are intended for use by synthesis, timing analysis, and static timing analysis (STA) tools.

---

# Generated Liberty Files

| File | Corner |
|------|--------|
| sram_2_16_sky130A_TT_1p8V_25C.lib | Typical |
| sram_2_16_sky130A_TT_1p8V_0C.lib | Typical (0°C) |
| sram_2_16_sky130A_TT_1p8V_100C.lib | Typical (100°C) |
| sram_2_16_sky130A_FF_1p8V_25C.lib | Fast |
| sram_2_16_sky130A_SS_1p8V_25C.lib | Slow |

---

# Operating Conditions

The generated Liberty model reports:

| Parameter | Value |
|-----------|-------|
| Delay Model | Table Lookup |
| Supply Voltage | 1.8 V |
| Nominal Temperature | 25 °C |
| Process | Typical |
| Interface Timing | Enabled |

---

# Memory Configuration

The Liberty file describes the generated SRAM as:

| Parameter | Value |
|-----------|-------|
| Memory Type | RAM |
| Address Width | 4 bits |
| Word Width | 2 bits |
| Cell Area | 7915.0296 |
| Cell Leakage Power | 0.000196 mW |

---

# Interface Verification

The Liberty model contains timing information for:

- clk0
- csb0
- web0
- addr0
- din0
- dout0
- vdd
- gnd

Power and ground pins are correctly declared as primary power and primary ground.

---

# AI Verification

The Liberty files were inspected using AI-assisted analysis.

The following checks were performed:

- Library syntax
- Operating conditions
- Delay model
- Memory declaration
- Address width
- Data width
- Power pins
- Leakage information
- Generated timing metadata

All information was verified against the generated Liberty files.

---

# Limitations

The generated Liberty files provide timing models for supported operating corners.

No manual modification was performed.

Timing values were generated directly by OpenRAM.

---

# Conclusion

The OpenRAM compiler successfully generated Liberty timing models for multiple process corners (TT, FF, and SS).

The generated files are consistent with the synthesized SRAM macro and provide the timing information required for digital timing analysis workflows.
