/////////////////////////////////////////////////////////////////////
// ---------------------- IVCAD 2022 Spring ---------------------- //
// ---------------------- Editor: Teng Shih-Ying(Wendy)  --------- //
// ---------------------- Version : v.1.00  ---------------------- //
// ---------------------- Date : 2022.02    ---------------------- //
// ---------------------- 3x3 bit multiplier --------------------- // 
/////////////////////////////////////////////////////////////////////
`timescale 1ns/10ps
`define INTERVAL 10

module multi_tb;
	reg   [2:0] A;
	reg   [2:0] B;
	wire  [5:0] S;
  
  
	multi multi(.A(A),.B(B),.S(S));
  
	integer i,j;
	initial begin
	$monitor($time,"ns, A=%d, B=%d, S in decimal=%d, S in binary=%b",A,B,S,S);
	end
	
	initial begin
		for(i=0;i<8;i++)begin
			for(j=0;j<8;j++)begin
				#`INTERVAL A = i ;    B = j;
			end
		end
		#`INTERVAL
		$finish;
	end


initial 
begin
	`ifdef FSDB
		$fsdbDumpfile("multi.fsdb");
		$fsdbDumpvars(0, multi);
	`endif
end
  
endmodule