drc off

gds polygon subcell true
gds warning default
gds ordering true

set script_dir [file dirname [file normalize [info script]]]

if {[info exists ::env(TASK5_GDS)]} {
    set task5_gds [file normalize $::env(TASK5_GDS)]
} else {
    set task5_gds [file normalize [file join $script_dir .. .. generated task5_4kb_sram.gds]]
}

if {![file exists $task5_gds]} {
    puts stderr "ERROR: Task 5 GDS not found: $task5_gds"
    exit 2
}

puts "TASK5_GDS=$task5_gds"
gds read $task5_gds

puts "R31B_FRESH_GDS_READ_COMPLETE"

load task5_4kb_sram
select top cell

puts "R31B_SRAM_LOAD_COMPLETE"
puts "R31B_SRAM_BBOX=[box values]"

writeall force

puts "R31B_WRITEALL_COMPLETE=YES"

quit -noprompt
