# 6T SRAM Bitcell

## Introduction

The 6T SRAM bitcell is the fundamental storage element used in SRAM memories.

The name "6T" refers to the six transistors used to store one bit of information.

---

## 6T Cell Structure

The cell consists of:

* Two cross-coupled CMOS inverters
* Two access transistors

Total:

* 2 PMOS transistors
* 4 NMOS transistors

---

## Cell Diagram

## 6T SRAM Cell Structure

![6T SRAM Cell](../assets/images/6t_sram_cell.png)

Figure 1: Transistor-level schematic of a 6T SRAM bitcell consisting of two cross-coupled inverters and two access transistors.

---

## Transistor Functions

### M1 and M3

NMOS pull-down transistors.

Functions:

* Pull internal nodes to ground
* Maintain stored logic state

### M2 and M4

PMOS pull-up transistors.

Functions:

* Pull internal nodes toward VDD
* Form CMOS inverters with M1 and M3

### M5 and M6

Access transistors.

Functions:

* Controlled by Wordline (WL)
* Connect storage nodes to BL and BLB

---

## Storage Nodes

### Q

Stores the actual data.

### QB

Stores the complement of Q.

Example:

Q = 1 → QB = 0

Q = 0 → QB = 1

---

## Wordline (WL)

The wordline controls access to the cell.

WL = 0

* Cell isolated
* Data retained

WL = 1

* Cell connected to bitlines
* Read or write operation possible

---

## Bitlines

The cell uses differential bitlines:

* BL
* BLB

Functions:

* Carry read data
* Carry write data
* Improve noise immunity

---

## Hold Operation

During hold mode:

* WL = 0
* Access transistors OFF
* Cross-coupled inverters maintain data

No read or write operation occurs.

---

## Read Operation

1. BL and BLB are precharged.
2. WL becomes high.
3. Cell connects to bitlines.
4. One bitline discharges slightly.
5. Sense amplifier detects voltage difference.

---

## Write Operation

1. Write driver forces BL and BLB.
2. WL becomes high.
3. New value overwrites previous state.
4. Cell stores updated data.

---

## Advantages of 6T SRAM Cell

* High speed
* No refresh required
* Robust operation
* Suitable for cache memories

---

## Limitations

* Larger area than DRAM
* Higher transistor count
* Lower density

---

## Conclusion

The 6T SRAM bitcell is the fundamental building block of SRAM memories. It stores one bit using cross-coupled inverters and uses differential bitlines and access transistors for reliable read and write operations.
