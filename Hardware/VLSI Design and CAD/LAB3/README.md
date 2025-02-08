# lab3
## Multiplexer
16-to-1 multiplexer and testbench that needs to test all selected inputs and print results

## Arithmetic Logic Unit
1. operations

|alu_op|operation|description|
|:-:|:-:|:-:|
|01000|NOT|~src1|
|01001|NAND|~(src1&src2)|
|01010|MAX|max{sec1, src2}|
|01011|MIN|min{sec1, src2}|
|01100|ABS|\|src\||
|01101|SLTS|(src1<src2)?1:0|
|01110|SLL|src1<<src2|
|01111|ROTL|src1 rotate left by "src2 bits"|
|10000|ASSU|unsigned(src1+src2)|
|10001|SRLU|unsigned(src1>>src2)|

2. Port

|signal|type|bits|description|
|:-:|:-:|:-:|:-:|
|alu_enable|input|1|0->close;1->open|
|alu_op|input|5|opcode select which op to be execued|
|src1|input|32|ALU source 1|
|src2|input|32|ALU source 2|
|alu_out|output|32|ALU result|
|alu_overflow|output|1|0->no;1->yes|

## Multiplication
