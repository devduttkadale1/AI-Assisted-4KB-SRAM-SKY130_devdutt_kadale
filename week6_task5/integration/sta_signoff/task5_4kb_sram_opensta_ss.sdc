# Week 6 Task 5 - OpenSTA SS-corner interface constraints
#
# Limiting characterized SS minimum period:
#   2.241 ns = 446.229362 MHz
#
# 50% duty cycle:
#   high width = low width = 1.1205 ns
#
# This wrapper is timing-transparent. Input delays are set to zero to
# evaluate the SRAM interface timing checks from a synchronous launching
# boundary without inventing external controller/interconnect delay.

create_clock -name clk \
    -period 2.241 \
    -waveform {0.0000 1.1205} \
    [get_ports clk]

set_input_delay -clock clk -max 0.0 [get_ports csb]
set_input_delay -clock clk -min 0.0 [get_ports csb]

set_input_delay -clock clk -max 0.0 [get_ports web]
set_input_delay -clock clk -min 0.0 [get_ports web]

set_input_delay -clock clk -max 0.0 [get_ports wmask*]
set_input_delay -clock clk -min 0.0 [get_ports wmask*]

set_input_delay -clock clk -max 0.0 [get_ports addr*]
set_input_delay -clock clk -min 0.0 [get_ports addr*]

set_input_delay -clock clk -max 0.0 [get_ports din*]
set_input_delay -clock clk -min 0.0 [get_ports din*]
