verdiSetActWin -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 0)}
wvOpenFile -win $_nWave1 \
           {/home/user2/vlsi22/vlsi22114/Lab2/ProbB/ripple_adder.fsdb}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/ripple_adder_tb"
wvGetSignalSetScope -win $_nWave1 "/ripple_adder_tb/ripple_adder"
wvSetPosition -win $_nWave1 {("G1" 8)}
wvSetPosition -win $_nWave1 {("G1" 8)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/ripple_adder_tb/ripple_adder/A\[5:0\]} \
{/ripple_adder_tb/ripple_adder/B\[5:0\]} \
{/ripple_adder_tb/ripple_adder/B_temp\[5:0\]} \
{/ripple_adder_tb/ripple_adder/C\[4:0\]} \
{/ripple_adder_tb/ripple_adder/Cout} \
{/ripple_adder_tb/ripple_adder/S\[5:0\]} \
{/ripple_adder_tb/ripple_adder/addsub} \
{/ripple_adder_tb/ripple_adder/ov_flag} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 4 5 6 7 8 )} 
wvSetPosition -win $_nWave1 {("G1" 8)}
wvGetSignalClose -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 1 )} 
wvSelectSignal -win $_nWave1 {( "G1" 1 )} 
wvSelectSignal -win $_nWave1 {( "G1" 2 )} 
wvSelectSignal -win $_nWave1 {( "G1" 1 )} 
wvSelectSignal -win $_nWave1 {( "G1" 1 )} 
wvSetRadix -win $_nWave1 -format UDec
wvSelectSignal -win $_nWave1 {( "G1" 2 )} 
wvSelectSignal -win $_nWave1 {( "G1" 2 )} 
wvSetRadix -win $_nWave1 -format UDec
wvSelectSignal -win $_nWave1 {( "G1" 3 )} 
wvSelectSignal -win $_nWave1 {( "G1" 3 )} 
wvSetRadix -win $_nWave1 -format UDec
wvSelectSignal -win $_nWave1 {( "G1" 4 )} 
wvSelectSignal -win $_nWave1 {( "G1" 4 )} 
wvSetRadix -win $_nWave1 -format UDec
wvSelectSignal -win $_nWave1 {( "G1" 5 )} 
wvSetCursor -win $_nWave1 149.835165 -snap {("G2" 0)}
wvSelectSignal -win $_nWave1 {( "G1" 6 )} 
wvSelectSignal -win $_nWave1 {( "G1" 6 )} 
wvSetRadix -win $_nWave1 -format UDec
wvSelectSignal -win $_nWave1 {( "G1" 7 )} 
wvSelectSignal -win $_nWave1 {( "G1" 8 )} 
wvSetCursor -win $_nWave1 110.930596 -snap {("G2" 0)}
wvSelectGroup -win $_nWave1 {G2}
wvSelectGroup -win $_nWave1 {G1}
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvSetCursor -win $_nWave1 6718.924234 -snap {("G2" 0)}
wvSelectSignal -win $_nWave1 {( "G1" 3 )} 
wvSelectSignal -win $_nWave1 {( "G1" 3 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G2" 0)}
wvSetPosition -win $_nWave1 {("G1" 7)}
wvSelectSignal -win $_nWave1 {( "G1" 3 )} 
wvSetCursor -win $_nWave1 1361.659919 -snap {("G2" 0)}
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G2" 0)}
wvSetPosition -win $_nWave1 {("G1" 6)}
wvSelectSignal -win $_nWave1 {( "G1" 4 )} 
wvSelectSignal -win $_nWave1 {( "G1" 3 )} 
wvSetCursor -win $_nWave1 2271.185656 -snap {("G2" 0)}
wvSetCursor -win $_nWave1 2323.759398 -snap {("G2" 0)}
wvSetCursor -win $_nWave1 4290.017351 -snap {("G1" 3)}
wvSetCursor -win $_nWave1 2833.724696 -snap {("G2" 0)}
wvSetCursor -win $_nWave1 1061.989589 -snap {("G2" 0)}
wvSetCursor -win $_nWave1 1750.705610 -snap {("G2" 0)}
wvSetCursor -win $_nWave1 662.429150 -snap {("G1" 3)}
wvSetCursor -win $_nWave1 536.252169 -snap {("G1" 3)}
wvSetCursor -win $_nWave1 1256.512435 -snap {("G2" 0)}
wvSelectGroup -win $_nWave1 {G2}
wvSetCursor -win $_nWave1 767.576634 -snap {("G2" 0)}
wvSetCursor -win $_nWave1 47.316368 -snap {("G2" 0)}
wvZoom -win $_nWave1 804.378253 1004.158473
wvSetCursor -win $_nWave1 815.470735 -snap {("G2" 0)}
wvZoom -win $_nWave1 818.706042 838.580072
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvSetCursor -win $_nWave1 0.000000 -snap {("G1" 0)}
wvSelectGroup -win $_nWave1 {G1}
wvSetCursor -win $_nWave1 1000.000000
wvSetCursor -win $_nWave1 1000.000000
wvSetCursor -win $_nWave1 1000.000000
wvSetCursor -win $_nWave1 1440.520532 -snap {("G1" 1)}
wvSetCursor -win $_nWave1 1545.668016 -snap {("G1" 1)}
wvSetCursor -win $_nWave1 1624.528629 -snap {("G1" 2)}
wvSetCursor -win $_nWave1 5.257374 -snap {("G1" 2)}
wvSetCursor -win $_nWave1 1004.158473 -snap {("G1" 2)}
wvSetCursor -win $_nWave1 1403.718913 -snap {("G1" 2)}
wvSetCursor -win $_nWave1 1529.895894 -snap {("G1" 2)}
wvSetCursor -win $_nWave1 530.994795 -snap {("G1" 2)}
wvSetCursor -win $_nWave1 0.000000 -snap {("G1" 3)}
wvSetCursor -win $_nWave1 2376.333141 -snap {("G2" 0)}
wvSelectSignal -win $_nWave1 {( "G1" 2 )} 
wvSetRadix -win $_nWave1 -2Com
wvSelectSignal -win $_nWave1 {( "G1" 1 )} 
wvSetRadix -win $_nWave1 -2Com
wvSetCursor -win $_nWave1 3107.108155 -snap {("G2" 0)}
wvSetCursor -win $_nWave1 3101.850781 -snap {("G2" 0)}
wvSelectSignal -win $_nWave1 {( "G1" 4 )} 
wvSetRadix -win $_nWave1 -2Com
wvSetCursor -win $_nWave1 2570.855986 -snap {("G2" 0)}
wvSetCursor -win $_nWave1 4705.349913 -snap {("G2" 0)}
wvSetCursor -win $_nWave1 1256.512435 -snap {("G2" 0)}
wvExit
