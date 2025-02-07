
.protect
.lib cic018.l tt
.unprotect
.inc fig1_6.cir
*************************************

vvdd vdd gnd 1.8v
VD0 D0 gnd pulse(0 1.8 0n 100p 100p 39.8n 80n)
VD1 D1 gnd pulse(0 1.8 0n 100p 100p 29.8n 60n)
VS S gnd pulse   (0 1.8 0n 100p 100p 34.8n 70n)
************************************


xfig1_6 D0 D1 S Vdd Y gnd fig1_6
************************************

.tran 100p 500n
.option post
.end
************************************
