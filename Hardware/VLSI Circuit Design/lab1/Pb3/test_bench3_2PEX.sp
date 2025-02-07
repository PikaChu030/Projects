
.protect
.lib cic018.l tt
.unprotect
.inc fig3_2layout.pex.netlist
*************************************

vvdd vdd gnd 1.8v
VA A gnd pulse    (0 1.8 0n 100p 100p  9.8n 20n)
VB B gnd pulse    (0 1.8 0n 100p 100p 19.8n 40n)
VC C gnd pulse    (0 1.8 0n 100p 100p 39.8n 80n)
************************************


xfig3_2layout  A B VDD C GND Y fig3_2layout
************************************

.tran 100p 500n
.option post
.end
************************************
