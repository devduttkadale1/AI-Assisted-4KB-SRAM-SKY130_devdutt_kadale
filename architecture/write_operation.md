# SRAM Write Operation

## Introduction

The write operation stores new data into the selected SRAM cell. During a write cycle, the write driver forces the bitlines (BL and BLB) to the desired logic levels, and the selected wordline (WL) enables access to the cell.

Unlike a read operation, where the cell only influences the bitlines, a write operation actively changes the state of the SRAM cell.

---

## Write Path

Input Data
→ Write Driver
→ Bitlines (BL, BLB)
→ Selected 6T SRAM Cell
→ Data Stored

---

## Write Operation Diagram

![SRAM Write Operation](../assets/images/sram_write.png)

*Figure 1: Block-level SRAM write operation showing write driver activity, wordline activation, and data storage in the 6T SRAM cell.*


## Step 1: Write Data Preparation

The write driver receives the input data (D) and its complement (D').

The bitlines are driven according to the desired value:

### Writing Logic '1'

```text
BL  = 1
BLB = 0
```

### Writing Logic '0'

```text
BL  = 0
BLB = 1
```

The write driver must be strong enough to overcome the existing state stored in the SRAM cell.

---

## Step 2: Wordline Activation

The row decoder selects the required row.

The wordline driver activates the selected wordline:

```text
WL = 1
```

This turns ON the access transistors (M5 and M6) of the selected SRAM cell.

As a result, the internal storage nodes become connected to BL and BLB.

---

## Step 3: Cell Overwrite

Once WL becomes high, the write driver forces the internal storage nodes toward the new values.

Example:

If:

```text
BL  = 1
BLB = 0
```

Then:

```text
Q  → 1
QB → 0
```

If:

```text
BL  = 0
BLB = 1
```

Then:

```text
Q  → 0
QB → 1
```

The previous data stored in the cell is overwritten.

---

## Step 4: Data Storage

After the internal nodes reach stable logic levels, the cross-coupled inverters reinforce the new state.

The cell now stores the updated value.

Example:

```text
Q  = 1
QB = 0
```

or

```text
Q  = 0
QB = 1
```

The cell will continue holding this value as long as power is supplied.

---

## Step 5: Write Completion

After sufficient write time:

```text
WL = 0
```

The access transistors turn OFF.

The cell becomes isolated from the bitlines and permanently retains the newly written value.

---

## Write Timing Sequence

1. Input data arrives.
2. Write driver generates BL and BLB values.
3. Row decoder selects the target row.
4. Wordline is activated.
5. Cell state is overwritten.
6. New value becomes stable.
7. Wordline is deactivated.

---

## Writeability Considerations

Successful writing depends on several factors:

* Write driver strength
* Access transistor sizing
* Cell ratio
* Supply voltage
* Bitline capacitance

The write driver must be strong enough to change the state of the cross-coupled inverters.

---

## Difference Between Read and Write Operations

| Read Operation                  | Write Operation           |
| ------------------------------- | ------------------------- |
| Retrieves stored data           | Stores new data           |
| Uses sense amplifier            | Uses write driver         |
| Does not modify data            | Overwrites data           |
| Cell creates voltage difference | Bitlines force new values |
| Focus on read stability         | Focus on writeability     |

---

## Summary

During a write operation, the write driver forces BL and BLB to the desired logic levels while the selected wordline enables access to the SRAM cell. The new values overwrite the previous state of the cross-coupled inverters, and the cell stores the updated data after the wordline is deactivated.
