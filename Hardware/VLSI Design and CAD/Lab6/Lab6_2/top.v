module top(
	input clk,
	input rst,
	//RAM1
	input   [23:0] RAM1_Q,
	output reg [23:0] RAM1_D,
	output reg [19:0] RAM1_A,
	output reg RAM1_WE,
	output reg RAM1_OE,
	//RAM2
	input   [23:0] RAM2_Q,
	output reg [23:0] RAM2_D,
	output reg [19:0] RAM2_A,
	output reg RAM2_WE,
	output reg RAM2_OE,
	//RAM3
	//input [23:0] RAM3_Q,
	output reg [23:0] RAM3_D,
	output reg [19:0] RAM3_A,
	output reg RAM3_WE,
	output reg RAM3_OE,
	//controller
	output reg done  );

	parameter s0 = 2'b00,
			  s1 = 2'b01,
			  s2 = 2'b10,
			  s3 = 2'b11;


	reg [1:0] st ,n_st;
	reg [19:0] counter;
	always @(posedge clk or posedge rst) begin
		if(rst) begin
			st <= s0;
			counter <= 20'b0;
		end
		else begin
			st <= n_st;
			counter <= counter + 20'b1;
		end
	end	


	always @(*) begin
		if (st == s0) begin
			RAM1_OE = 1'b0;
			RAM1_WE = 1'b0;
			RAM2_OE = 1'b0;
			RAM2_WE = 1'b0;
			RAM3_OE = 1'b0;
			RAM3_WE = 1'b0;
			RAM1_A = 20'b0;
			RAM2_A = 20'b0;
			RAM3_A = 20'b0;
			RAM1_D = 24'b0;
			RAM2_D = 24'b0;
			RAM3_D = 24'b0;
			done = 1'b0;
			n_st = s1;
		end
		else if (st == s1) begin
			RAM1_OE = 1'b1;
			RAM1_WE = 1'b0;
			RAM2_OE = 1'b1;
			RAM2_WE = 1'b0;
			RAM3_OE = 1'b0;
			RAM3_WE = 1'b1;
			RAM1_D = 24'b0;
			RAM2_D = 24'b0;

			RAM2_A = counter - 20'd1;
			RAM3_A = counter - 20'd3;
			RAM1_A = RAM2_Q;
			RAM3_D = RAM1_Q;

			if(counter == 20'd4098) begin
				done = 1'b1;
				n_st = s2;
			end
			else begin
				done = 1'b0;
				n_st = s1;
			end
		end
		else if (st == s2) begin
			RAM1_OE = 1'b0;
			RAM1_WE = 1'b0;
			RAM2_OE = 1'b0;
			RAM2_WE = 1'b0;
			RAM3_OE = 1'b0;
			RAM3_WE = 1'b0;
			RAM1_A = 20'b0;
			RAM2_A = 20'b0;
			RAM3_A = 20'b0;
			RAM1_D = 24'b0;
			RAM2_D = 24'b0;
			RAM3_D = 24'b0;
			done = 1'b1;
			n_st = s2;
		end
		else begin
			RAM1_OE = 1'b0;
			RAM1_WE = 1'b0;
			RAM2_OE = 1'b0;
			RAM2_WE = 1'b0;
			RAM3_OE = 1'b0;
			RAM3_WE = 1'b0;
			RAM1_A = 20'b0;
			RAM2_A = 20'b0;
			RAM3_A = 20'b0;
			RAM1_D = 24'b0;
			RAM2_D = 24'b0;
			RAM3_D = 24'b0;
			done = 1'b0;
			n_st = s1;
		end
	end
endmodule
