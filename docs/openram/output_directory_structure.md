# OpenRAM Output Directory Structure

## Overview

This repository contains two sets of OpenRAM-generated output files.

The directories represent different stages of the OpenRAM exploration performed during the project.

---

# 1. Legacy OpenRAM Outputs

Directory:

```
results/
```

These files were generated during earlier OpenRAM experiments while learning the compiler flow and validating different configurations.

The directory has been preserved for reference and comparison purposes.

Contents include:

- GDS
- LEF
- SPICE
- Verilog
- Liberty timing models

---

# 2. Final Task 4 OpenRAM Outputs

Directory:

```
openram/results/
```

This directory contains the final validated SRAM macro generated during the Week 5 OpenRAM integration task.

The following files were verified:

- GDS Layout
- LEF Abstract
- SPICE Netlist
- Verilog Behavioral Model
- Liberty Timing Model
- HTML Summary Report
- LVS Reports

These files are the primary OpenRAM deliverables referenced throughout the documentation.

---

# Documentation Reference

Unless explicitly stated otherwise, all OpenRAM documentation in this repository refers to the files located in:

```
openram/results/
```

These outputs were inspected and cross-verified using the generated Verilog, SPICE, Liberty, and HTML reports.