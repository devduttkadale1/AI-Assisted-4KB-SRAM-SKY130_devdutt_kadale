# Column Multiplexer Architecture

## Introduction

The Column Multiplexer (Column MUX) is an important peripheral circuit in SRAM architecture. Its purpose is to select the required data word from a larger physical column structure and connect it to the read and write circuitry.

In the OpenRAM-generated 4 KB SRAM (1024 × 32), column multiplexing allows multiple logical words to be stored within the same physical row. This significantly reduces area, routing complexity, and decoder size.

---

## Column Multiplexer Diagram

![Column Multiplexer Architecture](../assets/images/column_mux.png)

*Figure 1: Column Multiplexer selecting one word from multiple words stored in the same physical row.*

---

## Why Column Multiplexing is Needed

A logical SRAM specification of:

```text
1024 Words × 32 Bits
```

can be implemented directly as:

```text
1024 Rows × 32 Columns
```

However, such an organization results in:

* Long wordlines
* Large row decoders
* Increased routing complexity
* Larger area

To optimize the memory, OpenRAM reorganizes the array into:

```text
128 Rows × 256 Columns
```

This still stores:

```text
128 × 256 = 32768 bits
```

which equals:

```text
1024 × 32 = 32768 bits
```

The storage capacity remains unchanged while the physical implementation becomes more efficient.

---

## Physical Organization

Logical memory:

```text
1024 × 32
```

Physical memory:

```text
128 Rows × 256 Columns
```

Since:

```text
256 Columns ÷ 32 Bits
=
8 Words
```

each physical row stores:

```text
8 logical words
```

This organization is commonly referred to as:

```text
8 Words Per Row
```

---

## Understanding "8 Words Per Row"

Each physical row contains:

```text
256 Bitcells
```

These are grouped into:

```text
8 Groups × 32 Bits
```

Example:

```text
Word 0 → Columns 0–31
Word 1 → Columns 32–63
Word 2 → Columns 64–95
Word 3 → Columns 96–127
Word 4 → Columns 128–159
Word 5 → Columns 160–191
Word 6 → Columns 192–223
Word 7 → Columns 224–255
```

Thus, a single row contains eight independent 32-bit words.

---

## Address Division

The SRAM contains:

```text
1024 Words
```

Therefore:

```text
Address Width = log₂(1024)
              = 10 bits
```

The address is divided into:

| Function         | Bits |
| ---------------- | ---- |
| Row Selection    | 7    |
| Column Selection | 3    |

```text
Address[9:3] → Row Decoder
Address[2:0] → Column Multiplexer
```

Representation:

```text
A9 A8 A7 A6 A5 A4 A3 | A2 A1 A0
<------ Row -------> | <-Col->
       7 bits        | 3 bits
```

---

## Column Selection Process

The Row Decoder first selects one physical row.

The lower address bits are then used by the Column Multiplexer to select one of the eight available words stored in that row.

Examples:

### Address Bits = 000

```text
A2 A1 A0 = 000
```

Selects:

```text
Word 0
Columns 0–31
```

---

### Address Bits = 001

```text
A2 A1 A0 = 001
```

Selects:

```text
Word 1
Columns 32–63
```

---

### Address Bits = 111

```text
A2 A1 A0 = 111
```

Selects:

```text
Word 7
Columns 224–255
```

Only the selected word is connected to the sense amplifiers and output circuitry.

---

## Relationship with Bitlines

Each column contains:

* BL (Bitline)
* BLB (Bitline Bar)

For:

```text
256 Columns
```

there are:

```text
256 BL/BLB pairs
```

The Column MUX sits between:

```text
Bitcell Array
```

and

```text
Sense Amplifier Array
```

Architecture:

```text
Bitcell Array
      ↓
Column Multiplexer
      ↓
Sense Amplifier
      ↓
Output Data
```

The multiplexer determines which group of bitlines is connected to the output circuitry.

---

## During Read Operation

1. Address arrives.
2. Row Decoder selects one row.
3. Wordline becomes active.
4. Selected cells develop differential voltages on bitlines.
5. Column Multiplexer selects one 32-bit word.
6. Sense Amplifiers detect the data.
7. Output data is produced.

Flow:

```text
Address
   ↓
Row Decoder
   ↓
Wordline
   ↓
Bitcell Array
   ↓
Column Multiplexer
   ↓
Sense Amplifier
   ↓
DOUT
```

---

## During Write Operation

1. Address arrives.
2. Row Decoder selects one row.
3. Column Multiplexer selects one word.
4. Write Driver drives BL and BLB.
5. Selected cells are updated.

Flow:

```text
DIN
 ↓
Write Driver
 ↓
Column Multiplexer
 ↓
Selected Bitlines
 ↓
SRAM Cell
```

---

## Advantages of Column Multiplexing

### Reduced Decoder Complexity

Instead of decoding 1024 rows, OpenRAM only needs:

```text
128 Rows
```

This reduces row decoder size and delay.

### Reduced Area

Multiple words share the same physical row.

### Improved Routing

Shorter wordlines reduce routing congestion.

### Lower Power Consumption

Smaller decoders and shorter wires reduce switching power.

### Better Scalability

Large memories can be implemented efficiently using column multiplexing.

---

## OpenRAM Implementation

The designer specifies:

```python
word_size = 32
num_words = 1024
```

OpenRAM automatically determines:

* Number of rows
* Number of columns
* Words per row
* Column MUX ratio
* Address partitioning

and generates the required multiplexing circuitry.

---

## Summary

The Column Multiplexer allows multiple logical words to share the same physical row. In the OpenRAM-generated 1024 × 32 SRAM, each physical row contains eight 32-bit words. The lower three address bits select one of these words, while the upper seven address bits select the row. This organization reduces area, routing complexity, and decoder size while maintaining the full 4 KB storage capacity.
