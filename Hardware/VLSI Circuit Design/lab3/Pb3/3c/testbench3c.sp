.protect
.lib cic018.l tt
.unprotect
.option post
+accurate=1
+ingold=2
+runlvl=6

.param frequency=1Meg
.param period=1/frequency
.param td=0.1n

.subckt input_inv in out Vdd gnd
m1 out in gnd gnd N_18 l=0.18u w=1u
m2 out in Vdd Vdd P_18 l=0.18u w=3u
.ends


.subckt inv in out Vdd gnd
m1 out in gnd gnd N_18 l=0.18u w=0.5u
m2 out in Vdd Vdd P_18 l=0.18u w=1.5u
.ends

.subckt output_inv in out Vdd gnd
m1 out in gnd gnd N_18 l=0.18u w=w1
m2 out in Vdd Vdd P_18 l=0.18u w=3*w1
.ends


xinv11 ideal x1 Vddb gnd input_inv m=2
xinv12 x1   Vin Vddb gnd input_inv m=8

xinv13 Vin   x2 Vdd  gnd inv
xinv14 x2  Vout Vdd  gnd output_inv

C1 Vout gnd 128f


VVdd Vdd  gnd 1.8
Vddb Vddb gnd 1.8


VVin ideal gnd pulse(0 1.8 0.1n 1n 1n 99.9n 200n)


.tran 1p 2u sweep w1 1u 10u 50n

.MEAS tran power AVG p(VVdd)

.MEAS tran rising_delay
+trig V(Vin)  val=0.9 td=td rise=5
+targ V(Vout) val=0.9 td=td rise=5
.MEAS tran falling_delay
+trig V(Vin)  val=0.9 td=td rise=5
+targ V(Vout) val=0.9 td=td rise=5
.MEAS tran delay_avg
+param = '(rising_delay+falling_delay)/2'

.MEAS tran PDP
+param = 'delay_avg*power'

.end
