# Verified AI Findings

## Verified Topic 1

### Topic

1024 × 32 SRAM Memory Size

### AI Finding

```text
1024 × 32 = 32768 bits = 4096 bytes = 4 KB
```

### Verification

Confirmed using memory size calculations and OpenRAM configuration files.

Status: VERIFIED

---

## Verified Topic 2

### Topic

Address Width

### AI Finding

```text
log2(1024) = 10 bits
```

### Verification

Confirmed using SRAM addressing principles.

Status: VERIFIED

---

## Verified Topic 3

### Topic

Physical Organization

### AI Finding

```text
128 Rows
256 Columns
8 Words Per Row
```

### Verification

Cross-checked against OpenRAM-generated reports and compiler outputs.

Status: VERIFIED

---

## Verified Topic 4

### Topic

OpenRAM Outputs

### AI Finding

Generated outputs include:

* GDS
* LEF
* LIB
* SPICE
* Verilog

### Verification

Confirmed through SRAM_SKY130 repository output directories.

Status: VERIFIED

---

## Verified Topic 5

### Topic

SKY130 Technology Integration

### AI Finding

SKY130 provides:

* Design rules
* Layer information
* Device models
* Characterization support

### Verification

Confirmed through SKY130 technology directory structure.

Status: VERIFIED

## Verified Topic 6

### Topic
SNM Value — SKY130 TT Corner

### AI Finding
SNM ≈ 280–320 mV at VDD=1.8V, TT process corner

### Verification
Confirmed via butterfly curve simulation in ngspice

Status: VERIFIED

---

## Verified Topic 7

### Topic
Cell Ratio for Read Stability

### AI Finding
CR = W_pulldown / W_access > 1.5 prevents read disturb

### Verification
Confirmed via read disturb simulation — Q node stable

Status: VERIFIED

---

## Verified Topic 8

### Topic
Write Ratio for Write Margin

### AI Finding
WR = W_access / W_pullup > 1 required for successful write

### Verification
Confirmed via write margin simulation — latch flips reliably at γ ≈ 1.2

Status: VERIFIED