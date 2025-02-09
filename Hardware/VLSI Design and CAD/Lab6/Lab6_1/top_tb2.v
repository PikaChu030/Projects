`timescale 1ns/10ps
`define PERIOD 10.0
`define MAX 50700 // Max cycle number
/*
`ifdef _512
`define INPUT_PIC "lena_512_512.bmp"
`define WEIGHT "codebook_512.bmp"
`define GOLDEN "data_tag_512.hex"  
`define size_pic 512*512
`define offset 138
`define offset2 54
`else
*/
`define INPUT_PIC "lena_64_64.bmp"
`define WEIGHT "codebook_64.bmp"
`define GOLDEN "data_tag_64_inv.hex"  
`define size_pic 64*64
`define offset 138
`define offset2 54
//`endif


`define size_weight 8*8
`define width 256


`include "RAM.v"

`ifdef syn
`include "/usr/cad/CBDK/SAED14_EDK_rvt/verilog/saed14nm_rvt.v"
`include "top_syn.v"
`else
`include "top.v"
`endif

module top_tb;
	integer size= `size_pic;
	reg 		clk;
	reg			rst;
	reg [7:0] data [`size_pic*3+`offset:0];
	reg [7:0] codebook [`size_weight*3+`offset2:0];
	reg [7:0] golden [`size_pic-1:0];
	reg [7:0] data2 ;
	reg real_done;
	integer point = 0;
	integer i,j, pointer, pointer2, pointer3, ifile1, ifile2, ifile3, ifile4, o2file, correct_num=0,err=0;
	
	wire [23:0] RAM1_Q,RAM2_Q;
	wire [23:0] RAM1_D,RAM2_D;
	wire [19:0] RAM1_A,RAM2_A;
	wire RAM1_WE,RAM2_WE;
	wire RAM1_OE,RAM2_OE;
	wire done;
	RAM ram1(.CK(clk), .A(RAM1_A), .WE(RAM1_WE), .OE(RAM1_OE), .D(RAM1_D), .Q(RAM1_Q));
	RAM ram2(.CK(clk), .A(RAM2_A), .WE(RAM2_WE), .OE(RAM2_OE), .D(RAM2_D), .Q(RAM2_Q));
	top TOP(.clk(clk), .rst(rst), .RAM1_Q(RAM1_Q), .RAM1_D(RAM1_D), .RAM1_A(RAM1_A), .RAM1_WE(RAM1_WE), 
			.RAM1_OE(RAM1_OE),/* .RAM2_Q(RAM2_Q),*/ .RAM2_D(RAM2_D), .RAM2_A(RAM2_A), 
			.RAM2_WE(RAM2_WE), .RAM2_OE(RAM2_OE), .done(done));
	
	always #(`PERIOD/2) clk = ~clk;
	always @(posedge clk) real_done <= done;
	initial begin
       clk = 0; rst = 0;
		#(`PERIOD) rst = 1;
		#(`PERIOD) rst = 0;
	end
	
	`ifdef syn
	initial $sdf_annotate("top_syn.sdf", TOP);
	`endif
	
	
	initial
	begin
		`ifdef FSDB
			$fsdbDumpfile("top.fsdb");
			$fsdbDumpvars("+struct", "+mda",TOP);
			$fsdbDumpvars("+struct", "+mda",ram1);
			$fsdbDumpvars("+struct", "+mda",ram2);
		`endif
		#(`PERIOD*`MAX)
		for (j = 0; j < `size_pic; j=j+1)
		begin
			if(ram2.memory[j][7:0] !== golden[j]) begin
				err=err+1;
				 $display("RAM2[%4d] = %h, expect = %h", j, ram2.memory[j][7:0], golden[j]);
			end
			else begin
				 $display("RAM2[%4d] = %h, pass", j, ram2.memory[j][7:0]);
			end
		end
		$display("run time error!!\n");
		$finish;
	end
	
	initial begin
		ifile1 = $fopen(`INPUT_PIC, "rb");
		//ifile2 = $fopen(`INPUT_PIC_GOLD, "r");
		ifile3 = $fopen(`WEIGHT, "rb");
		ifile4 = $fopen(`GOLDEN, "r");
		o2file = $fopen("test.txt", "w");
		pointer = $fread(data, ifile1);		//read picture
		pointer2= $fread(codebook, ifile3);		//read codebook 
		$readmemh(`GOLDEN, golden);
		
		begin: loop
			for(i=0;i<`size_weight;i=i+1)begin
				/*$fwrite(o2file,"%d\n",codebook[offset2+i]);
				$fscanf(ifile2,"%d",data2);
				if(data[offset+i] == data2)
					correct_num = correct_num + 1;
				*/
				ram1.memory[i] = {codebook[3*i+`offset2+2],codebook[3*i+`offset2+1],codebook[3*i+`offset2]};
			end
			for(i=0;i<`size_pic;i=i+1)
				ram1.memory[`size_weight+i] = {data[3*i+`offset+2],data[3*i+`offset+1],data[3*i+`offset]};
		end
		
		//if(correct_num == size * 3) $display("read success\n");
		$display(data[10]);
		$display(data[11]);
		$display(data[12]);
		$display(data[13]);
		$fclose(ifile1);	
		$fclose(ifile2);
		$fclose(ifile3);
		$fclose(ifile4);
		$fclose(o2file);
		wait (real_done)
		
		for(i=0;i<`size_pic;i=i+1) begin
			if(ram2.memory[i][7:0] !== golden[i]) begin
				err=err+1;
				 $display("RAM2[%4d] = %h, expect = %h", i, ram2.memory[i][7:0], golden[i]);
			end
			else begin
				 $display("RAM2[%4d] = %h, pass", i, ram2.memory[i][7:0]);
			end
		end	
		
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
		$fsdbDumpvars("+struct", "+mda",TOP);
		$fsdbDumpvars("+struct", "+mda",ram1);
		$fsdbDumpvars("+struct", "+mda",ram2);
	end
	`endif
endmodule