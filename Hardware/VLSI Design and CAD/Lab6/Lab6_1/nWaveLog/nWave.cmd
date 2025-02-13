verdiSetActWin -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 0)}
wvOpenFile -win $_nWave1 {/home/user2/vlsi22/vlsi22114/Lab6/Lab6_1/top.fsdb}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/top_tb"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP"
wvSetPosition -win $_nWave1 {("G1" 21)}
wvSetPosition -win $_nWave1 {("G1" 21)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/top_tb/TOP/MAN_A_WEIGHT\[2:0\]} \
{/top_tb/TOP/M_data\[23:0\]} \
{/top_tb/TOP/RAM1_A\[19:0\]} \
{/top_tb/TOP/RAM1_D\[23:0\]} \
{/top_tb/TOP/RAM1_OE} \
{/top_tb/TOP/RAM1_Q\[23:0\]} \
{/top_tb/TOP/RAM1_WE} \
{/top_tb/TOP/RAM2_A\[19:0\]} \
{/top_tb/TOP/RAM2_D\[23:0\]} \
{/top_tb/TOP/RAM2_OE} \
{/top_tb/TOP/RAM2_WE} \
{/top_tb/TOP/clk} \
{/top_tb/TOP/rst} \
{/top_tb/TOP/wen0} \
{/top_tb/TOP/wen1} \
{/top_tb/TOP/wen2} \
{/top_tb/TOP/wen3} \
{/top_tb/TOP/wen4} \
{/top_tb/TOP/wen5} \
{/top_tb/TOP/wen6} \
{/top_tb/TOP/wen7} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 \
           18 19 20 21 )} 
wvSetPosition -win $_nWave1 {("G1" 21)}
wvSetPosition -win $_nWave1 {("G1" 21)}
wvSetPosition -win $_nWave1 {("G1" 21)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/top_tb/TOP/MAN_A_WEIGHT\[2:0\]} \
{/top_tb/TOP/M_data\[23:0\]} \
{/top_tb/TOP/RAM1_A\[19:0\]} \
{/top_tb/TOP/RAM1_D\[23:0\]} \
{/top_tb/TOP/RAM1_OE} \
{/top_tb/TOP/RAM1_Q\[23:0\]} \
{/top_tb/TOP/RAM1_WE} \
{/top_tb/TOP/RAM2_A\[19:0\]} \
{/top_tb/TOP/RAM2_D\[23:0\]} \
{/top_tb/TOP/RAM2_OE} \
{/top_tb/TOP/RAM2_WE} \
{/top_tb/TOP/clk} \
{/top_tb/TOP/rst} \
{/top_tb/TOP/wen0} \
{/top_tb/TOP/wen1} \
{/top_tb/TOP/wen2} \
{/top_tb/TOP/wen3} \
{/top_tb/TOP/wen4} \
{/top_tb/TOP/wen5} \
{/top_tb/TOP/wen6} \
{/top_tb/TOP/wen7} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 \
           18 19 20 21 )} 
wvSetPosition -win $_nWave1 {("G1" 21)}
wvGetSignalClose -win $_nWave1
wvSelectGroup -win $_nWave1 {G2}
wvSelectSignal -win $_nWave1 {( "G1" 19 )} 
wvSelectSignal -win $_nWave1 {( "G1" 11 )} 
wvSelectSignal -win $_nWave1 {( "G1" 12 )} 
wvSetPosition -win $_nWave1 {("G1" 12)}
wvSetPosition -win $_nWave1 {("G1" 9)}
wvSetPosition -win $_nWave1 {("G1" 3)}
wvSetPosition -win $_nWave1 {("G1" 2)}
wvSetPosition -win $_nWave1 {("G1" 1)}
wvSetPosition -win $_nWave1 {("G1" 0)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 0)}
wvSetPosition -win $_nWave1 {("G1" 1)}
wvSelectSignal -win $_nWave1 {( "G1" 13 )} 
wvSetPosition -win $_nWave1 {("G1" 13)}
wvSetPosition -win $_nWave1 {("G1" 10)}
wvSetPosition -win $_nWave1 {("G1" 4)}
wvSetPosition -win $_nWave1 {("G1" 3)}
wvSetPosition -win $_nWave1 {("G1" 2)}
wvSetPosition -win $_nWave1 {("G1" 1)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 1)}
wvSetPosition -win $_nWave1 {("G1" 2)}
wvSelectSignal -win $_nWave1 {( "G1" 15 )} 
wvSelectSignal -win $_nWave1 {( "G1" 20 )} 
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/top_tb"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP"
wvSetPosition -win $_nWave1 {("G1" 3)}
wvSetPosition -win $_nWave1 {("G1" 3)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/top_tb/TOP/clk} \
{/top_tb/TOP/rst} \
{/top_tb/TOP/done} \
{/top_tb/TOP/MAN_A_WEIGHT\[2:0\]} \
{/top_tb/TOP/M_data\[23:0\]} \
{/top_tb/TOP/RAM1_A\[19:0\]} \
{/top_tb/TOP/RAM1_D\[23:0\]} \
{/top_tb/TOP/RAM1_OE} \
{/top_tb/TOP/RAM1_Q\[23:0\]} \
{/top_tb/TOP/RAM1_WE} \
{/top_tb/TOP/RAM2_A\[19:0\]} \
{/top_tb/TOP/RAM2_D\[23:0\]} \
{/top_tb/TOP/RAM2_OE} \
{/top_tb/TOP/RAM2_WE} \
{/top_tb/TOP/wen0} \
{/top_tb/TOP/wen1} \
{/top_tb/TOP/wen2} \
{/top_tb/TOP/wen3} \
{/top_tb/TOP/wen4} \
{/top_tb/TOP/wen5} \
{/top_tb/TOP/wen6} \
{/top_tb/TOP/wen7} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 3 )} 
wvSetPosition -win $_nWave1 {("G1" 3)}
wvSetPosition -win $_nWave1 {("G1" 3)}
wvSetPosition -win $_nWave1 {("G1" 3)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/top_tb/TOP/clk} \
{/top_tb/TOP/rst} \
{/top_tb/TOP/done} \
{/top_tb/TOP/MAN_A_WEIGHT\[2:0\]} \
{/top_tb/TOP/M_data\[23:0\]} \
{/top_tb/TOP/RAM1_A\[19:0\]} \
{/top_tb/TOP/RAM1_D\[23:0\]} \
{/top_tb/TOP/RAM1_OE} \
{/top_tb/TOP/RAM1_Q\[23:0\]} \
{/top_tb/TOP/RAM1_WE} \
{/top_tb/TOP/RAM2_A\[19:0\]} \
{/top_tb/TOP/RAM2_D\[23:0\]} \
{/top_tb/TOP/RAM2_OE} \
{/top_tb/TOP/RAM2_WE} \
{/top_tb/TOP/wen0} \
{/top_tb/TOP/wen1} \
{/top_tb/TOP/wen2} \
{/top_tb/TOP/wen3} \
{/top_tb/TOP/wen4} \
{/top_tb/TOP/wen5} \
{/top_tb/TOP/wen6} \
{/top_tb/TOP/wen7} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 3 )} 
wvSetPosition -win $_nWave1 {("G1" 3)}
wvGetSignalClose -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvSelectGroup -win $_nWave1 {G2}
wvSelectSignal -win $_nWave1 {( "G1" 8 )} 
wvSelectSignal -win $_nWave1 {( "G1" 9 )} 
wvSelectSignal -win $_nWave1 {( "G1" 7 )} 
wvSelectSignal -win $_nWave1 {( "G1" 6 )} 
wvSelectSignal -win $_nWave1 {( "G1" 7 )} 
wvSelectSignal -win $_nWave1 {( "G1" 8 )} 
wvSetPosition -win $_nWave1 {("G1" 8)}
wvSetPosition -win $_nWave1 {("G1" 6)}
wvSetPosition -win $_nWave1 {("G1" 5)}
wvSetPosition -win $_nWave1 {("G1" 4)}
wvSetPosition -win $_nWave1 {("G1" 5)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 5)}
wvSetPosition -win $_nWave1 {("G1" 6)}
wvSelectSignal -win $_nWave1 {( "G1" 5 )} 
wvSelectGroup -win $_nWave1 {G1}
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G2" 0)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/top_tb"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/C_1"
wvSetPosition -win $_nWave1 {("G2" 21)}
wvSetPosition -win $_nWave1 {("G2" 21)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G2" \
{/top_tb/TOP/C_1/MAN_A_WEIGHT\[2:0\]} \
{/top_tb/TOP/C_1/RAM1_A\[19:0\]} \
{/top_tb/TOP/C_1/RAM1_OE} \
{/top_tb/TOP/C_1/RAM1_Q\[23:0\]} \
{/top_tb/TOP/C_1/RAM1_Q_latch\[23:0\]} \
{/top_tb/TOP/C_1/RAM2_A\[19:0\]} \
{/top_tb/TOP/C_1/RAM2_WE} \
{/top_tb/TOP/C_1/clk} \
{/top_tb/TOP/C_1/counter_1\[19:0\]} \
{/top_tb/TOP/C_1/done} \
{/top_tb/TOP/C_1/n_st\[1:0\]} \
{/top_tb/TOP/C_1/rst} \
{/top_tb/TOP/C_1/st\[2:0\]} \
{/top_tb/TOP/C_1/wen0} \
{/top_tb/TOP/C_1/wen1} \
{/top_tb/TOP/C_1/wen2} \
{/top_tb/TOP/C_1/wen3} \
{/top_tb/TOP/C_1/wen4} \
{/top_tb/TOP/C_1/wen5} \
{/top_tb/TOP/C_1/wen6} \
{/top_tb/TOP/C_1/wen7} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G2" 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 \
           18 19 20 21 )} 
wvSetPosition -win $_nWave1 {("G2" 21)}
wvSetPosition -win $_nWave1 {("G2" 21)}
wvSetPosition -win $_nWave1 {("G2" 21)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G2" \
{/top_tb/TOP/C_1/MAN_A_WEIGHT\[2:0\]} \
{/top_tb/TOP/C_1/RAM1_A\[19:0\]} \
{/top_tb/TOP/C_1/RAM1_OE} \
{/top_tb/TOP/C_1/RAM1_Q\[23:0\]} \
{/top_tb/TOP/C_1/RAM1_Q_latch\[23:0\]} \
{/top_tb/TOP/C_1/RAM2_A\[19:0\]} \
{/top_tb/TOP/C_1/RAM2_WE} \
{/top_tb/TOP/C_1/clk} \
{/top_tb/TOP/C_1/counter_1\[19:0\]} \
{/top_tb/TOP/C_1/done} \
{/top_tb/TOP/C_1/n_st\[1:0\]} \
{/top_tb/TOP/C_1/rst} \
{/top_tb/TOP/C_1/st\[2:0\]} \
{/top_tb/TOP/C_1/wen0} \
{/top_tb/TOP/C_1/wen1} \
{/top_tb/TOP/C_1/wen2} \
{/top_tb/TOP/C_1/wen3} \
{/top_tb/TOP/C_1/wen4} \
{/top_tb/TOP/C_1/wen5} \
{/top_tb/TOP/C_1/wen6} \
{/top_tb/TOP/C_1/wen7} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G2" 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 \
           18 19 20 21 )} 
wvSetPosition -win $_nWave1 {("G2" 21)}
wvGetSignalClose -win $_nWave1
wvZoomIn -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G2" 12 )} 
wvSetPosition -win $_nWave1 {("G2" 12)}
wvSetPosition -win $_nWave1 {("G2" 9)}
wvSetPosition -win $_nWave1 {("G2" 5)}
wvSetPosition -win $_nWave1 {("G2" 4)}
wvSetPosition -win $_nWave1 {("G2" 3)}
wvSetPosition -win $_nWave1 {("G2" 2)}
wvSetPosition -win $_nWave1 {("G2" 1)}
wvSetPosition -win $_nWave1 {("G2" 0)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G2" 0)}
wvSetPosition -win $_nWave1 {("G2" 1)}
wvSelectSignal -win $_nWave1 {( "G2" 9 )} 
wvSetPosition -win $_nWave1 {("G2" 9)}
wvSetPosition -win $_nWave1 {("G2" 6)}
wvSetPosition -win $_nWave1 {("G2" 2)}
wvSetPosition -win $_nWave1 {("G2" 1)}
wvSetPosition -win $_nWave1 {("G2" 0)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G2" 0)}
wvSetPosition -win $_nWave1 {("G2" 1)}
wvSelectSignal -win $_nWave1 {( "G2" 11 )} 
wvSetPosition -win $_nWave1 {("G2" 11)}
wvSetPosition -win $_nWave1 {("G2" 8)}
wvSetPosition -win $_nWave1 {("G2" 3)}
wvSetPosition -win $_nWave1 {("G2" 2)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G2" 2)}
wvSetPosition -win $_nWave1 {("G2" 3)}
wvSelectSignal -win $_nWave1 {( "G2" 11 )} 
wvSetPosition -win $_nWave1 {("G2" 11)}
wvSetPosition -win $_nWave1 {("G2" 8)}
wvSetPosition -win $_nWave1 {("G2" 5)}
wvSetPosition -win $_nWave1 {("G2" 4)}
wvSetPosition -win $_nWave1 {("G2" 3)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G2" 3)}
wvSetPosition -win $_nWave1 {("G2" 4)}
wvSelectSignal -win $_nWave1 {( "G2" 13 )} 
wvSetPosition -win $_nWave1 {("G2" 13)}
wvSetPosition -win $_nWave1 {("G2" 11)}
wvSetPosition -win $_nWave1 {("G2" 7)}
wvSetPosition -win $_nWave1 {("G2" 6)}
wvSetPosition -win $_nWave1 {("G2" 5)}
wvSetPosition -win $_nWave1 {("G2" 4)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G2" 4)}
wvSetPosition -win $_nWave1 {("G2" 5)}
wvSelectSignal -win $_nWave1 {( "G2" 13 )} 
wvSetPosition -win $_nWave1 {("G2" 13)}
wvSetPosition -win $_nWave1 {("G2" 11)}
wvSetPosition -win $_nWave1 {("G2" 8)}
wvSetPosition -win $_nWave1 {("G2" 7)}
wvSetPosition -win $_nWave1 {("G2" 6)}
wvSetPosition -win $_nWave1 {("G2" 5)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G2" 5)}
wvSetPosition -win $_nWave1 {("G2" 6)}
wvSelectSignal -win $_nWave1 {( "G2" 6 )} 
wvSelectSignal -win $_nWave1 {( "G2" 1 )} 
wvSelectGroup -win $_nWave1 {G2}
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G3" 0)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/top_tb"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/C_1"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/M1"
wvSetPosition -win $_nWave1 {("G3" 22)}
wvSetPosition -win $_nWave1 {("G3" 22)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G3" \
{/top_tb/TOP/M1/MAN_A_W\[2:0\]} \
{/top_tb/TOP/M1/clk} \
{/top_tb/TOP/M1/d0_out\[10:0\]} \
{/top_tb/TOP/M1/d1_out\[10:0\]} \
{/top_tb/TOP/M1/d2_out\[10:0\]} \
{/top_tb/TOP/M1/d3_out\[10:0\]} \
{/top_tb/TOP/M1/d4_out\[10:0\]} \
{/top_tb/TOP/M1/d5_out\[10:0\]} \
{/top_tb/TOP/M1/d6_out\[10:0\]} \
{/top_tb/TOP/M1/d7_out\[10:0\]} \
{/top_tb/TOP/M1/data\[23:0\]} \
{/top_tb/TOP/M1/data_in\[23:0\]} \
{/top_tb/TOP/M1/rst} \
{/top_tb/TOP/M1/weight_0\[23:0\]} \
{/top_tb/TOP/M1/weight_1\[23:0\]} \
{/top_tb/TOP/M1/weight_2\[23:0\]} \
{/top_tb/TOP/M1/weight_3\[23:0\]} \
{/top_tb/TOP/M1/weight_4\[23:0\]} \
{/top_tb/TOP/M1/weight_5\[23:0\]} \
{/top_tb/TOP/M1/weight_6\[23:0\]} \
{/top_tb/TOP/M1/weight_7\[23:0\]} \
{/top_tb/TOP/M1/wen} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G3" 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 \
           18 19 20 21 22 )} 
wvSetPosition -win $_nWave1 {("G3" 22)}
wvSetPosition -win $_nWave1 {("G3" 22)}
wvSetPosition -win $_nWave1 {("G3" 22)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G3" \
{/top_tb/TOP/M1/MAN_A_W\[2:0\]} \
{/top_tb/TOP/M1/clk} \
{/top_tb/TOP/M1/d0_out\[10:0\]} \
{/top_tb/TOP/M1/d1_out\[10:0\]} \
{/top_tb/TOP/M1/d2_out\[10:0\]} \
{/top_tb/TOP/M1/d3_out\[10:0\]} \
{/top_tb/TOP/M1/d4_out\[10:0\]} \
{/top_tb/TOP/M1/d5_out\[10:0\]} \
{/top_tb/TOP/M1/d6_out\[10:0\]} \
{/top_tb/TOP/M1/d7_out\[10:0\]} \
{/top_tb/TOP/M1/data\[23:0\]} \
{/top_tb/TOP/M1/data_in\[23:0\]} \
{/top_tb/TOP/M1/rst} \
{/top_tb/TOP/M1/weight_0\[23:0\]} \
{/top_tb/TOP/M1/weight_1\[23:0\]} \
{/top_tb/TOP/M1/weight_2\[23:0\]} \
{/top_tb/TOP/M1/weight_3\[23:0\]} \
{/top_tb/TOP/M1/weight_4\[23:0\]} \
{/top_tb/TOP/M1/weight_5\[23:0\]} \
{/top_tb/TOP/M1/weight_6\[23:0\]} \
{/top_tb/TOP/M1/weight_7\[23:0\]} \
{/top_tb/TOP/M1/wen} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G3" 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 \
           18 19 20 21 22 )} 
wvSetPosition -win $_nWave1 {("G3" 22)}
wvGetSignalClose -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G3" 22 )} 
wvSetPosition -win $_nWave1 {("G3" 19)}
wvSetPosition -win $_nWave1 {("G3" 16)}
wvSetPosition -win $_nWave1 {("G3" 15)}
wvSetPosition -win $_nWave1 {("G3" 14)}
wvSetPosition -win $_nWave1 {("G3" 13)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G3" 13)}
wvSetPosition -win $_nWave1 {("G3" 14)}
wvSelectSignal -win $_nWave1 {( "G3" 13 )} 
wvSetPosition -win $_nWave1 {("G3" 13)}
wvSetPosition -win $_nWave1 {("G3" 10)}
wvSetPosition -win $_nWave1 {("G3" 6)}
wvSetPosition -win $_nWave1 {("G3" 5)}
wvSetPosition -win $_nWave1 {("G3" 4)}
wvSetPosition -win $_nWave1 {("G3" 3)}
wvSetPosition -win $_nWave1 {("G3" 2)}
wvSetPosition -win $_nWave1 {("G3" 1)}
wvSetPosition -win $_nWave1 {("G3" 0)}
wvSetPosition -win $_nWave1 {("G3" 1)}
wvSetPosition -win $_nWave1 {("G3" 2)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G3" 2)}
wvSetPosition -win $_nWave1 {("G3" 3)}
wvSelectSignal -win $_nWave1 {( "G3" 1 )} 
wvSetPosition -win $_nWave1 {("G3" 1)}
wvSetPosition -win $_nWave1 {("G3" 3)}
wvSetPosition -win $_nWave1 {("G3" 4)}
wvSetPosition -win $_nWave1 {("G3" 5)}
wvSetPosition -win $_nWave1 {("G3" 6)}
wvSetPosition -win $_nWave1 {("G3" 7)}
wvSetPosition -win $_nWave1 {("G3" 8)}
wvSetPosition -win $_nWave1 {("G3" 9)}
wvSetPosition -win $_nWave1 {("G3" 10)}
wvSetPosition -win $_nWave1 {("G3" 11)}
wvSetPosition -win $_nWave1 {("G3" 12)}
wvSetPosition -win $_nWave1 {("G3" 13)}
wvSetPosition -win $_nWave1 {("G3" 14)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G3" 14)}
wvSelectSignal -win $_nWave1 {( "G3" 13 )} 
wvSelectSignal -win $_nWave1 {( "G3" 12 )} 
wvSelectSignal -win $_nWave1 {( "G3" 11 )} 
wvSelectSignal -win $_nWave1 {( "G3" 10 )} 
wvSelectSignal -win $_nWave1 {( "G3" 3 )} 
wvSetCursor -win $_nWave1 58724.255192 -snap {("G2" 0)}
wvSetCursor -win $_nWave1 104506.525769 -snap {("G3" 13)}
wvSelectSignal -win $_nWave1 {( "G3" 3 )} 
wvSelectSignal -win $_nWave1 {( "G3" 3 )} 
wvSelectGroup -win $_nWave1 {G3}
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G2" 0)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/top_tb"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/C_1"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/M1"
wvGetSignalSetScope -win $_nWave1 "/top_tb/TOP/m1"
wvSetPosition -win $_nWave1 {("G2" 16)}
wvSetPosition -win $_nWave1 {("G2" 16)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G2" \
{/top_tb/TOP/m1/clk} \
{/top_tb/TOP/m1/d0\[10:0\]} \
{/top_tb/TOP/m1/d1\[10:0\]} \
{/top_tb/TOP/m1/d2\[10:0\]} \
{/top_tb/TOP/m1/d3\[10:0\]} \
{/top_tb/TOP/m1/d4\[10:0\]} \
{/top_tb/TOP/m1/d5\[10:0\]} \
{/top_tb/TOP/m1/d6\[10:0\]} \
{/top_tb/TOP/m1/d7\[10:0\]} \
{/top_tb/TOP/m1/d_min\[10:0\]} \
{/top_tb/TOP/m1/d_min_pos\[2:0\]} \
{/top_tb/TOP/m1/rst} \
{/top_tb/TOP/m1/temp_0\[10:0\]} \
{/top_tb/TOP/m1/temp_1\[10:0\]} \
{/top_tb/TOP/m1/temp_2\[10:0\]} \
{/top_tb/TOP/m1/temp_3\[10:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G2" 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 )} \
           
wvSetPosition -win $_nWave1 {("G2" 16)}
wvSetPosition -win $_nWave1 {("G2" 16)}
wvSetPosition -win $_nWave1 {("G2" 16)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G2" \
{/top_tb/TOP/m1/clk} \
{/top_tb/TOP/m1/d0\[10:0\]} \
{/top_tb/TOP/m1/d1\[10:0\]} \
{/top_tb/TOP/m1/d2\[10:0\]} \
{/top_tb/TOP/m1/d3\[10:0\]} \
{/top_tb/TOP/m1/d4\[10:0\]} \
{/top_tb/TOP/m1/d5\[10:0\]} \
{/top_tb/TOP/m1/d6\[10:0\]} \
{/top_tb/TOP/m1/d7\[10:0\]} \
{/top_tb/TOP/m1/d_min\[10:0\]} \
{/top_tb/TOP/m1/d_min_pos\[2:0\]} \
{/top_tb/TOP/m1/rst} \
{/top_tb/TOP/m1/temp_0\[10:0\]} \
{/top_tb/TOP/m1/temp_1\[10:0\]} \
{/top_tb/TOP/m1/temp_2\[10:0\]} \
{/top_tb/TOP/m1/temp_3\[10:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G2" 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 )} \
           
wvSetPosition -win $_nWave1 {("G2" 16)}
wvGetSignalClose -win $_nWave1
wvExit
