verdiSetActWin -win $_nWave1
wvResizeWindow -win $_nWave1 0 23 1920 1017
wvSetPosition -win $_nWave1 {("G1" 0)}
wvOpenFile -win $_nWave1 {/home/user2/vlsi22/vlsi22114/Lab3/ProbA/mux16to1.fsdb}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/mux16to1_tb"
wvGetSignalSetScope -win $_nWave1 "/mux16to1_tb/mux"
wvSetPosition -win $_nWave1 {("G1" 18)}
wvSetPosition -win $_nWave1 {("G1" 18)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/mux16to1_tb/mux/A} \
{/mux16to1_tb/mux/B} \
{/mux16to1_tb/mux/C} \
{/mux16to1_tb/mux/D} \
{/mux16to1_tb/mux/E} \
{/mux16to1_tb/mux/F} \
{/mux16to1_tb/mux/G} \
{/mux16to1_tb/mux/H} \
{/mux16to1_tb/mux/I} \
{/mux16to1_tb/mux/J} \
{/mux16to1_tb/mux/K} \
{/mux16to1_tb/mux/L} \
{/mux16to1_tb/mux/M} \
{/mux16to1_tb/mux/N} \
{/mux16to1_tb/mux/O} \
{/mux16to1_tb/mux/P} \
{/mux16to1_tb/mux/Q} \
{/mux16to1_tb/mux/sel\[3:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 \
           18 )} 
wvSetPosition -win $_nWave1 {("G1" 18)}
wvGetSignalClose -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 \
           18 )} 
wvSetRadix -win $_nWave1 -format UDec
wvExit
