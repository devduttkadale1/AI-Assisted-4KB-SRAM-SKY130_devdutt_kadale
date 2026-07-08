# Bitline Behaviour

- BL and BLB precharged to VDD before every read
- During READ: one bitline discharges by ΔV ≈ 50–100mV
- During WRITE: write driver forces BL=0, BLB=VDD (or vice versa)
- Bitline capacitance dominates access time
- Longer bitlines = higher capacitance = slower sensing