# Week 6 Task 5 — Clean-Clone Reproducibility

This flow regenerates and verifies the 1024-word × 32-bit single-port SKY130 SRAM from a fresh repository clone.

## Requirements

- OpenRAM SKY130 installation
- OpenRAM Python virtual environment
- SKY130 PDK
- Icarus Verilog: `iverilog` and `vvp`

Default OpenRAM location:

`$HOME/VLSI/Tools/OpenRAM`

Override when required:

`export OPENRAM_ROOT=/path/to/OpenRAM`

## Run

From the root of a fresh clone:

`bash week6_task5/reproducibility/run_task5_reproducibility.sh`

Fresh outputs are written outside the repository by default:

`/tmp/task5_4kb_sram_repro_$USER`

Override with:

`export TASK5_REPRO_OUT=/some/writable/path`

## Required generated outputs

The flow requires non-empty:

- GDS
- LEF
- Verilog
- SPICE
- TT Liberty
- SS Liberty
- FF Liberty

It verifies the raw OpenRAM interface and runs the functional regression against the freshly generated Verilog.

Required regression result:

- `TOTAL_PASS = 144`
- `TOTAL_FAIL = 0`
- `TASK5_FUNCTIONAL_REGRESSION = PASS`

## Icarus source ordering

The testbench must be compiled before the generated OpenRAM Verilog model.

The clean-clone investigation proved that compiling the model first caused a timescale/source-order issue and produced `x` read data for all 144 checks.

The reproducibility script therefore compiles:

1. regression testbench
2. generated OpenRAM Verilog

Corrected result:

- 144 PASS
- 0 FAIL

## Reproducibility scope

The successful clean-clone run established:

- Verilog byte identity
- TT/SS/FF Liberty byte identity
- LEF semantic equivalence
- SPICE semantic equivalence
- fresh functional regression PASS

Exact GDS bitwise or physical-layout reproducibility is **not claimed**.

The fresh GDS had the same set of 194 structure names, but the top-level macro structure differed while 193 child structures matched.

The committed authoritative GDS retains its existing:

- Magic DRC = 0
- clean Netgen LVS

The clean-clone flow intentionally does not rerun final Magic DRC, Netgen LVS, extraction, R108 full-macro transient, or R109 characterization.

See:

`clean_clone_evidence/`

for the preserved evidence and GDS reproducibility note.
