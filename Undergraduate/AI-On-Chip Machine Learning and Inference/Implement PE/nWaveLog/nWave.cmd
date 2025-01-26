wvResizeWindow -win $_nWave1 125 132 960 332
wvSetPosition -win $_nWave1 {("G1" 0)}
wvOpenFile -win $_nWave1 {/home/AOC2023/aoc2023_021/AOClab3/MAC.fsdb}
wvResizeWindow -win $_nWave1 0 23 1920 1057
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/MAC_tb"
wvGetSignalSetScope -win $_nWave1 "/MAC_tb/MAC0"
wvSetPosition -win $_nWave1 {("G1" 3)}
wvSetPosition -win $_nWave1 {("G1" 3)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/MAC_tb/MAC0/ifmap\[7:0\]} \
{/MAC_tb/MAC0/filter\[7:0\]} \
{/MAC_tb/MAC0/psum\[23:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 2 3 )} 
wvSetPosition -win $_nWave1 {("G1" 3)}
wvSetPosition -win $_nWave1 {("G1" 4)}
wvSetPosition -win $_nWave1 {("G1" 4)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/MAC_tb/MAC0/ifmap\[7:0\]} \
{/MAC_tb/MAC0/filter\[7:0\]} \
{/MAC_tb/MAC0/psum\[23:0\]} \
{/MAC_tb/MAC0/add_res\[23:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 4 )} 
wvSetPosition -win $_nWave1 {("G1" 4)}
wvSetPosition -win $_nWave1 {("G1" 5)}
wvSetPosition -win $_nWave1 {("G1" 5)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/MAC_tb/MAC0/ifmap\[7:0\]} \
{/MAC_tb/MAC0/filter\[7:0\]} \
{/MAC_tb/MAC0/psum\[23:0\]} \
{/MAC_tb/MAC0/add_res\[23:0\]} \
{/MAC_tb/MAC0/updated_psum\[23:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 5 )} 
wvSetPosition -win $_nWave1 {("G1" 5)}
wvSetPosition -win $_nWave1 {("G1" 5)}
wvSetPosition -win $_nWave1 {("G1" 5)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/MAC_tb/MAC0/ifmap\[7:0\]} \
{/MAC_tb/MAC0/filter\[7:0\]} \
{/MAC_tb/MAC0/psum\[23:0\]} \
{/MAC_tb/MAC0/add_res\[23:0\]} \
{/MAC_tb/MAC0/updated_psum\[23:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 5 )} 
wvSetPosition -win $_nWave1 {("G1" 5)}
wvGetSignalClose -win $_nWave1
wvResizeWindow -win $_nWave1 0 23 1920 1057
wvSetCursor -win $_nWave1 536662.176162 -snap {("G2" 0)}
wvResizeWindow -win $_nWave1 0 23 1920 1057
wvSetCursor -win $_nWave1 443059.323761 -snap {("G1" 1)}
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvSetCursor -win $_nWave1 208.016885 -snap {("G1" 3)}
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvSetCursor -win $_nWave1 7556.733391 -snap {("G1" 3)}
wvSetCursor -win $_nWave1 7894.760829 -snap {("G1" 3)}
wvResizeWindow -win $_nWave1 0 23 1920 1057
wvSetCursor -win $_nWave1 10704.033326 -snap {("G1" 2)}
wvSetCursor -win $_nWave1 10429.419454 -snap {("G1" 1)}
wvSetCursor -win $_nWave1 1085.214874 -snap {("G1" 2)}
wvSetCursor -win $_nWave1 7614.175242 -snap {("G1" 1)}
wvSetCursor -win $_nWave1 570246.194452 -snap {("G1" 2)}
wvSearchPrev -win $_nWave1
wvSearchPrev -win $_nWave1
wvSearchPrev -win $_nWave1
wvSearchPrev -win $_nWave1
wvSearchPrev -win $_nWave1
wvSetCursor -win $_nWave1 569998.798724 -snap {("G1" 4)}
wvSetCursor -win $_nWave1 569852.232347 -snap {("G1" 2)}
wvSelectSignal -win $_nWave1 {( "G1" 1 )} 
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 4 5 )} 
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 4 5 )} 
wvSetRadix -win $_nWave1 -format UDec
