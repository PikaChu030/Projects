.protect
.lib cic018.l tt
.unprotect
.option post
+accurate=1
+ingold=2
+runlvl=6

.param frequency=1Meg
.param period=1/frequency
.param td=200p


.subckt inv1 in out Vdd gnd
m1 out in gnd gnd N_18 l=0.18u w=0.5u
m2 out in Vdd Vdd P_18 l=0.18u w=1.5u
.ends

.subckt inv2 in out Vdd gnd
m1 out in gnd gnd N_18 l=0.18u w=4u
m2 out in Vdd Vdd P_18 l=0.18u w=12u
.ends


xinv1 Vin x1 Vdd gnd inv1
xinv2 x1 Vout Vdd gnd inv2
C1 Vout gnd 128f


VVdd Vdd gnd 1.8


VVin Vin gnd pwl(0 0V 'period-td/2' 0v 'period+td/2' 1.8v '3*period-td/2' 1.8v '3*period+td/2' 0v '6*period-td/2' 0v '6*period+td/2' 1.8v '7*period-td/2' 1.8v '7*period+td/2' 0v)


.tran 1p 10u

.MEAS tran power AVG p(VVdd)

.end
