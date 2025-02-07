
.protect
.lib cic018.l tt
.unprotect
.inc n1_1.cir
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

xn1_1 Clk Vin Vout_n gnd n1_1
*n1_1 Clk Vin Vout_n gnd
************************************

.tran 100p 200n
.option post
.end
************************************
