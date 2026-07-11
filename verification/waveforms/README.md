# Verification Waveforms

This folder contains waveform screenshots generated during the AI-assisted design and verification of SRAM circuit blocks using the **SKY130A PDK**, **Xschem**, and **NGSpice**.

Each image represents a specific simulation performed to verify circuit functionality before layout implementation. The waveforms provide visual evidence of correct operation for the CMOS inverter, SRAM bitcell, peripheral circuits, and memory access behavior.

---

## Waveform Summary

| Image | Description |
|-------|-------------|
| **1bit_sram_full_waveform.png** | Complete functional simulation of the integrated 1-bit SRAM cell showing the interaction between wordline, bitlines, storage nodes, and read/write operations. Demonstrates the overall functionality of the SRAM cell. |
| **6T_read_waveform.png** | Read operation of the 6T SRAM bitcell. Shows the development of differential bitline voltage after the wordline is asserted while preserving the stored data. |
| **6T_write_waveform.png** | Write operation of the 6T SRAM bitcell. Demonstrates successful overwriting of the stored data through the access transistors and bitlines. |
| **6t_sram_bitcell.png** | Reference schematic/simulation view of the complete 6T SRAM bitcell used throughout the verification process. Serves as the primary circuit under investigation. |
| **SPI waveforms.png** | Simulation results of the SPI interface used for SRAM communication experiments. Shows the timing relationship between SPI clock, data, and control signals. |
| **cmos_design_waveform.png** | CMOS inverter transient response used as the baseline verification before moving to SRAM circuit design. Confirms proper inverter switching using SKY130 models. |
| **cmos_waveform.pdf** | PDF version of the CMOS inverter waveform for documentation and report generation. Contains the same verification results in printable format. |
| **cmos_waveform.png** | Transient simulation of the CMOS inverter showing complementary input and output switching characteristics. Used to validate the simulation environment. |
| **precharge_waveform.png** | Simulation of the SRAM precharge circuit. Demonstrates equalization and charging of BL and BLB to VDD before initiating a read cycle. |
| **read_disturb_analysis.png** | Read disturb verification of the SRAM bitcell. Confirms that the stored data remains stable during the read operation without unintended bit flipping. |
| **sense_amp_waveform.png** | Sense amplifier transient response showing amplification of a small bitline differential voltage into a full logic-level output. Validates sensing operation. |
| **snm_butterfly_curve.png** | Static Noise Margin (SNM) butterfly curve used to evaluate SRAM cell stability. The butterfly lobes are used to estimate the maximum tolerable noise margin. |
| **sram_read.png** | SRAM read cycle waveform illustrating wordline activation, bitline discharge, and data sensing. Confirms correct read functionality of the SRAM bitcell. |
| **sram_write.png** | SRAM write cycle waveform demonstrating successful data storage through complementary bitline driving and wordline activation. |
| **write_driver_waveform.png** | Simulation of the SRAM write driver circuit. Shows the generation of complementary bitline voltages required for reliable write operations. |
| **write_margin_analysis.png** | Write margin analysis used to evaluate the write ability of the SRAM cell. Confirms that the access transistors can successfully overwrite the stored value. |

---

## Simulation Environment

- **Technology:** SKY130A Open-Source PDK
- **Schematic Editor:** Xschem
- **Circuit Simulator:** NGSpice
- **Supply Voltage:** 1.8 V (Typical TT Corner)
- **Design Methodology:** AI-Assisted Design with Manual Verification

---

## Purpose

These waveform screenshots serve as verification evidence for the VSD AI-Assisted Analog, Mixed-Signal and FPGA Internship. Every simulation result shown here was generated, analyzed, and verified using open-source EDA tools before being incorporated into the project documentation and reports.