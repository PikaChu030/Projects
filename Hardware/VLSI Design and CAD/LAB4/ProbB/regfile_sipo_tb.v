/////////////////////////////////////////////////////////////////////
// ---------------------- IVCAD 2020 Spring ---------------------- //
// ---------------------- Editor : Claire C  --------------------- //
// ---------------------- Version : v.1.00  ---------------------- //
// ---------------------- Date : 2020.02.20 ---------------------- //
// ---------------------- SIPO Register File Testbench ----------- //
/////////////////////////////////////////////////////////////////////

`timescale 1ns/10ps

`include "regfile_sipo.v"

// ---------------------- define ---------------------- //
// ----You can define the parameters you want below---- //

`define clkPeriod 10
`define AddrSize 7
`define DataSize 32

module regfile_sipo_tb();
  // ---------------------------------------------------- //
  // ----------------------   reg  ---------------------- //
  reg						     	clk;
  reg						     	rst;
  reg						     	reg_enable;
  reg 					     	reg_write;
  reg	[`AddrSize-1:0]	src_addr;
  reg	[`AddrSize-1:0]	write_addr;
  reg	[`DataSize-1:0]	write_data;

  // ----------------------  wire  ---------------------- //
  wire	[`DataSize-1:0]		src1;
  wire	[`DataSize-1:0]		src2;
  wire 	[`DataSize-1:0]		src3;
  wire 	[`DataSize-1:0]		src4;
  wire 	[`DataSize-1:0]		src5;

  integer i;

  regfile_sipo RF (.clk(clk), .rst(rst), .reg_enable(reg_enable), .reg_write(reg_write),
                   .src_addr(src_addr), .write_addr(write_addr), .write_data(write_data),
                   .src1(src1), .src2(src2), .src3(src3), .src4(src4), .src5(src5));

  //monitor
  initial begin
    #300
     $display("-----------------------register file---------------------------");
    for(i=0;i<`RegSize;i=i+1) begin
      $display("REG[%d] = %d  ",i,RF.REG[i]);
    end
  end

  //clock generator
  always #(`clkPeriod/2) clk = ~clk;

  initial begin
    clk = 0;
    rst = 1;
    reg_enable = 0;
    reg_write = 0;
    write_addr = 7'd0;
    write_data = 32'd0;
    src_addr = 7'd0;
    #10			   rst = 0;
    src_addr = 7'd0;
    #6                  reg_enable = 1;
    reg_write = 1;
    write_addr = 7'd0;
    write_data = 32'hffff_0000;
    src_addr = 7'd0;
    #10 		 		reg_enable = 1;
    reg_write = 1;
    write_addr = 7'd1;
    write_data = 32'hffff_0001;
    src_addr = 7'd0;
    #10 		 		reg_enable = 1;
    reg_write = 1;
    write_addr = 7'd2;
    write_data = 32'hffff_0002;
    src_addr = 7'd0;
    #10 		 		reg_enable = 1;
    reg_write = 1;
    write_addr = 7'd3;
    write_data = 32'hffff_0003;
    src_addr = 7'd0;
    #10 		 		reg_enable = 1;
    reg_write = 1;
    write_addr = 7'd4;
    write_data = 32'hffff_0004;
    src_addr = 7'd0;
    #10 		 		reg_enable = 1;
    reg_write = 1;
    write_addr = 7'd105;
    write_data = 32'hffff_0005;
    src_addr = 7'd0;
    #10 		 		reg_enable = 1;
    reg_write = 1;
    write_addr = 7'd106;
    write_data = 32'hffff_0006;
    src_addr = 7'd0;
    #10 		 		reg_enable = 1;
    reg_write = 1;
    write_addr = 7'd107;
    write_data = 32'hffff_0007;
    src_addr = 7'd0;
    #10 		 		reg_enable = 1;
    reg_write = 1;
    write_addr = 7'd108;
    write_data = 32'hffff_0008;
    src_addr = 7'd0;
    #10 		 		reg_enable = 1;
    reg_write = 1;
    write_addr = 7'd109;
    write_data = 32'hffff_0009;
    src_addr = 7'd0;
    #10                 reg_enable = 1;
    reg_write = 0;
    write_addr = 7'd0;
    write_data = 32'h0000_0000;
    src_addr = 7'd0;
    #10                 reg_enable = 1;
    reg_write = 0;
    write_addr = 7'd0;
    write_data = 32'h0000_0000;
    src_addr = 7'd105;



    // ----------please complete the test patterns here--------------- //

    #200 $finish;
  end

  initial begin
`ifdef FSDB
    $fsdbDumpfile("regfile_sipo.fsdb");
    $fsdbDumpvars;
`endif
  end
endmodule

