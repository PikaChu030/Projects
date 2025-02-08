/////////////////////////////////////////////////////////////////////
// ---------------------- IVCAD 2022 Spring ---------------------- //
// ---------------------- Editor: Teng Shih-Ying(Wendy) -------=-- //
// ---------------------- Version : v.1.00  ---------------------- //
// ---------------------- Date : 2022.02    ---------------------- //
// ---------------------- K-map simplifier  ---------------------- // 
/////////////////////////////////////////////////////////////////////
// Module name and I/O port
module kmap(A,B,C,D,Out);

// Input and output ports declaration
input A,B,C,D;
output Out;
/********* your code ***********/
wire [7:0] temp;

nor(temp[0],B,B);
nor(temp[1],D,D);
nor(temp[2],A,temp[1]);
nor(temp[3],C,C);
nor(temp[4],temp[3],temp[0]);
nor(temp[5],temp[4],temp[1]);
nor(temp[6],temp[2],temp[0]);
nor(temp[7],temp[6],temp[5]);
nor(Out,temp[7],temp[7]);



/******************************/
endmodule
