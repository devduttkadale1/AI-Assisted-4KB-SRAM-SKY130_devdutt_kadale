# Week 6 Task 5
# Authoritative OpenRAM SKY130 configuration
#
# Logical target:
#   1024 words x 32 bits = 4 KB
#   single-port 1RW
#
# SKY130 requires one spare row and one spare column
# for array row/column multiple constraints.
#
# write_size=8 is used because it is the supported
# OpenRAM 32x1024 SKY130 configuration and ensures
# correct behavioral coverage of all 32 normal data bits.

word_size = 32
write_size = 8

num_words = 1024
num_banks = 1
words_per_row = 8

num_spare_rows = 1
num_spare_cols = 1

tech_name = "sky130"

process_corners = ["TT"]
supply_voltages = [1.8]
temperatures = [25]

output_path = "week6_task5/output"
output_name = "task5_4kb_sram"

route_supplies = True

# DRC/LVS will be run explicitly after interface validation.
check_lvsdrc = False
