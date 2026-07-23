# Week 5 — OpenRAM SRAM Macro Generation and Verification

## Objective

The objective of Week 5 was to install and configure the OpenRAM memory compiler, generate a functional SRAM macro using the SKY130A Process Design Kit (PDK), inspect the generated physical layout, and verify the generated design using industry-standard open-source EDA tools.

Unlike previous weeks, which focused on designing and verifying individual SRAM building blocks, this week concentrated on generating a complete SRAM macro automatically using OpenRAM.

---

## Environment

- Ubuntu 24.04 LTS (WSL2)
- Python Virtual Environment
- OpenRAM
- SKY130A Open-Source PDK
- Magic VLSI
- Netgen
- NGSpice

---

## Tasks Performed

### 1. OpenRAM Installation

- Installed OpenRAM from the official repository.
- Configured the Python virtual environment.
- Installed all required dependencies.
- Configured the SKY130 technology files.

---

### 2. OpenRAM Configuration

A custom SRAM configuration file was prepared specifying:

- Technology: SKY130A
- Word Size
- Number of Words
- Read/Write Port Configuration

This configuration was used as the input for the OpenRAM compiler.

---

### 3. SRAM Macro Generation

The OpenRAM compiler successfully generated a complete SRAM macro including:

- GDSII Layout
- LEF
- SPICE Netlist
- Verilog Model
- Liberty Timing Model
- HTML Datasheet
- Compiler Log

---

### 4. Physical Layout Inspection

The generated GDS layout was imported into Magic VLSI.

The following observations were made:

- Complete SRAM macro successfully loaded.
- Cell hierarchy correctly displayed.
- Memory array visible.
- Peripheral circuitry visible.
- Layout screenshots captured for documentation.

---

### 5. LVS Verification

Netgen LVS was executed.

Results showed that the generated SRAM was successfully compared against the extracted layout.

A mismatch involving the `special_pfet_pass` cells was observed and investigated.

The issue is related to library implementation differences rather than compiler installation.

---

### 6. DRC Verification

Magic DRC was executed on the generated SRAM.

A large number of DRC violations were reported.

Further investigation indicated that these violations are expected when using the default Magic DRC rule deck with OpenRAM-generated SKY130 SRAM macros because certain specialized SRAM structures are not fully represented by the default rules.

The results were documented instead of manually modifying the generated macro.

---

## Generated Deliverables

- GDSII
- LEF
- SPICE
- Verilog
- Liberty Timing File
- HTML Datasheet
- Compiler Log
- LVS Report
- LVS JSON Report

---

## Lessons Learned

This week provided practical experience with memory compiler flows and demonstrated how a complete SRAM macro can be automatically generated from a high-level configuration.

The work also highlighted the importance of understanding verification reports, technology libraries, and limitations of open-source verification tools.

---

## Status

Week 5 successfully completed.