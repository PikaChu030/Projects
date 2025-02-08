`timescale 1ns/10ps
`define PERIOD 10.0
`ifdef syn
`include "/usr/cad/CBDK/SAED14_EDK_rvt/verilog/saed14nm_rvt.v"
`include "pattern_gen_syn.v"
`else
`include "pattern_gen.v"
`endif

module tb;
	reg 		clk;
	reg			rst;
	reg         en;
	reg         x;
	wire        p;
	wire        valid;
	integer     i,err=0;
	
	initial begin
		en = 1'b0;
		x = 1'b0;
		clk = 0;
		rst = 1'b1; 
		#(`PERIOD) rst = 1'b0;
		#(`PERIOD) begin 
			en = 1'b1;
			x = 1'b1;
		end
		wait(valid);
		$display("//////////////////x is %d/////////////////", x);
		for(i=0;i<2;i=i+1)
		begin
		@(negedge clk) 
		begin
			if(p!=1) 
			begin 
			err=err+1;
			$display("p is %d, expect %d", p,1);
			end
			else $display("p is %d, pass!!!", p);
		end
		
		@(negedge clk) 
		begin
			if(p!=0) 
			begin 
			err=err+1;
			$display("p is %d, expect %d", p,0);
			end
			else $display("p is %d, pass!!!", p);
		end
		end
		
		
		#(`PERIOD) en  = 1'b0;
		#(`PERIOD) 
		begin 
			en  = 1'b1;
			x = 1'b0;
		end
		
		
		wait(valid);
		$display("//////////////////x is %d/////////////////", x);
		@(negedge clk) 
		begin
			if(p!=1) 
			begin 
			err=err+1;
			$display("p is %d, expect %d", p,1);
			end
			else $display("p is %d, pass!!!", p);
		end
		
		for(i=0;i<3;i=i+1)
		begin
		
		@(negedge clk) 
		begin
			if(p!=0) 
			begin 
			err=err+1;
			$display("p is %d, expect %d", p,0);
			end
			else $display("p is %d, pass!!!", p);
		end
		end
		#(`PERIOD*3);
		if(err!= 0) begin
		  $display("\n");
          $display("\n");
          $display("        ****************************               ");
          $display("        **                        **       |\__||  ");
          $display("        **  OOPS!!                **      / X,X  | ");
          $display("        **                        **    /_____   | ");
          $display("        **  Simulation Failed!!   **   /^ ^ ^ \\  |");
          $display("        **                        **  |^ ^ ^ ^ |w| ");
          $display("        ****************************   \\m___m__|_|");
          $display("         Totally has %d errors                     ", err); 
          $display("\n");
		 end
		else begin
		  $display("\n");
          $display("\n");
          $display("        ****************************               ");
          $display("        **                        **       |\__||  ");
          $display("        **  Congratulations !!    **      / O.O  | ");
          $display("        **                        **    /_____   | ");
          $display("        **  Simulation PASS!!     **   /^ ^ ^ \\  |");
          $display("        **                        **  |^ ^ ^ ^ |w| ");
          $display("        ****************************   \\m___m__|_|");
          $display("\n");
		  
		end
		
		$finish;
	end
	
	always #(`PERIOD/2) clk = ~clk;
	
	
	
	
	pattern_gen p1(
	.clk(clk),
	.rst(rst),
	.en(en),
	.x(x),
	.p(p),
	.valid(valid));
	
	`ifdef FSDB
	initial begin
		$fsdbDumpfile("pattern_gen.fsdb");
		$fsdbDumpvars("+struct", "+mda",p1);
	end
	`endif
	
	`ifdef syn
		initial $sdf_annotate("pattern_gen_syn.sdf",p1);
	`endif
endmodule