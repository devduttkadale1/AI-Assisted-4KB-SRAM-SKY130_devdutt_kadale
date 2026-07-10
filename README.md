# AI-Assisted 4KB SRAM Design — SKY130 PDK

> **VSD Internship | Cohort 1.2 | Devdutt Bajirao Kadale**  
> AI-Assisted Analog, Mixed-Signal and FPGA Internship

[![Week 1](https://img.shields.io/badge/Week%201-Complete-brightgreen)](reports/week1/)
[![Week 2&3](https://img.shields.io/badge/Week%202%263-Complete-brightgreen)](reports/week2%20%26%20week3/)
[![Week 4](https://img.shields.io/badge/Week%204-Complete-brightgreen)](Layout/)
[![Weeks 5-8](https://img.shields.io/badge/Weeks%205--8-Planned-yellow)](#weeks-58-roadmap)
[![PDK](https://img.shields.io/badge/PDK-SKY130-orange)](https://skywater-pdk.readthedocs.io/)
[![License](https://img.shields.io/badge/License-MIT-yellow)](LICENSE)

---

## Project Overview

This repository documents the AI-assisted design journey for building a **4KB SRAM macro** using the **SKY130 PDK**, starting from SRAM fundamentals and progressing through schematic design, transistor-level simulation, layout, and LVS verification of the 6T SRAM bitcell.

The project is currently at the end of **Week 4**. That means the focus so far has been on establishing a correct and verified **bitcell foundation**, while the remaining **Weeks 5-8** will be used for peripheral circuits, array-level integration, and full macro assembly.

This repository is intentionally organized as a **phased academic project**:
- **Weeks 1-4:** SRAM theory, CMOS baseline verification, 6T bitcell design, simulations, layout, and LVS.
- **Weeks 5-8:** Decoder, precharge, sense amplifier, write driver, column mux, array integration, and top-level verification.

---

## Project Goal

The goal of this project is to design a complete **4KB SRAM macro** on the open-source **SkyWater SKY130A PDK**, beginning from the transistor-level 6T cell and gradually building toward the full SRAM architecture.

The final macro target includes:
- 6T SRAM bitcell array
- Row decoder and wordline drivers
- Precharge and equalization circuit
- Sense amplifier
- Write driver
- Column multiplexer
- Top-level integration and verification

At the current project stage, the **6T bitcell is already verified**, and the next phase is to extend that verified core into a complete SRAM subsystem.

---

## Current Project Status

| Week | Focus Area | Status | Main Output |
|---|---|---|---|
| Week 1 | SRAM theory, architecture study, baseline CMOS verification | Complete | IEEE report, architecture notes |
| Week 2-3 | 6T SRAM circuit simulations and stability analysis | Complete | SPICE decks, waveforms, report |
| Week 4 | 6T SRAM layout and LVS verification | Complete | Magic layout, clean LVS result |
| Weeks 5-8 | Peripheral circuits and full 4KB SRAM build-up | Planned | Pending implementation |

---

## Week 1-4 Achievements

The work completed so far establishes a strong and review-ready foundation for the final SRAM macro.

### Week 1
- Studied SRAM fundamentals, 6T cell operation, read/write concepts, and SRAM architecture.
- Verified CMOS inverter operation as a baseline using SKY130 models.
- Prepared the Week 1 IEEE-style report.
- Documented theory and architecture notes for later implementation.

### Weeks 2-3
- Designed the 6T SRAM bitcell schematic in Xschem.
- Performed transistor-level simulations in NGspice.
- Completed:
  - Read operation analysis
  - Write operation analysis
  - Static Noise Margin (SNM) butterfly curve
  - Read disturb analysis
  - Write margin analysis
- Documented simulation results and waveform evidence.

### Week 4
- Created the 6T SRAM bitcell layout in Magic.
- Achieved **DRC-clean layout**.
- Ran **LVS using Netgen**.
- Confirmed final result: **Circuits match uniquely**.

This makes the bitcell ready to serve as the verified base unit for future array-level work.

---

## SRAM Architecture

A complete 4KB SRAM macro consists of several key building blocks working together.

| Block | Function |
|---|---|
| **6T Bitcell Array** | Stores data using cross-coupled inverter-based memory cells |
| **Row Decoder** | Converts row address bits into one-hot wordline selection |
| **Wordline Driver** | Buffers and drives selected wordlines across the array |
| **Precharge Circuit** | Precharges BL and BLB to VDD before each read cycle |
| **Sense Amplifier** | Detects and amplifies small BL/BLB differential voltage |
| **Write Driver** | Forces BL/BLB to desired values during write operations |
| **Column Multiplexer** | Selects a subset of columns corresponding to output word width |
| **Top-Level Control** | Coordinates read, write, precharge, and timing signals |

The current repository focuses on the **memory cell foundation first**, which is the right engineering sequence for an SRAM project.

---

## 6T SRAM Bitcell

The fundamental storage element in this design is the standard **6T SRAM cell**.

It is composed of:
- **2 PMOS pull-up transistors**
- **2 NMOS pull-down transistors**
- **2 NMOS access transistors**

The two cross-coupled inverters store one bit of information at internal nodes **Q** and **QB**, while the access transistors connect the cell to **BL** and **BLB** when the **wordline (WL)** is asserted.

### Verified transistor sizing

| Transistor Group | Type | Width | Length |
|---|---|---:|---:|
| MP1, MP2 | PFET load | 1.5u | 0.15u |
| MN1, MN2 | NFET pull-down | 1.0u | 0.15u |
| MN3, MN4 | NFET access | 0.8u | 0.15u |

### Derived design ratios

| Metric | Value | Interpretation |
|---|---:|---|
| Cell Ratio | 1.25 | Supports read stability |
| Pull-up Ratio | 0.533 | Supports write ability |

These sizing choices were selected and verified so that the cell remains stable during read while still allowing successful overwrite during write.

---

## Verified 6T SRAM Subcircuit

```spice
.subckt sram_6t_cell BL BLB WL VDD VSS Q QB
MP1 Q    QB   VDD  VDD  sky130_fd_pr__pfet_01v8 W=1.5u L=0.15u
MP2 QB   Q    VDD  VDD  sky130_fd_pr__pfet_01v8 W=1.5u L=0.15u
MN1 Q    QB   VSS  VSS  sky130_fd_pr__nfet_01v8 W=1.0u L=0.15u
MN2 QB   Q    VSS  VSS  sky130_fd_pr__nfet_01v8 W=1.0u L=0.15u
MN3 Q    WL   BL   VSS  sky130_fd_pr__nfet_01v8 W=0.8u L=0.15u
MN4 QB   WL   BLB  VSS  sky130_fd_pr__nfet_01v8 W=0.8u L=0.15u
.ends sram_6t_cell
```

---

## Simulation Work Completed

The repository includes transistor-level verification of the main 6T SRAM bitcell behaviors.

### Completed simulation topics
- CMOS inverter baseline verification
- 6T SRAM read operation
- 6T SRAM write operation
- Static Noise Margin (SNM) butterfly curve
- Read disturb analysis
- Write margin analysis

These simulations were performed using **NGspice** with **SKY130** transistor models and were used to validate the selected transistor sizing and operating behavior before layout.

---

## Layout and LVS Verification

The 6T SRAM bitcell layout has been created in **Magic VLSI** and verified with **Netgen LVS**.

### Final verification files

| Item | File Path |
|---|---|
| Layout file | `Layout/sram_6t_cell.mag` |
| Layout LVS netlist | `Layout/sram_6t_cell_lvs_clean.spice` |
| Schematic SPICE netlist | `verification/xschem/schematic/bitcell/sram_6t_bitcell.spice` |
| LVS report | `lvs_report.txt` |

### Final LVS result

```text
Number of devices: 6 | Number of devices: 6
Netlists match uniquely.
Final result: Circuits match uniquely.
```

This is the most important **Week 4 milestone** in the repository because it proves that the schematic and physical implementation of the SRAM bitcell are consistent.

---

## Physical Organization Target

The final SRAM target is a **4KB macro**, which corresponds to:

- **4KB = 4096 bytes**
- **4096 bytes = 32768 bits**
- A common logical organization is **1024 words x 32 bits**

One practical physical organization for the macro is:
- **128 rows x 256 columns**
- Equivalent to **8 logical words per physical row**

This kind of organization reduces bitline length compared to a long monolithic array and is useful for improving speed and bitline loading.

---

## What Comes Next

The following blocks are still pending and are planned for **Weeks 5-8**:

1. **Row decoder**
2. **Wordline driver**
3. **Precharge and equalization circuit**
4. **Sense amplifier**
5. **Write driver**
6. **Column multiplexer**
7. **Full bitcell array instantiation**
8. **Top-level SRAM integration**
9. **Array-level DRC and LVS**
10. **Top-level simulation and final documentation**

The project is therefore best understood as **bitcell-complete and macro-under-construction**.

---

## Weeks 5-8 Roadmap

### Week 5
- Design and simulate precharge circuit
- Design and simulate write driver
- Start row decoder architecture

### Week 6
- Complete row decoder and wordline driver
- Design and simulate sense amplifier
- Begin column mux structure

### Week 7
- Build small array prototype using verified bitcell
- Integrate decoder, precharge, and write path
- Verify timing flow at subsystem level

### Week 8
- Top-level integration of the full 4KB SRAM architecture
- Final validation strategy
- Documentation cleanup and demo preparation

This roadmap keeps the project realistic and clearly shows that the current repository is only the **first half** of the internship work.

---

## Repository Structure

| Folder | Contents |
|---|---|
| `architecture/` | SRAM theory and architecture notes |
| `assets/images/` | README and report figures |
| `ai_workflow/` | AI prompts, verified answers, mistakes, and corrections |
| `docs/` | Design notes and validation strategy |
| `journal/` | Week-by-week learning notes |
| `Layout/` | Magic layout, LVS-ready netlist, and layout artifacts |
| `reports/week1/` | Week 1 IEEE report |
| `reports/week2 & week3/` | Week 2-3 IEEE report and supporting content |
| `verification/spice/` | SPICE netlists for circuit simulations |
| `verification/waveforms/` | Waveform screenshots and result plots |
| `verification/xschem/` | Xschem schematics and extracted schematic netlists |

---

## Tools and Environment

| Tool | Purpose |
|---|---|
| **Magic VLSI** | Layout design and DRC |
| **Netgen** | LVS verification |
| **Xschem** | Schematic entry |
| **NGspice** | Transistor-level simulation |
| **SKY130A PDK** | Device models and design rules |
| **WSL2 Ubuntu** | Linux-based design environment |
| **AI tools** | Prompt-based guidance, debugging, and documentation support |

### Installed environment details
- Magic rcfile: `/usr/local/share/pdk/sky130A/libs.tech/magic/sky130A.magicrc`
- SKY130A PDK path: `/usr/local/share/pdk/sky130A/`
- Netgen setup file: `/usr/local/share/pdk/sky130A/libs.tech/netgen/sky130A_setup.tcl`

---

## How to Run Simulations

```bash
git clone https://github.com/devduttkadale1/AI-Assisted-4KB-SRAM-SKY130_devdutt_kadale.git
cd AI-Assisted-4KB-SRAM-SKY130_devdutt_kadale

cd verification/spice
ngspice -b 6T_cell_read.spice
```

### Example LVS workflow
```bash
cd /mnt/c/Users/devka/Semiconductor/AI-Assisted-4KB-SRAM-SKY130_devdutt_kadale

netgen -batch lvs \
"Layout/sram_6t_cell_lvs_clean.spice sram_6t_cell" \
"verification/xschem/schematic/bitcell/sram_6t_bitcell.spice sram_6t_cell" \
/usr/local/share/pdk/sky130A/libs.tech/netgen/sky130A_setup.tcl \
lvs_report.txt
```

---

## AI-Assisted Workflow

This project is intentionally **AI-assisted**. AI tools were used to:
- break down the SRAM design problem into smaller tasks,
- generate SPICE starting points,
- suggest debugging directions,
- assist with documentation,
- help validate simulation setup and verification flow.

Every AI-generated suggestion was treated as a starting point and then manually checked through simulation, layout verification, and engineering review before being accepted into the project.

The goal of the internship is not to avoid AI, but to use AI responsibly to bridge skill gaps while still performing real technical verification.

---

## Internship Task Alignment

This repository is aligned to the assigned **4KB SRAM Design** internship track.

| Task | Requirement | Status |
|---|---|---|
| Week 1 | SRAM fundamentals, reference study, IEEE report | Complete |
| Week 2-3 | Circuit-level SRAM understanding and simulation | Complete |
| Week 4 | Bitcell layout, LVS verification, repo documentation | Complete |
| Weeks 5-8 | Peripheral circuits and macro-level completion | Pending |

---

## Intern Information

**Name:** Devdutt Bajirao Kadale  
**Role:** RTL Design Engineer / VLSI Design Engineer  
**Internship Program:** VSD AI-Assisted Analog, Mixed-Signal and FPGA Internship  
**Cohort:** 1.2  
**Project:** AI-Assisted 4KB SRAM Design using SKY130  
**GitHub:** [devduttkadale1](https://github.com/devduttkadale1)

---

## Notes

- This repository currently represents **Weeks 1-4 work only**.
- The **6T bitcell is verified and LVS-passed**.
- The **full 4KB SRAM macro is not yet complete** and is planned for **Weeks 5-8**.
- The repository is structured to make that project status clear to reviewers, mentors, and evaluators.