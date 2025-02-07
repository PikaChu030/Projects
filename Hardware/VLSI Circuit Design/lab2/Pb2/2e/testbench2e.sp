.protect
.lib cic018.l tt
.unprotect
.option post
+accurate=1
+ingold=2
+runlvl=6
.inc AND.pex.netlist


*.subckt AND  B3 EN V3 B2 V2 B1 V1 GND VDD



xand B3 EN V3 B2 V2 B1 V1 GND VDD AND
C4 Vdac V1 1200f
C3 Vdac V2 600f
C2 Vdac V3 300f
C1 Vdac gnd 300f

*****************************************************
G_switch gnd Vdac vcr PWL(1) reset Vdac 0V,200Meg  1.8V,0
*****************************************************

VVdd Vdd gnd 1.8

VB1 B1 gnd pulse(0 1.8 11n 200p 200p 39.2n 80n)
VB2 B2 gnd pulse(0 1.8 11n 200p 200p 19.6n 40n)
VB3 B3 gnd pulse(0 1.8 11n 200p 200p 9.8n 20n)
VEN EN gnd pulse(1.8 0 9n 200p 200p 4n 10n)


Vreset reset gnd pulse(0 1.8 11n 200p 200p 2n 10n)

.MEAS tran tdelay_rise1 trig V(EN) val=0.9 td=0 fall=2 targ V(V1) val=0.9 rise=2
.MEAS tran tdelay_fall1 trig V(EN) val=0.9 td=0 rise=2 targ V(V1) val=0.9 fall=2
.MEAS tran tdelay_avg1 param = '(tdelay_rise1+tdelay_fall1)/2'

.MEAS tran tdelay_rise2 trig V(EN) val=0.9 td=0 fall=2 targ V(V2) val=0.9 rise=2
.MEAS tran tdelay_fall2 trig V(EN) val=0.9 td=0 rise=2 targ V(V2) val=0.9 fall=2
.MEAS tran tdelay_avg2 param = '(tdelay_rise2+tdelay_fall2)/2'

.MEAS tran tdelay_rise3 trig V(EN) val=0.9 td=0 fall=2 targ V(V3) val=0.9 rise=2
.MEAS tran tdelay_fall3 trig V(EN) val=0.9 td=0 rise=2 targ V(V3) val=0.9 fall=2
.MEAS tran tdelay_avg3 param = '(tdelay_rise3+tdelay_fall3)/2'


.tran 1p 500n

.end
