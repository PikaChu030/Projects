.protect
.lib cic018.l tt
.unprotect
.option post
+accurate=1
+ingold=2
+runlvl=6
.include "INV_pseudo.cir"


.param alpha=0.5u
*.subckt INV in out vdd gnd 

Vdd Vdd gnd 1.8
Vin Vin gnd 0

xinv Vin Vout Vdd gnd \ INV Wp=alpha Wn=2u

.DC Vin 0 1.8 0.01 sweep alpha 0.5u 2u 0.25u

.tran 1p 100n

*1A
.probe V(Vin) V(Vout)

*1B

.MEAS dc vil find V(Vin) when deriv('V(Vout)')=-1 cross=1
.MEAS dc vol find V(Vout) when deriv('V(Vout)')=-1 cross=2
.MEAS dc vih find V(Vin) when deriv('V(Vout)')=-1 cross=2
.MEAS dc voh find V(Vout) when deriv('V(Vout)')=-1 cross=1
.MEAS dc NMH param='voh-vih'
.MEAS dc NML param='vil-vol'

.end
