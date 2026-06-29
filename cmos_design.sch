v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 10 -130 10 -80 {
lab=Vout}
N 10 -20 10 10 {
lab=GND}
N -90 -160 -30 -160 {
lab=#net1}
N -90 -160 -90 -50 {
lab=#net1}
N -90 -50 -30 -50 {
lab=#net1}
N -150 -160 -150 -130 {
lab=#net1}
N -150 -160 -90 -160 {
lab=#net1}
N 10 -110 120 -110 {
lab=Vout}
N 10 -50 90 -50 {
lab=GND}
N 90 -50 90 -0 {
lab=GND}
N 10 -0 90 -0 {
lab=GND}
N 10 -240 10 -190 {
lab=#net2}
N 10 -300 60 -300 {
lab=GND}
N -150 -70 -150 10 {
lab=GND}
N 10 -160 90 -160 {
lab=#net2}
N 90 -220 90 -160 {
lab=#net2}
N 10 -220 90 -220 {
lab=#net2}
C {gnd.sym} 10 10 0 0 {name=l2 lab=GND}
C {vsource.sym} -150 -100 0 0 {name=VIN value="pulse(0 1.8 0 100p 100p 5n 10n)"}
C {lab_pin.sym} 120 -110 2 0 {name=p1 sig_type=std_logic lab=Vout
}
C {vsource.sym} 10 -270 2 0 {name=VDD_SRC value=1.8}
C {gnd.sym} 60 -300 0 0 {name=l1 lab=GND}
C {gnd.sym} -150 10 0 0 {name=l3 lab=GND}
C {code.sym} 270 -240 0 0 {name=s1 only_toplevel=false value=".lib /usr/local/share/pdk/sky130A/libs.tech/ngspice/sky130.lib.spice tt

.tran 10p 50n

.control
run
plot v(net1) v(vout)
.endc"}
C {sky130_fd_pr/nfet_01v8.sym} -10 -50 0 0 {name=M3
W=1
L=0.15
nf=1 
mult=1
model=nfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/pfet_01v8.sym} -10 -160 0 0 {name=M4
W=1
L=0.15
nf=1
mult=1
model=pfet_01v8
spiceprefix=X
}
