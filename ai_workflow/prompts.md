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


## Entry 08

Date: 18 June 2026

Tool: Codex

Objective:
Understand SRAM row decoding and address selection mechanisms.

Prompt:
Act as a senior SRAM compiler engineer.

Using the SRAM_SKY130 repository as context, explain the Row Decoder used in the generated 1024 × 32 SRAM macro.

Explain:

* Why row decoding is required
* Address division
* One-hot wordline generation
* Wordline drivers
* Decoder interaction during read and write operations
* Impact on SRAM performance

Key Findings:

* The row decoder converts address bits into one-hot wordline signals.
* OpenRAM organizes the memory into a physical array requiring row and column address partitioning.
* Only one row is activated during each access cycle.
* Wordline drivers are required to drive the large capacitive load of SRAM rows.
* Decoder delay contributes directly to memory access time.

Verification:
Cross-checked decoder concepts against SRAM architecture diagrams and OpenRAM memory organization.

Outcome:
Created architecture/row_decoder.md and documented row selection mechanisms used in the 4 KB SRAM macro.

---

## Entry 09

Date: 18 June 2026

Tool: Codex

Objective:
Understand column multiplexing and physical memory organization.

Prompt:
Act as a senior SRAM compiler engineer.

Using the SRAM_SKY130 repository as context, explain the Column Multiplexer used in the generated 1024 × 32 SRAM macro.

Explain:

* Why column multiplexing is needed
* Meaning of 8 words per row
* Physical organization of 128 rows × 256 columns
* Column address selection
* Relationship between column muxes and bitlines
* Impact on area and performance

Key Findings:

* OpenRAM physically organizes the SRAM as 128 rows × 256 columns.
* Each physical row stores eight logical 32-bit words.
* Three address bits are used for column selection.
* Column multiplexing reduces bitline length and improves memory density.
* Physical organization differs significantly from logical memory organization.

Verification:
Cross-checked calculations using OpenRAM configuration parameters and generated memory organization reports.

Outcome:
Created architecture/column_mux.md and documented logical-to-physical memory mapping concepts.

---

## Entry 10

Date: 18 June 2026

Tool: Codex

Objective:
Understand the SKY130 technology package used by OpenRAM.

Prompt:
Using the SRAM_SKY130 repository as context, explain the SKY130 technology files, custom cells, transistor models, and design rules used during SRAM generation.

Explain:

* SKY130 directory structure
* Technology files
* Custom SRAM cells
* Process corners
* Transistor models
* OpenRAM interaction with SKY130

Key Findings:

* SKY130 provides design rules, transistor models, routing information, and technology definitions.
* OpenRAM uses custom SRAM cells such as bitcells, sense amplifiers, write drivers, and replica cells.
* Process corners (TT, SS, FF, FS, SF) support timing and power characterization.
* Technology files guide layout generation and verification.
* OpenRAM combines configuration files, SKY130 technology data, and custom cells to generate the final SRAM macro.

Verification:
Reviewed sky130A technology directory, custom cell libraries, transistor models, and OpenRAM documentation.

Outcome:
Enhanced docs/sky130_pdk.md and developed a deeper understanding of technology-aware SRAM generation.

## Entry 11 — 6T SRAM READ Simulation Debug (June 29, 2026)

**Prompt:** Help fix ngspice SKY130 model errors for 6T SRAM READ simulation

**AI Response:** Identified 3 root causes:
1. Missing ~/.spiceinit with SKY130 compatibility flags
2. Wrong PDK lib path (ngspice/ vs combined/)
3. Model parameter conflicts with BSIM4

**Fix Applied:**
- Created ~/.spiceinit with `set ngbehavior=hsa`, `set ng_nomodcheck`
- Used `.lib "combined/sky130.lib.spice" tt`
- Matched exact syntax from working cmos_inverter.spice

**Result:** 2020 data rows, simulation successful ✅
