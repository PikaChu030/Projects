
.protect
.lib cic018.l tt
.unprotect
.inc fig3_1.cir
*************************************

vvdd vdd gnd 1.8v
VA A gnd pulse    (0 1.8 0n 100p 100p  9.8n 20n)
VB B gnd pulse    (0 1.8 0n 100p 100p 19.8n 40n)
VC C gnd pulse    (0 1.8 0n 100p 100p 39.8n 80n)
VD D gnd pulse    (0 1.8 0n 100p 100p 79.8n 160n)
************************************


xfig3_1 A B C D Vdd Y gnd fig3_1
************************************

.tran 100p 500n
.option post
.end
************************************
