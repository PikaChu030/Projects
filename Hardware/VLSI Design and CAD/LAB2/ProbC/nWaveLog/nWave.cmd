verdiSetActWin -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 0)}
wvOpenFile -win $_nWave1 {/home/user2/vlsi22/vlsi22114/Lab2/ProbC/multi.fsdb}
wvResizeWindow -win $_nWave1 0 23 1920 1017
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/multi_tb"
wvGetSignalSetScope -win $_nWave1 "/multi_tb/multi"
wvSetPosition -win $_nWave1 {("G1" 8)}
wvSetPosition -win $_nWave1 {("G1" 8)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/multi_tb/multi/A\[2:0\]} \
{/multi_tb/multi/B\[2:0\]} \
{/multi_tb/multi/C_temp\[3:0\]} \
{/multi_tb/multi/S\[5:0\]} \
{/multi_tb/multi/c} \
{/multi_tb/multi/n_c} \
{/multi_tb/multi/s} \
{/multi_tb/multi/t} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 4 5 6 7 8 )} 
wvSetPosition -win $_nWave1 {("G1" 8)}
wvSetPosition -win $_nWave1 {("G1" 8)}
wvSetPosition -win $_nWave1 {("G1" 8)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/multi_tb/multi/A\[2:0\]} \
{/multi_tb/multi/B\[2:0\]} \
{/multi_tb/multi/C_temp\[3:0\]} \
{/multi_tb/multi/S\[5:0\]} \
{/multi_tb/multi/c} \
{/multi_tb/multi/n_c} \
{/multi_tb/multi/s} \
{/multi_tb/multi/t} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 4 5 6 7 8 )} 
wvSetPosition -win $_nWave1 {("G1" 8)}
wvGetSignalClose -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 4 5 6 7 8 )} 
wvSetRadix -win $_nWave1 -format UDec
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 4 5 6 7 8 )} 
wvSetRadix -win $_nWave1 -format UDec
wvExit
