# AI-Assisted 4KB SRAM Design using SKY130 PDK and OpenRAM

> **VSD AI-Assisted Analog, Mixed-Signal & FPGA Internship | Cohort 1.2**  
> **Designer:** Devdutt Bajirao Kadale

[![AI Workflow](https://img.shields.io/badge/AI-Assisted-Verified-purple)](...)
[![Week 1](https://img.shields.io/badge/Week%201-Complete-brightgreen)](reports/week1/)
[![Week 2&3](https://img.shields.io/badge/Week%202%263-Complete-brightgreen)](reports/week2%20%26%20week3/)
[![Week 5](https://img.shields.io/badge/Week%205-Complete-brightgreen)](reports/week5/)
[![OpenRAM](https://img.shields.io/badge/OpenRAM-v1.2.49-success)](openram/)
[![SKY130A](https://img.shields.io/badge/PDK-SKY130A-orange)](https://skywater-pdk.readthedocs.io/)
[![Magic DRC](https://img.shields.io/badge/Magic-DRC%20Executed-blue)](verification/reports/)
[![Netgen LVS](https://img.shields.io/badge/Netgen-LVS%20Verified-blue)](verification/reports/)
[![License](https://img.shields.io/badge/License-MIT-yellow)](LICENSE)

---

<p align="center">
  <img src="assets/images/sram_architecture.png" width="900" alt="4KB SRAM Architecture">
</p>

## Overview

This repository documents the complete **AI-assisted design, simulation, verification, and OpenRAM generation workflow** for an SRAM design using the **SKY130A Open-Source PDK**.

The project was completed as part of the **VSD AI-Assisted Analog, Mixed-Signal & FPGA Internship**, covering the complete development flow from transistor-level circuit design through OpenRAM-based SRAM macro generation and physical verification using open-source EDA tools.

The repository combines:

- Transistor-level SRAM circuit design using **Xschem**
- Circuit verification using **NGSpice**
- Layout design and inspection using **Magic VLSI**
- Layout-versus-Schematic verification using **Netgen**
- SRAM macro generation using **OpenRAM v1.2.49**
- AI-assisted engineering workflow with complete documentation and verification

---

## Project Highlights

| Feature | Status |
|---------|:------:|
| CMOS Inverter Verification | ✅ |
| 6T SRAM Bitcell Design | ✅ |
| Read / Write Operation Verification | ✅ |
| Static Noise Margin (SNM) Analysis | ✅ |
| Read Disturb & Write Margin Analysis | ✅ |
| Peripheral Circuit Design | ✅ |
| Integrated 1-Bit SRAM Verification | ✅ |
| OpenRAM SRAM Macro Generation | ✅ |
| Physical Verification Documentation | ✅ |
| Final Generated SRAM Macro | **16 Words × 16 Bits** |

> **Repository Note**
>
> This repository represents the complete learning and implementation journey toward a **4KB SRAM design**. Due to the minimum memory organization supported by the OpenRAM version used during the internship, the final compiler-generated deliverable is a **validated 16×16 SRAM macro**, while the remaining work documents the complete circuit-level design methodology, verification flow, and AI-assisted engineering process.