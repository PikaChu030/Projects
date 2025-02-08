/////////////////////////////////////////////////////////////////////
// ---------------------- IVCAD 2020 Spring ---------------------- //
// ---------------------- Editor: Tseng Hsin-Yu (Sylvia) --------- //
// ---------------------- Version : v.1.10  ---------------------- //
// ---------------------- Date : 2020.04    ---------------------- //
// ---------------------- det_1001_tb  --------------------------- // 
/////////////////////////////////////////////////////////////////////
`timescale 1ns/1ps
`define INTERVAL 10

`ifdef syn
   `include "det_1001_syn.v"
   `include "/usr/cad/CBDK/SAED14_EDK_rvt/verilog/saed14nm_rvt.v"
`else
   `include "det_1001.v"
`endif


module det_1001_tb();
  reg clk,rst,d;
  wire q;
  wire [1:0] num;

  reg [19:0] golden;
  reg [1:0]  num_golden;
  integer i,err;
 
  det_1001 d0(.clk(clk),.rst(rst),.d(d),.q(q), .num(num));

  always begin
    #(`INTERVAL/2) clk = ~clk;
  end

 initial begin
                clk = 1; rst = 1; d = 0;
    #`INTERVAL  rst = 1;
    #(`INTERVAL*0.5)  rst = 0; 
    #`INTERVAL  d = 1;
    #`INTERVAL  d = 0;
    #`INTERVAL  d = 1;
    #`INTERVAL  d = 0;
    #`INTERVAL  d = 0;
    #`INTERVAL  d = 1;
    #`INTERVAL  d = 0;
    #`INTERVAL  d = 0;
    #`INTERVAL  d = 1;
    #`INTERVAL  d = 1;
    #`INTERVAL  d = 0;
    #`INTERVAL  d = 0;
    #`INTERVAL  d = 0;
    #`INTERVAL  d = 1;
    #`INTERVAL  d = 0;
    #`INTERVAL  d = 0;
    #`INTERVAL  d = 1;
    #`INTERVAL  d = 0;
    #`INTERVAL  d = 1;
 end

 initial begin
   golden[0] = 0;
   golden[1] = 0;
   golden[2] = 0;
   golden[3] = 0;
   golden[4] = 0;
   golden[5] = 0;
   golden[6] = 1;
   golden[7] = 0;
   golden[8] = 0;
   golden[9] = 1;
   golden[10] = 0;
   golden[11] = 0;
   golden[12] = 0;
   golden[13] = 0;
   golden[14] = 0;
   golden[15] = 0;
   golden[16] = 0;
   golden[17] = 1;
   golden[18] = 0;
   golden[19] = 0;
   num_golden = 2'd3;
end


  initial begin
    err = 0;
    #(3*`INTERVAL-1)
    for(i=0;i<20;i=i+1)begin
       if(q == golden[i])
          $display("Result No.%0d is correct.", i+1);
      else begin
          $display("Result No.%0d is not correct. The result is %d, but %d is expected.", i+1, q, golden[i]);
          err = err + 1;
      end
       #`INTERVAL;
    end

    if(num == num_golden)
    	$display("The totoal number of pattern 1001 is %d. Correct!",num);
    else begin
     	$display("The totoal number of pattern 1001 is %d. Not correct, %d is expected!",num,num_golden);       
         err = err + 1;
    end

    if(err==0)begin
          $display("                                                     ");
          $display("     ************************************************");
          $display("     *                                              *");
          $display("     *  Congrats! All results are correct. (^o^)b   *");
          $display("     *                                              *");
          $display("     ************************************************"); 
          $display("                                                     ");
    end
    else begin
          $display("                                                     ");
          $display("     ************************************************");
          $display("     *                                              *");
          $display("     *           Something is error. (T_T)          *");
          $display("     *                                              *");
          $display("     ************************************************"); 
          $display("                                                     ");
    end

    $finish;
  end

  `ifdef FSDB
  initial begin
       $fsdbDumpfile("det_1001_tb.fsdb");
       $fsdbDumpvars;
   end
  `endif

 `ifdef syn
    initial $sdf_annotate("det_1001_syn.sdf",d0);
 `endif

endmodule

