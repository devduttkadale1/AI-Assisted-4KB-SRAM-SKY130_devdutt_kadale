# Task 5 — AI-Assisted SRAM Sign-off Workflow

## Objective

Generate and sign off a 1024-word × 32-bit single-port 4 KB SRAM using OpenRAM v1.2.49 on SKY130.

The workflow used AI assistance for configuration review, controlled debugging, functional regression planning, DRC/LVS diagnosis, extraction analysis, evidence packaging, and repository documentation.

## Engineering rules used during Task 5

- Do not advance while the current verification stage has an unresolved blocker.
- Diagnose failures using read-only or targeted evidence before modifying source.
- Warn before computationally expensive OpenRAM, Magic, extraction, or Netgen operations.
- Preserve authoritative generated artifacts and hashes.
- Do not manually waive DRC or LVS violations.
- Do not manually rename, join, or force-connect unexplained nets to obtain an LVS match.
- Prove a suspected root cause at the smallest useful hierarchy before applying a broader correction.
- Keep failed forensic experiments separate from the final sign-off recipe.
- Treat Netgen execution success separately from LVS electrical equivalence.
- Treat intermediate hierarchical mismatches separately from the final top-level LVS verdict.

## Final SRAM configuration

Authoritative configuration:

`../config/task5_4kb_sram.py`

Key organization:

- 1024 words
- 32 logical data bits
- 4 KB logical capacity
- single-port 1RW
- words_per_row = 8
- one spare row
- one spare column
- SKY130
- 1.8 V
- 25 C

## Generated implementation views

The final OpenRAM generation produced:

- GDS
- LEF
- Verilog
- SPICE
- TT Liberty
- SS Liberty
- FF Liberty

Repository location:

`../generated/`

## Functional regression

The automated regression verifies:

- first address
- last address
- representative row/column boundary addresses
- all-zero data
- all-one data
- alternating data patterns
- walking-1
- walking-0
- deterministic pseudorandom patterns

Final result:

- TOTAL_PASS = 144
- TOTAL_FAIL = 0
- TASK5_FUNCTIONAL_REGRESSION = PASS

Evidence:

`../regression/`

## Physical sign-off workflow

### Magic DRC

The authoritative production GDS completed Magic DRC with:

- Total DRC errors found: 0

Evidence:

`../verification/drc/`

### Magic extraction

The corrected extraction flow generated the final hierarchical top-level extracted SPICE:

`../verification/extraction/task5_4kb_sram_extracted.spice`

SHA-256:

`35574eb6b6027fdb89d84d7d78f1e77d4130391c574c6e92cebbfc005a1b3a5b`

### Netgen LVS

Final top-level result:

- Layout devices: 270248
- Reference devices: 270248
- Layout nets: 69617
- Reference nets: 69617
- Property errors: 0
- Final result: Circuits match uniquely.

Evidence:

`../verification/lvs/`

## Remaining Task 5 workflow

The following stages remain after this repository checkpoint:

1. Targeted extracted simulations
2. TT / SS / FF characterization summary
3. Read access timing
4. Write timing
5. Leakage power
6. Read energy
7. Write energy
8. Comparison with OpenRAM Liberty
9. Hard-macro controller integration
10. STA
11. Maximum safe operating frequency
12. Clean-clone reproducibility
13. Final project documentation
