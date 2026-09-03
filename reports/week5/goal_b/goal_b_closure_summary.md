# Week 5 Task 4 — Goal-B Closure Summary

## Final status

**INFEASIBLE_IN_NORMAL_OPENRAM_FLOW**

Target: exact 2-word x 16-bit, single-port, 1.8 V SKY130 SRAM using the normal unmodified OpenRAM flow.

## Passed

- Week 6 repository/tag protection.
- Historical artifact identity audit.
- Exact organization analysis.
- Pristine OpenRAM source-integrity audit.
- Exhaustive normal organization audit.
- Alternate decoder override audit.

## Decisive blocker

The exact memory requires a one-bit logical address and therefore a 0-input or 1-input row-decoder organization. OpenRAM 1.2.49's normal row-address path uses the hierarchical decoder, which does not support those tiny decoder organizations.

No normal SKY130 override was found that preserves the exact interface while supplying a supported small decoder.

## Historical findings

- `task4_sram_2x16` = 16 words x 16 bits.
- `sram_2_16_1_sky130` = 16 words x 2 bits.
- Historical `num_words=2, words_per_row=8` was an invalid organization.
- Historical Week 5 physical verification was not clean DRC/LVS sign-off.

## Stop-rule action

OpenRAM core, SKY130 technology, PDK cells, decoder logic, and generated GDS were not modified to force the target.

Stages B2 through B9 are intentionally N/A for the literal exact target.

Week 6 Task 5 remains protected and unchanged.
