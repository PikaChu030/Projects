`timescale 1ns/10ps
`include "mux16to1.v"

module mux16to1_tb;
    reg  A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P;
    reg  [3:0] sel;
    wire Q;

    mux16to1 mux (.A(A),.B(B),.C(C),.D(D),.E(E),.F(F),.G(G),.H(H),.I(I),.J(J),.K(K),.L(L),.M(M),.N(N),.O(O),.P(P),.sel(sel),.Q(Q));
    initial $monitor($time, "  A=%d, B=%d, C=%d, D=%d, E=%d, F=%d, G=%d, H=%d, I=%d, J=%d, K=%d, L=%d, M=%d, N=%d, O=%d, P=%d, sel=%d, Q=%d ",
    A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, sel, Q);

    initial begin
            A=0; B=0; C=0; D=0; E=0; F=0; G=0; H=0; I=0; J=0; K=0; L=0; M=0; N=0; O=0; P=0; sel=4'd0;
	#10 A=1; sel=4'd0;
	#10 A=0;B=1;sel=4'd1;
	#10 B=0;C=1;sel=4'd2;
	#10 C=0;D=1;sel=4'd3;
	#10 D=0;E=1;sel=4'd4;
	#10 E=0;F=1;sel=4'd5;
	#10 F=0;G=1;sel=4'd6;
	#10 G=0;H=1;sel=4'd7;
	#10 H=0;I=1;sel=4'd8;
	#10 I=0;J=1;sel=4'd9;
	#10 J=0;K=1;sel=4'd10;
	#10 K=0;L=1;sel=4'd11;
	#10 L=0;M=1;sel=4'd12;
	#10 M=0;N=1;sel=4'd13;
	#10 N=0;O=1;sel=4'd14;
	#10 O=0;P=1;sel=4'd15;
	#10 sel=2'd0;
        #10 $finish;
    end

    initial begin
        `ifdef FSDB
        $fsdbDumpfile("mux16to1.fsdb");
        $fsdbDumpvars;
        `endif
    end

endmodule
