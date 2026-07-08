# SRAM Read Operation

## Introduction

The read operation retrieves data stored in the selected SRAM cell without changing its value.

A read operation involves:

* Precharge Circuit
* Wordline Activation
* Bitline Development
* Sense Amplification

---

## Read Path

Precharge Circuit
→ Bitlines (BL, BLB)
→ Selected 6T SRAM Cell
→ Sense Amplifier
→ Output Data

## Read Operation Diagram

![SRAM Read Operation](../assets/images/sram_read.png)

*Figure 1: Block-level SRAM read operation showing precharge, bitline differential development, and sense amplification.*


---

## Step 1: Precharge Phase

Before reading:

BL = VDD

BLB = VDD

Purpose:

* Establish equal initial conditions
* Improve sensing accuracy

---

## Step 2: Wordline Activation

The row decoder selects the required row.

The wordline driver activates the corresponding wordline.

Result:

WL = 1

Access transistors turn ON.

---

## Step 3: Bitline Differential Development

Assume:

Q = 1

QB = 0

The cell slightly discharges one bitline while the other remains near VDD.

Example:

BL ≈ VDD

BLB ≈ VDD − ΔV

A small voltage difference is created.

---

## Step 4: Sense Amplification

The sense amplifier detects the voltage difference.

It converts:

Small analog voltage difference

into

Full digital logic value.

---

## Step 5: Data Output

The amplified value appears at the output port.

The stored value inside the SRAM cell remains unchanged.

---

## Read Timing Sequence

1. Precharge BL and BLB.
2. Enable selected wordline.
3. Develop differential voltage.
4. Enable sense amplifier.
5. Capture output data.

---

## Read Stability

During read operations, the internal storage nodes are temporarily disturbed.

Important considerations:

* Read Static Noise Margin (RSNM)
* Bitline capacitance
* Sense amplifier sensitivity

---

## Summary

The SRAM read operation relies on differential sensing. Precharged bitlines, selected wordlines, and sense amplifiers work together to read stored data quickly and reliably without destroying the stored information.
