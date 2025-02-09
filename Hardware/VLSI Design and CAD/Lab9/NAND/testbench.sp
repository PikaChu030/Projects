 	**testbench**
.INC'Nand.pex.netlist'
.GLOBAL gnd
+ vdd

.portect
.lib 'cic018.l'TT
.unprotect

.oO
.options post
.tran 0.05n 160n
.temp 25

xnand B gnd out_2 A vdd nand 

**Testing Voltage**
V1 VDD GND DC 1.8v
V2 GND GND DC 0v
VvA A 0 pulse(0 1.8 0 0.1n 0.1n 20n 40n)
VvB B 0 pulse(0 1.8 0 0.1n 0.1n 40n 80n)

