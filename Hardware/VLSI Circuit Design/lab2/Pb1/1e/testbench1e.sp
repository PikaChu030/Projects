.protect
.lib cic018.l tt
.unprotect
.option post
+accurate=1
+ingold=2
+runlvl=6
.inc 'inv.cir'


.param h = h1

xinv1 Vdd gnd pulse_in x INV
xinv2 Vdd gnd x in INV m=h
xinv3 Vdd gnd in out INV m=h^2
xinv4 Vdd gnd out y INV m=h^3
xinv5 Vdd gnd y z INV m=h^4



VVdd Vdd gnd 1.8

Vpulse pulse_in gnd PULSE(0 1.8 0 0.2n 0.2n 9.8n 20n)

.tran 1p 200n sweep h1 1 7 1

.MEAS tran tdelay_rise trig V(in) val=0.9 td=0 fall=2 targ V(out) val=0.9 rise=2
.MEAS tran tdelay_fall trig V(in) val=0.9 td=0 rise=2 targ V(out) val=0.9 fall=2
.MEAS tran tdelay_avg param = '(tdelay_rise+tdelay_fall)/2'

.end
