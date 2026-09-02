# Week 6 Task 5 — Clone and Reproduce the 4 KB SRAM

This document explains how to clone this repository and reproduce the main
Week 6 Task 5 SRAM workflow.

The final design is a:

- **1024-word × 32-bit single-port SRAM**
- **32,768 bits**
- **4096 bytes / 4 KB**
- **SKY130A technology**
- generated using **OpenRAM v1.2.49**

The repository contains the final configuration, generated SRAM views,
functional regression, physical-verification evidence, characterization,
integration, OpenSTA STA, clean-clone evidence, and final sign-off
documentation.

---

## 1. Reproducibility Summary

A clean-clone reproduction was already performed during Task 5.

The demonstrated result was:

- OpenRAM generation: **PASS**
- required generated SRAM views: **PASS**
- functional regression: **144 PASS / 0 FAIL**
- Verilog reproduction: **PASS**
- TT Liberty reproduction: **PASS**
- SS Liberty reproduction: **PASS**
- FF Liberty reproduction: **PASS**
- LEF semantic equivalence: **PASS**
- SPICE semantic equivalence: **PASS**

### Important GDS qualification

Exact regenerated GDS bit-for-bit or geometry identity is **not claimed**.

The clean-clone investigation showed some top-level GDS nondeterminism even
though the logical, electrical, functional, Liberty, LEF, and SPICE results
reproduced correctly.

The committed signed-off GDS remains the authoritative physical artifact.

See:

```text
week6_task5/reproducibility/clean_clone_evidence/
week6_task5/reproducibility/clean_clone_evidence/gds_reproducibility_note.txt
```

---

## 2. Clone the Repository

Run:

```bash
git clone \
  https://github.com/devduttkadale1/AI-Assisted-4KB-SRAM-SKY130_devdutt_kadale.git
```

Enter the repository:

```bash
cd AI-Assisted-4KB-SRAM-SKY130_devdutt_kadale
```

Check the repository state:

```bash
git status
git log -3 --oneline
git rev-parse HEAD
```

A fresh clone should have a clean worktree.

---

## 3. Required External Tools

The GitHub repository contains the project files and verification evidence,
but EDA tools must be installed separately.

For the clean-clone regeneration flow, install:

- Linux / Ubuntu / WSL
- Python 3
- Git
- OpenRAM v1.2.49
- OpenRAM Python virtual environment
- SKY130A PDK
- Icarus Verilog (`iverilog` and `vvp`)

For deeper independent sign-off reproduction, also install:

- Magic VLSI
- Netgen
- ngspice
- OpenSTA 3.1.0

---

## 4. OpenRAM and SKY130 Paths

The reproduction script uses:

```text
OPENRAM_ROOT=$HOME/VLSI/Tools/OpenRAM
PDK_ROOT=/usr/local/share/pdk
```

The expected SKY130 installation is therefore:

```text
/usr/local/share/pdk/sky130A
```

These paths are machine-specific.

If OpenRAM is installed somewhere else:

```bash
export OPENRAM_ROOT=/your/path/to/OpenRAM
```

If the PDK is installed somewhere else:

```bash
export PDK_ROOT=/your/path/to/pdk
```

For example:

```bash
export OPENRAM_ROOT=$HOME/VLSI/Tools/OpenRAM
export PDK_ROOT=/usr/local/share/pdk
```

---

## 5. Verify the Environment

Check OpenRAM:

```bash
test -f "$OPENRAM_ROOT/sram_compiler.py" \
  && echo "OPENRAM_COMPILER=FOUND" \
  || echo "OPENRAM_COMPILER=MISSING"
```

Check the OpenRAM virtual environment:

```bash
test -f "$OPENRAM_ROOT/venv/bin/activate" \
  && echo "OPENRAM_VENV=FOUND" \
  || echo "OPENRAM_VENV=MISSING"
```

Check SKY130:

```bash
test -d "${PDK_ROOT:-/usr/local/share/pdk}/sky130A" \
  && echo "SKY130A_PDK=FOUND" \
  || echo "SKY130A_PDK=MISSING"
```

Check Icarus Verilog:

```bash
iverilog -V
vvp -V
```

Do not start SRAM regeneration until these required checks pass.

---

## 6. Final SRAM Configuration

The final OpenRAM configuration is:

```text
week6_task5/config/task5_4kb_sram.py
```

Inspect it with:

```bash
sed -n '1,220p' week6_task5/config/task5_4kb_sram.py
```

The logical design target is:

```text
Words       = 1024
Word width  = 32 bits
Capacity    = 32768 bits
Capacity    = 4096 bytes / 4 KB
Port type   = single read/write port
```

---

## 7. Run the Supported Clean-Clone Reproduction

The repository contains:

```text
week6_task5/reproducibility/run_task5_reproducibility.sh
```

Inspect it before running:

```bash
sed -n '1,260p' \
  week6_task5/reproducibility/run_task5_reproducibility.sh
```

The script automatically uses:

```text
OPENRAM_ROOT
PDK_ROOT
TASK5_REPRO_OUT
```

Fresh outputs are written outside the repository by default:

```text
/tmp/task5_4kb_sram_repro_$USER
```

To use another location:

```bash
export TASK5_REPRO_OUT=/your/writable/output/path
```

Run the reproduction:

```bash
bash week6_task5/reproducibility/run_task5_reproducibility.sh
```

---

## 8. Expected Generated Views

The clean-clone flow checks these seven generated views:

```text
task5_4kb_sram.gds
task5_4kb_sram.lef
task5_4kb_sram.v
task5_4kb_sram.sp
task5_4kb_sram_TT_1p8V_25C.lib
task5_4kb_sram_SS_1p8V_25C.lib
task5_4kb_sram_FF_1p8V_25C.lib
```

The authoritative committed versions are stored under:

```text
week6_task5/generated/
```

---

## 9. Functional Regression

The clean-clone script automatically runs the SRAM functional regression.

The regression covers representative addresses including:

- first address
- last address
- boundary addresses

Patterns include:

- all zeros
- all ones
- alternating patterns
- walking one
- walking zero
- deterministic pseudo-random patterns

Expected result:

```text
TOTAL_PASS=144
TOTAL_FAIL=0
TASK5_FUNCTIONAL_REGRESSION=PASS
FRESH_FUNCTIONAL_REGRESSION_GATE=PASS
```

Therefore:

```text
144 PASS
0 FAIL
```

is the required clean-clone functional result.

---

## 10. Important Icarus Compile Ordering

The regression testbench must be compiled before the generated OpenRAM Verilog
model.

Correct ordering:

```text
1. task5_4kb_regression_tb.sv
2. task5_4kb_sram.v
```

This ordering is already implemented in:

```text
week6_task5/reproducibility/run_task5_reproducibility.sh
```

---

## 11. Audit the Submitted Final Evidence

The final sign-off documentation is located at:

```text
week6_task5/docs/final_signoff.md
```

The final artifact manifest is:

```text
week6_task5/docs/final_artifact_manifest.tsv
```

The manifest contains **40 validated artifacts**.

Important evidence is also available under:

```text
week6_task5/regression/
week6_task5/verification/
week6_task5/characterization/
week6_task5/integration/
week6_task5/reproducibility/
week6_task5/ai/
```

---

## 12. Physical Verification Results

The authoritative physical sign-off achieved:

```text
Magic DRC violations = 0
```

Final Netgen LVS:

```text
Circuits match uniquely.
```

Device count:

```text
270248 vs 270248
```

Net count:

```text
69617 vs 69617
```

Property errors:

```text
0
```

Physical-verification evidence is stored under:

```text
week6_task5/verification/
```

These stages are computationally more expensive and are intentionally not
rerun by the clean-clone functional reproduction script.

---

## 13. Extraction Scope

The final extracted characterization must be described as:

```text
C-extracted
```

It must **not** be described as RC-extracted.

The extracted hierarchy contains capacitance information but does not contain
an extracted resistance network.

---

## 14. TT / SS / FF Characterization

Targeted physically C-extracted characterization was completed for:

```text
TT
SS
FF
```

Representative results:

| Corner | Write Time | Read Metric |
|---|---:|---:|
| TT | 77.940700 ps | 40.880500 ps |
| SS | 117.096 ps | 71.808900 ps |
| FF | 60.619700 ps | WL50→DOUT50 = 392.222 ps |

Characterization evidence is stored under:

```text
week6_task5/characterization/
```

These are targeted extracted-path measurements, not full-macro RC-extracted
timing values.

---

## 15. Full-Macro Extracted Simulation Note

A full-macro C-extracted transient simulation was attempted.

It was manually terminated after approximately:

```text
19 hours 46 minutes
```

because of very high memory and swap usage.

This was classified as:

```text
COMPUTATIONALLY_IMPRACTICAL_MANUALLY_TERMINATED
```

It was **not** classified as an SRAM functional failure.

The unchanged full-macro transient should not be rerun simply to reproduce a
known computational feasibility result.

---

## 16. RTL Integration

The logical SRAM wrapper is:

```text
week6_task5/integration/task5_4kb_sram_1024x32_wrapper.v
```

Logical interface:

```text
Address width = 10 bits
Data input    = 32 bits
Data output   = 32 bits
```

Integration regression result:

```text
13 PASS
0 FAIL
```

---

## 17. OpenSTA Static Timing Analysis

External STA was completed using:

```text
OpenSTA 3.1.0
```

Important files:

```text
week6_task5/integration/sta_signoff/task5_4kb_sram_sta_wrapper.v
week6_task5/integration/sta_signoff/task5_4kb_sram_opensta_ss.sdc
week6_task5/integration/sta_signoff/run_opensta_ss.tcl
week6_task5/integration/sta_signoff/run_opensta_ss_dout_charpoint.tcl
```

If OpenSTA is installed as `sta`, run:

```bash
sta -no_splash -exit \
  week6_task5/integration/sta_signoff/run_opensta_ss.tcl
```

Expected SS results:

```text
Setup slack               = +2.138 ns
Hold slack                = +0.056 ns
Minimum period            = 2.241 ns
OpenSTA warnings          = 0
OpenSTA errors            = 0
Reported violations       = 0
```

Maximum characterized SS model frequency:

```text
446.229362 MHz
```

Important:

> **446.229362 MHz is the maximum characterized Liberty-model boundary.**
> It is not a guard-banded operating-frequency recommendation.

The characterized DOUT load points are:

```text
0.0017225 pF -> 0.446 ns
0.0068900 pF -> 0.478 ns
0.0275600 pF -> 0.606 ns
```

OpenSTA summary:

```text
week6_task5/integration/sta_signoff/task5_4kb_sram_opensta_summary.md
```

---

## 18. Recommended Reproduction Levels

## Level A — Audit the Submitted Project

Requires only Git and standard command-line tools.

1. Clone the repository.
2. Check the commit.
3. Inspect `final_signoff.md`.
4. Inspect `final_artifact_manifest.tsv`.
5. Review regression, DRC, LVS, characterization, integration and STA evidence.

This is the fastest way to audit the submitted project.

---

## Level B — Regenerate and Functionally Verify

Requires OpenRAM, SKY130A and Icarus Verilog.

1. Clone the repository.
2. Install/configure OpenRAM v1.2.49.
3. Install/configure SKY130A.
4. Set `OPENRAM_ROOT`.
5. Set `PDK_ROOT`.
6. Inspect `run_task5_reproducibility.sh`.
7. Run the script.
8. Verify all seven generated views.
9. Confirm `144 PASS / 0 FAIL`.
10. Preserve the documented GDS nondeterminism qualification.

This reproduction level was successfully demonstrated during Task 5.

---

## Level C — Full Independent Sign-Off

Requires the complete EDA toolchain and significantly more computation.

After completing Level B:

1. reproduce Magic DRC
2. reproduce extraction
3. reproduce Netgen LVS
4. reproduce targeted TT/SS/FF characterization
5. reproduce Liberty comparison
6. reproduce RTL integration
7. reproduce OpenSTA SS timing analysis
8. reproduce characterized DOUT load points

Do not advance to the next verification stage if the current stage contains an
unresolved failure or mismatch.

---

## 19. Expected Final Project State

A successful audit or reproduction should agree with:

```text
SRAM organization              1024 × 32
Capacity                       4 KB
Functional regression          144 PASS / 0 FAIL
Magic DRC                      0 violations
Netgen LVS                     Circuits match uniquely
LVS devices                    270248 / 270248
LVS nets                       69617 / 69617
LVS property errors            0
Extraction characterization    C-extracted
TT/SS/FF characterization      complete
RTL integration                13 PASS / 0 FAIL
External STA                   OpenSTA 3.1.0 PASS
SS setup slack                 +2.138 ns
SS hold slack                  +0.056 ns
SS minimum period              2.241 ns
SS model frequency boundary    446.229362 MHz
Final artifact manifest        40 validated artifacts
```

---

## 20. Primary Evidence Index

Start with these files:

```text
README.md
TASK_STATUS.md
week6_task5/docs/final_signoff.md
week6_task5/docs/final_artifact_manifest.tsv
week6_task5/reproducibility/README.md
week6_task5/reproducibility/clean_clone_evidence/clean_clone_summary.txt
week6_task5/reproducibility/clean_clone_evidence/gds_reproducibility_note.txt
week6_task5/integration/sta_signoff/task5_4kb_sram_opensta_summary.md
week6_task5/ai/task5_ai_prompt_record.md
week6_task5/ai/task5_errors_and_fixes.md
```

---

## 21. Final Reproducibility Statement

A new user can clone this repository and immediately audit the complete
submitted Task 5 evidence.

With a compatible OpenRAM/SKY130 environment, the user can regenerate the SRAM
and reproduce the functional regression.

With the complete EDA toolchain and sufficient compute resources, the user can
also independently repeat the physical-verification, characterization,
integration, and OpenSTA stages.

Exact regenerated GDS identity is not claimed.

The committed signed-off GDS remains the authoritative physical reference.
