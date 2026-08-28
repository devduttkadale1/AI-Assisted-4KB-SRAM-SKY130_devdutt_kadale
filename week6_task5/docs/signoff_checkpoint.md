# Task 5 — 4 KB SRAM Sign-off Checkpoint

## SRAM target

- Technology: SKY130
- Generator: OpenRAM
- Organization: 1024 words × 32 bits
- Logical capacity: 4 KB
- Port type: single-port 1RW
- Words per row: 8
- Spare rows: 1
- Spare columns: 1
- Supply: 1.8 V
- Generated timing corners: TT, SS, FF at 25 C

## Generated views

The authoritative OpenRAM generation produced:

- GDS
- LEF
- Verilog
- SPICE
- TT Liberty
- SS Liberty
- FF Liberty

## Functional regression

Automated behavioral regression result:

- TOTAL_PASS = 144
- TOTAL_FAIL = 0
- TASK5_FUNCTIONAL_REGRESSION = PASS

Coverage includes:

- first address
- last address
- representative boundary addresses
- all-zero data
- all-one data
- alternating patterns
- walking-1
- walking-0
- deterministic pseudorandom patterns

## Physical verification

### Magic DRC

Authoritative production-GDS DRC result:

- Total DRC errors found: 0
- Result: PASS

### Extraction

Corrected full Magic extraction was converted to top-level SPICE.

Extracted top SPICE SHA-256:

35574eb6b6027fdb89d84d7d78f1e77d4130391c574c6e92cebbfc005a1b3a5b

### Netgen LVS

Final top-level comparison:

- Layout devices: 270248
- Reference devices: 270248
- Layout nets: 69617
- Reference nets: 69617
- Final result: Circuits match uniquely.
- Property error count: 0
- Result: CLEAN LVS PASS

## Authoritative artifact hashes

OpenRAM configuration:

15dab2a824d5b5e4cccbd601b606f5d8f59c899d0c40fea61883a3e0a7f597a3

Production GDS:

ea0bf4b57117d9ac8013968213333536803cb5aff8d4f8560f98b181caf66c47

Production LEF:

50e201f62e0a1489c68532dafa252f1758ebc3cee8310a0f7249b0e75ece565b

Production Verilog:

4c180c8f725c6b8f66d7b747fdc33d82a079a78822d52bdab0d849d4e381a97b

Production SPICE:

e7a22d3c381b032acc15b54d72fd83b7112483468772669ca244c8907619a873

Authoritative DRC report:

fd7a39c8a479b22f5149c3f9d09e1fc344e0dbbaeb800bddebb961709d87340d

Final extracted top SPICE:

35574eb6b6027fdb89d84d7d78f1e77d4130391c574c6e92cebbfc005a1b3a5b

Property-corrected LVS reference:

059c9ae0b4c808269170b062b1be0cc9aca670b7a11c58cd5031d787d4a49ee5

Final clean LVS report:

954e2ed9ee7c9ab1bf7c5b6a50833cacd6c5896dcbb879ab0c0451cc30b05723

## Sign-off status at this checkpoint

| Requirement | Status |
|---|---|
| OpenRAM configuration | PASS |
| GDS generation | PASS |
| LEF generation | PASS |
| Verilog generation | PASS |
| SPICE generation | PASS |
| TT/SS/FF Liberty generation | PASS |
| Automated functional regression | PASS — 144/144 |
| Magic DRC | PASS — 0 errors |
| Magic extraction | PASS |
| Netgen LVS | PASS — clean unique match |
| Characterization report | Remaining |
| Extracted targeted simulation report | Remaining |
| Liberty comparison | Remaining |
| RTL controller wrapper | Remaining |
| STA integration | Remaining |
| Maximum safe frequency analysis | Remaining |
| Clean-clone reproducibility | Remaining |
| Final repository documentation | In progress |

This checkpoint records completed work only. Remaining Task 5 requirements are not claimed complete until their corresponding evidence is generated and reviewed.
