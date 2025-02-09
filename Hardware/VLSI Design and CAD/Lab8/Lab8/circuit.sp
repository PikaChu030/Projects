**inverter**
.subckt inv IN OUT_1 VDD GND
M_pMOS OUT_1 IN VDD VDD p_18 W=1u L=0.18u
M_nMOS OUT_1 IN GND GND n_18 W=0.5u L=0.18u
.ends

**nand**
.subckt nand A B OUT_2 VDD GND
M_p1 OUT_2 A VDD VDD p_18 W=1u L=0.18u
M_p2 OUT_2 B VDD VDD p_18 W=1u L=0.18u
M_n1 OUT_2 A C GND n_18 W=0.5u L=0.18u
M_n2 C B GND GND n_18 W=0.5u L=0.18u
.ends

**nor**
.subckt nor X Y OUT_3 VDD GND
M_p1 C X VDD VDD p_18 W=1u L=0.18u
M_p2 OUT_3 Y C VDD p_18 W=1u L=0.18u
M_n1 OUT_3 Y GND GND n_18 W=0.5u L=0.18u
M_n2 OUT_3 X GND GND n_18 W=0.5u L=0.18u
.ends
