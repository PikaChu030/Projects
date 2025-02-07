.protect
.lib cic018.l tt
.unprotect
.option post
+accurate=1
+ingold=2
+runlvl=6

mn1 VD VG VDD VDD P_18 W=4u L=180n

VVDD VDD gnd 1.8
VVG VG gnd G
VVD VD gnd D
*.DC D 0 1.8 0.1 sweep G 0 1.8 0.1
.DC G 0 1.8 0.1 sweep D 0 1.8 0.1
.PROBE I(mn1) VDS(mn1) VGS(mn1)

.end
