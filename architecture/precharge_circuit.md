# Precharge Circuit in SRAM

## Introduction

The precharge circuit is an essential support block in SRAM memories. Before every read operation, the bitlines (BL and BLB) must be initialized to a known voltage level. This process is called precharging.

The precharge circuit charges both bitlines to VDD and equalizes their voltages before a read operation begins.

Without precharging, reliable sensing of stored data would not be possible.

---

## Precharge Circuit Implementations

![Precharge Circuit](../assets/images/precharge_circuit.png)

*Figure 1: Various SRAM precharge circuit topologies. The circuits progressively improve bitline charging and equalization. PRE# is an active-low precharge control signal, while BL and BLB represent the differential bitlines.*

---

## Why Precharge is Required

During a read operation, the SRAM cell creates only a small voltage difference between BL and BLB.

For accurate sensing:

* Both bitlines must start from the same voltage level.
* The sense amplifier must observe a small differential voltage.
* Previous bitline states must not affect the next read cycle.

The precharge circuit ensures these conditions are satisfied.

---

## Function of PRE#

PRE# is an active-low control signal.

When:

```text
PRE# = 0
```

* Precharge transistors turn ON.
* BL and BLB are charged to VDD.
* Equalization circuitry may connect BL and BLB together.

When:

```text
PRE# = 1
```

* Precharge transistors turn OFF.
* Bitlines are released.
* Read operation can begin.

---

## Equalization of Bitlines

One important feature of SRAM precharge circuits is bitline equalization.

During precharge:

```text
BL = BLB = VDD
```

The equalization transistor removes any voltage difference between the bitlines.

Benefits:

* Faster sensing
* Improved read accuracy
* Reduced noise sensitivity
* Better matching between BL and BLB

---

## Position in the SRAM Read Path

Read operation flow:

```text
Precharge Circuit
        ↓
Bitlines (BL, BLB)
        ↓
Selected SRAM Cell
        ↓
Sense Amplifier
        ↓
Output Data
```

The precharge phase always occurs before wordline activation.

---

## Read Operation Example

Step 1:

```text
BL  = 1.8 V
BLB = 1.8 V
```

Precharge complete.

Step 2:

Wordline becomes active.

Step 3:

Selected cell slightly discharges one bitline.

Example:

```text
BL  = 1.8 V
BLB = 1.7 V
```

Step 4:

The sense amplifier detects this differential voltage and generates the output data.

---

## Benefits of Precharge Circuits

### Improved Read Accuracy

Both bitlines begin at identical voltages.

### Faster Read Access

The sense amplifier only needs to detect a small differential voltage.

### Reduced Noise

Equalized bitlines improve signal integrity.

### Reliable SRAM Operation

Ensures repeatable and predictable read cycles.

---

## Design Considerations

The effectiveness of a precharge circuit depends on:

* Bitline capacitance
* Precharge transistor sizing
* Equalization transistor sizing
* Supply voltage
* Precharge timing

Insufficient precharge time may lead to incorrect read results.

---

## Role in the SRAM_SKY130 Repository

The SRAM_SKY130 repository contains dedicated precharge circuit implementations and simulations.

Relevant files:

```text
Prelayout/Schematic/xschem_precharge_circuit.png
Prelayout/Spice_models/precharge_circuit.spice
```

These files demonstrate how BL and BLB are charged and equalized before SRAM read operations.

---

## Summary

The precharge circuit prepares BL and BLB before every read operation by charging both bitlines to VDD and equalizing their voltages. This establishes identical starting conditions for differential sensing and enables fast, accurate, and reliable SRAM read operations.
