# -----------------------------
# Task 4 OpenRAM Configuration
# -----------------------------

word_size = 16
num_words = 16

tech_name = "sky130"

process_corners = ["TT"]
supply_voltages = [1.8]
temperatures = [25]

output_path = "task4/results"

output_name = "task4_sram_16x16"

route_supplies = True

check_lvsdrc = False
