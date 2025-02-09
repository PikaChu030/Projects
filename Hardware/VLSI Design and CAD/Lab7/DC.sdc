# Modify the clock period for your design
current_design TOP
create_clock -name clk -period 10 [get_ports clk]
# Don't modify following constraints
set_dont_touch_network      [get_ports clk]
set_fix_hold                [get_ports clk]
set_clock_uncertainty  0.1  [get_ports clk]
set_clock_latency -source 0 [get_ports clk]
set_clock_latency      1.0  [get_ports clk]
set_ideal_network           [get_ports clk]

set_input_delay  5.0   -clock clk [remove_from_collection [all_inputs] [get_ports clk]]
set_output_delay 0.5   -clock clk [all_outputs]

set_drive  0.1   [all_inputs]
set_load   0.1   [all_outputs]

set_operating_conditions -min_library saed14rvt_ff0p88vm40c -min ff0p88vm40c  -max_library saed14rvt_ss0p72v125c -max ss0p72v125c
set_wire_load_model -name ForQA -library saed14rvt_ss0p72v125c                        

#set_max_fanout 6 [all_inputs]