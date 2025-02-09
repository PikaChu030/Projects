`include "controller.v"
`include "MAN.v"
`include "MIN_D.v"
module top(
	input clk,
	input rst,
	//RAM1
	input [23:0] RAM1_Q,
	output [23:0] RAM1_D,
	output [19:0] RAM1_A,
	output RAM1_WE,
	output RAM1_OE,
	//RAM2
	//input [23:0] RAM2_Q,
	output reg [23:0] RAM2_D,
	output [19:0] RAM2_A,
	output RAM2_WE,
	output RAM2_OE,
	//controller
	output done );

	wire [23:0] M_data;
	wire wen0,wen1,wen2,wen3,wen4,wen5,wen6,wen7;
	wire [2:0]MAN_A_WEIGHT;
	wire [10:0] d0,d1,d2,d3,d4,d5,d6,d7;
	wire [10:0] d8,d9,d10,d11,d12,d13,d14,d15;
	wire [10:0] d16,d17,d18,d19,d20,d21,d22,d23;
	wire [10:0] d24,d25,d26,d27,d28,d29,d30,d31;
	wire [10:0] d32,d33,d34,d35,d36,d37,d38,d39;
	wire [10:0] d40,d41,d42,d43,d44,d45,d46,d47;
	wire [10:0] d48,d49,d50,d51,d52,d53,d54,d55;
	wire [10:0] d56,d57,d58,d59,d60,d61,d62,d63;
	wire [10:0] d_min0,d_min1,d_min2,d_min3,d_min4,d_min5,d_min6,d_min7,d_min8;
	wire [2:0]  d_min_pos0,d_min_pos1,d_min_pos2,d_min_pos3,d_min_pos4,d_min_pos5,d_min_pos6,d_min_pos7,d_min_pos8;

	assign RAM1_D = 24'b0;
	assign RAM1_WE = 1'b0;
	assign RAM2_OE = 1'b0;

	controller C_1 (.clk(clk)
					,.rst(rst) 
					,.done(done) 
					,.RAM1_Q(RAM1_Q)
					,.RAM1_OE(RAM1_OE)
					,.RAM1_A(RAM1_A)
					,.RAM2_WE(RAM2_WE)
					,.RAM2_A(RAM2_A)
					,.RAM1_Q_latch(M_data)
					,.wen0(wen0)
					,.wen1(wen1)
					,.wen2(wen2)
					,.wen3(wen3)
					,.wen4(wen4)
					,.wen5(wen5)
					,.wen6(wen6)
					,.wen7(wen7)
					,.MAN_A_WEIGHT(MAN_A_WEIGHT));
	MAN M1(.clk(clk)
		   ,.rst(rst)
		   ,.data_in(M_data)
		   ,.wen(wen0)
		   ,.MAN_A_W(MAN_A_WEIGHT)
		   ,.d0_out(d0)
		   ,.d1_out(d1)
		   ,.d2_out(d2)
		   ,.d3_out(d3)
		   ,.d4_out(d4)
		   ,.d5_out(d5)
		   ,.d6_out(d6)
		   ,.d7_out(d7));
	MAN M2(.clk(clk)
		   ,.rst(rst)
		   ,.data_in(M_data)
		   ,.wen(wen1)
		   ,.MAN_A_W(MAN_A_WEIGHT)
		   ,.d0_out(d8)
		   ,.d1_out(d9)
		   ,.d2_out(d10)
		   ,.d3_out(d11)
		   ,.d4_out(d12)
		   ,.d5_out(d13)
		   ,.d6_out(d14)
		   ,.d7_out(d15));
	MAN M3(.clk(clk)
		   ,.rst(rst)
		   ,.data_in(M_data)
		   ,.wen(wen2)
		   ,.MAN_A_W(MAN_A_WEIGHT)
		   ,.d0_out(d16)
		   ,.d1_out(d17)
		   ,.d2_out(d18)
		   ,.d3_out(d19)
		   ,.d4_out(d20)
		   ,.d5_out(d21)
		   ,.d6_out(d22)
		   ,.d7_out(d23));
	MAN M4(.clk(clk)
		   ,.rst(rst)
		   ,.data_in(M_data)
		   ,.wen(wen3)
		   ,.MAN_A_W(MAN_A_WEIGHT)
		   ,.d0_out(d24)
		   ,.d1_out(d25)
		   ,.d2_out(d26)
		   ,.d3_out(d27)
		   ,.d4_out(d28)
		   ,.d5_out(d29)
		   ,.d6_out(d30)
		   ,.d7_out(d31));
	MAN M5(.clk(clk)
		   ,.rst(rst)
		   ,.data_in(M_data)
		   ,.wen(wen4)
		   ,.MAN_A_W(MAN_A_WEIGHT)
		   ,.d0_out(d32)
		   ,.d1_out(d33)
		   ,.d2_out(d34)
		   ,.d3_out(d35)
		   ,.d4_out(d36)
		   ,.d5_out(d37)
		   ,.d6_out(d38)
		   ,.d7_out(d39));
	MAN M6(.clk(clk)
		   ,.rst(rst)
		   ,.data_in(M_data)
		   ,.wen(wen5)
		   ,.MAN_A_W(MAN_A_WEIGHT)
		   ,.d0_out(d40)
		   ,.d1_out(d41)
		   ,.d2_out(d42)
		   ,.d3_out(d43)
		   ,.d4_out(d44)
		   ,.d5_out(d45)
		   ,.d6_out(d46)
		   ,.d7_out(d47));
	MAN M7(.clk(clk)
		   ,.rst(rst)
		   ,.data_in(M_data)
		   ,.wen(wen6)
		   ,.MAN_A_W(MAN_A_WEIGHT)
		   ,.d0_out(d48)
		   ,.d1_out(d49)
		   ,.d2_out(d50)
		   ,.d3_out(d51)
		   ,.d4_out(d52)
		   ,.d5_out(d53)
		   ,.d6_out(d54)
		   ,.d7_out(d55));
	MAN M8(.clk(clk)
		   ,.rst(rst)
		   ,.data_in(M_data)
		   ,.wen(wen7)
		   ,.MAN_A_W(MAN_A_WEIGHT)
		   ,.d0_out(d56)
		   ,.d1_out(d57)
		   ,.d2_out(d58)
		   ,.d3_out(d59)
		   ,.d4_out(d60)
		   ,.d5_out(d61)
		   ,.d6_out(d62)
		   ,.d7_out(d63));

	MIN_D m1(.clk(clk)
			,.rst(rst)
			,.d0(d0)
			,.d1(d1)
			,.d2(d2)
			,.d3(d3)
			,.d4(d4)
			,.d5(d5)
			,.d6(d6)
			,.d7(d7)
			,.d_min(d_min0)
			,.d_min_pos(d_min_pos0));
	MIN_D m2(.clk(clk)
			,.rst(rst)
			,.d0(d8)
			,.d1(d9)
			,.d2(d10)
			,.d3(d11)
			,.d4(d12)
			,.d5(d13)
			,.d6(d14)
			,.d7(d15)
			,.d_min(d_min1)
			,.d_min_pos(d_min_pos1));
	MIN_D m3(.clk(clk)
			,.rst(rst)
			,.d0(d16)
			,.d1(d17)
			,.d2(d18)
			,.d3(d19)
			,.d4(d20)
			,.d5(d21)
			,.d6(d22)
			,.d7(d23)
			,.d_min(d_min2)
			,.d_min_pos(d_min_pos2));
	MIN_D m4(.clk(clk)
			,.rst(rst)
			,.d0(d24)
			,.d1(d25)
			,.d2(d26)
			,.d3(d27)
			,.d4(d28)
			,.d5(d29)
			,.d6(d30)
			,.d7(d31)
			,.d_min(d_min3)
			,.d_min_pos(d_min_pos3));
	MIN_D m5(.clk(clk)
			,.rst(rst)
			,.d0(d32)
			,.d1(d33)
			,.d2(d34)
			,.d3(d35)
			,.d4(d36)
			,.d5(d37)
			,.d6(d38)
			,.d7(d39)
			,.d_min(d_min4)
			,.d_min_pos(d_min_pos4));
	MIN_D m6(.clk(clk)
			,.rst(rst)
			,.d0(d40)
			,.d1(d41)
			,.d2(d42)
			,.d3(d43)
			,.d4(d44)
			,.d5(d45)
			,.d6(d46)
			,.d7(d47)
			,.d_min(d_min5)
			,.d_min_pos(d_min_pos5));
	MIN_D m7(.clk(clk)
			,.rst(rst)
			,.d0(d48)
			,.d1(d49)
			,.d2(d50)
			,.d3(d51)
			,.d4(d52)
			,.d5(d53)
			,.d6(d54)
			,.d7(d55)
			,.d_min(d_min6)
			,.d_min_pos(d_min_pos6));
	MIN_D m8(.clk(clk)
			,.rst(rst)
			,.d0(d56)
			,.d1(d57)
			,.d2(d58)
			,.d3(d59)
			,.d4(d60)
			,.d5(d61)
			,.d6(d62)
			,.d7(d63)
			,.d_min(d_min7)
			,.d_min_pos(d_min_pos7));
	MIN_D m9(.clk(clk)
			,.rst(rst)
			,.d0(d_min0)
			,.d1(d_min1)
			,.d2(d_min2)
			,.d3(d_min3)
			,.d4(d_min4)
			,.d5(d_min5)
			,.d6(d_min6)
			,.d7(d_min7)
			,.d_min(d_min8)
			,.d_min_pos(d_min_pos8));


	always @(*) begin
		if(d_min_pos8 == 3'd0) begin
			RAM2_D = {21'b0,d_min_pos0}- 24'd1;
		end
		else if (d_min_pos8 == 3'd1) begin
			RAM2_D = 24'd7+ {21'b0,d_min_pos1};
		end
		else if (d_min_pos8 == 3'd2) begin
			RAM2_D = 24'd15+ {21'b0,d_min_pos2};
		end
		else if (d_min_pos8 == 3'd3) begin
			RAM2_D = 24'd23+ {21'b0,d_min_pos3};
		end
		else if (d_min_pos8 == 3'd4) begin
			RAM2_D = 24'd31+ {21'b0,d_min_pos4};
		end
		else if (d_min_pos8 == 3'd5) begin
			RAM2_D = 24'd39+ {21'b0,d_min_pos5};
		end
		else if (d_min_pos8 == 3'd6) begin
			RAM2_D = 24'd47+ {21'b0,d_min_pos6};
		end
		else if (d_min_pos8 == 3'd7) begin
			RAM2_D = 24'd55+ {21'b0,d_min_pos7};
		end
		else begin
			RAM2_D = 24'd0;
		end
	end
endmodule
