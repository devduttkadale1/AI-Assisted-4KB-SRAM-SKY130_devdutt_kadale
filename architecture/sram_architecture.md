# SRAM Architecture

## Overview

Static Random Access Memory (SRAM) is a high-speed semiconductor memory widely used in processor caches, register files, FIFOs, and embedded memory blocks. Unlike DRAM, SRAM does not require periodic refresh operations and provides significantly lower access latency.

The objective of this project is to understand the architecture of a 4 KB SRAM macro generated using OpenRAM and the SKY130 Process Design Kit (PDK).

Memory organization:

* Capacity: 4 KB
* Total bits: 32,768 bits
* Organization: 1024 × 32

---

## SRAM Macro Architecture

The SRAM macro consists of several functional blocks that work together to perform read and write operations.

### Architecture Diagram

## SRAM Macro Architecture

![SRAM Architecture](../assets/images/sram_architecture.png)

Figure 1: High-level SRAM macro architecture showing the row decoder, wordline driver, bitcell array, precharge circuitry, column multiplexer, write drivers, sense amplifiers, and control logic.

---

## Row Decoder

The row decoder receives the address bits and activates exactly one wordline corresponding to the selected row.

Functions:

* Decodes address inputs
* Generates one-hot row select signals
* Selects the target memory row

---

## Wordline Driver

The wordline driver strengthens the decoder output and drives the selected wordline across the memory array.

Functions:

* Buffers decoder outputs
* Drives long wordlines
* Enables access transistors of selected cells

---

## Bitcell Array

The bitcell array is the core storage element of the SRAM macro.

Features:

* Composed of 6T SRAM cells
* Arranged as rows and columns
* Stores actual user data

---

## Precharge Array

Before every read operation, the bitlines are precharged to VDD.

Functions:

* Charges BL and BLB
* Equalizes bitline voltages
* Improves sensing reliability

---

## Column Multiplexer

The column multiplexer selects the required columns from the bitcell array.

Functions:

* Reduces routing complexity
* Connects selected columns to sense amplifiers
* Supports word-per-row organization

---

## Write Driver Array

The write driver forces the desired values onto BL and BLB during write operations.

Functions:

* Drives differential data
* Overwrites existing cell contents
* Provides sufficient drive strength

---

## Sense Amplifier Array

The sense amplifier detects small voltage differences between BL and BLB during read operations.

Functions:

* Amplifies differential signals
* Converts analog voltage differences into digital logic levels
* Produces output data

---

## Control Logic

The control logic coordinates all SRAM operations.

Functions:

* Generates internal timing signals
* Controls precharge phase
* Controls read and write cycles
* Synchronizes memory operation

---

## Read Data Flow

Address
→ Row Decoder
→ Wordline Driver
→ Bitcell Array
→ Bitlines
→ Sense Amplifier
→ Output Data

---

## Write Data Flow

Input Data
→ Write Driver
→ Bitlines
→ Selected Bitcell
→ Data Stored

---

## Conclusion

A complete SRAM macro consists of memory cells and supporting circuitry such as decoders, wordline drivers, precharge circuits, write drivers, sense amplifiers, and control logic. These blocks work together to provide fast and reliable memory access.
