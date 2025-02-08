verdiSetActWin -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 0)}
wvOpenFile -win $_nWave1 {/home/user2/vlsi22/vlsi22114/Lab3/ProbB/ALU.fsdb}
wvResizeWindow -win $_nWave1 0 23 1920 1017
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/ALU_tb"
wvGetSignalSetScope -win $_nWave1 "/ALU_tb/alu"
wvSetPosition -win $_nWave1 {("G1" 6)}
wvSetPosition -win $_nWave1 {("G1" 6)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/ALU_tb/alu/alu_enable} \
{/ALU_tb/alu/alu_op\[4:0\]} \
{/ALU_tb/alu/alu_out\[31:0\]} \
{/ALU_tb/alu/alu_overflow} \
{/ALU_tb/alu/src1\[31:0\]} \
{/ALU_tb/alu/src2\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 4 5 6 )} 
wvSetPosition -win $_nWave1 {("G1" 6)}
wvSetPosition -win $_nWave1 {("G1" 6)}
wvSetPosition -win $_nWave1 {("G1" 6)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/ALU_tb/alu/alu_enable} \
{/ALU_tb/alu/alu_op\[4:0\]} \
{/ALU_tb/alu/alu_out\[31:0\]} \
{/ALU_tb/alu/alu_overflow} \
{/ALU_tb/alu/src1\[31:0\]} \
{/ALU_tb/alu/src2\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 4 5 6 )} 
wvSetPosition -win $_nWave1 {("G1" 6)}
wvGetSignalClose -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 4 5 6 )} 
wvSetRadix -win $_nWave1 -format Hex
wvExit
