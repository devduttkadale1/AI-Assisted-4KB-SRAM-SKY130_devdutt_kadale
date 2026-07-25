*************************************************
* OpenRAM SRAM Smoke Testbench
*************************************************

*------------------------------------------------
* SKY130 Models
*------------------------------------------------
.lib /usr/local/share/pdk/sky130A/libs.tech/ngspice/sky130.lib.spice tt

*------------------------------------------------
* OpenRAM SRAM
*------------------------------------------------
.include "../../../openram/results/sky130_sram_0kbytes_1rw_8x16_2.sp"

*************************************************
* Power Supplies
*************************************************
VDD vccd1 0 DC 1.8
VSS vssd1 0 DC 0

*************************************************
* Clock
*************************************************
VCLK clk0 0 PULSE(0 1.8 0n 100p 100p 5n 10n)

*************************************************
* Control Signals
*************************************************
VCSB csb0 0 DC 1.8
VWEB web0 0 DC 1.8

*************************************************
* Address Inputs
*************************************************
VA0 addr0[0] 0 DC 0
VA1 addr0[1] 0 DC 0
VA2 addr0[2] 0 DC 0
VA3 addr0[3] 0 DC 0
VA4 addr0[4] 0 DC 0

*************************************************
* Write Mask
*************************************************
VWM0 wmask0[0] 0 DC 1.8
VWM1 wmask0[1] 0 DC 1.8
VWM2 wmask0[2] 0 DC 1.8
VWM3 wmask0[3] 0 DC 1.8

*************************************************
* Spare Write Enable
*************************************************
VSP spare_wen0 0 DC 1.8

*************************************************
* Data Inputs
*************************************************
VD0 din0[0] 0 DC 0
VD1 din0[1] 0 DC 0
VD2 din0[2] 0 DC 0
VD3 din0[3] 0 DC 0
VD4 din0[4] 0 DC 0
VD5 din0[5] 0 DC 0
VD6 din0[6] 0 DC 0
VD7 din0[7] 0 DC 0
VD8 din0[8] 0 DC 0

*************************************************
* SRAM Instance
*************************************************
XSRAM din0[0] din0[1] din0[2] din0[3] din0[4] din0[5] din0[6] din0[7] din0[8]
+ addr0[0] addr0[1] addr0[2] addr0[3] addr0[4]
+ csb0 web0 clk0
+ wmask0[0] wmask0[1] wmask0[2] wmask0[3]
+ spare_wen0
+ dout0[0] dout0[1] dout0[2] dout0[3] dout0[4] dout0[5] dout0[6] dout0[7] dout0[8]
+ vccd1 vssd1
+ sky130_sram_0kbytes_1rw_8x16_2

*************************************************
.control

set filetype=ascii

save all

tran 100p 100n

write ../../results/openram_smoke.raw

plot v(clk0)

.endc
