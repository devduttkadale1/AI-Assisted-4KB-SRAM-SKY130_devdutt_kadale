# SRAM Validation Strategy

## Objective

The purpose of validation is to ensure that the generated SRAM macro operates correctly and meets design expectations before integration into a larger ASIC design.

This Week 1 investigation focused on understanding the validation flow rather than executing complete verification.

---

## Validation Flow

```text
SRAM Architecture Review
        ↓
Circuit-Level Verification
        ↓
OpenRAM Configuration Review
        ↓
Generated Output Inspection
        ↓
Physical Verification
        ↓
Timing and Power Validation
```

---

## Architecture Validation

The first step is verifying that the SRAM architecture matches the intended specification.

Checks include:

* Word size
* Number of words
* Address width
* Memory organization
* Read/write functionality

For the reference design:

```text
1024 × 32 SRAM
4 KB Memory
10-bit Address Width
```

---

## Circuit-Level Validation

Key SRAM circuits should be verified individually.

Examples:

* 6T SRAM Cell
* Precharge Circuit
* Sense Amplifier
* Write Driver

Typical checks include:

* Hold operation
* Read operation
* Write operation
* Stability analysis

---

## OpenRAM Configuration Validation

Configuration files should be reviewed to ensure:

* Correct memory size
* Correct technology selection
* Valid process corners
* Proper output generation

Files reviewed:

```text
myconfig_sky130.py
myconfig_sky130_2.py
```

---

## Generated Output Validation

OpenRAM generates several ASIC views.

These outputs should be inspected for consistency.

Files include:

* Verilog (.v)
* SPICE (.sp)
* LEF (.lef)
* LIB (.lib)
* GDS (.gds)
* LOG (.log)

---

## Physical Verification

A production SRAM typically requires:

* DRC (Design Rule Check)
* LVS (Layout Versus Schematic)
* PEX (Parasitic Extraction)

The reference project notes that these checks are disabled and therefore the generated outputs should be treated as educational rather than signoff-ready.

---

## Timing and Power Validation

Timing characterization is typically performed across multiple process corners:

```text
TT
SS
FF
```

Metrics include:

* Read access time
* Write time
* Dynamic power
* Leakage power

---

## Week 1 Validation Scope

For Week 1, validation focused on:

* Understanding SRAM architecture
* Reviewing OpenRAM configuration
* Inspecting generated outputs
* Understanding the verification flow

Future work will involve practical OpenRAM execution and detailed verification activities.
