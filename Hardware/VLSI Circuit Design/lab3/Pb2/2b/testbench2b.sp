.protect
.lib cic018.l tt
.unprotect
.option post
+accurate=1
+ingold=2
+runlvl=6
.include "hw3_2b.pex.netlist"

*.param frequency=1Meg
*.param period=1/frequency
*.param td=200p
.ic V(Vin)=1.8V


xinv Vin gnd Vdd hw3_2b


VVdd Vdd gnd 1.8


.tran 1p 100n uic


.MEAS tran period trig V(Vin)  val=0.9 fall=10 targ V(Vin) val=0.9 fall=11
.MEAS tran frequency param='1/period'
.MEAS tran t_on   trig V(Vin)  val=0.9 rise=10 targ V(Vin) val=0.9 fall=11
.MEAS tran duty_cycle param='t_on/period'

.end
