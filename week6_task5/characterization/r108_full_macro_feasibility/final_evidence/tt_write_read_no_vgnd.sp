* Week 6 Task 5 - R88 minimal C-extracted TT write/read bench
* Target: task5_4kb_sram
* Corner: TT, 1.8 V, 25 C
* Proven source protocol: R87A/R87B
*
* Operation:
*   cycle 0 : idle
*   rising edge 9.995 ns  : WRITE address 5, data 0xD141386E
*   rising edge 19.995 ns : READ  address 5
*   sample outputs at 24 ns

.lib "/usr/local/share/pdk/sky130A/libs.tech/ngspice/sky130.lib.spice" tt
.include "/home/devdutt/VLSI/Tools/OpenRAM/week6_task5/characterization/r100_all_primitive_unit_normalized_cnet/task5_4kb_sram.all_sim_units.spice"
.temp 25

Vvdd vdd 0 1.8

* Exact OpenRAM clock timing from functional_stim.sp
Vclk0 clk0 0 PULSE(0 1.8 9.995n 0.01n 0.01n 4.99n 10n)

* Idle -> write -> read -> idle
VCSB0 CSB0 0 PWL(0n 1.8 9.495n 1.8 9.505n 0 29.495n 0 29.505n 1.8 30n 1.8)
VWEB0 WEB0 0 PWL(0n 1.8 9.495n 1.8 9.505n 0 19.495n 0 19.505n 1.8 30n 1.8)

Vdin0_0 din0_0 0 0
Vdin0_1 din0_1 0 1.8
Vdin0_2 din0_2 0 1.8
Vdin0_3 din0_3 0 1.8
Vdin0_4 din0_4 0 0
Vdin0_5 din0_5 0 1.8
Vdin0_6 din0_6 0 1.8
Vdin0_7 din0_7 0 0
Vdin0_8 din0_8 0 0
Vdin0_9 din0_9 0 0
Vdin0_10 din0_10 0 0
Vdin0_11 din0_11 0 1.8
Vdin0_12 din0_12 0 1.8
Vdin0_13 din0_13 0 1.8
Vdin0_14 din0_14 0 0
Vdin0_15 din0_15 0 0
Vdin0_16 din0_16 0 1.8
Vdin0_17 din0_17 0 0
Vdin0_18 din0_18 0 0
Vdin0_19 din0_19 0 0
Vdin0_20 din0_20 0 0
Vdin0_21 din0_21 0 0
Vdin0_22 din0_22 0 1.8
Vdin0_23 din0_23 0 0
Vdin0_24 din0_24 0 1.8
Vdin0_25 din0_25 0 0
Vdin0_26 din0_26 0 0
Vdin0_27 din0_27 0 0
Vdin0_28 din0_28 0 1.8
Vdin0_29 din0_29 0 0
Vdin0_30 din0_30 0 1.8
Vdin0_31 din0_31 0 1.8
Vdin0_32 din0_32 0 0

Va0_0 a0_0 0 1.8
Va0_1 a0_1 0 0
Va0_2 a0_2 0 1.8
Va0_3 a0_3 0 0
Va0_4 a0_4 0 0
Va0_5 a0_5 0 0
Va0_6 a0_6 0 0
Va0_7 a0_7 0 0
Va0_8 a0_8 0 0
Va0_9 a0_9 0 0
Va0_10 a0_10 0 0

VWMASK0_0 WMASK0_0 0 1.8
VWMASK0_1 WMASK0_1 0 1.8
VWMASK0_2 WMASK0_2 0 1.8
VWMASK0_3 WMASK0_3 0 1.8
VSPARE_WEN0_0 SPARE_WEN0_0 0 0

* OpenRAM-generated functional output loading
CD00 dout0_0 0 27.56f
CD01 dout0_1 0 27.56f
CD02 dout0_2 0 27.56f
CD03 dout0_3 0 27.56f
CD04 dout0_4 0 27.56f
CD05 dout0_5 0 27.56f
CD06 dout0_6 0 27.56f
CD07 dout0_7 0 27.56f
CD08 dout0_8 0 27.56f
CD09 dout0_9 0 27.56f
CD010 dout0_10 0 27.56f
CD011 dout0_11 0 27.56f
CD012 dout0_12 0 27.56f
CD013 dout0_13 0 27.56f
CD014 dout0_14 0 27.56f
CD015 dout0_15 0 27.56f
CD016 dout0_16 0 27.56f
CD017 dout0_17 0 27.56f
CD018 dout0_18 0 27.56f
CD019 dout0_19 0 27.56f
CD020 dout0_20 0 27.56f
CD021 dout0_21 0 27.56f
CD022 dout0_22 0 27.56f
CD023 dout0_23 0 27.56f
CD024 dout0_24 0 27.56f
CD025 dout0_25 0 27.56f
CD026 dout0_26 0 27.56f
CD027 dout0_27 0 27.56f
CD028 dout0_28 0 27.56f
CD029 dout0_29 0 27.56f
CD030 dout0_30 0 27.56f
CD031 dout0_31 0 27.56f
CD032 dout0_32 0 27.56f

* DUT -- same 87-node positional order proven by R85A
Xuut din0_0 din0_1 din0_2 din0_3 din0_4 din0_5 din0_6 din0_7
+ din0_8 din0_9 din0_10 din0_11 din0_12 din0_13 din0_14 din0_15
+ din0_16 din0_17 din0_18 din0_19 din0_20 din0_21 din0_22 din0_23
+ din0_24 din0_25 din0_26 din0_27 din0_28 din0_29 din0_30 din0_31
+ din0_32 a0_0 a0_1 a0_2 a0_3 a0_4 a0_5 a0_6
+ a0_7 a0_8 a0_9 a0_10 CSB0 WEB0 clk0 WMASK0_0
+ WMASK0_1 WMASK0_2 WMASK0_3 SPARE_WEN0_0 dout0_0 dout0_1 dout0_2 dout0_3
+ dout0_4 dout0_5 dout0_6 dout0_7 dout0_8 dout0_9 dout0_10 dout0_11
+ dout0_12 dout0_13 dout0_14 dout0_15 dout0_16 dout0_17 dout0_18 dout0_19
+ dout0_20 dout0_21 dout0_22 dout0_23 dout0_24 dout0_25 dout0_26 dout0_27
+ dout0_28 dout0_29 dout0_30 dout0_31 dout0_32 vdd gnd task5_4kb_sram

* Restrict stored transient vectors; do not retain enormous internal hierarchy
.save v(clk0) v(CSB0) v(WEB0) i(Vvdd)
+ v(dout0_0) v(dout0_1) v(dout0_2) v(dout0_3) v(dout0_4) v(dout0_5) v(dout0_6) v(dout0_7)
+ v(dout0_8) v(dout0_9) v(dout0_10) v(dout0_11) v(dout0_12) v(dout0_13) v(dout0_14) v(dout0_15)
+ v(dout0_16) v(dout0_17) v(dout0_18) v(dout0_19) v(dout0_20) v(dout0_21) v(dout0_22) v(dout0_23)
+ v(dout0_24) v(dout0_25) v(dout0_26) v(dout0_27) v(dout0_28) v(dout0_29) v(dout0_30) v(dout0_31)
+ v(dout0_32)

* First run is functional qualification, not final access-time measurement
.meas tran VOUT0_AT_24N FIND v(dout0_0) AT=24n
.meas tran VOUT1_AT_24N FIND v(dout0_1) AT=24n
.meas tran VOUT2_AT_24N FIND v(dout0_2) AT=24n
.meas tran VOUT3_AT_24N FIND v(dout0_3) AT=24n
.meas tran VOUT4_AT_24N FIND v(dout0_4) AT=24n
.meas tran VOUT5_AT_24N FIND v(dout0_5) AT=24n
.meas tran VOUT6_AT_24N FIND v(dout0_6) AT=24n
.meas tran VOUT7_AT_24N FIND v(dout0_7) AT=24n
.meas tran VOUT8_AT_24N FIND v(dout0_8) AT=24n
.meas tran VOUT9_AT_24N FIND v(dout0_9) AT=24n
.meas tran VOUT10_AT_24N FIND v(dout0_10) AT=24n
.meas tran VOUT11_AT_24N FIND v(dout0_11) AT=24n
.meas tran VOUT12_AT_24N FIND v(dout0_12) AT=24n
.meas tran VOUT13_AT_24N FIND v(dout0_13) AT=24n
.meas tran VOUT14_AT_24N FIND v(dout0_14) AT=24n
.meas tran VOUT15_AT_24N FIND v(dout0_15) AT=24n
.meas tran VOUT16_AT_24N FIND v(dout0_16) AT=24n
.meas tran VOUT17_AT_24N FIND v(dout0_17) AT=24n
.meas tran VOUT18_AT_24N FIND v(dout0_18) AT=24n
.meas tran VOUT19_AT_24N FIND v(dout0_19) AT=24n
.meas tran VOUT20_AT_24N FIND v(dout0_20) AT=24n
.meas tran VOUT21_AT_24N FIND v(dout0_21) AT=24n
.meas tran VOUT22_AT_24N FIND v(dout0_22) AT=24n
.meas tran VOUT23_AT_24N FIND v(dout0_23) AT=24n
.meas tran VOUT24_AT_24N FIND v(dout0_24) AT=24n
.meas tran VOUT25_AT_24N FIND v(dout0_25) AT=24n
.meas tran VOUT26_AT_24N FIND v(dout0_26) AT=24n
.meas tran VOUT27_AT_24N FIND v(dout0_27) AT=24n
.meas tran VOUT28_AT_24N FIND v(dout0_28) AT=24n
.meas tran VOUT29_AT_24N FIND v(dout0_29) AT=24n
.meas tran VOUT30_AT_24N FIND v(dout0_30) AT=24n
.meas tran VOUT31_AT_24N FIND v(dout0_31) AT=24n
.meas tran VOUT32_AT_24N FIND v(dout0_32) AT=24n

* Short targeted transient only
.tran 0.02n 30n

.end
