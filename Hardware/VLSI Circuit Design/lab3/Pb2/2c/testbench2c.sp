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

.param x=0.7V
.ic V(Vin)=1.8V


.SUBCKT hw3_2c Vctrl Vctrlb Vdd Vin gnd
*.PININFO Vctrl:I Vctrlb:I Vdd:I gnd:I Vin:B
MM0 net27 Vctrl Vdd Vdd P_18 W=7.8u L=180n
MM1 net15 Vin net27 Vdd P_18 W=1.9u L=180n
MM2 net15 Vin net28 gnd N_18 W=1u L=180.00n
MM3 net28 Vctrlb gnd gnd N_18 W=1u L=180.00n


MM4 net32 Vctrl Vdd Vdd P_18 W=7.8u L=180n
MM5 net18 net15 net32 Vdd P_18 W=1.9u L=180n
MM6 net18 net15 net29 gnd N_18 W=1u L=180.00n
MM7 net29 Vctrlb gnd gnd N_18 W=1u L=180.00n

MM8  net31  Vctrl Vdd Vdd P_18 W=7.8u L=180n
MM9  Vin  net18 net31 Vdd P_18 W=1.9u L=180n
MM10 Vin  net18 net30 gnd N_18 W=1u L=180.00n
MM11 net30 Vctrlb gnd gnd N_18 W=1u L=180.00n

.ENDS


xvco Vctrl Vctrlb Vdd Vin gnd hw3_2c


VVdd Vdd gnd 1.8
VVctrl Vctrl gnd x
VVctrlb Vctrlb gnd 1.8-x


.tran 1p 100n uic sweep x 0.7 1.1 0.1


.MEAS tran period trig V(Vin)  val=0.9 fall=10 targ V(Vin) val=0.9 fall=11
.MEAS tran frequency param='1/period'
.MEAS tran t_on   trig V(Vin)  val=0.9 rise=10 targ V(Vin) val=0.9 fall=11
.MEAS tran duty_cycle param='t_on/period'

.end
