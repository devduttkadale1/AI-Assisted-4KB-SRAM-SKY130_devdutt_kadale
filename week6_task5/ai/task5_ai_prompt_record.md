# Week 6 Task 5 AI Prompt Record

This file records the material AI prompts and instructions that drove the
Week 6 Task 5 SRAM implementation and sign-off. Earlier internship prompt
history remains in `ai_workflow/prompts.md`.

## Assigned Task Prompt

**Task 5 – Week 6:** Apply the verified Week 5 SRAM validation flow to
generate and sign off the complete 1024-word × 32-bit, single-port 4 KB SRAM
using OpenRAM and SKY130. Use ChatGPT, Codex or another AI tool to create and
debug the OpenRAM configuration, verify address width, data width, control
signals, power pins and generated hierarchy, and generate the required GDS,
LEF, Liberty, Verilog and SPICE views. Build an automated functional
regression that tests writes and reads across representative addresses
including first, last and boundary addresses, using all-0, all-1,
alternating, walking-1/walking-0 and pseudo-random data patterns, and
automatically reports PASS/FAIL. Run the available OpenRAM
physical-verification flow including Magic DRC, Netgen LVS and extraction,
and use AI-assisted debugging to classify and resolve violations without
manually accepting incorrect results. Characterize the final SRAM at
representative TT, SS and FF process conditions where computationally
practical and report read access time, write time, leakage power and
read/write energy. Compare these results against the OpenRAM-generated
Liberty timing values and explain significant differences. Use the generated
Liberty and LEF views to integrate the 4 KB SRAM as a hard macro inside a
simple RTL memory-controller wrapper and perform static timing analysis to
verify setup, hold and SRAM interface timing at the target clock frequency;
identify the maximum safe operating frequency from the available timing
model. Do not attempt exhaustive transistor-level post-layout simulation of
all 1024 addresses, as this is computationally unnecessary; use targeted
extracted simulations together with large-scale functional regression.
Finally perform a clean-clone reproducibility test and demonstrate that the
4 KB SRAM can be regenerated and verified from the repository instructions.
Submit all AI prompts, OpenRAM configurations, generated views, regression
scripts, DRC/LVS reports, timing/power results, STA reports, wrapper
integration, errors/fixes and a final sign-off table through GitHub.

## Session Control / Verification Prompts

- Give exactly two shell commands per response so each result can be checked
  before the next step.
- Do not advance while the current stage contains an unresolved blocker,
  error, mismatch or verification ambiguity.
- Diagnose pasted command output before issuing the next commands.
- Warn explicitly before heavy operations such as full DRC, LVS, extraction,
  characterization or long simulations.
- Do not manually waive DRC/LVS violations or force mismatched nets to pass.
- Preserve authoritative generated/extracted source files; use simulation-only
  normalization only where required.
- Do not rerun expensive verification once a clean authoritative result is
  already established unless contradictory evidence appears.

## OpenRAM Configuration / Generation Prompt

Create and debug the SKY130 OpenRAM configuration for the logical
1024-word × 32-bit single-port SRAM, confirm its 4 KB capacity, understand
the spare-row/spare-column physical interface, and generate GDS, LEF,
Liberty, Verilog and SPICE outputs.

## Interface / Hierarchy Verification Prompt

Audit logical versus raw macro address/data widths, clock/chip-select/write
control, write masks, spare controls, power pins and generated hierarchy.
Explain and correctly map the raw spare-related 11-bit address and 33-bit
data interface to the logical 10-bit address / 32-bit data interface.

## Functional Regression Prompt

Build an automated regression covering first, last and boundary addresses
with all-zero, all-one, alternating, walking-one, walking-zero and
pseudo-random data, and report automatic PASS/FAIL totals.

## Physical Verification Prompt

Run Magic DRC, diagnose every remaining violation until the authoritative
result is zero, then run Netgen LVS and require unique circuit matching with
zero property errors. Perform extraction only after the physical-verification
gates pass.

## Extracted Simulation / Characterization Prompt

Avoid exhaustive full-macro transistor simulation of all 1024 addresses.
Establish computational feasibility, then use a representative targeted
C-extracted SRAM path to characterize TT, SS and FF read access, write time,
leakage power and read/write energy. Do not describe the C-only extraction
as RC-extracted.

## Liberty Comparison Prompt

Extract TT/SS/FF Liberty setup, hold, read timing, minimum pulse width and
minimum period values. Compare them with targeted extracted measurements and
explain differences caused by abstraction, loading and the targeted path.

## Wrapper Integration Prompt

Create a logical 1024×32 RTL wrapper around the raw OpenRAM interface,
disable spare resources during normal operation, and verify wrapper behavior
with representative functional tests.

## Static Timing Analysis Prompt

Use the generated Liberty timing model with the logical hard-macro wrapper to
verify setup, hold, pulse width, minimum period and clock-to-DOUT interface
timing. After OpenSTA was found unavailable initially, build OpenSTA 3.1.0
from source with CUDD 3.0.0, create a Liberty-compatible STA abstraction, and
run genuine SS-corner STA.

The final OpenSTA results are:

- setup slack: +2.138 ns
- hold slack: +0.056 ns
- high/low pulse-width slack: 0.000 ns at the characterized boundary
- minimum-period slack: 0.000 ns at 2.241 ns
- maximum characterized SS model frequency: 446.229362 MHz
- characterized clock-to-DOUT delays reproduced exactly:
  0.446 ns, 0.478 ns and 0.606 ns at the three Liberty output-load points
- OpenSTA warnings/errors: 0 / 0

## Clean-Clone Reproducibility Prompt

Perform a genuine fresh clone, regenerate the SRAM from repository
instructions, rerun the functional regression, compare generated views and
document any nondeterminism without falsely claiming exact GDS identity.

## Final Sign-Off / GitHub Prompt

Package generated views, functional results, DRC/LVS evidence,
characterization, Liberty comparison, wrapper integration, STA evidence,
reproducibility evidence, errors/fixes, AI workflow and the final sign-off
table. Audit hashes and repository cleanliness, commit, push and verify that
the GitHub remote HEAD exactly matches the final local commit.
