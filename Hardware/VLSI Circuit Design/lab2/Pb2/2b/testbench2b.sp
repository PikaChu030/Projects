.protect
.lib cic018.l tt
.unprotect
.option post
+accurate=1
+ingold=2
+runlvl=6


.SUBCKT AND B EN V Vdd gnd
MM0 net1 EN gnd gnd N_18 W=1u L=180n
MM1 net2 B net1 gnd N_18 W=1u L=180n
MM2 net2 EN Vdd Vdd P_18 W=1.5u L=180n
MM3 net2 B Vdd Vdd P_18 W=1.5u L=180n


MM4 V net2 gnd gnd N_18 W=30u L=180.00n
MM5 V net2 Vdd Vdd P_18 W=90u L=180n
.ENDS



xand1 B1 EN V1 Vdd gnd AND
xand2 B2 EN V2 Vdd gnd AND
xand3 B3 EN V3 Vdd gnd AND
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

.tran 1p 500n

.end
