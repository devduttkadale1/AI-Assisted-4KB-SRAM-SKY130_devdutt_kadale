# AI Mistakes and Corrections

## Case 1

### Initial AI Response

Assumed logical organization and physical organization were identical.

```text
1024 × 32
=
1024 Rows × 32 Columns
```

### Correction

OpenRAM internally reorganizes memory.

```text
128 Rows × 256 Columns
8 Words Per Row
```

### Lesson

Logical memory organization and physical implementation are not always the same.

---

## Case 2

### Initial AI Response

Suggested that generated LIB files were signoff-quality timing models.

### Correction

Repository logs indicate analytical timing models were used.

### Lesson

Generated outputs must always be validated against tool logs.

---

## Case 3

### Initial AI Response

Focused only on OpenRAM execution.

### Correction

Internship Week 1 objective emphasized understanding architecture and flow rather than generating a working SRAM macro.

### Lesson

Always verify AI recommendations against project requirements.

---

## Key Takeaway

AI can accelerate learning and exploration, but every technical finding must be independently verified before being documented.

## Case 4

### Initial AI Response
Suggested `.lib "ngspice/sky130.lib.spice" tt` path for SKY130 models

### Correction
Correct path is `.lib "combined/sky130.lib.spice" tt`
ngspice/ directory has incomplete model bindings

### Lesson
Always verify PDK library paths against actual installed directory structure before trusting AI suggestions.