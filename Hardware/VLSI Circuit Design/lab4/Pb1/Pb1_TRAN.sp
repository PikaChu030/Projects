.protect
.lib cic018.l tt
.unprotect
.option post
+accurate=1
+ingold=2
+runlvl=6
.include "INV_pseudo.cir"


.param alpha=0.25u
*.subckt INV in out vdd gnd 

Vdd Vdd gnd 1.8
Vddb Vddb gnd 1.8
Vin Vin gnd pwl(0 1.8V 0.5n 1.8V 0.6n 0V)

xinv x1 Vout Vdd gnd \ INV Wp=alpha Wn=2u

m0 x1 x2 vddb vddb p_18 W=30u L=0.18u
m1 x1 x2 gnd gnd n_18 W=10u L=0.18u

m2 x2 Vin vddb vddb p_18 W=30u L=0.18u
m3 x2 Vin gnd gnd n_18 W=10u L=0.18u

.ic V(Vout)=0
.tran 10p 5n uic sweep alpha 0.5u 2u 0.25u


.MEAS tran Trise trig V(Vout) val=0.18 rise=1 targ V(Vout) val=1.62 rise=1

.end
