# Task 5 — Errors, Root Causes, and Fixes

This document records the major technical issues encountered during the Week 6 4 KB SRAM sign-off flow and the evidence-based resolutions used.

## 1. OpenRAM SRAM organization constraints

### Symptom

Initial configurations without spare structures were incompatible with required SKY130 SRAM array / replica structures.

### Resolution

The final configuration uses:

- one spare row
- one spare column
- words_per_row = 8

The logical SRAM interface remains 1024 × 32 even though the generated physical interface contains spare-related internal width.

---

## 2. Functional validation evidence

### Requirement

Regression had to cover representative addresses and multiple data-pattern classes rather than only a simple smoke test.

### Resolution

A dedicated SystemVerilog regression was created covering:

- first and last addresses
- representative boundary addresses
- all-zero
- all-one
- alternating patterns
- walking-1
- walking-0
- deterministic pseudorandom data

Final result:

- 144 PASS
- 0 FAIL

No functional failures remain at this checkpoint.

---

## 3. Magic DRC debugging

### Symptom

Multiple intermediate physical implementations and targeted investigations produced DRC issues during development.

### Debugging policy

DRC violations were not waived or accepted as harmless.

Each issue was investigated before proceeding to LVS.

### Final resolution

The authoritative production GDS completed Magic DRC with:

`Total DRC errors found: 0`

The final DRC evidence is stored under:

`../verification/drc/`

---

## 4. Extraction hierarchy / polygon-subcell artifact

### Symptom

Earlier extraction experiments showed large apparent connectivity differences in repeated SRAM bitcells and replica structures.

### Root cause

Using polygon-subcell behavior during hierarchical extraction produced artificial connectivity effects in repeated child cells.

### Resolution

The corrected full extraction used the validated hierarchy-preserving recipe without the problematic polygon-subcell behavior.

The final extracted top-level SPICE is:

`../verification/extraction/task5_4kb_sram_extracted.spice`

No manual bitcell wordline joins were introduced.

---

## 5. Replica-column custom flattening experiment

### Symptom

A forensic extraction experiment appeared to reduce a replica-column device count.

### Root cause

Custom flattening of the SRAM `colend` / `colenda` structures caused an illegal parallel-device merge.

### Resolution

The custom flattening rule was rejected and removed from the corrected extraction recipe.

The official hierarchy was preserved for the final extraction.

---

## 6. Local supply-node differences

### Symptom

Several primitive or intermediate cells showed local names such as generated VDD/GND fragments during hierarchical comparison.

### Investigation

Parent-level hierarchy demonstrated that these local fragments resolve into the correct production supply rails.

### Resolution

No manual rail rename, join, or forced connection was used.

Supply connectivity was allowed to resolve through the real generated hierarchy.

---

## 7. Initial full Netgen run memory exhaustion

### Symptom

An early full top-level Netgen LVS attempt exhausted the available WSL memory.

### Resolution

WSL resources were increased to approximately:

- 12 GB RAM
- 8 GB swap

The final LVS run was launched detached from the VS Code integrated-terminal lifecycle so a UI disconnect could not terminate the verification process.

The failed memory-limited run was retained only as forensic evidence and was not treated as an LVS verdict.

---

## 8. LVS topology matched but device properties failed

### Symptom

A later full LVS comparison reported:

`Circuits match uniquely.`

but also reported property errors.

Therefore the result was not accepted as clean LVS.

### Scope

The mismatches involved 67,080 instances of:

`sky130_fd_pr__special_pfet_pass`

across five SRAM cell families.

### Root cause

The generated LVS reference used stale short-device geometry:

- W = 0.07 um
- L = 0.095 um

Fresh Magic extraction and GDS-derived evidence showed the physical devices were:

- W = 0.14 um
- L = 0.025 um

### Proof

The correction scope was reduced to exactly ten affected reference definitions.

A positive control using the corrected dimensions removed the property mismatch.

A negative control using the old dimensions reproduced the mismatch.

### Resolution

A disposable property-corrected LVS reference was created.

The original generated SRAM source was not manually altered to force LVS.

Final corrected reference:

`../verification/lvs/task5_4kb_sram.corrected_pfet.lvs.sp`

---

## 9. Final Netgen LVS

The final top-level LVS result is:

- Layout devices = 270248
- Reference devices = 270248
- Layout nets = 69617
- Reference nets = 69617
- Property errors = 0
- Final result = Circuits match uniquely.

Therefore:

**FINAL TOP-LEVEL LVS = CLEAN PASS**

Evidence:

`../verification/lvs/task5_4kb_sram.final.lvs.out`

---

## Sign-off principle

Throughout Task 5, verification mismatches were resolved through evidence and root-cause analysis.

The final result does not depend on:

- DRC waivers
- LVS property waivers
- manual unexplained net joins
- artificial supply ties
- rejected custom replica-column flattening
- modification of the production GDS to force verification success
