/////////////////////////////////////////////////////////////////////
// ---------------------- IVCAD 2022 Spring ---------------------- //
// ---------------------- Editor : Willie  ----------------------- //
// ---------------------- Version : v.1.00  ---------------------- //
// ---------------------- Date : 2022.04.13 ---------------------- //
// -------------------------- testbench -------------------------- //
/////////////////////////////////////////////////////////////////////

`timescale 1ns/10ps
`define PERIOD 10.0

/////////////////////////////////////////////////////////
//													   //
//               Do not modify code below              //
//													   //
/////////////////////////////////////////////////////////

`define size 4096
`define INPUT_PIC "train0.bmp"
`define GOLDEN "codebook.txt"
`define GOLDEN2 "result0.txt"
`define size_pic 64*64
`define size_weight 64
`define offset 138
`define offset2 54

`include "RAM.v"

`ifdef syn
`include "/usr/cad/CBDK/SAED14_EDK_rvt/verilog/saed14nm_rvt.v"
`include "top_syn.v"
`else
`include "TOP.v"
`endif

module top_tb;

	//top
	reg clk;
	reg rst;
	wire [17:0] ram_if_a ;
	wire [23:0] ram_if_d ;
	wire ram_if_oe       ;
	wire [23:0] ram_if_q ;
	wire ram_if_we       ;
	wire [17:0] ram_w_a  ;
	wire [23:0] ram_w_d  ;
	wire ram_w_oe        ;
	wire [23:0] ram_w_q  ;
	wire ram_w_we        ;
	wire [17:0] ram_result_a  ;
	wire [23:0] ram_result_d  ;
	wire ram_result_oe        ;
	wire [23:0] ram_result_q  ;
	wire ram_result_we        ;
	wire done;
	
	//testbench
	integer i, j, ifile1, ifile4, ifile6, ofile, pointer;
	integer temp;
	integer err = 0;
	
	reg [7:0] data [`size_pic*3+`offset:0];
	reg [23:0] golden [`size_weight-1:0];
	reg [23:0] golden1 [`size_pic-1:0];
	reg [23:0] golden2 [`size_pic-1:0];
	reg  real_done;
	
	TOP top (
			.clk(clk),
			.rst(rst),
			.RAM_IF_OE(ram_if_oe),
			.RAM_IF_WE(ram_if_we),
			.RAM_IF_A(ram_if_a),
			.RAM_IF_D(ram_if_d),
			.RAM_IF_Q(ram_if_q),
			.RAM_W_OE(ram_w_oe),
			.RAM_W_WE(ram_w_we),
			.RAM_W_A(ram_w_a),
			.RAM_W_D(ram_w_d),
			.RAM_W_Q(ram_w_q),
			.RAM_RESULT_OE(ram_result_oe),
			.RAM_RESULT_WE(ram_result_we),
			.RAM_RESULT_A(ram_result_a),
			.RAM_RESULT_D(ram_result_d),
			.RAM_RESULT_Q(ram_result_q),
			.done(done)
			);		  

	RAM ram_if(	
				.CK(clk), 
				.A(ram_if_a), 
				.WE(ram_if_we), 
				.OE(ram_if_oe), 
				.D(ram_if_d), 
				.Q(ram_if_q)
			);	

	RAM ram_w(	
				.CK(clk), 
				.A(ram_w_a), 
				.WE(ram_w_we), 
				.OE(ram_w_oe), 
				.D(ram_w_d), 
				.Q(ram_w_q)
			);	
			
	RAM ram_result(	
				.CK(clk), 
				.A(ram_result_a), 
				.WE(ram_result_we), 
				.OE(ram_result_oe), 
				.D(ram_result_d), 
				.Q(ram_result_q)
			);

	always #(`PERIOD/2) clk = ~clk;
	always @(posedge clk) real_done <= done;
	
	initial begin
		clk = 0; rst = 1;
		#(`PERIOD) rst = 0;
	end

	`ifdef syn
		initial $sdf_annotate("top_syn.sdf", top);
	`endif
	
	initial begin
		ifile1 = $fopen(`INPUT_PIC, "rb");
		ifile4 = $fopen(`GOLDEN, "r");
		ifile6 = $fopen(`GOLDEN2, "r");

		ofile = $fopen("result0.bmp", "wb");
		pointer = $fread(data, ifile1);

		$readmemh(`GOLDEN, golden);
		$readmemh(`GOLDEN2, golden2);
		
		begin: loop
			for(i=0;i<`size_pic;i=i+1)
				ram_if.memory[i] = {data[3*i+`offset+2],data[3*i+`offset+1],data[3*i+`offset]};
		end
		
		$fclose(ifile1);	
		$fclose(ifile4);
		$fclose(ifile6);

		wait (real_done)
		
		for (i=0; i<`offset; i=i+1) begin
			$fwrite(ofile, "%c", data[i]);
		end
		for (i=0; i<`size_pic; i=i+1) begin
			temp = ram_result.memory[i];
			$fwrite(ofile, "%c", temp[7:0]);
			$fwrite(ofile, "%c", temp[15:8]);
			$fwrite(ofile, "%c", temp[23:16]);
		end
		$fclose(ofile);
  
		`ifdef WEIGHT
		for(i=0;i<`size_weight;i=i+1) begin
			if(ram_w.memory[i] !== golden[i]) begin
				err=err+1;
				$display("RAM_W[%4d] = %h, expect = %h", i, ram_w.memory[i], golden[i]);
			end
			else begin
				 $display("RAM_W[%4d] = %h, pass", i, ram_w.memory[i]);
			end
		end	
		`endif
			
		`ifdef RESULT
		for(i=0;i<`size_pic;i=i+1) begin
			if(ram_result.memory[i] !== golden2[i]) begin
				err=err+1;
				$display("RAM_RESULT[%4d] = %h, expect = %h", i, ram_result.memory[i], golden2[i]);
			end
			else begin
				 $display("RAM_RESULT[%4d] = %h, pass", i, ram_result.memory[i]);
			end
		end
		`endif
		
		`ifdef FULL
		for(i=0;i<`size_weight;i=i+1) begin
			if(ram_w.memory[i] !== golden[i]) begin
				err=err+1;
				$display("RAM_W[%4d] = %h, expect = %h", i, ram_w.memory[i], golden[i]);
			end
			else begin
				 $display("RAM_W[%4d] = %h, pass", i, ram_w.memory[i]);
			end
		end	
		for(i=0;i<`size_pic;i=i+1) begin
			if(ram_result.memory[i] !== golden2[i]) begin
				err=err+1;
				$display("RAM_RESULT[%4d] = %h, expect = %h", i, ram_result.memory[i], golden2[i]);
			end
			else begin
				 $display("RAM_RESULT[%4d] = %h, pass", i, ram_result.memory[i]);
			end
		end
		`endif
		
		if (err === 0)
        begin
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
        else
        begin
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
		$finish;
	end
	
	`ifdef FSDB
	initial begin
		$fsdbDumpfile("top.fsdb");
		$fsdbDumpvars("+struct", "+mda", top);
		$fsdbDumpvars("+struct", "+mda", ram_if);
		$fsdbDumpvars("+struct", "+mda", ram_w);
		$fsdbDumpvars("+struct", "+mda", ram_result);
	end
	`endif
endmodule