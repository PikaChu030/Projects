.protect
.lib cic018.l tt
.unprotect
.option post
+accurate=1
+ingold=2
+runlvl=6

*.param frequency=1Meg
*.param period=1/frequency
*.param td=200p
.ic V(Vin)=1.8V

.subckt inv in out Vdd gnd
m1 out in gnd gnd N_18 l=0.18u w=1u
m2 out in Vdd Vdd P_18 l=0.18u w=4.85u
.ends

xinv1 Vin  x1 Vdd gnd inv
xinv2 x1   x2 Vdd gnd inv
xinv3 x2   x3 Vdd gnd inv
xinv4 x3   x4 Vdd gnd inv
xinv5 x4  Vin Vdd gnd inv


VVdd Vdd gnd 1.8


.tran 1p 100n uic


.MEAS tran period trig V(Vin)  val=0.9 fall=10 targ V(Vin) val=0.9 fall=11
.MEAS tran frequency param='1/period'
.MEAS tran t_on   trig V(Vin)  val=0.9 rise=10 targ V(Vin) val=0.9 fall=11
.MEAS tran duty_cycle param='t_on/period'

.end
