# Week 6 Task 5 - Clean-Clone Reproducibility

This flow regenerates and verifies the 1024-word x 32-bit single-port SKY130 SRAM from a fresh clone.

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

## Required fresh outputs

The flow checks non-empty GDS, LEF, Verilog, SPICE, and TT/SS/FF Liberty files.

It also checks the generated OpenRAM interface and runs the existing functional regression directly against the freshly generated Verilog model.

Required regression result:

`TOTAL_PASS = 144`
`TOTAL_FAIL = 0`
`TASK5_FUNCTIONAL_REGRESSION = PASS`

Required final gates:

`FRESH_GENERATED_VIEW_GATE=PASS`
`FRESH_INTERFACE_GATE=PASS`
`FRESH_FUNCTIONAL_REGRESSION_GATE=PASS`
`TASK5_CLEAN_CLONE_REPRODUCIBILITY=PASS`

The clean-clone flow does not rerun final Magic DRC, Netgen LVS, extraction, or the previously documented full-macro C-extracted transient.
