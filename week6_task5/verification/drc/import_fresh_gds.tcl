drc off

gds polygon subcell true
gds warning default
gds ordering true

gds read {/home/devdutt/VLSI/Tools/OpenRAM/week6_task5/output/task5_4kb_sram.gds}

puts "R31B_FRESH_GDS_READ_COMPLETE"

load task5_4kb_sram
select top cell

puts "R31B_SRAM_LOAD_COMPLETE"
puts "R31B_SRAM_BBOX=[box values]"

writeall force

puts "R31B_WRITEALL_COMPLETE=YES"

quit -noprompt
