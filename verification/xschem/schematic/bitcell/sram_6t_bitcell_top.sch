v {xschem version=3.0.0 file_version=1.2}
G {}
K {}
V {}
S {}
E {}

T {6T SRAM Bitcell Top} 100 20 0 0 0.6 0.6 {}

C {sram_6t_bitcell.sym} 200 140 0 0 {name=U1
BL=BL
BLB=BLB
WL=WL
VDD=VDD
VSS=VSS
Q=Q
QB=QB}

C {devices/lab_pin.sym} 120 120 0 0 {name=p1 lab=BL}
C {devices/lab_pin.sym} 120 160 0 0 {name=p2 lab=BLB}
C {devices/lab_pin.sym} 120 200 0 0 {name=p3 lab=WL}
C {devices/lab_pin.sym} 280 90 0 0 {name=p4 lab=VDD}
C {devices/lab_pin.sym} 280 190 0 0 {name=p5 lab=VSS}
C {devices/lab_pin.sym} 320 120 0 0 {name=p6 lab=Q}
C {devices/lab_pin.sym} 320 160 0 0 {name=p7 lab=QB}