/////////////////////////////////////////////////////////////////////
// ---------------------- IVCAD 2022 Spring ---------------------- //
// ---------------------- Editor: Teng Shih-Ying(Wendy) --------- //
// ---------------------- Version : v.2.00  ---------------------- //
// ---------------------- Date : 2022.02    ---------------------- //
// ---------------------- ripple_adder --------------------------- // 
/////////////////////////////////////////////////////////////////////
`timescale 1ns/10ps
`define INTERVAL 10

module ripple_adder_tb;
  reg   [5:0] A,B;
  reg         addsub;
  wire  [5:0] S;
  wire        Cout,ov_flag;
  
  
  ripple_adder ripple_adder(.A(A),.B(B),.addsub(addsub),.S(S),.Cout(Cout),.ov_flag(ov_flag));
  
  initial begin
	$monitor($time,"ns, A=%b, B=%b, addsub=%b, S=%d, Cout=%b, ov_flag=%b",A,B,addsub,S,Cout,ov_flag);
  end
  

  initial begin
             A = 31 ;    B = 12 ;   addsub = 0;
  #`INTERVAL A = 7 ;    B = -5;   addsub = 0;
  #`INTERVAL A = -10 ;    B = 13 ;   addsub = 0;
  #`INTERVAL A = -31;    B = -24 ;   addsub = 0;
  #`INTERVAL A = -31;    B = -24 ;   addsub = 1;
  #`INTERVAL A = -28;    B = 10 ;   addsub = 1;
  #`INTERVAL A = 8;    B = 31;   addsub = 1;
  #`INTERVAL A = 20 ;    B = 7 ;   addsub = 1;
  #`INTERVAL A = 22 ;    B = -25 ;   addsub = 1;  
  #`INTERVAL $finish;
  end


initial
  begin
  `ifdef FSDB
    $fsdbDumpfile("ripple_adder.fsdb");
    $fsdbDumpvars(0, ripple_adder);
  `endif
  end
  
endmodule
