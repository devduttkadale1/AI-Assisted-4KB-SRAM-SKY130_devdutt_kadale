# Week 2 & 3 Report

## Overview
This folder contains the Week 2 and Week 3 report material for the **AI-Assisted 4KB SRAM Design using SKY130** project. The work in this stage focuses on the **circuit design side of SRAM**, following the task requirement to study and recreate the main SRAM circuit building blocks with AI-assisted prompts, SPICE/netlist generation, and simulation-based understanding.

Unlike Week 1, which emphasized SRAM architecture and the OpenRAM-based memory generation flow, Week 2 and Week 3 concentrate on the circuit-level behavior of SRAM blocks such as the 6T bitcell, precharge circuit, sense amplifier, write driver, wordline control, decoder basics, and timing sequence. The objective is not to finish the complete SRAM macro layout or GDS generation, but to build verified understanding of the underlying SRAM circuits through open-source tools and documented AI assistance.

## Contents
This folder is expected to contain:

- `Devdutt_Kadale_SRAM_4KB_Week2_3_Report.tex` — IEEE-format LaTeX source for the Week 2 & 3 report.
- `SRAM_4KB_Week_2_3_Report.pdf` — Compiled PDF report.
- Supporting screenshots, waveform plots, or simulation evidence, if added later.

## Work Covered
The Week 2 & 3 report documents the following technical topics:

- 6T SRAM bitcell structure and read/write operation.
- Static Noise Margin (SNM), butterfly curve concept, and read disturb behavior.
- Write margin considerations and transistor sizing ratios.
- SRAM precharge circuit using PMOS devices.
- Latch-type sense amplifier concept and differential sensing.
- Write driver operation for forcing SRAM bitlines.
- Wordline driver role and SRAM timing sequence.
- Row and column decoder basics.
- AI-assisted SPICE/netlist generation using tools such as ChatGPT and Perplexity.
- ngspice/Xschem-based exploration and debugging notes.
- Parallel OpenRAM debugging observations related to SKY130 internal cells.

## Tools and Workflow
The report work for Week 2 and Week 3 was carried out using an AI-assisted workflow:

- AI tools were used to generate focused prompts, SPICE netlists, simulation hints, and debugging guidance.
- Circuit-level understanding was developed block by block instead of targeting full SRAM macro generation.
- Open-source EDA tools such as **ngspice** and **xschem** were used wherever possible to validate generated circuit examples.
- The GitHub repository was maintained to record prompts, generated files, debugging attempts, observations, and report outputs.

## Report Purpose
The purpose of this report is to show clear progress in understanding SRAM circuit building blocks using AI-assisted exploration. It serves as documentation of:

- what was studied,
- how AI tools were used,
- which SRAM subcircuits were analyzed,
- what simulations or debugging attempts were performed, and
- what observations were obtained during the process.

This makes the report suitable for internship or academic weekly progress tracking, especially for tasks centered on design understanding rather than full physical implementation.

## Notes
- The report follows the same IEEE-style documentation approach as Week 1.
- The main emphasis is on **circuit-level SRAM understanding**, not final SRAM macro completion.
- OpenRAM compilation issues encountered during this phase are included as supporting debugging observations, but they are not the primary deliverable for the task.

## Author
**Devdutt Bajirao Kadale**  
AI-Assisted 4KB SRAM Design using SKY130