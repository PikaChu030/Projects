**testbench**
.INC'nor.pex.netlist'
.GLOBAL gnd
+ vdd

.portect
.lib 'cic018.l'TT
.unprotect

.oO
.options post
.tran 0.05n 160n
.temp 25

xnor  Y out_3 vdd X gnd nor

**Testing Voltage**
V1 VDD GND DC 1.8v
V2 GND GND DC 0v
VvX X 0 pulse(0 1.8 0 0.1n 0.1n 20n 40n)
VvY Y 0 pulse(0 1.8 0 0.1n 0.1n 40n 80n)
