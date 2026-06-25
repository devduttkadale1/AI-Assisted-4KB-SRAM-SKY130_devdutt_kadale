v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {vout}
E {}
N 390 -90 390 -70 {
lab=VDD}
N 390 -10 390 50 {
lab=#net1}
N 390 110 390 140 {
lab=GND}
N 300 -40 350 -40 {
lab=#net2}
N 390 20 470 20 {
lab=#net1}
N 330 -40 330 80 {
lab=#net2}
N 330 80 350 80 {
lab=#net2}
N 300 -40 300 -10 {
lab=#net2}
N 300 50 300 140 {}
N 300 140 390 140 {}
C {nmos.sym} 370 80 0 0 {name=M1 model=M2N7002 device=2N7002 footprint=SOT23 m=1}
C {pmos.sym} 370 -40 0 0 {name=M2 
model=DMP2035U 
device=DMP2035U 
m=1}
C {gnd.sym} 390 140 0 0 {name=l1 lab=GND}
C {vdd.sym} 390 -90 0 0 {name=l2 lab=VDD}
C {vsource.sym} 300 20 0 0 {name=V1 value=3 savecurrent=false}
