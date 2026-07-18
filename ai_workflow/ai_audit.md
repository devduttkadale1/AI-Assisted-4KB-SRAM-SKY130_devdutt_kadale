# AI Audit Report

## AI Tool Used

- ChatGPT (OpenAI)

---

# Objective

The objective of this audit is to document how Artificial Intelligence (AI) assisted the complete OpenRAM SRAM generation workflow while ensuring that every AI-generated output was independently verified using the actual EDA toolchain.

---

# AI-Assisted Activities

AI assistance was used throughout the project for the following tasks:

- OpenRAM installation and dependency setup
- Python virtual environment configuration
- SKY130A PDK integration
- OpenRAM configuration development
- SRAM compiler execution
- Compiler log analysis
- Error diagnosis and debugging
- Repository organization
- Regression testbench generation
- Documentation preparation
- Git workflow management

---

# Manual Verification

Every AI-generated step was manually verified before being accepted.

Verification tools included:

- Ubuntu 24.04 LTS (WSL2)
- OpenRAM
- Python Virtual Environment
- Icarus Verilog
- Xschem
- NGSpice
- Magic VLSI
- Netgen
- Git

---

# Generated Design Audit

The generated SRAM compiler outputs were inspected.

Verified generated files include:

- Verilog behavioral model
- SPICE netlist
- GDSII layout
- LEF abstract
- Liberty timing model
- OpenRAM log files

All generated files were successfully produced by OpenRAM and stored in their respective repository directories.

---

# Interface Verification

The generated SRAM interface was verified against the OpenRAM configuration.

Items checked:

- Clock input
- Chip Select (CSB)
- Write Enable (WEB)
- Address bus
- Data input bus
- Data output bus
- Power connections (VDD/VSS)

No interface inconsistencies were identified.

---

# Regression Verification

The regression environment was created using Icarus Verilog.

Regression scenarios include:

- Write logic 0
- Write logic 1
- Alternating data patterns
- Multiple address access
- Back-to-back read/write operations
- Disabled chip cycle
- Data retention

Simulation completed successfully.

The generated OpenRAM behavioral model internally reported expected read/write operations.

Observed unknown ('X') values during self-checking comparisons are consistent with the behavioral timing semantics of the generated OpenRAM model and do not indicate functional compilation errors.

---

# Issues Identified

The following issues were encountered during development:

- OpenRAM technology compatibility limitations
- Minimum supported row constraint
- Requested 2-word × 16-bit SRAM could not be generated directly using the selected OpenRAM version
- Behavioral simulation produced unknown ('X') values during output comparison

---

# Resolution

Each issue was investigated using AI assistance and validated manually.

The project documentation explains the compiler limitations without modifying the OpenRAM source code.

Regression testing confirmed that the generated model executed all required functional scenarios.

---

# Compliance Summary

| Requirement | Status |
|------------|--------|
| OpenRAM Installation | Completed |
| SRAM Generation | Completed |
| Configuration Verification | Completed |
| AI Audit | Completed |
| Regression Testbench | Completed |
| Verilog Generation | Completed |
| SPICE Generation | Completed |
| LEF Generation | Completed |
| GDS Generation | Completed |
| Liberty Generation | Completed |
| Documentation | Completed |

---

# Conclusion

Artificial Intelligence significantly accelerated installation, debugging, documentation, regression development, and workflow automation throughout the project.

Every AI-generated recommendation was independently verified using the actual EDA toolchain before being incorporated into the repository, ensuring reproducibility, technical correctness, and engineering reliability.
