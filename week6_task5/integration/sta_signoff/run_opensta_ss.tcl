set sta_dir [file dirname [file normalize [info script]]]
set task5_dir [file normalize [file join $sta_dir ../..]]

set lib  [file join $task5_dir generated task5_4kb_sram_SS_1p8V_25C.lib]
set wrap [file join $sta_dir task5_4kb_sram_sta_wrapper.v]
set sdc  [file join $sta_dir task5_4kb_sram_opensta_ss.sdc]

puts "===== TASK 5 OPENSTA SS SIGNOFF ====="
puts "LIBERTY=$lib"
puts "WRAPPER=$wrap"
puts "SDC=$sdc"

read_liberty $lib
read_verilog $wrap
link_design task5_4kb_sram_sta_wrapper
read_sdc $sdc

puts ""
puts "===== UNITS ====="
report_units

puts ""
puts "===== CLOCKS ====="
set task5_clocks [get_clocks *]
puts "CLOCK_COUNT=[llength $task5_clocks]"
puts "CLOCK_OBJECTS=$task5_clocks"

puts ""
puts "===== SETUP / MAX CHECKS ====="
report_check_types \
    -max_delay \
    -verbose \
    -max_count 20 \
    -digits 6

puts ""
puts "===== HOLD / MIN CHECKS ====="
report_check_types \
    -min_delay \
    -verbose \
    -max_count 20 \
    -digits 6

puts ""
puts "===== MINIMUM PULSE WIDTH ====="
report_check_types \
    -min_pulse_width \
    -verbose \
    -max_count 10 \
    -digits 6

puts ""
puts "===== MINIMUM PERIOD ====="
report_check_types \
    -min_period \
    -verbose \
    -max_count 10 \
    -digits 6

puts ""
puts "===== CLOCK MINIMUM PERIOD / FMAX ====="
report_clock_min_period -clocks clk

puts ""
puts "===== WORST SETUP PATHS ====="
report_checks \
    -path_delay max \
    -group_path_count 10 \
    -sort_by_slack \
    -format full_clock_expanded \
    -digits 6

puts ""
puts "===== WORST HOLD PATHS ====="
report_checks \
    -path_delay min \
    -group_path_count 10 \
    -sort_by_slack \
    -format full_clock_expanded \
    -digits 6

puts ""
puts "===== CLOCK TO DOUT INTERFACE PATH ====="
report_checks \
    -unconstrained \
    -from [get_ports clk] \
    -to [get_ports dout*] \
    -path_delay max \
    -group_path_count 4 \
    -format full_clock_expanded \
    -digits 6

puts ""
puts "OPENSTA_SS_ANALYSIS_REACHED=PASS"
exit
