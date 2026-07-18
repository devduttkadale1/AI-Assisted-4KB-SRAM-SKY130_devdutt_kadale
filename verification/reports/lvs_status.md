# Netgen LVS Status

## Objective

Prepare the Netgen LVS environment for comparing the generated SRAM layout against the SPICE netlist.

---

## Environment

| Item | Details |
|------|---------|
| Tool | Netgen 1.5.323 |
| Technology | SKY130A |
| LVS Setup | sky130A_setup.tcl |

---

## Verification

Verified the following:

- Netgen installation
- SKY130A setup file
- OpenRAM-generated LVS SPICE netlist
- Generated SRAM SPICE netlist

Files verified:

- results/spice/sram_2_16_sky130A.sp
- results/spice/sram_2_16_sky130A.lvs.sp
- /usr/local/share/pdk/sky130A/libs.tech/netgen/sky130A_setup.tcl

---

## Status

The verification environment is correctly configured.

A complete LVS comparison between a layout-extracted SPICE netlist and the schematic netlist was not performed during this task.

---

## Conclusion

The Netgen verification environment has been successfully prepared for future LVS verification of the generated SRAM macro.
