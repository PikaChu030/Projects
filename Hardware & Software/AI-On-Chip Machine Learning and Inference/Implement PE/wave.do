onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /top_tb/pe/controller/clk
add wave -noupdate /top_tb/pe/controller/rst
add wave -noupdate -radix unsigned /top_tb/pe/controller/curState
add wave -noupdate -radix unsigned /top_tb/pe/controller/nextState
add wave -noupdate -radix decimal -childformat {{{/top_tb/pe/ifmSpad_dout[7]} -radix decimal} {{/top_tb/pe/ifmSpad_dout[6]} -radix decimal} {{/top_tb/pe/ifmSpad_dout[5]} -radix decimal} {{/top_tb/pe/ifmSpad_dout[4]} -radix decimal} {{/top_tb/pe/ifmSpad_dout[3]} -radix decimal} {{/top_tb/pe/ifmSpad_dout[2]} -radix decimal} {{/top_tb/pe/ifmSpad_dout[1]} -radix decimal} {{/top_tb/pe/ifmSpad_dout[0]} -radix decimal}} -subitemconfig {{/top_tb/pe/ifmSpad_dout[7]} {-height 15 -radix decimal} {/top_tb/pe/ifmSpad_dout[6]} {-height 15 -radix decimal} {/top_tb/pe/ifmSpad_dout[5]} {-height 15 -radix decimal} {/top_tb/pe/ifmSpad_dout[4]} {-height 15 -radix decimal} {/top_tb/pe/ifmSpad_dout[3]} {-height 15 -radix decimal} {/top_tb/pe/ifmSpad_dout[2]} {-height 15 -radix decimal} {/top_tb/pe/ifmSpad_dout[1]} {-height 15 -radix decimal} {/top_tb/pe/ifmSpad_dout[0]} {-height 15 -radix decimal}} /top_tb/pe/ifmSpad_dout
add wave -noupdate -radix decimal /top_tb/pe/weiSpad_dout
add wave -noupdate -radix decimal /top_tb/pe/mult
add wave -noupdate /top_tb/pe/controller/conv_done
add wave -noupdate -radix unsigned /top_tb/pe/controller/counter
add wave -noupdate -radix decimal /top_tb/pe/psum_wrdata
add wave -noupdate -radix decimal /top_tb/pe/mux1_out
add wave -noupdate -radix decimal /top_tb/pe/mux2_out
add wave -noupdate /top_tb/pe/mux1_sel
add wave -noupdate /top_tb/pe/mux2_sel
add wave -noupdate /top_tb/pe/controller/ipsum_ready
add wave -noupdate -radix unsigned /top_tb/pe/controller/psum_addr
add wave -noupdate -radix unsigned /top_tb/pe/controller/psum_wen
add wave -noupdate /top_tb/pe/controller/psum_ren
add wave -noupdate -radix decimal {/top_tb/pe/psumSpad/mem[7]}
add wave -noupdate -radix decimal {/top_tb/pe/psumSpad/mem[6]}
add wave -noupdate -radix decimal {/top_tb/pe/psumSpad/mem[5]}
add wave -noupdate -radix decimal {/top_tb/pe/psumSpad/mem[4]}
add wave -noupdate -radix decimal {/top_tb/pe/psumSpad/mem[3]}
add wave -noupdate -radix decimal {/top_tb/pe/psumSpad/mem[2]}
add wave -noupdate -radix decimal {/top_tb/pe/psumSpad/mem[1]}
add wave -noupdate -radix decimal {/top_tb/pe/psumSpad/mem[0]}
add wave -noupdate /top_tb/pe/controller/opsum_ready
add wave -noupdate -radix decimal /top_tb/pe/ipsum_enable
add wave -noupdate -radix decimal /top_tb/pe/ipsum_noc
add wave -noupdate /top_tb/pe/ipsum_ready
add wave -noupdate /top_tb/pe/controller/opsum_enable
add wave -noupdate /top_tb/opsum_count
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1970360 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 242
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {1954770 ps} {1981560 ps}
