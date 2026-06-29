# Week 2 Journal — 6T SRAM Cell Simulation

## Day 1-2: READ Operation (June 29, 2026)

### What I Did
- Wrote 6T SRAM SPICE netlist using SKY130 PDK models
- Debugged ngspice + SKY130 compatibility (3 hours)
- Fixed: created ~/.spiceinit with `set ngbehavior=hsa` and `set ng_nomodcheck`
- Fixed: used `combined/sky130.lib.spice` not `ngspice/sky130.lib.spice`
- Simulation ran successfully: 2020 data rows, transient op completed

### Files Created
- `verification/spice/6T_cell_read.spice` — READ testbench
- `verification/simulations/6T_read.raw` — raw waveform data
- `verification/waveforms/6T_read_waveform.png` — READ waveform

### Key Observations
- BL discharges slightly when WL goes HIGH (read disturb visible)
- Q node holds at 1.8V (stored 1 stable)
- QB stays at 0V throughout read
- Access transistors correctly pass cell state to bitlines

### Debugging Notes
- ngspice-42 requires .spiceinit for SKY130 BSIM4 models
- `Cannot compute substitute` = missing .spiceinit
- `could not find model` = wrong .lib path
