/////////////////////////////////////////////////////////////////////
// ---------------------- IVCAD 2022 Spring ---------------------- //
// ---------------------- Version : v.1.10  ---------------------- //
// ---------------------- Date : 2022.04.13 ---------------------- //
// --------------------- Controller module ------------------------//
// ----------------- Feb. 2022 Willie authored --------------------//
/////////////////////////////////////////////////////////////////////

module Controller(clk, rst, D_update, W_update, RAM_IF_A, RAM_IF_OE, RAM_W_A, RAM_W_WE, RAM_RESULT_A, RAM_RESULT_WE, done);

// ---------------------- input  ---------------------- //
	input clk;
	input rst;

// ---------------------- output  ---------------------- //	
	output  D_update;
	output  W_update;
	output reg [17:0] RAM_IF_A;
	output  RAM_IF_OE;
	output reg [17:0] RAM_W_A;
	output  RAM_W_WE;
	output reg [17:0] RAM_RESULT_A;
	output  RAM_RESULT_WE;
	output  done;
	
// ---------------------- Write down Your design below  ---------------------- //
	reg [3:0] st,n_st;
	parameter [3:0] s0 = 4'b0000,
					s1 = 4'b0001,
					s2 = 4'b0010,
					s3 = 4'b0011,
					s4 = 4'b0100,
					s5 = 4'b0101,
					s6 = 4'b0110,
					s7 = 4'b0111,
					s8 = 4'b1000;


	assign done = (st == s8)?1'b1:1'b0;
	assign D_update = (st==s8)?1'b0:1'b1;
	assign W_update = (st==s6)?1'b0:1'b1;
	assign RAM_IF_OE = (st==s8)?1'b0:1'b1;
	assign RAM_W_WE = (st==s6)?1'b1:1'b0;
	assign RAM_RESULT_WE = (st==s7)?1'b1:1'b0;

	always @(posedge clk or posedge rst) begin     //FSM 
		if(rst) begin
			st <= s0;
		end
		else begin
			st <= n_st;
		end
	end
	always @(posedge clk ) begin     //if address
		if(st ==s0) begin
			RAM_IF_A = 18'b0;
		end
		else if(st == s1)begin			
			RAM_IF_A = RAM_IF_A + 18'd1;
		end
		else if(st == s6) begin
			RAM_IF_A = 18'b0;
		end
		else if(st == s7) begin
			RAM_IF_A = RAM_IF_A + 18'd1;
		end
		else begin
			
		end
	end	

	always @(posedge clk) begin     //w address
		if(st == s0) begin
			RAM_W_A = 18'd0;
		end
		else if (st==s6) begin
			RAM_W_A = RAM_W_A + 18'd1;
		end
		else begin

		end

	end 
	
	always @(posedge clk) begin
		if(st == s0) begin
			RAM_RESULT_A = 18'd0;
		end
		else if(st==s7) begin
			RAM_RESULT_A = RAM_RESULT_A + 18'd0;
		end
		else begin
			
		end
	end


	always@(*) begin
		case(st)
		s0:begin
			n_st = s1;
		end
		s1:begin
			n_st = s2;
		end
		s2:begin
			n_st = s3;
		end
		s3:begin
			n_st = s4;
		end
		s4:begin
			n_st = s5;
		end
		s5:begin
			if(RAM_IF_A == 18'd4096) begin
				n_st = s6;
			end
			else begin
				n_st = s1;
			end
		end
		s6:begin
			if(RAM_W_A == 18'd64) begin
				n_st = s7;
			end
			else begin
				n_st = s6;
			end
		end
		s7:begin
			if(RAM_RESULT_A == 18'd4096) begin
				n_st = s7;
			end
			else begin
				n_st = s8;
			end
		end
		s8:begin
			n_st = s8;
		end
		default:begin
			n_st = s0;
		end
		endcase
	end

	
endmodule 