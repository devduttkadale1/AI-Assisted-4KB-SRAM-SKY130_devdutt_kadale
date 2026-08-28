load task5_4kb_sram
select top cell

puts "R31B_DRC_SRAM_LOAD_COMPLETE"
puts "R31B_DRC_SRAM_BBOX=[box values]"

drc style drc(fast)
drc check
drc catchup

drc count total

puts "R31B_AUTHORITATIVE_DRC_COMPLETE"

quit -noprompt
