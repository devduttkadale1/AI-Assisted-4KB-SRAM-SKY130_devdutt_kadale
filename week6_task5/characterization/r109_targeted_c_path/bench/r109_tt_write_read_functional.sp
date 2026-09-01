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

.lib "/usr/local/share/pdk/sky130A/libs.tech/ngspice/sky130.lib.spice" tt
.include "r109_target_path_wrapper.sp"

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
+ 20.98n  0
+ 21.00n  1.8
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

.end
