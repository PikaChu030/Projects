/////////////////////////////////////////////////////////////////////
// ---------------------- IVCAD 2022 Spring ---------------------- //
// ---------------------- Editor: Tseng Hsin-Yu (Sylvia) --------- //
// ---------------------- Version : v.1.00  ---------------------- //
// ---------------------- Date : 2021.01    ---------------------- //
// ---------------------- ripple_adder  -------------------------- // 
/////////////////////////////////////////////////////////////////////
`include "../ProbB/FullAdder.v"
// Module name and I/O port
module ripple_adder(A,B,addsub,S,Cout,ov_flag);

// Input and output ports declaration
input [5:0] A,B;
input addsub;
output [5:0]S;
output Cout, ov_flag;

/********* your code ***********/
wire [4:0] C;
wire [5:0] B_temp;
xor(B_temp[0],B[0],addsub);
xor(B_temp[1],B[1],addsub);
xor(B_temp[2],B[2],addsub);
xor(B_temp[3],B[3],addsub);
xor(B_temp[4],B[4],addsub);
xor(B_temp[5],B[5],addsub);


FullAdder M1 (.A(A[0]),.B(B_temp[0]),.S(S[0]),.Cin(addsub),.Cout(C[0]));
FullAdder M2 (.A(A[1]),.B(B_temp[1]),.S(S[1]),.Cin(C[0]),.Cout(C[1]));
FullAdder M3 (.A(A[2]),.B(B_temp[2]),.S(S[2]),.Cin(C[1]),.Cout(C[2]));
FullAdder M4 (.A(A[3]),.B(B_temp[3]),.S(S[3]),.Cin(C[2]),.Cout(C[3]));
FullAdder M5 (.A(A[4]),.B(B_temp[4]),.S(S[4]),.Cin(C[3]),.Cout(C[4]));
FullAdder M6 (.A(A[5]),.B(B_temp[5]),.S(S[5]),.Cin(C[4]),.Cout(Cout));
xor (ov_flag,C[4],Cout);









/******************************/

endmodule


