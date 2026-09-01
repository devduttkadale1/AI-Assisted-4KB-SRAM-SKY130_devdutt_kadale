* R109 TT targeted C-extracted operating-point smoke test
* Simulation-only bitcell substrate capacitance reference:
* internal VSUBS -> VNB -> vssd1, evidence-backed.

.lib "/usr/local/share/pdk/sky130A/libs.tech/ngspice/sky130.lib.spice" tt
.include "r109_target_path_wrapper.sp"

.temp 25

VDD_SRC VDD 0 1.8

VWL   WL   0 0
VDIN  DIN  0 0
VWEN  WEN  0 0
VSEN  SEN  0 0
VPREB PREB 0 0
VSEL  SEL  0 1.8

XPATH
+ WL DIN WEN SEN PREB SEL DOUT
+ CELL_BL CELL_BR IO_BL IO_BR
+ BC_N104 BC_N182
+ VDD 0
+ r109_target_path

.control
op

echo R109_OP_RESULTS_BEGIN
print v(VDD)
print v(WL)
print v(CELL_BL)
print v(CELL_BR)
print v(IO_BL)
print v(IO_BR)
print v(DOUT)
print v(BC_N104)
print v(BC_N182)
print i(VDD_SRC)
echo R109_OP_RESULTS_END

quit
.endc

.end
