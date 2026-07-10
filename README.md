# AI-Assisted 4KB SRAM Design — SKY130 PDK

> **VSD Internship | Cohort 1.2 | Devdutt Bajirao Kadale**  
> AI-Assisted Analog, Mixed-Signal and FPGA Internship

[![Week 1](https://img.shields.io/badge/Week%201-Complete-brightgreen)](reports/week1/)
[![Week 2&3](https://img.shields.io/badge/Week%202%263-Complete-brightgreen)](reports/week2%20%26%20week3/)
[![Simulations](https://img.shields.io/badge/Simulations-6%20Circuits-blue)](verification/waveforms/)
[![PDK](https://img.shields.io/badge/PDK-SKY130-orange)](https://skywater-pdk.readthedocs.io/)
[![License](https://img.shields.io/badge/License-MIT-yellow)](LICENSE)

---

## Project Overview

This repository documents the complete learning and design journey for building a **4KB SRAM macro** using:

- **SKY130 PDK** — open-source 130nm CMOS process by SkyWater + Google
- **ngspice** — transistor-level SPICE simulation
- **OpenRAM** — open-source SRAM compiler (Week 3+)
- **AI-Assisted Workflow** — every design decision logged with prompts and verification

The project covers everything from first principles of SRAM theory (Week 1) through full circuit simulation (Weeks 2 & 3) to SRAM macro generation (Week 4+).

---

## SRAM Architecture

![SRAM Architecture](assets/images/sram_architecture.png)

A 4KB SRAM macro consists of several key blocks working together:

| Block | Function |
|---|---|
| **6T Bitcell Array** | Stores bits using cross-coupled inverter latches |
| **Row Decoder** | Converts address bits → one-hot wordline signal |
| **Precharge Circuit** | Charges BL and BLB to VDD before every read |
| **Sense Amplifier** | Amplifies small differential voltage → full logic swing |
| **Write Driver** | Forces BL/BLB to desired data during write |
| **Column Mux** | Selects one word from multiple words per physical row |

---

## 6T SRAM Cell

![6T SRAM Cell](assets/images/6t_sram_cell.png)

The fundamental storage unit is a **6-transistor (6T) SRAM cell**:

- **M1, M2** — PMOS pull-up transistors (form cross-coupled inverters)
- **M3, M4** — NMOS pull-down transistors (form cross-coupled inverters)
- **M5, M6** — NMOS access transistors (connect cell to BL and BLB)
- **WL** — Word line: gates of M5 and M6
- **Q, QB** — Storage nodes (complementary)

The two cross-coupled inverters hold one bit indefinitely as long as power is supplied — no refresh needed, unlike DRAM.

---

## Read and Write Operations

### Read Operation

![SRAM Read](assets/images/sram_read.png)

1. **Precharge** — BL and BLB both charged to VDD = 1.8V
2. **Access** — WL asserted, M5 and M6 turn ON
3. **Discharge** — One bitline discharges slightly (ΔV ≈ 50–100mV)
4. **Sense** — Sense amplifier detects differential and snaps to full swing

> **Key constraint:** Cell Ratio (CR) = W_pulldown / W_access must be > 1.5 to prevent read disturb.

### Write Operation

![SRAM Write](assets/images/sram_write.png)

1. **Drive** — Write driver forces BL=0, BLB=VDD (or vice versa)
2. **Access** — WL asserted, M5 and M6 turn ON
3. **Overwrite** — Write driver overpowers PMOS pull-up → Q flips

> **Key constraint:** Write Ratio (WR) = W_access / W_pullup must be > 1 to successfully overwrite cell.

---

## Peripheral Circuits

### Precharge Circuit

![Precharge Circuit](assets/images/precharge_circuit.png)

Three-PMOS topology:
- **PC1** — Pulls BL to VDD when PCB=0
- **PC2** — Pulls BLB to VDD when PCB=0
- **PC3** — Equalizer: ensures BL = BLB before sense amp fires

### Sense Amplifier

![Sense Amplifier](assets/images/sense_amplifier.png)

Cross-coupled CMOS latch triggered by SAE (sense amp enable):
- Input NMOS connected to BL and BLB
- Regenerative action amplifies ΔV to full logic swing in < 200ps
- SAE must fire only after sufficient ΔV has developed (≥ 50mV)

### Row Decoder

![Row Decoder](assets/images/row_decoder.png)

- Converts N-bit row address into 2^N one-hot wordline signals
- For 1024-row array: 10-bit address → 1024 wordlines
- Only one WL is HIGH at any time — selects exactly one row

### Column Multiplexer

![Column Mux](assets/images/column_mux.png)

- Physical array has more columns than logical words
- Column address selects one word out of multiple words sharing the same bitlines
- Example: 128 rows × 256 columns → 8 words/row → 1024 words logical

---

## OpenRAM Flow

![OpenRAM Flow](assets/images/sky130_openram_flow.png)

Memory Specification (word_size, num_words)
        ↓
  Configuration File (.py)
        ↓
  SKY130 Technology Files + Custom Cells
        ↓
     OpenRAM Compiler
        ↓
      Characterization
        ↓
  Generated Outputs: GDS | LEF | LIB | Verilog | SPICE

**4KB SRAM Physical Organization:**
- Logical: 1024 words × 32 bits
- Physical: 128 rows × 256 columns, 8 words/row
- Benefit: shorter bitlines → lower capacitance → faster access

---

## Repository Structure

| Folder | Contents |
|---|---|
| `verification/spice/` | SPICE netlists for all circuit blocks |
| `verification/waveforms/` | Simulation waveform screenshots (PNG) |
| `verification/xschem/` | Schematic files (.sch) |
| `architecture/` | SRAM theory docs — 10 topics (bitcell, SA, precharge, decoder, timing...) |
| `docs/` | Design decisions, tradeoffs, PDK notes |
| `ai_workflow/` | AI prompt log, verified answers, mistakes caught |
| `journal/` | Week-by-week learning diary |
| `reports/week1/` | Week 1 IEEE PDF + LaTeX source |
| `reports/week2 & week3/` | Week 2&3 IEEE PDF + LaTeX with all waveforms |
| `assets/images/` | Architecture diagrams |
| `openram/` | OpenRAM configuration files (Week 4+) |
---

## Progress by Week

### ✅ Week 1 — SRAM Theory & Fundamentals

> 📄 [Download IEEE PDF](reports/week1/Devdutt_Kadale_SRAM_4KB_Week_1_Report.pdf)

![Week 1 Report Preview](reports/week1/week1_report_preview.png)

**Completed:**
- Studied 6T SRAM cell, read/write operation, SNM, OpenRAM architecture
- CMOS inverter simulated with SKY130 PDK (baseline verification)
- Documented 8 architecture topics in `architecture/`
- Wrote IEEE one-page technical report

---

### ✅ Weeks 2 & 3 — Circuit Simulations (ngspice + SKY130)

> 📄 [Download IEEE PDF](reports/week2%20%26%20week3/Devdutt_Kadale_SRAM_4KB_Week2_3_Report.pdf)  
> Journal: [`journal/week2.md`](journal/week2.md)

**AI-Assisted workflow:** ChatGPT GPT-4o + Perplexity AI used for netlist generation, debugging hints and simulation setup. All prompts logged in [`ai_workflow/prompts.md`](ai_workflow/prompts.md).

#### CMOS Baseline Verification

![CMOS Design Waveform](verification/waveforms/cmos_design_waveform.png)

CMOS inverter simulated at VDD=1.8V TT corner to verify SKY130 PDK + ngspice integration before SRAM-specific blocks.

#### 6T SRAM Bitcell — Read Operation

![SRAM Read Waveform](verification/waveforms/sram_read.png)

BL and BLB differential development after WL assertion. Cell ratio β > 1.5 confirmed — no read disturb.

#### 6T SRAM Bitcell — Write Operation

![SRAM Write Waveform](verification/waveforms/sram_write.png)

Write driver successfully overrides stored latch. Write ratio γ ≈ 1.2 confirmed.

#### Static Noise Margin — Butterfly Curve

![SNM Butterfly Curve](verification/waveforms/snm_butterfly_curve.png)

SNM ≈ 280–320 mV at TT corner, 1.8V. Consistent with published SKY130 bitcell values.

#### Read Disturb Analysis

![Read Disturb Analysis](verification/waveforms/read_disturb_analysis.png)

Q node voltage recovers after WL assertion — data integrity confirmed with standard SKY130 cell sizing.

#### Write Margin Analysis

![Write Margin Analysis](verification/waveforms/write_margin_analysis.png)

Latch flip threshold analysis confirms reliable write operation across process corners.

#### New Architecture Docs Added
- [`wordline_control.md`](architecture/wordline_control.md) — WL timing and driver sizing
- [`bitline_behaviour.md`](architecture/bitline_behaviour.md) — BL capacitance and precharge analysis
- [`sram_timing_sequence.md`](architecture/sram_timing_sequence.md) — Full read/write cycle timing

---

### 🔲 Week 4 — OpenRAM Setup & Macro Generation
- Install and configure OpenRAM for SKY130
- Generate 4KB SRAM macro
- Verify outputs: GDS, LEF, LIB, Verilog

### 🔲 Week 5 — Post-Layout Verification & Final Report
- DRC / LVS checks
- Parasitic extraction and post-layout simulation
- Final report and presentation

---

## How to Run Simulations

```bash
# Clone the repo
git clone https://github.com/devduttkadale1/AI-Assisted-4KB-SRAM-SKY130_devdutt_kadale.git
cd AI-Assisted-4KB-SRAM-SKY130_devdutt_kadale

# Run any waveform simulation (example: SRAM read)
cd verification/spice
ngspice -b 6T_cell_read.spice
```

**Prerequisite:** SKY130 PDK installed at `/usr/local/share/pdk/sky130A/`

---

## Tools & Environment

| Tool | Version | Purpose |
|---|---|---|
| ngspice | 42 | SPICE simulation |
| SKY130 PDK | Combined lib, TT corner | 130nm transistor models |
| xschem | latest | Schematic capture |
| OpenRAM | latest | SRAM compiler (Week 4+) |
| ChatGPT GPT-4o | June 2026 | Netlist generation, debugging |
| Perplexity AI | June 2026 | Design verification, prompts |

---

## AI Workflow

Every AI interaction is logged in [`ai_workflow/prompts.md`](ai_workflow/prompts.md) with:
- Exact prompt used
- AI tool and model name
- Generated output (netlist / explanation)
- Verification method
- Mistakes caught and corrections made

See [`ai_workflow/workflow.md`](ai_workflow/workflow.md) for the full methodology.

---

## Intern Information

**Name:** Devdutt Bajirao Kadale  
**Program:** VSD AI-Assisted Analog, Mixed-Signal and FPGA Internship (Cohort 1.2)  
**Duration:** June – August 2026  
**Contact:** [GitHub](https://github.com/devduttkadale1)
---

## VSD Internship Task Status

This repository is prepared for the assigned **4kB SRAM Design** track.

| Task | Requirement | Status |
|---|---|---|
| Task 1 - Week 1 | SRAM fundamentals + reference repo study + IEEE report | Complete |
| Task 2 - Week 2 & 3 | Circuit-level SRAM blocks using AI-assisted workflow | Complete |
| Task 3 - Week 4 | Demonstration video and README link | Pending video link |

Detailed task status is available in [`TASK_STATUS.md`](TASK_STATUS.md).

---

## Final 6T Bitcell LVS Status

The 6T SRAM bitcell schematic and layout have been verified using Netgen LVS.

| Item | File |
|---|---|
| Layout LVS netlist | `Layout/sram_6t_cell_lvs_clean.spice` |
| Schematic SPICE | `verification/xschem/schematic/bitcell/sram_6t_bitcell.spice` |
| LVS report | `lvs_report.txt` |

Final LVS result:

```text
Number of devices: 6 | Number of devices: 6
Netlists match uniquely.
Final result: Circuits match uniquely.


---

## VSD Internship Task Status

This repository is prepared for the assigned **4kB SRAM Design** track.

| Task | Requirement | Status |
|---|---|---|
| Task 1 - Week 1 | SRAM fundamentals + reference repo study + IEEE report | Complete |
| Task 2 - Week 2 & 3 | Circuit-level SRAM blocks using AI-assisted workflow | Complete |
| Task 3 - Week 4 | Demonstration video and README link | Pending video link |

Detailed task status is available in [`TASK_STATUS.md`](TASK_STATUS.md).

---

## Final 6T Bitcell LVS Status

The 6T SRAM bitcell schematic and layout have been verified using Netgen LVS.

| Item | File |
|---|---|
| Layout LVS netlist | `Layout/sram_6t_cell_lvs_clean.spice` |
| Schematic SPICE | `verification/xschem/schematic/bitcell/sram_6t_bitcell.spice` |
| LVS report | `lvs_report.txt` |

Final LVS result:

```text
Number of devices: 6 | Number of devices: 6
Netlists match uniquely.
Final result: Circuits match uniquely.
```

---

## Clean Repository Structure

This repository is organized around the assigned VSD internship tasks only.

| Path | Purpose |
|---|---|
| `TASK_STATUS.md` | Summary of Task 1, Task 2, and Task 3 status |
| `reports/week1/` | Week 1 IEEE report |
| `reports/week2 & week3/` | Week 2 and Week 3 circuit-level SRAM report |
| `verification/spice/` | SRAM circuit SPICE decks |
| `verification/xschem/` | Xschem schematic and bitcell SPICE |
| `verification/waveforms/` | Verified waveform screenshots |
| `Layout/` | Final 6T bitcell Magic layout and LVS-ready netlist |
| `Layout/debug_history/` | Old LVS/debug reports kept for transparency |
| `architecture/` | SRAM architecture notes |
| `docs/` | Design notes and validation strategy |
| `ai_workflow/` | AI prompts, workflow, mistakes, and verified answers |
| `assets/images/` | README/report images |
| `references/` | External reference repo links |

The cleaned repository intentionally does not store large external SKY130 SRAM library dumps or generated OpenRAM macro outputs, because the assigned Week 1-4 tasks require circuit-level understanding, verification evidence, and a demonstration video rather than a full 4KB macro GDS.
