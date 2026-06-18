# AI Prompt Log

## Entry 01

Date: 15 June 2026

Tool: Codex

Objective:
Understand the SRAM_SKY130 reference repository.

Prompt:
Analyze the SRAM_SKY130 repository and explain the OpenRAM flow.

Key Findings:

* Repository organized into Prelayout, Postlayout and OpenRAM sections.
* Main target design is a 1024 × 32 SRAM macro.
* OpenRAM generates GDS, LEF, LIB, SPICE and Verilog outputs.
* Prelayout section focuses on SRAM circuit fundamentals.

Verification:
Cross-checked findings against README and repository folder structure.

Outcome:
Created Week 1 study roadmap focused on SRAM architecture and OpenRAM fundamentals.

---

## Entry 02

Date: 15 June 2026

Tool: Codex

Objective:
Define internship goals and repository strategy.

Prompt:
I am participating in a 2-month AI-Assisted Analog, Mixed-Signal and FPGA Internship...

Key Findings:

* Repository should emphasize engineering understanding rather than generated files.
* Weekly progress tracking and decision logs are important.
* AI-assisted workflow should be documented and verified.

Verification:
Compared recommendations against internship requirements and repository structure.

Outcome:
Finalized repository organization and documentation strategy.


## Entry 03

Date: 16 June 2026

Tool: Codex

Objective:
Understand SRAM architecture and identify the major functional blocks inside an SRAM macro.

Prompt:
Act as a senior SRAM design engineer and mentor.

Using the SRAM_SKY130 repository as context, teach me the architecture of SRAM from the perspective of this project.

Explain:

* Why SRAM is used in modern processors
* Memory hierarchy
* Typical SRAM macro architecture
* Bitcell Array
* Wordline
* Bitline
* Precharge Circuit
* Sense Amplifier
* Write Driver
* Row Decoder
* Column Mux
* Hold, Read and Write operations

Key Findings:

* SRAM macros contain both storage cells and peripheral circuits.
* Major blocks include row decoder, wordline driver, bitcell array, precharge circuit, sense amplifier, write driver and control logic.
* OpenRAM automatically generates many of these peripheral blocks.
* The 1024 × 32 SRAM corresponds to a 4 KB memory macro.

Verification:
Cross-checked concepts against repository diagrams and OpenRAM documentation.

Outcome:
Created architecture/sram_architecture.md and established the Week 1 learning path.

---

## Entry 04

Date: 16 June 2026

Tool: Codex

Objective:
Understand the 6T SRAM bitcell and memory operations.

Prompt:
Using the SRAM_SKY130 repository as context, create a detailed study guide for the 6T SRAM bitcell.

Explain:

* Cell structure
* Q and QB nodes
* BL and BLB operation
* Wordline operation
* Hold mode
* Read mode
* Write mode
* Read stability
* Writeability
* Static Noise Margin

Key Findings:

* The 6T SRAM cell consists of two cross-coupled CMOS inverters and two access transistors.
* Data is stored at nodes Q and QB.
* BL and BLB provide differential read and write paths.
* Read and write operations rely on controlled activation of the wordline.

Verification:
Compared explanations with SRAM cell schematics and simulation files from the repository.

Outcome:
Created architecture/bitcell_6t.md, architecture/read_operation.md and architecture/write_operation.md.


## Entry 05

Date: 17 June 2026

Tool: Codex

Objective:
Understand OpenRAM configuration and memory organization.

Prompt:
Analyze myconfig_sky130.py and myconfig_sky130_2.py from the SRAM_SKY130 repository.

Explain:

* Important parameters
* Memory size calculation
* OpenRAM usage of parameters
* Generated outputs
* Key learning points for a VLSI intern

Key Findings:

* word_size and num_words define memory capacity.
* 1024 × 32 corresponds to 32768 bits (4 KB).
* OpenRAM converts a high-level memory specification into a complete SRAM macro.
* Physical organization may differ from logical organization.

Verification:
Cross-checked calculations using configuration parameters and generated OpenRAM outputs.

Outcome:
Created documentation for OpenRAM configuration and memory organization concepts.

---

## Entry 06

Date: 17 June 2026

Tool: Codex

Objective:
Understand the complete OpenRAM compilation flow.

Prompt:
Using the SRAM_SKY130 repository as context, explain the complete OpenRAM flow used to generate the 1024 × 32 SRAM macro.

Key Findings:

* Flow begins with memory specification and configuration.
* OpenRAM loads SKY130 technology files and custom cells.
* Compiler generates bitcell arrays, decoders, column muxes and peripheral circuits.
* Characterization produces timing and power views.
* Outputs include GDS, LEF, LIB, SPICE and Verilog models.

Verification:
Cross-referenced generated outputs and repository structure.

Outcome:
Created docs/openram_flow.md and documented the OpenRAM generation process.


## Entry 07

Date: 18 June 2026

Tool: Codex

Objective:
Understand SKY130 technology integration within OpenRAM.

Prompt:
Act as a senior OpenRAM engineer.

Using the SRAM_SKY130 repository as context, explain how OpenRAM uses the SKY130 technology directory during SRAM generation.

Key Findings:

* SKY130 technology files provide design rules, layers and transistor models.
* Custom cells such as bitcells, sense amplifiers and write drivers are reused by OpenRAM.
* Technology files guide layout generation and characterization.
* Process corners (TT, SS, FF) are used for timing and power analysis.

Verification:
Reviewed sky130A directory structure, technology files and custom cell libraries.

Outcome:
Created docs/sky130_pdk.md and improved understanding of technology-dependent SRAM generation.
