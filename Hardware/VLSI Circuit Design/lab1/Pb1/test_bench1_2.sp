
.protect
.lib cic018.l tt
.unprotect
.inc p1_2.cir
*.inc inv.pex.netlist
*************************************

vvdd vdd gnd 1.8v
vin Vin gnd pulse(0 1.8 0n 100p 100p 19.8n 40n)
vclk clk gnd pulse(0 1.8 10n 100p 100p 19.8n 40n)
************************************

CL1 Vout_n gnd 0.1p
CL2 Vout_p gnd 0.1p
CL3 Vout   gnd 0.1p
************************************

xp1_2 Clk Vdd Vin Vout_p p1_2
*p1_2 Clk Vdd Vin Vout_p
************************************

.tran 100p 200n
.option post
.end
************************************
