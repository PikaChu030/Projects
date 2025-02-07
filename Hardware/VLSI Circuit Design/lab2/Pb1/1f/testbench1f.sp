.protect
.lib cic018.l tt
.unprotect
.option post
+accurate=1
+ingold=2
+runlvl=6


.SUBCKT NOR A B C Vdd Y gnd
MM3 Y C gnd gnd N_18 W=2u L=180n
MM1 Y B gnd gnd N_18 W=2u L=180n
MM0 Y A gnd gnd N_18 W=2u L=180n
MM5 Y C net20 Vdd P_18 W=18u L=180n
MM4 net20 B net21 Vdd P_18 W=18u L=180n
MM7 net21 A Vdd Vdd P_18 W=18u L=180n
.ENDS


.param h = h1

xnor1 pulse_in gnd gnd Vdd x gnd NOR
xnor2 x gnd gnd Vdd in gnd NOR m=h
xnor3 in gnd gnd Vdd out gnd NOR m=h^2
xnor4 out gnd gnd Vdd y gnd NOR m=h^3
xnor5 y gnd gnd Vdd z gnd NOR m=h^4



VVdd Vdd gnd 1.8

Vpulse pulse_in gnd PULSE(0 1.8 0 0.2n 0.2n 9.8n 20n)

.tran 1p 200n sweep h1 1 7 1

.MEAS tran tdelay_rise trig V(in) val=0.9 td=0 fall=2 targ V(out) val=0.9 rise=2
.MEAS tran tdelay_fall trig V(in) val=0.9 td=0 rise=2 targ V(out) val=0.9 fall=2
.MEAS tran tdelay_avg param = '(tdelay_rise+tdelay_fall)/2'

.end
