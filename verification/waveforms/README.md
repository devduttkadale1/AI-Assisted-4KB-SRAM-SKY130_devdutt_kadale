# Verification Waveforms

This directory contains waveform screenshots generated during the AI-assisted verification of SRAM circuit blocks using **Xschem**, **NGSpice**, and the **SKY130A Open-Source PDK**.

Each waveform validates a specific operation or circuit used during the development of the SRAM bitcell and its peripheral blocks.

---

## CMOS Inverter Verification

![CMOS Design Waveform](cmos_design_waveform.png)

The CMOS inverter was simulated as the baseline verification before starting SRAM design. The waveform confirms correct switching behaviour and validates the SKY130 simulation environment.

---

## CMOS Inverter Waveform

![CMOS Waveform](cmos_waveform.png)

Transient response of the CMOS inverter showing complementary input and output signals. This simulation verifies the basic CMOS operation used throughout the SRAM design.

---

## 6T SRAM Bitcell

![6T SRAM Bitcell](6t_sram_bitcell.png)

Reference simulation of the complete 6T SRAM bitcell showing the cross-coupled inverter structure and access transistors. This circuit forms the fundamental storage element of the SRAM array.

---

## SRAM Read Operation

![SRAM Read](sram_read.png)

Simulation of the SRAM read cycle after wordline activation. The waveform shows bitline differential development while maintaining the stored data without read disturb.

---

## SRAM Write Operation

![SRAM Write](sram_write.png)

Simulation of the SRAM write cycle where complementary bitlines successfully overwrite the previous stored value. Demonstrates reliable write functionality.

---

## 6T SRAM Read Verification

![6T Read Waveform](6T_read_waveform.png)

Detailed transient verification of the 6T SRAM cell during a read operation. Confirms correct wordline control and stable storage node behaviour.

---

## 6T SRAM Write Verification

![6T Write Waveform](6T_write_waveform.png)

Detailed write verification of the 6T SRAM bitcell. Shows successful data transition through the access transistors and storage nodes.

---

## Static Noise Margin (SNM)

![SNM Butterfly Curve](snm_butterfly_curve.png)

Butterfly curve used to evaluate the static noise margin of the SRAM cell. The size of the butterfly lobes indicates the stability of the stored data.

---

## Read Disturb Analysis

![Read Disturb Analysis](read_disturb_analysis.png)

Verifies that the stored data remains stable during read access. The simulation confirms that the cell does not unintentionally flip while being read.

---

## Write Margin Analysis

![Write Margin Analysis](write_margin_analysis.png)

Evaluates the write ability of the SRAM bitcell by measuring the voltage required to overwrite the stored value. Confirms reliable write operation.

---

## Precharge Circuit

![Precharge Waveform](precharge_waveform.png)

Simulation of the SRAM precharge circuit showing both bitlines being charged and equalized before each read operation. Proper precharge improves sensing accuracy.

---

## Sense Amplifier

![Sense Amplifier Waveform](sense_amp_waveform.png)

Transient response of the sense amplifier illustrating the amplification of a small bitline voltage difference into a full digital logic level.

---

## Write Driver

![Write Driver Waveform](write_driver_waveform.png)

Simulation of the write driver generating complementary bitline voltages required to write new data into the SRAM cell.

---

## 1-Bit SRAM Integration

![1-Bit SRAM Full Waveform](1bit_sram_full_waveform.png)

Complete functional verification of the integrated 1-bit SRAM showing the interaction of the bitcell, wordline, bitlines, and peripheral circuitry during read and write operations.

---

## SPI Interface Verification

![SPI Waveforms](SPI waveforms.png)

Timing waveforms of the SPI interface used for SRAM communication experiments. The results demonstrate correct synchronization between clock, control, and data signals.

---

## Simulation Environment

- **Technology:** SKY130A Open-Source PDK
- **Schematic Capture:** Xschem
- **Circuit Simulator:** NGSpice
- **Supply Voltage:** 1.8 V (Typical TT Corner)
- **Verification Flow:** AI-Assisted Design with Manual Validation

---

## Purpose

These waveform screenshots provide visual verification evidence for the AI-assisted design and validation of the SRAM circuits. Every waveform shown in this folder was generated using open-source EDA tools and used to validate the expected behaviour before layout implementation.