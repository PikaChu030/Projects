
.protect
.lib cic018.l tt
.unprotect
.inc fig2_2layout.pex.netlist
*************************************

vvdd vdd gnd 1.8v
VD D gnd pulse    (0 1.8 0n 100p 100p 39.8n 80n)
VClk Clk gnd pulse(0 1.8 10n 100p 100p 24.8n 50n)
************************************


xfig2_2layout  CLK D Q VDD GND fig2_2layout
************************************

.tran 100p 500n
.option post
.end
************************************
