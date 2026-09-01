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
Status: ✅ Complete — final 1024 × 32 single-port 4 KB SRAM sign-off closed

Requirement:
Generate and validate a 1024-word × 32-bit single-port SRAM (4 KB) using OpenRAM on SKY130, including generated views, automated functional regression, physical verification, extraction, characterization, integration, static timing analysis, reproducibility, AI evidence, and final documentation.

Completed:
- Generated authoritative 1024 × 32 single-port 4 KB SRAM using OpenRAM v1.2.49
- Generated GDS, LEF, Verilog, SPICE, and TT/SS/FF Liberty views
- Automated functional regression: 144 PASS / 0 FAIL
- Magic DRC: 0 violations
- Corrected full Magic extraction completed
- Final Netgen LVS: Circuits match uniquely
- Final LVS devices: 270248 vs 270248
- Final LVS nets: 69617 vs 69617
- Final LVS property errors: 0
- Targeted C-extracted TT/SS/FF characterization completed
- Liberty timing comparison completed
- Logical 1024 × 32 wrapper integration regression: 13 PASS / 0 FAIL
- OpenSTA 3.1.0 external SS-corner STA completed with 0 warnings/errors/violations
- SS setup slack: +2.138 ns
- SS hold slack: +0.056 ns
- SS minimum characterized period: 2.241 ns
- Maximum characterized SS model frequency: 446.229362 MHz
- Clock-to-DOUT characterized-point checks reproduced 0.446 / 0.478 / 0.606 ns
- Clean-clone reproducibility completed and GDS nondeterminism documented
- Week 6 Task 5 AI prompt record and errors/fixes documentation completed
- Final artifact manifest validated: 40 artifacts

Important scope notes:
- Extracted characterization is C-extracted, not RC-extracted
- 446.229362 MHz is the characterized Liberty-model boundary, not a guard-banded operating recommendation
- Exact fresh-clone GDS bitwise/geometry identity is not claimed; authoritative signed-off GDS remains preserved

Evidence:
- week6_task5/config/
- week6_task5/generated/
- week6_task5/regression/
- week6_task5/verification/
- week6_task5/characterization/
- week6_task5/integration/
- week6_task5/reproducibility/
- week6_task5/ai/
- week6_task5/docs/final_signoff.md
- week6_task5/docs/final_artifact_manifest.tsv
- week6_task5/integration/sta_signoff/task5_4kb_sram_opensta_summary.md
