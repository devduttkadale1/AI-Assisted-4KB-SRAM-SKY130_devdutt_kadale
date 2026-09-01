# Task 5 — AI-Assisted SRAM Sign-off Workflow

## Objective

Generate and sign off a 1024-word × 32-bit single-port 4 KB SRAM using OpenRAM/SKY130.

## Engineering rules

The workflow used the following controls:

- do not advance while a current-stage blocker remains unresolved
- use read-only diagnostics before destructive or expensive reruns
- explicitly identify heavy runs before execution
- do not waive Magic DRC violations
- do not accept LVS property mismatches as clean LVS
- do not manually join or rename unexplained nets to force LVS
- preserve authoritative source/design artifacts
- separate forensic experiments from final sign-off evidence
- distinguish C-extracted from RC-extracted results
- do not fabricate timing when a measured transition precedes the selected trigger
- avoid repeating computationally expensive work without contradictory evidence

## Completed workflow

1. Finalize OpenRAM 1024 × 32 SKY130 configuration.
2. Generate GDS, LEF, Verilog, SPICE, and Liberty views.
3. Verify logical and spare-aware raw interface.
4. Run automated 144-vector functional regression.
5. Reach true Magic DRC = 0.
6. Correct extraction hierarchy issues without manual electrical forcing.
7. Reach final Netgen LVS unique match with property errors = 0.
8. Produce corrected C-extracted hierarchy.
9. Evaluate full-macro extracted transient feasibility.
10. Build and validate targeted extracted characterization path.
11. Characterize TT, SS, and FF timing/leakage/energy.
12. Compare targeted results with generated Liberty timing.
13. Build logical 1024 × 32 wrapper around spare-aware raw macro.
14. Run 13-case integration regression.
15. Evaluate timing constraints directly from OpenRAM Liberty.
16. Package compact evidence and manifests.
17. Audit OpenRAM Liberty-corner provenance.
18. Make runnable scripts portable.
19. Perform genuine clean-clone OpenRAM regeneration.
20. Diagnose Icarus source-order/timescale issue in fresh regression.
21. Correct reproducibility script and prove fresh regression = 144/144.
22. Audit fresh Verilog/Liberty byte identity, LEF semantic identity, SPICE semantic identity, and GDS nondeterminism.
23. Produce final documentation and sign-off summary.

## Important final interpretations

### Extraction

The final extracted hierarchy contains capacitances but no extracted resistors.

Use the term:

**C-extracted**

Do not call it RC-extracted.

### Full-macro simulation

The full C-extracted macro transient was computationally impractical in the available WSL environment.

This is a feasibility result, not a functional SRAM failure.

### Targeted characterization

R109 is a deliberately reduced extracted signal path. It is appropriate for practical TT/SS/FF measurements but is not equivalent to a complete full-macro extracted characterization.

### Liberty timing

The limiting generated Liberty model is SS:

- minimum period = 2.241 ns
- model frequency ceiling = 446.229362 MHz

No guard-band is implied.

### Timing signoff

OpenSTA/OpenROAD was not available.

Timing constraints were therefore evaluated directly from generated OpenRAM Liberty and a timing-transparent wrapper.

Do not claim a separate external STA engine passed.

### Clean-clone reproducibility

Fresh generation succeeded and fresh Verilog regression passed 144/144 after correcting the Icarus compile order.

Logical/electrical/abstract equivalence was proven.

Exact GDS physical identity was not proven and is not claimed.

## Evidence locations

- configuration: `../config/`
- generated views: `../generated/`
- regression: `../regression/`
- physical verification: `../verification/`
- characterization: `../characterization/`
- integration: `../integration/`
- reproducibility: `../reproducibility/`
- final signoff: `../docs/final_signoff.md`
