verdiSetActWin -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 0)}
wvOpenFile -win $_nWave1 \
           {/home/user2/vlsi22/vlsi22114/Lab5/Lab5_1/det_1001_tb.fsdb}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/SAEDRVT14_ADDF_V1_0P5"
wvGetSignalSetScope -win $_nWave1 "/det_1001_tb"
wvSetPosition -win $_nWave1 {("G1" 9)}
wvSetPosition -win $_nWave1 {("G1" 9)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/det_1001_tb/clk} \
{/det_1001_tb/d} \
{/det_1001_tb/err\[31:0\]} \
{/det_1001_tb/golden\[19:0\]} \
{/det_1001_tb/i\[31:0\]} \
{/det_1001_tb/num\[1:0\]} \
{/det_1001_tb/num_golden\[1:0\]} \
{/det_1001_tb/q} \
{/det_1001_tb/rst} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 4 5 6 7 8 9 )} 
wvSetPosition -win $_nWave1 {("G1" 9)}
wvGetSignalClose -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvClearAll -win $_nWave1
wvOpenFile -win $_nWave1 {/home/user2/vlsi22/vlsi22114/Lab5/Lab5_2/bp.fsdb}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/tb"
wvGetSignalSetScope -win $_nWave1 "/tb/bp"
wvGetSignalSetScope -win $_nWave1 "/tb"
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/tb/bp"
wvGetSignalSetScope -win $_nWave1 "/tb/bp"
wvSetPosition -win $_nWave1 {("G1" 9)}
wvSetPosition -win $_nWave1 {("G1" 9)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/tb/bp/clk} \
{/tb/bp/n1} \
{/tb/bp/n3} \
{/tb/bp/n4} \
{/tb/bp/p_taken} \
{/tb/bp/rst} \
{/tb/bp/st\[1:0\]} \
{/tb/bp/st_ns\[1:0\]} \
{/tb/bp/taken} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 4 5 6 7 8 9 )} 
wvSetPosition -win $_nWave1 {("G1" 9)}
wvSetPosition -win $_nWave1 {("G1" 9)}
wvSetPosition -win $_nWave1 {("G1" 9)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/tb/bp/clk} \
{/tb/bp/n1} \
{/tb/bp/n3} \
{/tb/bp/n4} \
{/tb/bp/p_taken} \
{/tb/bp/rst} \
{/tb/bp/st\[1:0\]} \
{/tb/bp/st_ns\[1:0\]} \
{/tb/bp/taken} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 4 5 6 7 8 9 )} 
wvSetPosition -win $_nWave1 {("G1" 9)}
wvGetSignalClose -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvSetCursor -win $_nWave1 36538.750723 -snap {("G2" 0)}
wvSetCursor -win $_nWave1 39220.011567 -snap {("G2" 0)}
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvSetCursor -win $_nWave1 29125.853094 -snap {("G1" 9)}
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvClearAll -win $_nWave1
wvOpenFile -win $_nWave1 \
           {/home/user2/vlsi22/vlsi22114/Lab5/Lab5_3/pattern_gen.fsdb}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/tb"
wvGetSignalSetScope -win $_nWave1 "/tb/p1"
wvSetPosition -win $_nWave1 {("G1" 30)}
wvSetPosition -win $_nWave1 {("G1" 30)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/tb/p1/N19} \
{/tb/p1/N20} \
{/tb/p1/N21} \
{/tb/p1/clk} \
{/tb/p1/en} \
{/tb/p1/n1} \
{/tb/p1/n2} \
{/tb/p1/n3} \
{/tb/p1/n4} \
{/tb/p1/n5} \
{/tb/p1/n6} \
{/tb/p1/n7} \
{/tb/p1/n8} \
{/tb/p1/n9} \
{/tb/p1/n10} \
{/tb/p1/n11} \
{/tb/p1/n12} \
{/tb/p1/n13} \
{/tb/p1/n14} \
{/tb/p1/n15} \
{/tb/p1/n16} \
{/tb/p1/n17} \
{/tb/p1/n18} \
{/tb/p1/n19} \
{/tb/p1/n20} \
{/tb/p1/p} \
{/tb/p1/rst} \
{/tb/p1/st\[2:0\]} \
{/tb/p1/valid} \
{/tb/p1/x} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 \
           18 19 20 21 22 23 24 25 26 27 28 29 30 )} 
wvSetPosition -win $_nWave1 {("G1" 30)}
wvSetPosition -win $_nWave1 {("G1" 30)}
wvSetPosition -win $_nWave1 {("G1" 30)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/tb/p1/N19} \
{/tb/p1/N20} \
{/tb/p1/N21} \
{/tb/p1/clk} \
{/tb/p1/en} \
{/tb/p1/n1} \
{/tb/p1/n2} \
{/tb/p1/n3} \
{/tb/p1/n4} \
{/tb/p1/n5} \
{/tb/p1/n6} \
{/tb/p1/n7} \
{/tb/p1/n8} \
{/tb/p1/n9} \
{/tb/p1/n10} \
{/tb/p1/n11} \
{/tb/p1/n12} \
{/tb/p1/n13} \
{/tb/p1/n14} \
{/tb/p1/n15} \
{/tb/p1/n16} \
{/tb/p1/n17} \
{/tb/p1/n18} \
{/tb/p1/n19} \
{/tb/p1/n20} \
{/tb/p1/p} \
{/tb/p1/rst} \
{/tb/p1/st\[2:0\]} \
{/tb/p1/valid} \
{/tb/p1/x} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 \
           18 19 20 21 22 23 24 25 26 27 28 29 30 )} 
wvSetPosition -win $_nWave1 {("G1" 30)}
wvGetSignalClose -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvExit
