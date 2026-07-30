# AI-Assisted 4KB SRAM Design --- SKY130 PDK

> **VSD AI-Assisted Analog, Mixed-Signal & FPGA Internship (Cohort
> 1.2)**\
> **Designer:** Devdutt Bajirao Kadale

[![OpenRAM](https://img.shields.io/badge/OpenRAM-v1.2.49-success)](openram/)
[![PDK](https://img.shields.io/badge/PDK-SKY130-orange)](https://skywater-pdk.readthedocs.io/)
[![License](https://img.shields.io/badge/License-MIT-yellow)](LICENSE)

------------------------------------------------------------------------

# Project Overview

This repository documents the AI-assisted design, verification, and
OpenRAM generation flow of an SRAM macro using the open-source SKY130A
PDK.

The project covers:

-   CMOS and 6T SRAM circuit verification
-   NGSpice transistor-level simulations
-   Magic layout and Netgen LVS
-   OpenRAM macro generation
-   AI-assisted engineering workflow
-   Technical documentation

------------------------------------------------------------------------

# Project Highlights

-   ✅ 6T SRAM Bitcell Design
-   ✅ Read / Write / SNM Verification
-   ✅ Precharge, Write Driver & Sense Amplifier
-   ✅ Integrated 1-bit SRAM
-   ✅ OpenRAM v1.2.49 Flow
-   ✅ Final OpenRAM 16×16 SRAM Macro
-   ✅ GDSII, LEF, SPICE, Verilog, Liberty & HTML Outputs
-   ✅ AI-Assisted Documentation

------------------------------------------------------------------------

# Final OpenRAM Results

  Item             Result
  ---------------- ------------------------
  Macro            **task4_sram_16x16**
  Organization     **16 Words × 16 Bits**
  Technology       SKY130A
  Compiler         OpenRAM v1.2.49
  Verilog          ✅
  SPICE            ✅
  LEF              ✅
  GDSII            ✅
  Liberty TT       ✅
  Liberty FF       ✅
  Liberty SS       ✅
  HTML Datasheet   ✅

> The repository uses the validated **16×16** OpenRAM implementation.
> Exploratory 2×16 artifacts are archived separately.

------------------------------------------------------------------------

# Repository Structure

``` text
architecture/
assets/
docs/
journal/
openram/
reports/
verification/
ai_workflow/
Layout/
```

------------------------------------------------------------------------

# Documentation

  Topic          Location
  -------------- ----------------
  Architecture   architecture/
  OpenRAM        docs/openram/
  Verification   verification/
  Reports        reports/
  AI Workflow    ai_workflow/
  Progress       TASK_STATUS.md

------------------------------------------------------------------------

# Generated Deliverables

``` text
task4_sram_16x16.gds
task4_sram_16x16.lef
task4_sram_16x16.sp
task4_sram_16x16.v
task4_sram_16x16.html
task4_sram_16x16_TT_1p8V_25C.lib
task4_sram_16x16_FF_1p8V_25C.lib
task4_sram_16x16_SS_1p8V_25C.lib
```

------------------------------------------------------------------------

# Verification Summary

  Verification           Status
  ---------------------- --------
  CMOS                   ✅
  6T Bitcell             ✅
  Read                   ✅
  Write                  ✅
  SNM                    ✅
  Read Disturb           ✅
  Write Margin           ✅
  Magic DRC (Bitcell)    ✅
  Netgen LVS (Bitcell)   ✅
  OpenRAM Generation     ✅

------------------------------------------------------------------------

# Tools

-   SKY130A PDK
-   OpenRAM v1.2.49
-   NGSpice
-   Xschem
-   Magic VLSI
-   Netgen
-   Python
-   Ubuntu 24.04 (WSL2)

------------------------------------------------------------------------

# AI-Assisted Workflow

AI tools were used for:

-   Design exploration
-   SPICE generation
-   Debugging
-   Documentation
-   Verification planning

All generated results were independently verified using open-source EDA
tools.

------------------------------------------------------------------------

# Quick Start

``` bash
git clone https://github.com/devduttkadale1/AI-Assisted-4KB-SRAM-SKY130_devdutt_kadale.git
cd AI-Assisted-4KB-SRAM-SKY130_devdutt_kadale
```

------------------------------------------------------------------------

# Internship

VSD AI-Assisted Analog, Mixed-Signal & FPGA Internship

Track: 4KB SRAM Design

------------------------------------------------------------------------

# License

MIT License
