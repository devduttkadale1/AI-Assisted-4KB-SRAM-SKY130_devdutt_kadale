# Row Decoder Architecture

## Introduction

The Row Decoder is one of the fundamental blocks inside an SRAM macro. Its purpose is to translate the incoming memory address into a unique wordline signal that selects exactly one row of SRAM cells.

In the OpenRAM-generated 4 KB SRAM (1024 × 32), the row decoder ensures that only the requested memory row is activated during read and write operations.

Without a row decoder, the SRAM would not be able to identify which row contains the required data.

---

## Row Decoder Diagram

![Row Decoder Architecture](../assets/images/row_decoder.png)

*Figure 1: Row Decoder selecting one wordline from the SRAM array.*

---

## Why Row Decoding is Required

An SRAM contains many rows of memory cells arranged in a matrix.

For the reference design:

```text
1024 Words × 32 Bits
```

When a processor requests data, only one word should be accessed.

For example:

```text
Address = 25
```

The SRAM must activate only the row containing Word 25.

If multiple rows were activated simultaneously:

* Incorrect data could be read.
* Write operations could corrupt memory.
* Power consumption would increase.
* Bitline conflicts could occur.

Therefore, a decoder is used to convert the binary address into a unique row selection signal.

---

## Address Width Calculation

The SRAM contains:

```text
1024 Words
```

Therefore:

```text
Address Width = log₂(1024)
              = 10 bits
```

OpenRAM divides the address into:

```text
7 Row Address Bits
3 Column Address Bits
```

Representation:

```text
A9 A8 A7 A6 A5 A4 A3 | A2 A1 A0
<------ Row -------> | <-Col->
       7 bits        | 3 bits
```

The upper 7 bits are sent to the Row Decoder.

The lower 3 bits are sent to the Column Multiplexer.

---

## Physical Memory Organization

Although the memory appears logically as:

```text
1024 × 32
```

OpenRAM internally organizes it as:

```text
128 Rows × 256 Columns
```

because:

```text
128 × 256 = 32768 bits
```

which equals:

```text
1024 × 32 = 32768 bits
```

Since:

```text
128 = 2⁷
```

only 7 address bits are required to select a row.

---

## One-Hot Wordline Generation

The Row Decoder converts the 7-bit row address into a one-hot wordline signal.

Example:

Input:

```text
Row Address = 0000101
```

Decimal value:

```text
5
```

Output:

```text
WL0  = 0
WL1  = 0
WL2  = 0
WL3  = 0
WL4  = 0
WL5  = 1
WL6  = 0
...
WL127 = 0
```

Only one wordline becomes active.

This is called **one-hot decoding**.

---

## Interaction with the Wordline Driver

The Row Decoder itself does not directly drive the SRAM cells.

Its output is connected to a Wordline Driver.

Architecture:

```text
Address
   ↓
Row Decoder
   ↓
Wordline Driver
   ↓
Selected Wordline
   ↓
SRAM Cell Row
```

The Wordline Driver strengthens the decoder output and drives the large capacitance associated with an entire SRAM row.

---

## Row Decoder During Read Operation

During a read operation:

1. Address arrives at the SRAM.
2. Row Decoder selects one row.
3. Wordline Driver activates the selected wordline.
4. Access transistors inside the selected cells turn ON.
5. Cell data appears on the bitlines.
6. Sense Amplifiers detect the stored value.

Flow:

```text
Address
   ↓
Row Decoder
   ↓
Wordline Driver
   ↓
Bitcell Array
   ↓
Sense Amplifier
   ↓
Output Data
```

---

## Row Decoder During Write Operation

During a write operation:

1. Address arrives.
2. Row Decoder selects the target row.
3. Wordline Driver activates the selected wordline.
4. Write Driver forces data onto BL and BLB.
5. The selected SRAM cells are updated.

Flow:

```text
Address
   ↓
Row Decoder
   ↓
Wordline Driver
   ↓
Selected SRAM Row
   ↓
Write Driver
   ↓
New Data Stored
```

---

## OpenRAM Implementation

The designer specifies only high-level memory parameters:

```python
word_size = 32
num_words = 1024
```

OpenRAM automatically determines:

* Number of rows
* Number of columns
* Address width
* Row Decoder size
* Wordline Driver size
* Routing connections

The generated decoder circuitry may include:

* NAND gates
* NOR gates
* Inverters
* Predecoders

depending on optimization requirements.

---

## Impact on SRAM Performance

The Row Decoder directly affects memory performance.

### Access Time

Decoder delay contributes to total read/write latency.

```text
Address Delay
+
Decoder Delay
+
Wordline Delay
+
Bitline Delay
+
Sense Amplifier Delay
```

### Dynamic Power

Every address transition causes decoder switching activity, increasing dynamic power consumption.

### Area

Larger memories require larger decoders and additional routing resources.

### Scalability

As memory size increases, decoder complexity also increases.

| Rows | Address Bits |
| ---- | ------------ |
| 128  | 7            |
| 256  | 8            |
| 512  | 9            |
| 1024 | 10           |

---

## Summary

The Row Decoder converts the binary memory address into a one-hot wordline signal that selects exactly one SRAM row. In the OpenRAM-generated 1024 × 32 SRAM, the 10-bit address is divided into 7 row bits and 3 column bits. The Row Decoder works together with the Wordline Driver to activate the required row, enabling accurate read and write operations while minimizing power consumption and preventing memory corruption.
