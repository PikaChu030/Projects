.protect
.lib cic018.l tt
.unprotect
.option post
+accurate=1
+ingold=2
+runlvl=6
.include "OR4_static.cir"
*****.include "OR4_static.pex.netlist"

******.subckt OR4 A B C D out vdd gnd

.subckt buffer in out vdd gnd
m0 x1 in vdd vdd p_18 W=30u L=0.18u
m1 x1 in gnd gnd n_18 W=10u L=0.18u

m2 out x1 vdd vdd p_18 W=30u L=0.18u
m3 out x1 gnd gnd n_18 W=10u L=0.18u
.ends

Vdd Vdd gnd 1.8
Vddb Vddb gnd 1.8

xbufferA Va Va_b Vddb gnd buffer
xbufferB Vb Vb_b Vddb gnd buffer
xbufferC Vc Vc_b Vddb gnd buffer
xbufferD Vd Vd_b Vddb gnd buffer


xOR4 Va_b Vb_b Vc_b Vd_b out vdd gnd OR4 *\ OR4 Wp=W1
******xOR4_static Vb_b Va_b out Vc_b vdd Vd_b gnd OR4_static
m0 x1 out vdd vdd p_18 W=5.4u L=0.18u
m1 x1 out gnd gnd n_18 W=2.7u L=0.18u

m2 Vout x1 vdd vdd p_18 W=21.6u L=0.18u
m3 Vout x1 gnd gnd n_18 W=10.8u L=0.18u

VA Va gnd pulse    (0 1.8 0 100p 100p  9.8n 20n)
VB Vb gnd pulse    (0 1.8 80n 100p 100p 19.8n 40n)
VC Vc gnd pulse    (0 1.8 80n 100p 100p 39.8n 80n)
VD Vd gnd pulse    (0 1.8 80n 100p 100p 79.8n 160n)


.Meas tran Trise 
+trig V(Va_b) val=0.9 td=0 rise=2
+targ V(out) val=0.9 td=0 rise=2
.Meas tran Tfall
+trig V(Va_b) val=0.9 td=0 fall=2
+targ V(out) val=0.9 td=0 fall=2
.Meas tran Tdelay_avg
+param='(Trise+Tfall)/2'

.tran 100p 500n *sweep W1 0.5 4 0.05
.end
