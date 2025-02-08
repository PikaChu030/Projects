/////////////////////////////////////////////////////////////////////
// ---------------------- IVCAD 2022 Spring ---------------------- //
// ---------------------- Editor: Teng Shih-Ying (Wendy) --------- //
// ---------------------- Version : v.1.00  ---------------------- //
// ---------------------- Date : 2022.02    ---------------------- //
// ---------------------- 3x3 bit multiplier  -------------------- // 
/////////////////////////////////////////////////////////////////////
`include "../ProbB/FullAdder.v"
// Module name and I/O port
module multi(A,B,S);

// Input and output ports declaration
input  [2:0]  A;
input  [2:0]  B;
output [5:0]  S;

/************your code************/
wire t,c,n_c,n;
wire [7:0] temp;
wire [3:0] C_temp;

and (S[0],A[0],B[0]);
and (temp[0],A[1],B[0]);
and (temp[1],A[0],B[1]);
and (temp[2],A[2],B[0]);
and (temp[3],A[1],B[1]);
and (temp[4],A[0],B[2]);
and (temp[5],A[2],B[1]);
and (temp[6],A[1],B[2]);
and (temp[7],A[2],B[2]);
not (n,1);
FullAdder M1 (.A(temp[0]),.B(temp[1]),.S(S[1]),.Cin(n),.Cout(C_temp[0]));
FullAdder M2 (.A(temp[2]),.B(temp[3]),.S(t),.Cin(C_temp[0]),.Cout(C_temp[1]));
FullAdder M3 (.A(temp[4]),.B(t),.S(S[2]),.Cin(n),.Cout(C_temp[2]));
xor (c,C_temp[1],C_temp[2]);
and (n_c,C_temp[1],C_temp[2]);
FullAdder M4 (.A(temp[5]),.B(temp[6]),.S(S[3]),.Cin(c),.Cout(C_temp[3]));
FullAdder M5 (.A(temp[7]),.B(C_temp[3]),.S(S[4]),.Cin(n_c),.Cout(S[5]));


/*********************************/

endmodule
