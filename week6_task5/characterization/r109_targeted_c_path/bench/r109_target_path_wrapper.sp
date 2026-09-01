* R109 targeted C-extracted SRAM path wrapper
*
* Evidence-backed mappings:
* bitcell vdd       -> VDD
* bitcell vpb       -> VDD
* bitcell gnd       -> GND
* bitcell vnb       -> GND
* bitcell m2_0_59#  -> WL
* bitcell a_0_24#   -> WL
* bitcell a_16_104# -> BC_N104 private instance-local node
* bitcell a_16_182# -> BC_N182 private instance-local node
* sense amp vdd/vdd_uq0     -> VDD
* write driver vdd/vdd_uq0  -> VDD
* precharge VSUBS            -> GND

.include "../normalized_closure/r109_target_cells.simfix.spice"

.subckt r109_target_path
+ WL DIN WEN SEN PREB SEL DOUT
+ CELL_BL CELL_BR IO_BL IO_BR
+ BC_N104 BC_N182
+ VDD GND

XBIT
+ WL CELL_BL CELL_BR GND VDD VDD GND
+ BC_N104 WL BC_N182 WL
+ sky130_fd_bd_sram__sram_sp_cell_opt1

XPRE
+ CELL_BL CELL_BR PREB VDD GND
+ task5_4kb_sram_precharge_0

XMUX
+ CELL_BL CELL_BR IO_BL IO_BR SEL GND
+ task5_4kb_sram_column_mux

XSA
+ GND IO_BL IO_BR DOUT SEN VDD VDD
+ SA_A96 SA_A184 SA_A154
+ sky130_fd_bd_sram__openram_sense_amp

XWD
+ GND DIN IO_BL IO_BR WEN VDD VDD
+ WD_A41 WD_A183 WD_A213 WD_A271 WD_A121 WD_A145 WD_A129
+ sky130_fd_bd_sram__openram_write_driver

.ends r109_target_path
