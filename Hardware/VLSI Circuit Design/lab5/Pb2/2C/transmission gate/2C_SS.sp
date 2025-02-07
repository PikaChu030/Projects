.protect
.lib cic018.l ss
.unprotect
.option post
+accurate=1
+ingold=2
+runlvl=6
.include "2C.cir"
****.subckt delay in out vdd gnd
****.subckt inv in out vdd gnd
****.subckt buffer in out vdd gnd
****.subckt DFF in out clk clk_b vdd gnd
.param t =0



Vdd Vdd gnd 1.8
Vclk_in clk_in gnd pulse(0 1.8 5n 100p 100p 4.8n 10n)
*VD_in D_in gnd pwl(0 0 '4.5n+t' 0 '4.6n+t' 1.8)
***********QR*********************************************
*.ic V(Q)=0
***********QF*********************************************
*.ic V(Q)=1.8

*xbuffer1 clk_in clk_ideal Vdd gnd buffer
*xbuffer2 D_in D Vdd gnd buffer


xtransmission_gate clk_in CLK Vdd gnd transmission_gate
*xinv1 clk_ideal CLK_b Vdd gnd inv



*xDFF1 D Q CLK CLK_b Vdd gnd DFF
*xDFF2 Q Q_2 CLK CLK_b Vdd gnd DFF m=4


*******DRQR**********************************************************
*VD_in D_in gnd pwl(0 0 '4.5n+t' 0 '4.6n+t' 1.8)
*.Meas tran tdc trig V(D)   val=0.9 rise=1 targ V(CLK) val=0.9 rise=1
*.Meas tran tcq trig V(CLK) val=0.9 rise=1 targ V(Q)   val=0.9 rise=1
*.Meas tdq PARAM='tdc+tcq'
*******DRQF**********************************************************
*VD_in D_in gnd pwl(0 0 '4.5n+t' 0 '4.6n+t' 1.8)
*.Meas tran tdc_2 trig V(D)   val=0.9 rise=1 targ V(CLK) val=0.9 rise=1
*.Meas tran tcq_2 trig V(CLK) val=0.9 rise=1 targ V(Q)   val=0.9 fall=1
*.Meas tdq_2 PARAM='tdc_2+tcq_2'
*******DFQR**********************************************************
*VD_in D_in gnd pwl(0 1.8 '4.5n+t' 1.8 '4.6n+t' 0)
*.Meas tran tdc_3 trig V(D)   val=0.9 fall=1 targ V(CLK) val=0.9 rise=1
*.Meas tran tcq_3 trig V(CLK) val=0.9 rise=1 targ V(Q)   val=0.9 rise=1
*.Meas tdq_3 PARAM='tdc_3+tcq_3'
*******DFQF**********************************************************
*VD_in D_in gnd pwl(0 1.8 '4.5n+t' 1.8 '4.6n+t' 0)
*.Meas tran tdc_4 trig V(D)   val=0.9 fall=1 targ V(CLK) val=0.9 rise=1
*.Meas tran tcq_4 trig V(CLK) val=0.9 rise=1 targ V(Q)   val=0.9 fall=1
*.Meas tdq_4 PARAM='tdc_4+tcq_4'

.tran 1p 40n *sweep t 2p 1n 2p

.end
