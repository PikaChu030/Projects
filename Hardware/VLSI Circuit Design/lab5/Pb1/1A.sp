.protect
.lib cic018.l tt
.unprotect
.option post
+accurate=1
+ingold=2
+runlvl=6
.include "1A.cir"
****.subckt delay in out vdd gnd
****.subckt inv in out vdd gnd
****.subckt buffer in out vdd gnd

Vdd Vdd gnd 1.8
Vclk_in clk_in gnd pulse(0 1.8 5n 100p 100p 4.8n 10n)

xbuffer clk_in clk_ideal Vdd gnd buffer m=32
xdelay clk_ideal CLK Vdd gnd delay
xinv2 clk_ideal CLK_b Vdd gnd inv m=16



.tran 1p 10n
.end
