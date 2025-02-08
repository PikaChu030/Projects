/////////////////////////////////////////////////////////////////////
// ---------------------- IVCAD 2022 Spring ---------------------- //
// ---------------------- Editor: Teng Shih-Ying(Wendy)  --------- //
// ---------------------- Version : v.1.00  ---------------------- //
// ---------------------- Date : 2022.02    ---------------------- //
// ---------------------- K-map simplifier  ---------------------- // 
/////////////////////////////////////////////////////////////////////
`timescale 1ns/10ps
`define INTERVAL 10

module kmap_tb;
	reg    A,B,C,D;

	wire  Out;
  
  
	kmap kmap(.A(A), .B(B), .C(C), .D(D), .Out(Out));
  
	integer i,j;
	initial begin
	$monitor($time,"ns, A=%b, B=%b, C=%b , D=%b , Out=%b",A,B,C,D,Out);
	end
	
	initial begin
			   A = 0;	B = 0;	C = 0;	D = 0;
	#`INTERVAL A = 0;	B = 0;	C = 0;	D = 1;
	#`INTERVAL A = 0;	B = 0;	C = 1;	D = 0;
	#`INTERVAL A = 0;	B = 0;	C = 1;	D = 1;
	#`INTERVAL A = 0;	B = 1;	C = 0;	D = 0;
	#`INTERVAL A = 0;	B = 1;	C = 0;	D = 1;
	#`INTERVAL A = 0;	B = 1;	C = 1;	D = 0;
	#`INTERVAL A = 0;	B = 1;	C = 1;	D = 1;
	#`INTERVAL A = 1;	B = 0;	C = 0;	D = 0;
	#`INTERVAL A = 1;	B = 0;	C = 0;	D = 1;
	#`INTERVAL A = 1;	B = 0;	C = 1;	D = 0;
	#`INTERVAL A = 1;	B = 0;	C = 1;	D = 1;
	#`INTERVAL A = 1;	B = 1;	C = 0;	D = 0;
	#`INTERVAL A = 1;	B = 1;	C = 0;	D = 1;
	#`INTERVAL A = 1;	B = 1;	C = 1;	D = 0;
	#`INTERVAL A = 1;	B = 1;	C = 1;	D = 1;
	#`INTERVAL $finish;
	end


initial 
begin
	`ifdef FSDB
		$fsdbDumpfile("kmap.fsdb");
		$fsdbDumpvars(0, kmap);
	`endif
end
  
endmodule