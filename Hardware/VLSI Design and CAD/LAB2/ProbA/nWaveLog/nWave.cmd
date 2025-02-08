verdiSetActWin -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 0)}
wvOpenFile -win $_nWave1 {/home/user2/vlsi22/vlsi22114/Lab2/ProbA/kmap.fsdb}
wvResizeWindow -win $_nWave1 0 23 1920 1017
wvSelectGroup -win $_nWave1 {G1}
wvSelectGroup -win $_nWave1 {G1}
wvSelectGroup -win $_nWave1 {G1}
wvSelectGroup -win $_nWave1 {G1}
wvSelectGroup -win $_nWave1 {G1}
wvSelectGroup -win $_nWave1 {G1}
wvSelectGroup -win $_nWave1 {G1}
wvSelectGroup -win $_nWave1 {G1}
wvMoveSelected -win $_nWave1
wvMoveSelected -win $_nWave1
wvSelectGroup -win $_nWave1 {G1}
wvSelectGroup -win $_nWave1 {G1}
wvSelectGroup -win $_nWave1 {G1}
wvSetCursor -win $_nWave1 511.045659
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/kmap_tb"
wvGetSignalSetScope -win $_nWave1 "/kmap_tb/kmap"
wvSetPosition -win $_nWave1 {("G1" 6)}
wvSetPosition -win $_nWave1 {("G1" 6)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/kmap_tb/kmap/A} \
{/kmap_tb/kmap/B} \
{/kmap_tb/kmap/C} \
{/kmap_tb/kmap/D} \
{/kmap_tb/kmap/Out} \
{/kmap_tb/kmap/temp\[7:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 4 5 6 )} 
wvSetPosition -win $_nWave1 {("G1" 6)}
wvSetPosition -win $_nWave1 {("G1" 6)}
wvSetPosition -win $_nWave1 {("G1" 6)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/kmap_tb/kmap/A} \
{/kmap_tb/kmap/B} \
{/kmap_tb/kmap/C} \
{/kmap_tb/kmap/D} \
{/kmap_tb/kmap/Out} \
{/kmap_tb/kmap/temp\[7:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 4 5 6 )} 
wvSetPosition -win $_nWave1 {("G1" 6)}
wvGetSignalClose -win $_nWave1
wvZoomAll -win $_nWave1
wvExit
