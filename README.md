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

This repository documents the AI-assisted design journey for building a **4KB SRAM macro** using the **SKY130 PDK**. The project starts from SRAM fundamentals and progresses through schematic design, transistor-level simulation, physical layout, and LVS verification of the 6T SRAM bitcell.

This repository currently represents **Weeks 1-4** of the internship. The work completed so far establishes a verified **bitcell-level foundation**, while **Weeks 5-8** are reserved for peripheral circuit design, array integration, and full SRAM macro development.

### Design Flow Covered So Far
- SRAM theory and architecture study
- CMOS baseline verification
- 6T SRAM bitcell schematic design
- Read/write/SPICE validation
- SNM, read disturb, and write margin analysis
- Magic layout
- Netgen LVS verification

---

## Project Goal

The final goal of this project is to design a complete **4KB SRAM macro** on the open-source **SkyWater SKY130A PDK**, starting from the transistor level and scaling up to array-level integration.

The complete SRAM macro will include:
- 6T SRAM bitcell array
- Row decoder
- Wordline driver
- Precharge and equalization circuit
- Sense amplifier
- Write driver
- Column multiplexer
- Top-level integration and verification

At the current stage, the **bitcell is verified**, and the next phase is to build the SRAM periphery and array structure.

---

## Main Work Highlights

The README intentionally shows the **main proof images** of actual project work rather than too many theory-only diagrams.

### SRAM Architecture Overview

![SRAM Architecture](assets/images/sram_architecture.png)

This diagram represents the high-level structure of the target SRAM macro, including the bitcell array and major peripheral blocks.

### 6T SRAM Bitcell

![6T SRAM Cell](assets/images/6t_sram_cell.png)

The 6T SRAM bitcell is the fundamental storage element used in the design. It consists of two cross-coupled CMOS inverters and two access transistors connected to the bitlines.

### Read Operation Verification

![SRAM Read Waveform](verification/waveforms/sram_read.png)

The read simulation verifies differential bitline development after wordline assertion and confirms stable read behavior.

### Write Operation Verification

![SRAM Write Waveform](verification/waveforms/sram_write.png)

The write simulation verifies that the bitcell state can be successfully overwritten through the bitline pair and access transistors.

### Static Noise Margin (SNM)

![SNM Butterfly Curve](verification/waveforms/snm_butterfly_curve.png)

The SNM butterfly curve is used to evaluate bitcell stability and confirm that the selected transistor sizing is functionally reasonable.

### Layout and LVS Verification

![Bitcell Layout](assets/images/6t_sram_layout.png)

The 6T SRAM bitcell layout was created in Magic and then checked using Netgen LVS against the schematic netlist.

---

## Current Status

| Week | Focus Area | Status | Main Deliverable |
|---|---|---|---|
| Week 1 | SRAM fundamentals and baseline CMOS verification | Complete | IEEE report + notes |
| Week 2-3 | 6T SRAM circuit simulations and stability analysis | Complete | SPICE decks + waveforms |
| Week 4 | 6T SRAM layout and LVS verification | Complete | Magic layout + LVS pass |
| Weeks 5-8 | Peripherals and 4KB macro integration | Planned | Pending |

---

## Week 1-4 Progress

### Week 1 — SRAM Theory and Fundamentals
- Studied SRAM basics, 6T SRAM operation, read/write mechanisms, SNM, and OpenRAM concepts.
- Simulated a CMOS inverter using SKY130 models as a baseline environment check.
- Prepared a one-page IEEE-style report.
- Added architecture notes and design references.

### Weeks 2-3 — Circuit Design and Simulation
- Designed the 6T SRAM bitcell schematic in Xschem.
- Simulated the bitcell in NGspice using SKY130 transistor models.
- Verified:
  - Read operation
  - Write operation
  - Static Noise Margin
  - Read disturb behavior
  - Write margin
- Documented waveforms and conclusions in the Week 2-3 report.

### Week 4 — Layout and LVS
- Created the 6T SRAM bitcell layout in Magic.
- Achieved DRC-clean layout status.
- Ran Netgen LVS using layout and schematic SPICE netlists.
- Obtained final result: **Circuits match uniquely**.

---

## 6T SRAM Bitcell Details

The standard 6T SRAM cell used in this project consists of:
- **2 PMOS pull-up transistors**
- **2 NMOS pull-down transistors**
- **2 NMOS access transistors**

Internal nodes:
- **Q** and **QB** store the data
- **BL** and **BLB** connect to the bitlines
- **WL** enables access during read and write

### Verified Transistor Sizing

| Transistor | Type | Width | Length |
|---|---|---:|---:|
| MP1, MP2 | PFET load | 1.5u | 0.15u |
| MN1, MN2 | NFET pull-down | 1.0u | 0.15u |
| MN3, MN4 | NFET access | 0.8u | 0.15u |

### Verified Ratios

| Metric | Value | Interpretation |
|---|---:|---|
| Cell Ratio | 1.25 | Read stable |
| Pull-up Ratio | 0.533 | Writable |

These ratios were selected so that the cell remains stable during read while still allowing successful write operation.

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

## Main Simulation Results

The main verified simulation results currently shown in the repository are:

- **CMOS inverter baseline verification**
- **6T SRAM read waveform**
- **6T SRAM write waveform**
- **SNM butterfly curve**
- **Read disturb analysis**
- **Write margin analysis**

These results were used to validate the bitcell before starting physical layout.

### Additional Verification Images
If needed, the following can be shown lower in the README or inside report sections:
- `verification/waveforms/cmos_design_waveform.png`
- `verification/waveforms/read_disturb_analysis.png`
- `verification/waveforms/write_margin_analysis.png`

---

## Layout and LVS Status

The 6T SRAM bitcell schematic and layout have been verified using **Netgen LVS**.

| Item | File Path |
|---|---|
| Layout file | `Layout/sram_6t_cell.mag` |
| Layout LVS netlist | `Layout/sram_6t_cell_lvs_clean.spice` |
| Schematic SPICE | `verification/xschem/schematic/bitcell/sram_6t_bitcell.spice` |
| LVS report | `lvs_report.txt` |

### Final LVS Result

```text
Number of devices: 6 | Number of devices: 6
Netlists match uniquely.
Final result: Circuits match uniquely.
```

This is the main **Week 4 milestone** and confirms that the implemented layout matches the intended schematic.

---

## Target SRAM Organization

The final target is a **4KB SRAM**.

### Memory Size
- **4KB = 4096 bytes**
- **4096 bytes = 32768 bits**

### Logical Organization
- **1024 words x 32 bits**

### Example Physical Organization
- **128 rows x 256 columns**
- Equivalent to **8 logical words per row**

This organization helps reduce bitline length and improve practical array behavior.

---

## Repository Structure

| Folder | Contents |
|---|---|
| `architecture/` | SRAM theory, notes, and architecture documents |
| `assets/images/` | README images and diagrams |
| `ai_workflow/` | AI prompts, workflow logs, mistakes, and verification notes |
| `docs/` | Design decisions, tradeoffs, and validation notes |
| `journal/` | Week-by-week progress tracking |
| `Layout/` | Bitcell layout, LVS-ready netlist, and layout artifacts |
| `reports/week1/` | Week 1 IEEE report |
| `reports/week2 & week3/` | Week 2-3 IEEE report |
| `verification/spice/` | SPICE netlists for simulations |
| `verification/waveforms/` | Waveform screenshots and result images |
| `verification/xschem/` | Xschem schematics and schematic netlists |

---

## How to Run Simulations

```bash
# Clone the repository
git clone https://github.com/devduttkadale1/AI-Assisted-4KB-SRAM-SKY130_devdutt_kadale.git
cd AI-Assisted-4KB-SRAM-SKY130_devdutt_kadale

# Run a sample simulation
cd verification/spice
ngspice -b 6T_cell_read.spice
```

### Prerequisite
SKY130 PDK should be installed at:

```bash
/usr/local/share/pdk/sky130A/
```

---

## LVS Command Example

```bash
cd /mnt/c/Users/devka/Semiconductor/AI-Assisted-4KB-SRAM-SKY130_devdutt_kadale

netgen -batch lvs \
"Layout/sram_6t_cell_lvs_clean.spice sram_6t_cell" \
"verification/xschem/schematic/bitcell/sram_6t_bitcell.spice sram_6t_cell" \
/usr/local/share/pdk/sky130A/libs.tech/netgen/sky130A_setup.tcl \
lvs_report.txt
```

---

## Tools and Environment

| Tool | Purpose |
|---|---|
| Magic VLSI | Layout design and DRC |
| Netgen | LVS verification |
| Xschem | Schematic capture |
| NGspice | Transistor-level simulation |
| SKY130A PDK | Device models and design rules |
| WSL2 Ubuntu | Linux-based development environment |
| AI tools | Prompt-based guidance, debugging, and documentation support |

### Installed Paths
- **Magic rcfile:** `/usr/local/share/pdk/sky130A/libs.tech/magic/sky130A.magicrc`
- **PDK path:** `/usr/local/share/pdk/sky130A/`
- **Netgen setup:** `/usr/local/share/pdk/sky130A/libs.tech/netgen/sky130A_setup.tcl`

---

## AI-Assisted Workflow

This is an **AI-assisted internship project**, and AI tools were used to:
- break the SRAM work into smaller tasks,
- generate starting netlists,
- debug simulation issues,
- improve documentation quality,
- assist with verification flow planning.

All design outputs were manually checked through SPICE simulation, layout review, and LVS verification before being treated as valid project results.

The project approach is not to replace engineering judgment, but to use AI as a productivity and learning accelerator.

---

## Internship Task Status

This repository is prepared for the assigned **4KB SRAM Design** track.

| Task | Requirement | Status |
|---|---|---|
| Task 1 - Week 1 | SRAM fundamentals + reference study + IEEE report | Complete |
| Task 2 - Week 2 & 3 | Circuit-level SRAM understanding using AI-assisted workflow | Complete |
| Task 3 - Week 4 | Bitcell layout + LVS + README/documentation | Complete |
| Task 4 - Weeks 5-8 | Peripheral circuits + full SRAM macro integration | Pending |

---

## Weeks 5-8 Roadmap

### Week 5
- Design precharge circuit
- Design write driver
- Start row decoder design

### Week 6
- Complete row decoder and wordline driver
- Design sense amplifier
- Start column multiplexer

### Week 7
- Build a small SRAM array prototype
- Integrate verified peripheral blocks
- Validate timing sequence

### Week 8
- Top-level 4KB SRAM integration
- Final verification strategy
- Final report and demo preparation

---

## Intern Information

**Name:** Devdutt Bajirao Kadale  
**Role:** RTL Design Engineer / VLSI Design Engineer  
**Program:** VSD AI-Assisted Analog, Mixed-Signal and FPGA Internship  
**Cohort:** 1.2  
**Project:** AI-Assisted 4KB SRAM Design using SKY130  
**GitHub:** [devduttkadale1](https://github.com/devduttkadale1)

---

## Notes

- This repository currently shows **Weeks 1-4 work only**.
- The **6T SRAM bitcell is verified and LVS-passed**.
- The **complete 4KB SRAM macro is still under development**.
- The main images in this README are selected to show the strongest engineering proof of work:
  - architecture,
  - bitcell,
  - read/write simulation,
  - SNM,
  - layout,
  - LVS status.