verdiSetActWin -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 0)}
wvOpenFile -win $_nWave1 {/home/user2/vlsi22/vlsi22114/Lab6/Lab6_2/top.fsdb}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/top_tb"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP"
wvSetPosition -win $_nWave1 {("G1" 20)}
wvSetPosition -win $_nWave1 {("G1" 20)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/top_tb/TOP/RAM1_A\[19:0\]} \
{/top_tb/TOP/RAM1_D\[23:0\]} \
{/top_tb/TOP/RAM1_OE} \
{/top_tb/TOP/RAM1_Q\[23:0\]} \
{/top_tb/TOP/RAM1_WE} \
{/top_tb/TOP/RAM2_A\[19:0\]} \
{/top_tb/TOP/RAM2_D\[23:0\]} \
{/top_tb/TOP/RAM2_OE} \
{/top_tb/TOP/RAM2_Q\[23:0\]} \
{/top_tb/TOP/RAM2_WE} \
{/top_tb/TOP/RAM3_A\[19:0\]} \
{/top_tb/TOP/RAM3_D\[23:0\]} \
{/top_tb/TOP/RAM3_OE} \
{/top_tb/TOP/RAM3_WE} \
{/top_tb/TOP/clk} \
{/top_tb/TOP/counter\[19:0\]} \
{/top_tb/TOP/done} \
{/top_tb/TOP/n_st\[1:0\]} \
{/top_tb/TOP/rst} \
{/top_tb/TOP/st\[1:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 \
           18 19 20 )} 
wvSetPosition -win $_nWave1 {("G1" 20)}
wvSetPosition -win $_nWave1 {("G1" 20)}
wvSetPosition -win $_nWave1 {("G1" 20)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/top_tb/TOP/RAM1_A\[19:0\]} \
{/top_tb/TOP/RAM1_D\[23:0\]} \
{/top_tb/TOP/RAM1_OE} \
{/top_tb/TOP/RAM1_Q\[23:0\]} \
{/top_tb/TOP/RAM1_WE} \
{/top_tb/TOP/RAM2_A\[19:0\]} \
{/top_tb/TOP/RAM2_D\[23:0\]} \
{/top_tb/TOP/RAM2_OE} \
{/top_tb/TOP/RAM2_Q\[23:0\]} \
{/top_tb/TOP/RAM2_WE} \
{/top_tb/TOP/RAM3_A\[19:0\]} \
{/top_tb/TOP/RAM3_D\[23:0\]} \
{/top_tb/TOP/RAM3_OE} \
{/top_tb/TOP/RAM3_WE} \
{/top_tb/TOP/clk} \
{/top_tb/TOP/counter\[19:0\]} \
{/top_tb/TOP/done} \
{/top_tb/TOP/n_st\[1:0\]} \
{/top_tb/TOP/rst} \
{/top_tb/TOP/st\[1:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 \
           18 19 20 )} 
wvSetPosition -win $_nWave1 {("G1" 20)}
wvGetSignalClose -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomOut -win $_nWave1
wvExit
