set sta_dir [file dirname [file normalize [info script]]]
set task5_dir [file normalize [file join $sta_dir ../..]]

set lib  [file join $task5_dir generated task5_4kb_sram_SS_1p8V_25C.lib]
set wrap [file join $sta_dir task5_4kb_sram_sta_wrapper.v]
set sdc  [file join $sta_dir task5_4kb_sram_opensta_ss.sdc]

if {![info exists ::env(TASK5_DOUT_LOAD)]} {
    puts "Error: TASK5_DOUT_LOAD not defined"
    exit 2
}

set dout_load $::env(TASK5_DOUT_LOAD)

read_liberty $lib
read_verilog $wrap
link_design task5_4kb_sram_sta_wrapper
read_sdc $sdc

# CELL_TABLE index_1 middle characterized clock slew.
set_input_transition 0.005 [get_ports clk]

# CELL_TABLE index_2 characterized DOUT load supplied by caller.
# Liberty/OpenSTA capacitance unit is 1 pF.
set_load $dout_load [get_ports {dout[0]}]

puts "===== CHARACTERIZED POINT ====="
puts "CLOCK_INPUT_TRANSITION_NS=0.005"
puts "DOUT0_LOAD_PF=$dout_load"

report_checks \
    -unconstrained \
    -from [get_clocks clk] \
    -to [get_ports {dout[0]}] \
    -path_delay max \
    -group_path_count 1 \
    -format full_clock_expanded \
    -digits 6

puts "OPENSTA_DOUT_CHARPOINT_REACHED=PASS"
exit
