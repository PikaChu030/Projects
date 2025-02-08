/////////////////////////////////////////////////////////////////////
// ---------------------- IVCAD 2021 Spring ---------------------- //
// ---------------------- Editor: Tseng Hsin-Yu (Sylvia) --------- //
// ---------------------- Version : v.1.00  ---------------------- //
// ---------------------- Date : 2021.02    ---------------------- //
// ---------------------- FullAdder  ----------------------------- // 
/////////////////////////////////////////////////////////////////////
// Module name and I/O port
module FullAdder(A,B,Cin,S,Cout);

// Input and output ports declaration
input A,B,Cin;
output S,Cout;
/********* your code ***********/
wire temp_1,temp_2,temp_3;
xor(temp_1,A,B);
xor(S,temp_1,Cin);
and(temp_2,A,B);
and(temp_3,temp_1,Cin);
or(Cout,temp_2,temp_3);
/******************************/

endmodule
