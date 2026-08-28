# VSD Internship Task Status - Devdutt Bajirao Kadale

## Assigned Track
4kB SRAM Design

## Required Tasks From Sheet

### Task 1 - Week 1
Status: Complete

Requirement:
Research SRAM fundamentals, study ShonTaware/SRAM_SKY130, understand OpenRAM/SKY130 flow, and submit compact 1-page IEEE report.

Evidence:
- reports/week1/Devdutt_Kadale_SRAM_4KB_Week_1_Report.pdf
- reports/week1/week1_summary_report.md
- architecture/
- docs/
- ai_workflow/

### Task 2 - Week 2 and 3
Status: Complete

Requirement:
Circuit-level SRAM design using AI-assisted prompts. Full OpenRAM flow, final GDS, complete SRAM macro integration, and full memory compiler output are not mandatory for this stage.

Evidence:
- verification/spice/
- verification/xschem/
- verification/waveforms/
- reports/week2 & week3/Devdutt_Kadale_SRAM_4KB_Week2_3_Report.pdf
- ai_workflow/prompts.md

Completed topics:
- CMOS inverter baseline
- 6T SRAM bitcell
- read operation
- write operation
- SNM butterfly curve
- read disturb
- write margin
- precharge concept
- sense amplifier concept
- write driver concept
- row/column decoder basics
- SRAM timing sequence

### Extra Completed Work
6T SRAM bitcell layout and LVS verification completed beyond minimum Task 2 requirement.

Final LVS evidence:
- Layout/sram_6t_cell_lvs_clean.spice
- verification/xschem/schematic/bitcell/sram_6t_bitcell.spice
- lvs_report.txt

Final LVS result:
Final result: Circuits match uniquely.

### Task 3 - Week 4
Status: Pending until video link is added

Requirement:
Prepare maximum 20-minute demo video showing reproducible AI-assisted workflow, commands, generated files, simulations, errors/fixes, and final results. Add video link in README.

Remaining:
- Record demo video
- Upload video
- Add video link in README


## Task 4 – Week 5

**Status:** ✅ Completed

### Completed Activities

- Installed OpenRAM v1.2.49
- Configured SKY130A PDK
- Generated SRAM macro
- Inspected generated GDS in Magic
- Executed DRC workflow
- Executed LVS workflow
- Generated GDS, LEF, SPICE, Verilog, Liberty, HTML reports
- Documented OpenRAM compiler limitations
- Updated repository documentation


### Task 5 - Week 6
Status: In Progress — core SRAM generation and physical sign-off complete

Requirement:
Generate and validate a 1024-word × 32-bit single-port SRAM (4 KB) using OpenRAM on SKY130, including generated views, automated functional regression, physical verification, extraction, characterization, integration, and reproducibility evidence.

Completed:
- Generated authoritative 1024 × 32 single-port SRAM using OpenRAM v1.2.49
- Generated GDS, LEF, Verilog, SPICE, and TT/SS/FF Liberty views
- Completed automated functional regression
- Functional result: 144 PASS / 0 FAIL
- Covered first/last and representative boundary addresses
- Covered all-zero, all-one, alternating, walking-1, walking-0, and deterministic pseudorandom patterns
- Completed authoritative Magic DRC
- Magic DRC result: 0 errors
- Completed corrected full Magic extraction
- Generated extracted top-level SPICE
- Completed final Netgen LVS
- Final LVS device count: 270248 vs 270248
- Final LVS net count: 69617 vs 69617
- Final LVS result: Circuits match uniquely.
- Final LVS property error count: 0
- Packaged authoritative configuration, generated views, regression evidence, DRC evidence, extraction evidence, LVS evidence, and SHA-256 manifest under week6_task5/

Remaining:
- Complete characterization summary for TT / SS / FF
- Report read access time, write time, leakage power, read energy, and write energy where computationally practical
- Compare measured/derived timing against OpenRAM Liberty data
- Complete integration / STA evidence
- Determine maximum safe operating frequency
- Complete clean-clone reproducibility check
- Finish Task 5 documentation and final repository checkpoint

Evidence:
- week6_task5/config/
- week6_task5/generated/
- week6_task5/regression/
- week6_task5/verification/
- week6_task5/SHA256SUMS
- week6_task5/docs/signoff_checkpoint.md
