**testbench**
.INC'circuit.sp'
.GLOBAL gnd
+ vdd

.portect
.lib './VLSI/cic018.l'TT
.unprotect

.oO
.options post
.tran 0.05n 160n
.temp 25

xinv in out_1 vdd gnd inv
xnand A B out_2 vdd gnd nand 
xnor  X Y out_3 vdd gnd nor

**Testing Voltage**
V1 VDD GND DC 1.8v
V2 GND GND DC 0v
Vv1 IN GND pulse(0 1.8 0 0.1n 0.1n 20n 40n)
VvA A 0 pulse(0 1.8 0 0.1n 0.1n 20n 40n)
VvB B 0 pulse(0 1.8 0 0.1n 0.1n 40n 80n)
VvX X 0 pulse(0 1.8 0 0.1n 0.1n 20n 40n)
VvY Y 0 pulse(0 1.8 0 0.1n 0.1n 40n 80n)
