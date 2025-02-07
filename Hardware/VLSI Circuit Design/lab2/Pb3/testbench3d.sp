.protect
.lib cic018.l tt
.unprotect
.option post
+accurate=1
+ingold=2
+runlvl=6
.inc function.pex.netlist

*.subckt function  A B GND C D Y E VDD



xPattern1 gnd pulse_in gnd gnd Vdd Y1 gnd Vdd function
xPattern2 Vdd Vdd gnd Vdd pulse_in Y2 gnd Vdd function
xPattern3 gnd gnd gnd pulse_in gnd Y3 Vdd Vdd function
xPattern4 gnd pulse_in gnd gnd Vdd Y4 Vdd Vdd function
xPattern5 pulse_in gnd gnd gnd Vdd Y5 Vdd Vdd function


VVdd Vdd gnd 1.8


Vpulse_in pulse_in gnd pulse(0 1.8 0 200p 200p 9.8n 20n)



.MEAS tran tdelay_fall1 trig V(pulse_in) val=0.9 td=0 rise=2 targ V(Y1) val=0.9 fall=2
.MEAS tran tdelay_rise2 trig V(pulse_in) val=0.9 td=0 fall=2 targ V(Y2) val=0.9 rise=2
.MEAS tran tdelay_fall3 trig V(pulse_in) val=0.9 td=0 rise=2 targ V(Y3) val=0.9 fall=2
.MEAS tran tdelay_fall4 trig V(pulse_in) val=0.9 td=0 rise=2 targ V(Y4) val=0.9 fall=2
.MEAS tran tdelay_fall5 trig V(pulse_in) val=0.9 td=0 rise=2 targ V(Y5) val=0.9 fall=2



.tran 1p 200n

.end
