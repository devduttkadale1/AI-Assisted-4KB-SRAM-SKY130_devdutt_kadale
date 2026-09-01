* R109 TT targeted C-extracted functional transient
*
* Sequence:
*  0-2 ns    precharge
*  2-6 ns    write phase A, DIN=1
*  6-8 ns    precharge
*  8-12 ns   read phase A
* 12-14 ns   precharge
* 14-18 ns   write phase B, DIN=0
* 18-20 ns   precharge
* 20-24 ns   read phase B
*
* PREB active low
* WEN assumed active high
* SEN assumed active high
* SEL held high
*
* No UIC: use the already-proven convergent operating point.

.lib "/usr/local/share/pdk/sky130A/libs.tech/ngspice/sky130.lib.spice" ss
.include "../r109_target_path_wrapper.sp"

.temp 25

VDD_SRC VDD 0 1.8

* Column selected throughout.
VSEL SEL 0 1.8

* DIN = 1 for phase A, then 0 for phase B.
VDIN DIN 0 PWL(
+ 0       1.8
+ 13.90n  1.8
+ 13.92n  0
+ 25n     0
+ )

* Precharge active-low.
VPREB PREB 0 PWL(
+ 0       0
+ 1.98n   0
+ 2.00n   1.8
+ 5.98n   1.8
+ 6.00n   0
+ 7.98n   0
+ 8.00n   1.8
+ 11.98n  1.8
+ 12.00n  0
+ 13.98n  0
+ 14.00n  1.8
+ 17.98n  1.8
+ 18.00n  0
+ 19.98n  0
+ 20.00n  1.8
+ 24.00n  1.8
+ )

* Write driver enabled only during the two write windows.
VWEN WEN 0 PWL(
+ 0       0
+ 2.48n   0
+ 2.50n   1.8
+ 5.48n   1.8
+ 5.50n   0
+ 14.48n  0
+ 14.50n  1.8
+ 17.48n  1.8
+ 17.50n  0
+ 25n     0
+ )

* Wordline active for write/read access windows.
VWL WL 0 PWL(
+ 0       0
+ 2.98n   0
+ 3.00n   1.8
+ 4.98n   1.8
+ 5.00n   0
+ 8.48n   0
+ 8.50n   1.8
+ 11.48n  1.8
+ 11.50n  0
+ 14.98n  0
+ 15.00n  1.8
+ 16.98n  1.8
+ 17.00n  0
+ 20.48n  0
+ 20.50n  1.8
+ 23.48n  1.8
+ 23.50n  0
+ 25n     0
+ )

* Sense amp enabled after WL has established bitline differential.
VSEN SEN 0 PWL(
+ 0       0
+ 8.98n   0
+ 9.00n   1.8
+ 10.98n  1.8
+ 11.00n  0
+ 21.23n  0
+ 21.25n  1.8
+ 22.98n  1.8
+ 23.00n  0
+ 25n     0
+ )

XPATH
+ WL DIN WEN SEN PREB SEL DOUT
+ CELL_BL CELL_BR IO_BL IO_BR
+ BC_N104 BC_N182
+ VDD 0
+ r109_target_path

.tran 0.01n 25n

* Phase A storage after write.
.meas tran A_N104 FIND v(BC_N104) AT=5.80n
.meas tran A_N182 FIND v(BC_N182) AT=5.80n

* Phase A storage + read output during enabled sense.
.meas tran A_READ_N104 FIND v(BC_N104) AT=10.50n
.meas tran A_READ_N182 FIND v(BC_N182) AT=10.50n
.meas tran A_DOUT FIND v(DOUT) AT=10.50n
.meas tran A_CELL_BL FIND v(CELL_BL) AT=9.00n
.meas tran A_CELL_BR FIND v(CELL_BR) AT=9.00n

* Phase B storage after opposite write.
.meas tran B_N104 FIND v(BC_N104) AT=17.80n
.meas tran B_N182 FIND v(BC_N182) AT=17.80n

* Phase B storage + read output.
.meas tran B_READ_N104 FIND v(BC_N104) AT=22.50n
.meas tran B_READ_N182 FIND v(BC_N182) AT=22.50n
.meas tran B_DOUT FIND v(DOUT) AT=22.50n
.meas tran B_CELL_BL FIND v(CELL_BL) AT=21.00n
.meas tran B_CELL_BR FIND v(CELL_BR) AT=21.00n


* ============================================================
* R109 FINAL TT TARGETED CHARACTERIZATION
*
* Read timing:
*   Only phase A produces an observable DOUT transition.
*   Phase B returns logic-0 while DOUT is already low with SEN=0,
*   therefore no falling 50% transition exists to time.
*
* Energy is total raw VDD energy over fixed 4 ns operation windows.
* Leakage is measured separately in both quiescent stored states.
* ============================================================

* State-changing write B timing.
.meas tran B_WRITE_N104 TRIG v(WL) VAL=0.9 RISE=1 TD=14.90n TARG v(BC_N104) VAL=0.9 FALL=1 TD=14.90n
.meas tran B_WRITE_N182 TRIG v(WL) VAL=0.9 RISE=1 TD=14.90n TARG v(BC_N182) VAL=0.9 RISE=1 TD=14.90n

* Transition-producing read access.
.meas tran A_READ_ACCESS TRIG v(SEN) VAL=0.9 RISE=1 TD=8.90n TARG v(DOUT) VAL=0.9 RISE=1 TD=8.90n

* Prove phase-B DOUT starts and remains low.
.meas tran B_DOUT_BEFORE_SEN FIND v(DOUT) AT=20.90n
.meas tran B_DOUT_AFTER_SEN FIND v(DOUT) AT=21.10n
.meas tran B_DOUT_VALID FIND v(DOUT) AT=22.50n

* Quiescent precharged-state currents for both stored states.
.meas tran LEAK_A_I_AVG AVG i(VDD_SRC) FROM=7.50n TO=7.90n
.meas tran LEAK_B_I_AVG AVG i(VDD_SRC) FROM=19.50n TO=19.90n

* Raw VDD-current integrals over fixed operation windows.
.meas tran WRITE_A_IINT INTEG i(VDD_SRC) FROM=2.00n TO=6.00n
.meas tran READ_A_IINT  INTEG i(VDD_SRC) FROM=8.00n TO=12.00n
.meas tran WRITE_B_IINT INTEG i(VDD_SRC) FROM=14.00n TO=18.00n
.meas tran READ_B_IINT  INTEG i(VDD_SRC) FROM=20.00n TO=24.00n


* SS sense-delay sweep diagnostics.
* WL B-read rise = 20.50 ns
* SEN B-read rise = 21.25 ns
* WL->SEN delay = 0.75 ns

.meas tran SWEEP_B_DOUT_225 FIND v(DOUT) AT=22.50n
.meas tran SWEEP_B_DOUT_229 FIND v(DOUT) AT=22.90n
.meas tran SWEEP_B_N104_229 FIND v(BC_N104) AT=22.90n
.meas tran SWEEP_B_N182_229 FIND v(BC_N182) AT=22.90n

.end
