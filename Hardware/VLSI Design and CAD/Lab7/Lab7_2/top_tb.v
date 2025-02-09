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
`define INPUT_PIC0 "train0.bmp"
`define INPUT_PIC1 "train1.bmp"
`define INPUT_PIC2 "train2.bmp"
`define INPUT_PIC3 "train3.bmp"
`define INPUT_PIC4 "train4.bmp"
`define INPUT_PIC5 "train5.bmp"
`define INPUT_PIC6 "train6.bmp"
`define INPUT_PIC7 "train7.bmp"
`define INPUT_PIC8 "train8.bmp"
`define INPUT_PIC9 "train9.bmp"
`define TEST_PIC0 "test0.bmp"
`define TEST_PIC1 "test1.bmp"
`define TEST_PIC2 "test2.bmp"
`define TEST_PIC3 "test3.bmp"
`define TEST_PIC4 "test4.bmp"

`define GOLDEN "codebook.txt"
`define GOLDEN2_0 "result0.txt"
`define GOLDEN2_1 "result1.txt"
`define GOLDEN2_2 "result2.txt"
`define GOLDEN2_3 "result3.txt"
`define GOLDEN2_4 "result4.txt"

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
	integer i, j;
	integer ifile1_0, ifile1_1, ifile1_2, ifile1_3, ifile1_4, ifile1_5, ifile1_6, ifile1_7, ifile1_8, ifile1_9, 
			ifile1_10, ifile1_11, ifile1_12, ifile1_13, ifile1_14;
	integer ifile2;
	integer ifile4_0, ifile4_1, ifile4_2, ifile4_3, ifile4_4;
	integer ofile0, ofile1, ofile2, ofile3, ofile4, pointer;
	integer temp0, temp1, temp2, temp3, temp4;
	integer err = 0;
	
	reg[7:0] r1,g1,b1,r2,g2,b2;
	reg signed[8:0] dr,dg,db;
	integer sum=0;
	real psnr;
	
	
	reg [7:0] test [`size_pic*3+`offset:0];
	reg [7:0] data0 [`size_pic*3+`offset:0];
	reg [7:0] data1 [`size_pic*3+`offset:0];
	reg [7:0] data2 [`size_pic*3+`offset:0];
	reg [7:0] data3 [`size_pic*3+`offset:0];
	reg [7:0] data4 [`size_pic*3+`offset:0];
	reg [7:0] data5 [`size_pic*3+`offset:0];
	reg [7:0] data6 [`size_pic*3+`offset:0];
	reg [7:0] data7 [`size_pic*3+`offset:0];
	reg [7:0] data8 [`size_pic*3+`offset:0];
	reg [7:0] data9 [`size_pic*3+`offset:0];
	reg [7:0] data10 [`size_pic*3+`offset:0];
	reg [7:0] data11 [`size_pic*3+`offset:0];
	reg [7:0] data12 [`size_pic*3+`offset:0];
	reg [7:0] data13 [`size_pic*3+`offset:0];
	reg [7:0] data14 [`size_pic*3+`offset:0];
	reg [23:0] golden [`size_weight-1:0];
	reg [23:0] golden2_0 [`size_pic-1:0];
	reg [23:0] golden2_1 [`size_pic-1:0];
	reg [23:0] golden2_2 [`size_pic-1:0];
	reg [23:0] golden2_3 [`size_pic-1:0];
	reg [23:0] golden2_4 [`size_pic-1:0];
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
		ifile1_0 = $fopen(`INPUT_PIC0, "rb");
		ifile1_1 = $fopen(`INPUT_PIC1, "rb");
		ifile1_2 = $fopen(`INPUT_PIC2, "rb");
		ifile1_3 = $fopen(`INPUT_PIC3, "rb");
		ifile1_4 = $fopen(`INPUT_PIC4, "rb");
		ifile1_5 = $fopen(`INPUT_PIC5, "rb");
		ifile1_6 = $fopen(`INPUT_PIC6, "rb");
		ifile1_7 = $fopen(`INPUT_PIC7, "rb");
		ifile1_8 = $fopen(`INPUT_PIC8, "rb");
		ifile1_9 = $fopen(`INPUT_PIC9, "rb");
		ifile1_10 = $fopen(`TEST_PIC0, "rb");
		ifile1_11 = $fopen(`TEST_PIC1, "rb");
		ifile1_12 = $fopen(`TEST_PIC2, "rb");
		ifile1_13 = $fopen(`TEST_PIC3, "rb");
		ifile1_14 = $fopen(`TEST_PIC4, "rb");
		
		ifile2 = $fopen(`GOLDEN, "r");
		ifile4_0 = $fopen(`GOLDEN2_0, "r");
		ifile4_1 = $fopen(`GOLDEN2_1, "r");
		ifile4_2 = $fopen(`GOLDEN2_2, "r");
		ifile4_3 = $fopen(`GOLDEN2_3, "r");
		ifile4_4 = $fopen(`GOLDEN2_4, "r");
		
		ofile0 = $fopen("result0.bmp", "wb");
		ofile1 = $fopen("result1.bmp", "wb");
		ofile2 = $fopen("result2.bmp", "wb");
		ofile3 = $fopen("result3.bmp", "wb");
		ofile4 = $fopen("result4.bmp", "wb");
		
		pointer = $fread(data0, ifile1_0);
		pointer = $fread(data1, ifile1_1);
		pointer = $fread(data2, ifile1_2);
		pointer = $fread(data3, ifile1_3);
		pointer = $fread(data4, ifile1_4);
		pointer = $fread(data5, ifile1_5);
		pointer = $fread(data6, ifile1_6);
		pointer = $fread(data7, ifile1_7);
		pointer = $fread(data8, ifile1_8);
		pointer = $fread(data9, ifile1_9);
		pointer = $fread(data10, ifile1_10);
		pointer = $fread(data11, ifile1_11);
		pointer = $fread(data12, ifile1_12);
		pointer = $fread(data13, ifile1_13);
		pointer = $fread(data14, ifile1_14);
		
		$readmemh(`GOLDEN, golden);
		$readmemh(`GOLDEN2_0, golden2_0);
		$readmemh(`GOLDEN2_1, golden2_1);
		$readmemh(`GOLDEN2_2, golden2_2);
		$readmemh(`GOLDEN2_3, golden2_3);
		$readmemh(`GOLDEN2_4, golden2_4);
		
		begin: loop
			for(i=0;i<`size_pic;i=i+1)
				ram_if.memory[i] = {data0[3*i+`offset+2],data0[3*i+`offset+1],data0[3*i+`offset]};
			for(i=0;i<`size_pic;i=i+1)
				ram_if.memory[i+4096] = {data1[3*i+`offset+2],data1[3*i+`offset+1],data1[3*i+`offset]};
			for(i=0;i<`size_pic;i=i+1)
				ram_if.memory[i+4096*2] = {data2[3*i+`offset+2],data2[3*i+`offset+1],data2[3*i+`offset]};
			for(i=0;i<`size_pic;i=i+1)
				ram_if.memory[i+4096*3] = {data3[3*i+`offset+2],data3[3*i+`offset+1],data3[3*i+`offset]};
			for(i=0;i<`size_pic;i=i+1)
				ram_if.memory[i+4096*4] = {data4[3*i+`offset+2],data4[3*i+`offset+1],data4[3*i+`offset]};
			for(i=0;i<`size_pic;i=i+1)
				ram_if.memory[i+4096*5] = {data5[3*i+`offset+2],data5[3*i+`offset+1],data5[3*i+`offset]};
			for(i=0;i<`size_pic;i=i+1)
				ram_if.memory[i+4096*6] = {data6[3*i+`offset+2],data6[3*i+`offset+1],data6[3*i+`offset]};
			for(i=0;i<`size_pic;i=i+1)
				ram_if.memory[i+4096*7] = {data7[3*i+`offset+2],data7[3*i+`offset+1],data7[3*i+`offset]};
			for(i=0;i<`size_pic;i=i+1)
				ram_if.memory[i+4096*8] = {data8[3*i+`offset+2],data8[3*i+`offset+1],data8[3*i+`offset]};
			for(i=0;i<`size_pic;i=i+1)
				ram_if.memory[i+4096*9] = {data9[3*i+`offset+2],data9[3*i+`offset+1],data9[3*i+`offset]};
			for(i=0;i<`size_pic;i=i+1)
				ram_if.memory[i+4096*10] = {data10[3*i+`offset+2],data10[3*i+`offset+1],data10[3*i+`offset]};
			for(i=0;i<`size_pic;i=i+1)
				ram_if.memory[i+4096*11] = {data11[3*i+`offset+2],data11[3*i+`offset+1],data11[3*i+`offset]};
			for(i=0;i<`size_pic;i=i+1)
				ram_if.memory[i+4096*12] = {data12[3*i+`offset+2],data12[3*i+`offset+1],data12[3*i+`offset]};
			for(i=0;i<`size_pic;i=i+1)
				ram_if.memory[i+4096*13] = {data13[3*i+`offset+2],data13[3*i+`offset+1],data13[3*i+`offset]};
			for(i=0;i<`size_pic;i=i+1)
				ram_if.memory[i+4096*14] = {data14[3*i+`offset+2],data14[3*i+`offset+1],data14[3*i+`offset]};
			
		end
		
		$fclose(ifile1_0);	
		$fclose(ifile1_1);
		$fclose(ifile1_2);
		$fclose(ifile1_3);
		$fclose(ifile1_4);
		$fclose(ifile1_5);	
		$fclose(ifile1_6);
		$fclose(ifile1_7);
		$fclose(ifile1_8);
		$fclose(ifile1_9);
		$fclose(ifile1_10);	
		$fclose(ifile1_11);
		$fclose(ifile1_12);
		$fclose(ifile1_13);
		$fclose(ifile1_14);
		
		$fclose(ifile2);
		$fclose(ifile4_0);
		$fclose(ifile4_1);
		$fclose(ifile4_2);
		$fclose(ifile4_3);
		$fclose(ifile4_4);
		
		wait (real_done)
		
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
		for(i=0;i<`size_pic*5;i=i+1) begin
			if(i < 4096) begin
				if(ram_result.memory[i] !== golden2_0[i]) begin
					err=err+1;
					$display("RAM_RESULT[%4d] = %h, expect = %h", i, ram_result.memory[i], golden2_0[i]);
				end
				else begin
					 $display("RAM_RESULT[%4d] = %h, pass", i, ram_result.memory[i]);
				end
			end
			else if(i < 8192) begin
				if(ram_result.memory[i] !== golden2_1[i-4096]) begin
					err=err+1;
					$display("RAM_RESULT[%4d] = %h, expect = %h", i, ram_result.memory[i], golden2_1[i-4096]);
				end
				else begin
					 $display("RAM_RESULT[%4d] = %h, pass", i, ram_result.memory[i]);
				end
			end
			else if(i < 12288) begin
				if(ram_result.memory[i] !== golden2_2[i-8192]) begin
					err=err+1;
					$display("RAM_RESULT[%4d] = %h, expect = %h", i, ram_result.memory[i], golden2_2[i-8192]);
				end
				else begin
					 $display("RAM_RESULT[%4d] = %h, pass", i, ram_result.memory[i]);
				end
			end
			else if(i < 16384) begin
				if(ram_result.memory[i] !== golden2_3[i-12288]) begin
					err=err+1;
					$display("RAM_RESULT[%4d] = %h, expect = %h", i, ram_result.memory[i], golden2_3[i-12288]);
				end
				else begin
					 $display("RAM_RESULT[%4d] = %h, pass", i, ram_result.memory[i]);
				end
			end
			else begin
				if(ram_result.memory[i] !== golden2_4[i-16384]) begin
					err=err+1;
					$display("RAM_RESULT[%4d] = %h, expect = %h", i, ram_result.memory[i], golden2_4[i-16384]);
				end
				else begin
					 $display("RAM_RESULT[%4d] = %h, pass", i, ram_result.memory[i]);
				end
			end
		end	
		`endif
		
		`ifdef RESULT0
		for(i=0;i<`size_pic;i=i+1) begin
			if(ram_result.memory[i] !== golden2_0[i]) begin
				err=err+1;
				$display("RAM_RESULT[%4d] = %h, expect = %h", i, ram_result.memory[i], golden2_0[i]);
			end
			else begin
				 $display("RAM_RESULT[%4d] = %h, pass", i, ram_result.memory[i]);
			end
		end	
		`endif
		
		`ifdef RESULT1
		for(i=4096;i<`size_pic*2;i=i+1) begin
			if(ram_result.memory[i] !== golden2_1[i-4096]) begin
				err=err+1;
				$display("RAM_RESULT[%4d] = %h, expect = %h", i, ram_result.memory[i], golden2_1[i-4096]);
			end
			else begin
				 $display("RAM_RESULT[%4d] = %h, pass", i, ram_result.memory[i]);
			end
		end	
		`endif
		
		`ifdef RESULT2
		for(i=8192;i<`size_pic*3;i=i+1) begin
			if(ram_result.memory[i] !== golden2_2[i-8192]) begin
				err=err+1;
				$display("RAM_RESULT[%4d] = %h, expect = %h", i, ram_result.memory[i], golden2_2[i-8192]);
			end
			else begin
				 $display("RAM_RESULT[%4d] = %h, pass", i, ram_result.memory[i]);
			end
		end	
		`endif
		
		`ifdef RESULT3
		for(i=12288;i<`size_pic*4;i=i+1) begin
			if(ram_result.memory[i] !== golden2_3[i-12288]) begin
				err=err+1;
				$display("RAM_RESULT[%4d] = %h, expect = %h", i, ram_result.memory[i], golden2_3[i-12288]);
			end
			else begin
				 $display("RAM_RESULT[%4d] = %h, pass", i, ram_result.memory[i]);
			end
		end	
		`endif
		
		`ifdef RESULT4
		for(i=16384;i<`size_pic*5;i=i+1) begin
			if(ram_result.memory[i] !== golden2_4[i-16384]) begin
				err=err+1;
				$display("RAM_RESULT[%4d] = %h, expect = %h", i, ram_result.memory[i], golden2_4[i-16384]);
			end
			else begin
				 $display("RAM_RESULT[%4d] = %h, pass", i, ram_result.memory[i]);
			end
		end	
		`endif

		//write bmp offset
		for (i=0; i<`offset; i=i+1) begin
			$fwrite(ofile0, "%c", data10[i]);
			$fwrite(ofile1, "%c", data11[i]);
			$fwrite(ofile2, "%c", data12[i]);
			$fwrite(ofile3, "%c", data13[i]);
			$fwrite(ofile4, "%c", data14[i]);
		end
		
		//generate validate0 bmp
		for (i=0; i<`size_pic; i=i+1) begin
			temp0 = ram_result.memory[i];
			$fwrite(ofile0, "%c", temp0[7:0]);
			$fwrite(ofile0, "%c", temp0[15:8]);
			$fwrite(ofile0, "%c", temp0[23:16]);
		end
		//generate validate1 bmp
		for (i=0; i<`size_pic; i=i+1) begin
			temp1 = ram_result.memory[i+4096];
			$fwrite(ofile1, "%c", temp1[7:0]);
			$fwrite(ofile1, "%c", temp1[15:8]);
			$fwrite(ofile1, "%c", temp1[23:16]);
		end
		//generate validate2 bmp
		for (i=0; i<`size_pic; i=i+1) begin
			temp2 = ram_result.memory[i+4096*2];
			$fwrite(ofile2, "%c", temp2[7:0]);
			$fwrite(ofile2, "%c", temp2[15:8]);
			$fwrite(ofile2, "%c", temp2[23:16]);
		end
		//generate validate3 bmp
		for (i=0; i<`size_pic; i=i+1) begin
			temp3 = ram_result.memory[i+4096*3];
			$fwrite(ofile3, "%c", temp3[7:0]);
			$fwrite(ofile3, "%c", temp3[15:8]);
			$fwrite(ofile3, "%c", temp3[23:16]);
		end
		//generate validate4 bmp
		for (i=0; i<`size_pic; i=i+1) begin
			temp4 = ram_result.memory[i+4096*4];
			$fwrite(ofile4, "%c", temp4[7:0]);
			$fwrite(ofile4, "%c", temp4[15:8]);
			$fwrite(ofile4, "%c", temp4[23:16]);
		end
		
		$fclose(ofile0);
		$fclose(ofile1);
		$fclose(ofile2);
		$fclose(ofile3);
		$fclose(ofile4);
		
		
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