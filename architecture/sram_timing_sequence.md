# SRAM Timing Sequence

## Read Cycle
1. PCB=0 → Precharge BL=BLB=VDD
2. PCB=1 → Precharge OFF
3. WL=1 → Access transistors ON
4. ΔV develops on bitlines (~50–100mV)
5. SAE=1 → Sense amplifier fires → full swing output
6. WL=0 → Access transistors OFF

## Write Cycle
1. PCB=0 → Precharge
2. Write driver drives BL/BLB to desired data
3. WL=1 → Access transistors ON
4. Cell flips to new value
5. WL=0 → Latch holds new value