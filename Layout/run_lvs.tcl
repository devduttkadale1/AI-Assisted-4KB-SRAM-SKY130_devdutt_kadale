set circuit1 [readnet spice Layout/sram_6t_cell.spice]
set circuit2 [readnet spice verification/xschem/schematic/bitcell/sram_6t_bitcell_wrap.spice]

permute "-circuit1 sram_6t_cell" Q QB
permute "-circuit2 sram_6t_bitcell_wrap" Q QB

lvs $circuit1 sram_6t_cell $circuit2 sram_6t_bitcell_wrap sky130A_setup.tcl lvs_report.txt
