# OpenRAM Command Log

This document records the commands used to install, configure, execute and verify the OpenRAM SRAM compiler during Week 5.

---

## Activate Python Virtual Environment

```bash
cd ~/VLSI/Tools/OpenRAM
source venv/bin/activate
```

---

## Verify Python

```bash
python3 --version
```

---

## Verify OpenRAM Installation

```bash
python3 -c "import openram; print(openram.__file__)"
```

---

## Export Required Environment Variables

```bash
export OPENRAM_HOME=~/VLSI/Tools/OpenRAM/compiler
export OPENRAM_TECH=~/VLSI/Tools/OpenRAM/technology
export PDK_ROOT=/usr/local/share/pdk
export PYTHONPATH=$OPENRAM_HOME:$PYTHONPATH
```

---

## Run OpenRAM Compiler

```bash
python3 $OPENRAM_HOME/sram_compiler.py \
    -t sky130 \
    openram/configs/myconfig_task4.py
```

---

## Generated Outputs

The OpenRAM compiler generates:

- GDSII Layout
- LEF
- SPICE Netlist
- Verilog Model
- Liberty Timing Model
- HTML Report
- Compiler Log
- LVS Report

---

## Magic Layout Inspection

```bash
magic -rcfile /usr/local/share/pdk/sky130A/libs.tech/magic/sky130A.magicrc
```

Inside Magic:

```tcl
gds read openram/results/sky130_sram_0kbytes_1rw_8x16_2.gds
load sky130_sram_0kbytes_1rw_8x16_2
zoom full
```

---

## Magic DRC

Inside Magic:

```tcl
drc check
drc count
```

---

## Netgen LVS

```bash
netgen -batch lvs \
layout.spice \
schematic.spice \
/usr/local/share/pdk/sky130A/libs.tech/netgen/sky130A_setup.tcl \
lvs_report.txt
```

---

## Notes

- OpenRAM Version: v1.2.49
- Technology: SKY130A
- Operating System: Ubuntu 24.04 (WSL2)
- Physical verification performed using Magic and Netgen.