# Week 6 Task 5 — Final 4 KB SRAM Sign-off

## 1. Target

- Technology: SKY130
- Generator: OpenRAM v1.2.49
- Logical organization: 1024 words × 32 bits
- Logical capacity: 32768 bits = 4096 bytes = 4 KB
- Port: single-port 1RW
- words_per_row = 8
- spare rows = 1
- spare columns = 1
- supply = 1.8 V
- nominal temperature = 25 C

The raw OpenRAM macro interface contains spare-related extension pins:

- ADDR_WIDTH = 11
- DATA_WIDTH = 33
- NUM_WMASKS = 4
- spare_wen0 present

The logical 1024 × 32 wrapper maps:

- macro_addr = {1'b0, addr[9:0]}
- macro_din = {1'b0, wdata[31:0]}
- spare_wen0 = 1'b0
- logical read data = macro_dout[31:0]

## 2. Generated views

The authoritative committed OpenRAM result contains:

- GDS
- LEF
- Verilog
- SPICE
- TT Liberty
- SS Liberty
- FF Liberty

Generated-view status: PASS.

## 3. Functional regression

Automated regression result:

- TOTAL_PASS = 144
- TOTAL_FAIL = 0
- TASK5_FUNCTIONAL_REGRESSION = PASS

Coverage includes:

- first address
- last address
- representative boundary addresses
- all-zero
- all-one
- alternating patterns
- walking-1
- walking-0
- deterministic pseudorandom patterns

## 4. Physical verification

### Magic DRC

Authoritative production GDS:

- Total DRC errors found: 0
- Result: PASS

### Netgen LVS

Final top-level comparison:

- layout devices = 270248
- reference devices = 270248
- layout nets = 69617
- reference nets = 69617
- property errors = 0
- final verdict = Circuits match uniquely.
- Result: CLEAN PASS

No DRC waiver, LVS property waiver, unexplained net join, or artificial supply tie is part of the final sign-off result.

## 5. Extraction

The corrected full Magic hierarchy contains capacitance extraction but no extracted resistors.

Therefore the signed-off terminology is:

**C-extracted**

and not RC-extracted.

## 6. Full-macro extracted transient feasibility

The full-macro C-extracted R108 transient was manually terminated after approximately 19 h 46 min.

Observed resource behavior included:

- SIGTERM / manual termination
- approximately 10.8 GiB peak RSS
- substantial swap usage
- transient solver setup reached
- no completed transient measurement rows

Classification:

**COMPUTATIONALLY IMPRACTICAL FOR THE AVAILABLE ENVIRONMENT**

This is not classified as an SRAM functional failure and the unchanged run was not repeated.

## 7. Targeted C-extracted characterization

A reduced but physically extracted signal path was used for practical TT/SS/FF characterization.

The path includes representative:

- precharge
- bitcell
- column mux
- sense amplifier
- write driver

The wordline driver and full-macro loading were intentionally omitted.

### TT

- worst write time = 77.940700 ps
- read access SEN50→DOUT50 = 40.880500 ps
- leakage average = 3.8723319 uW
- write energy average = 95.04531 fJ
- read energy average = 31.37364 fJ

### SS

- minimum tested passing SEN delay = 1.00 ns
- worst write time = 117.096 ps
- read access SEN50→DOUT50 = 71.808900 ps
- leakage average = 7.085295 uW
- write energy average = 177.78663 fJ
- read energy average = 42.39837 fJ

### FF

DOUT became valid before SEN50, so a fabricated zero SEN→DOUT delay is not reported.

- WL50→DOUT50 = 392.222 ps
- DOUT50 occurs 107.778 ps before SEN50
- worst write time = 60.619700 ps
- leakage average = 8.2157355 uW
- write energy average = 101.2986 fJ
- read energy average = 42.07302 fJ

Targeted characterization verdict: PASS.

## 8. Liberty comparison

Generated Liberty corners:

| Corner | Read max | Setup | Hold | Min pulse | Min period | Model ceiling |
|---|---:|---:|---:|---:|---:|---:|
| TT | 0.551 ns | 0.103 ns | -0.056 ns | 1.0185 ns | 2.037 ns | 490.918017 MHz |
| SS | 0.606 ns | 0.103 ns | -0.056 ns | 1.1205 ns | 2.241 ns | 446.229362 MHz |
| FF | 0.496 ns | 0.103 ns | -0.056 ns | 0.917 ns | 1.834 ns | 545.256270 MHz |

The R109 numbers are targeted local-path C-extracted measurements and are not expected to equal full-macro Liberty delays.

Reasons include:

- idealized wordline control
- omitted full-macro loading
- reduced local path
- different measurement definitions

The Liberty internal-power scalars are not converted into event energy because the generated files do not define a usable `power_unit`.

## 9. Integration

Logical wrapper:

`../integration/task5_4kb_sram_1024x32_wrapper.v`

Integration regression:

- 13 PASS
- 0 FAIL

The wrapper preserves the logical 1024 × 32 interface and disables spare address/data functionality.

## 10. Timing-model signoff

No OpenSTA/OpenROAD executable was available.

Therefore timing signoff was performed directly from the generated OpenRAM Liberty constraints together with the timing-transparent wrapper.

Limiting characterized corner:

- SS minimum period = 2.241 ns
- maximum characterized model frequency = 446.229362 MHz
- setup = 0.103 ns
- hold = -0.056 ns
- minimum pulse width = 1.1205 ns

This value is the **maximum characterized Liberty-model limit**, not a guard-banded recommended system frequency.

No claim is made that a separate external STA engine passed.

## 11. Clean-clone reproducibility

A genuine fresh local Git clone was created from checkpoint:

`27715f2eda62accc250a50e2b99c8f11da69e23d`

Fresh OpenRAM generation completed successfully:

- OpenRAM generation status = 0
- seven required views generated
- fresh interface gate = PASS

The initial scripted fresh regression failed 0/144 because Icarus compiled the generated model before the testbench, causing a timescale/source-order issue.

After proving the root cause, the reproducibility script was corrected to compile the testbench first.

Corrected fresh-model regression:

- TOTAL_PASS = 144
- TOTAL_FAIL = 0
- TASK5_FUNCTIONAL_REGRESSION = PASS

### Clean-clone view comparison

- Verilog: byte-identical
- TT Liberty: byte-identical
- SS Liberty: byte-identical
- FF Liberty: byte-identical
- LEF: same size, 87-pin set, pin attributes, pin geometry, and OBS
- SPICE: same 103 subcircuit names, ports, bodies, and global statements

### GDS reproducibility limitation

The fresh and committed GDS contain the same 194 structure names.

- 193 child structures matched
- only the top-level `task5_4kb_sram` structure differed
- exact flattened/hierarchical geometry equality was not established
- exact or bit-for-bit GDS reproducibility is therefore **not claimed**

The committed authoritative GDS retains its existing DRC=0 and clean-LVS sign-off.

Clean-clone result:

**PASS for successful regeneration and logical/electrical/abstract macro equivalence, with exact GDS physical nondeterminism explicitly documented.**

## 12. Key authoritative hashes

- config: `15dab2a824d5b5e4cccbd601b606f5d8f59c899d0c40fea61883a3e0a7f597a3`
- GDS: `ea0bf4b57117d9ac8013968213333536803cb5aff8d4f8560f98b181caf66c47`
- LEF: `50e201f62e0a1489c68532dafa252f1758ebc3cee8310a0f7249b0e75ece565b`
- Verilog: `4c180c8f725c6b8f66d7b747fdc33d82a079a78822d52bdab0d849d4e381a97b`
- SPICE: `e7a22d3c381b032acc15b54d72fd83b7112483468772669ca244c8907619a873`
- TT Liberty: `128ace55197b5f0058588a634f99101ee3a2bc6c73428115d2c8b3c1ce00d1bc`
- SS Liberty: `d33983f0f10a6e53dae494434838c2ec3faaa777ecda417985cfc64fc42826e3`
- FF Liberty: `58a8f5df93601f6ff0d2d61c7a0e046a7bec557515e2fb3b0da16766384f72da`
- regression log: `657d1d28df897796a83fbd17192b2ad42e6c106736ef1d610d5d1dc5e3db0257`
- DRC report: `fd7a39c8a479b22f5149c3f9d09e1fc344e0dbbaeb800bddebb961709d87340d`
- final LVS report: `954e2ed9ee7c9ab1bf7c5b6a50833cacd6c5896dcbb879ab0c0451cc30b05723`
- R109 characterization TSV: `5e58c6b918a1a3bfe586db9d2b2806243b6ebe99067cf1d0dfbc6552c7dd8c3c`
- integration run: `fa5a987c0744d4ed0acb384235dbb44da8a3d7b3233d001dd43020ab0e6c5758`
- timing TSV: `dcf8b79c3dc6a013b312d49aad661b5f2587bf2fbe05113e1e61eeba651e285f`

## 13. Final sign-off table

| Requirement | Final status |
|---|---|
| OpenRAM configuration | PASS |
| GDS / LEF / Verilog / SPICE generation | PASS |
| TT / SS / FF Liberty generation | PASS |
| Functional regression | PASS — 144/144 |
| Magic DRC | PASS — 0 |
| Netgen LVS | PASS — unique match, property errors 0 |
| C-extraction | PASS |
| Full-macro transient | FEASIBILITY LIMIT DOCUMENTED |
| TT / SS / FF targeted C-extracted characterization | PASS |
| Liberty comparison | PASS |
| Logical 1024 × 32 wrapper | PASS |
| Integration regression | PASS — 13/13 |
| Timing-model constraint analysis | PASS |
| Maximum characterized model frequency | 446.229362 MHz at SS |
| External STA engine | NOT AVAILABLE / NOT CLAIMED |
| Clean-clone regeneration | PASS |
| Exact GDS reproducibility | NOT CLAIMED |
| Final documentation | PASS |

## 14. Final conclusion

Week 6 Task 5 is complete at the documented scope.

The authoritative committed SRAM has:

- complete generated implementation views
- 144/144 behavioral regression
- zero-error Magic DRC
- clean unique Netgen LVS
- C-extraction
- documented full-macro simulation feasibility limit
- practical TT/SS/FF targeted extracted characterization
- Liberty comparison
- logical wrapper integration
- timing-model constraint analysis
- clean-clone regeneration evidence

All remaining limitations are explicitly documented rather than hidden or waived.
