# Week 2 Journal — SRAM Circuit Simulations (SKY130)

**Dates:** June 29, 2026  
**Intern:** Devdutt Kadale  
**Tools:** ngspice-42, SKY130 PDK (combined lib)

---

## Circuits Simulated

### 1. 6T SRAM Cell — READ (Day 1)
- **File:** `verification/spice/6T_cell_read.spice`
- **Result:** 2020 data rows ✅
- BL discharges slightly → read disturb visible
- Q holds at 1.8V (stored 1 stable throughout)

### 2. 6T SRAM Cell — WRITE (Day 1)
- **File:** `verification/spice/6T_cell_write.spice`
- **Result:** 2020 data rows ✅
- Q flips from 1.8V → 0V when WL fires with BL=0
- Write completes within 1ns

### 3. Precharge Circuit (Day 3)
- **File:** `verification/spice/precharge.spice`
- **Result:** 1520 data rows ✅
- 3-PMOS topology: PC1 (BL pullup) + PC2 (BLB pullup) + PC3 (equalizer)
- BL and BLB charge from 0V → 1.8V in < 1ns

### 4. Write Driver (Day 4)
- **File:** `verification/spice/write_driver.spice`
- **Result:** 2024 data rows ✅
- WE=HIGH → BL driven to DIN, BLB driven to ~DIN
- Correctly steers complementary data onto bitlines

### 5. Sense Amplifier (Day 5)
- **File:** `verification/spice/sense_amplifier.spice`
- **Result:** 1526 data rows ✅
- Cross-coupled latch topology (4T core + 2T enable)
- 50mV BL-BLB differential amplified to full 1.8V swing in < 200ps

---

## Key Debugging Notes
- ngspice-42 requires `~/.spiceinit` with `set ngbehavior=hsa`
- Must use `combined/sky130.lib.spice` NOT `ngspice/sky130.lib.spice`
- `Cannot compute substitute` = missing .spiceinit
- Always run ngspice from `verification/spice/` directory

---

## Waveforms
| Circuit | PNG |
|---|---|
| READ  | `verification/waveforms/6T_read_waveform.png` |
| WRITE | `verification/waveforms/6T_write_waveform.png` |
| Precharge | `verification/waveforms/precharge_waveform.png` |
| Write Driver | `verification/waveforms/write_driver_waveform.png` |
| Sense Amp | `verification/waveforms/sense_amp_waveform.png` |
