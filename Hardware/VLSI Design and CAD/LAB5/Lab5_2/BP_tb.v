`timescale 1ns/10ps
`define PERIOD 10.0
`define INPUT "input.txt"
`define GOLDEN "golden.txt"
`ifdef syn
`include "/usr/cad/CBDK/SAED14_EDK_rvt/verilog/saed14nm_rvt.v"
`include "BP_syn.v"
`else
`include "BP.v"
`endif

module tb;
	reg 		clk;
	reg			rst;
	reg         taken;
	wire        p_taken;
	reg         golden[6:0];
	reg         data[6:0];
	integer     err=0, ifile, ifile2,i;
	BP bp(.clk(clk) , .rst(rst), .taken(taken), .p_taken(p_taken));
	

	initial begin
       clk = 0; rst = 1; taken = 0;
		#(`PERIOD) rst = 0;
		
		ifile = $fopen(`GOLDEN, "r");
		ifile2 = $fopen(`INPUT, "r");
		$readmemh(`GOLDEN, golden);
		$readmemh(`INPUT, data);
		
		for (i=0;i<7;i=i+1) begin
		@(posedge clk) #0 taken = data[i];
		@(negedge clk)
		
		
		if(p_taken == golden[i])
			$display("Behavior of BP is correct!!, value of p_taken is %d, value of taken is %d", p_taken,taken);
		else begin
			$display("Behavior of BP is wrong!!, value of p_taken is %d, value of taken is %d", p_taken,taken);
			err=err+1;
		end
		
		end
		
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
		
		#(`PERIOD)
		$fclose(ifile);
		$fclose(ifile2);
		$finish;
	end
	
	always #(`PERIOD/2) clk = ~clk;
	
	`ifdef FSDB
	initial begin
		$fsdbDumpfile("bp.fsdb");
		$fsdbDumpvars("+struct", "+mda",bp);
	end
	`endif
	
	`ifdef syn
		initial $sdf_annotate("BP_syn.sdf",bp);
	`endif
endmodule