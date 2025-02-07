.protect
.lib cic018.l tt
.unprotect
.option post
+accurate=1
+ingold=2
+runlvl=6

mn1 out in Vdd Vdd P_18 W=w1 L=180n
mn2 out in gnd gnd N_18 W=2u L=180n

VVdd Vdd gnd 1.8
Vin in gnd 0

.DC Vin 0 1.8 0.01 sweep w1 1u 10u 10n

.MEAS DC Vth FIND V(out) WHEN V(out)=V(in)

.end
