/////////////////////////////////////////////////////////////////////
// ---------------------- IVCAD 2022 Spring ---------------------- //
// ---------------------- Version : v.1.10  ---------------------- //
// ---------------------- Date : 2022.04.13 ---------------------- //
// ------------------------ TOP module ----------------------------//
// ----------------- Feb. 2022 Willie authored --------------------//
/////////////////////////////////////////////////////////////////////

`include "VEP.v"
`include "MIN_1.v"
`include "MIN_2.v"
`include "USS.v"
`include "Controller.v"

module TOP(clk, rst, RAM_IF_Q, RAM_W_Q, RAM_RESULT_Q, RAM_IF_OE, RAM_IF_WE, RAM_IF_A, RAM_IF_D,
		RAM_W_OE, RAM_W_WE, RAM_W_A, RAM_W_D, RAM_RESULT_OE, RAM_RESULT_WE, RAM_RESULT_A, RAM_RESULT_D, done);

// ---------------------- input  ---------------------- //
	input clk;
	input rst;
	input [23:0] RAM_IF_Q;
	input [23:0] RAM_W_Q;
	input [23:0] RAM_RESULT_Q;
	
// ---------------------- output  ---------------------- //	
	output RAM_IF_OE;
	output RAM_IF_WE;
	output [17:0] RAM_IF_A;
	output [23:0] RAM_IF_D;
	output RAM_W_OE;
	output RAM_W_WE;
	output [17:0] RAM_W_A;
	output reg [23:0] RAM_W_D;
	output RAM_RESULT_OE;
	output RAM_RESULT_WE;
	output [17:0] RAM_RESULT_A;
	output [23:0] RAM_RESULT_D;
	output done;

// ---------------------- Write down Your design below  ---------------------- //
	wire t_w,t_d;
	wire [15:0] sel_0,sel_1,sel_2,sel_3,sel_4,sel_5,sel_6,sel_7;
	wire [10:0] t_d0,t_d1,t_d2,t_d3,t_d4,t_d5,t_d6,t_d7,
				t_d8,t_d9,t_d10,t_d11,t_d12,t_d13,t_d14,t_d15,
				t_d16,t_d17,t_d18,t_d19,t_d20,t_d21,t_d22,t_d23,
				t_d24,t_d25,t_d26,t_d27,t_d28,t_d29,t_d30,t_d31,
				t_d32,t_d33,t_d34,t_d35,t_d36,t_d37,t_d38,t_d39,
				t_d40,t_d41,t_d42,t_d43,t_d44,t_d45,t_d46,t_d47,
				t_d48,t_d49,t_d50,t_d51,t_d52,t_d53,t_d54,t_d55,
				t_d56,t_d57,t_d58,t_d59,t_d60,t_d61,t_d62,t_d63;

	wire [23:0] t_w0,t_w1,t_w2,t_w3,t_w4,t_w5,t_w6,t_w7,
				t_w8,t_w9,t_w10,t_w11,t_w12,t_w13,t_w14,t_w15,
				t_w16,t_w17,t_w18,t_w19,t_w20,t_w21,t_w22,t_w23,
				t_w24,t_w25,t_w26,t_w27,t_w28,t_w29,t_w30,t_w31,
				t_w32,t_w33,t_w34,t_w35,t_w36,t_w37,t_w38,t_w39,
				t_w40,t_w41,t_w42,t_w43,t_w44,t_w45,t_w46,t_w47,
				t_w48,t_w49,t_w50,t_w51,t_w52,t_w53,t_w54,t_w55,
				t_w56,t_w57,t_w58,t_w59,t_w60,t_w61,t_w62,t_w63;

	wire [10:0] d_min0,	d_min1,	d_min2,	d_min3,	d_min4,	d_min5,	d_min6,	d_min7;
	wire [2:0] d_min_index0,d_min_index1,d_min_index2,d_min_index3,d_min_index4,d_min_index5,d_min_index6,d_min_index7;
	wire [23:0] w_min0,w_min1,w_min2,w_min3,w_min4,w_min5,w_min6,w_min7;
	wire [2:0] x_c,y_c;

	Controller C1(.clk(clk), .rst(rst), .D_update(t_d), .W_update(t_w), 
				  .RAM_IF_A(RAM_IF_A), .RAM_IF_OE(RAM_IF_OE), .RAM_W_A(RAM_W_A), 
				  .RAM_W_WE(RAM_W_WE), .RAM_RESULT_A(RAM_RESULT_A), .RAM_RESULT_WE(RAM_RESULT_WE), 
				  .done(done));
	VEP V0 (.clk(clk), .rst(rst), .W_update(t_w), .D_update(t_d), .neighbor_sel(sel_0), .pixel(RAM_IF_Q),
			.d0(t_d0), .d1(t_d1), .d2(t_d2), .d3(t_d3), .d4(t_d4), .d5(t_d5), .d6(t_d6), .d7(t_d7), 
			.w0(t_w0), .w1(t_w1), .w2(t_w2), .w3(t_w3), .w4(t_w4), .w5(t_w5), .w6(t_w6), .w7(t_w7));
	VEP V1 (.clk(clk), .rst(rst), .W_update(t_w), .D_update(t_d), .neighbor_sel(sel_1), .pixel(RAM_IF_Q),
			.d0(t_d8), .d1(t_d9), .d2(t_d10), .d3(t_d11), .d4(t_d12), .d5(t_d13), .d6(t_d14), .d7(t_d15), 
			.w0(t_w8), .w1(t_w9), .w2(t_w10), .w3(t_w11), .w4(t_w12), .w5(t_w13), .w6(t_w14), .w7(t_w15));
	VEP V2 (.clk(clk), .rst(rst), .W_update(t_w), .D_update(t_d), .neighbor_sel(sel_2), .pixel(RAM_IF_Q),
			.d0(t_d16), .d1(t_d17), .d2(t_d18), .d3(t_d19), .d4(t_d20), .d5(t_d21), .d6(t_d22), .d7(t_d23), 
			.w0(t_w16), .w1(t_w17), .w2(t_w18), .w3(t_w19), .w4(t_w20), .w5(t_w21), .w6(t_w22), .w7(t_w23));
	VEP V3 (.clk(clk), .rst(rst), .W_update(t_w), .D_update(t_d), .neighbor_sel(sel_3), .pixel(RAM_IF_Q),
			.d0(t_d24), .d1(t_d25), .d2(t_d26), .d3(t_d27), .d4(t_d28), .d5(t_d29), .d6(t_d30), .d7(t_d31), 
			.w0(t_w24), .w1(t_w25), .w2(t_w26), .w3(t_w27), .w4(t_w28), .w5(t_w29), .w6(t_w30), .w7(t_w31));
	VEP V4 (.clk(clk), .rst(rst), .W_update(t_w), .D_update(t_d), .neighbor_sel(sel_4), .pixel(RAM_IF_Q),
			.d0(t_d32), .d1(t_d33), .d2(t_d34), .d3(t_d35), .d4(t_d36), .d5(t_d37), .d6(t_d38), .d7(t_d39), 
			.w0(t_w32), .w1(t_w33), .w2(t_w34), .w3(t_w35), .w4(t_w36), .w5(t_w37), .w6(t_w38), .w7(t_w39));
	VEP V5 (.clk(clk), .rst(rst), .W_update(t_w), .D_update(t_d), .neighbor_sel(sel_5), .pixel(RAM_IF_Q),
			.d0(t_d40), .d1(t_d41), .d2(t_d42), .d3(t_d43), .d4(t_d44), .d5(t_d45), .d6(t_d46), .d7(t_d47), 
			.w0(t_w40), .w1(t_w41), .w2(t_w42), .w3(t_w43), .w4(t_w44), .w5(t_w45), .w6(t_w46), .w7(t_w47));
	VEP V6 (.clk(clk), .rst(rst), .W_update(t_w), .D_update(t_d), .neighbor_sel(sel_6), .pixel(RAM_IF_Q),
			.d0(t_d48), .d1(t_d49), .d2(t_d50), .d3(t_d51), .d4(t_d52), .d5(t_d53), .d6(t_d54), .d7(t_d55), 
			.w0(t_w48), .w1(t_w49), .w2(t_w50), .w3(t_w51), .w4(t_w52), .w5(t_w53), .w6(t_w54), .w7(t_w55));
	VEP V7 (.clk(clk), .rst(rst), .W_update(t_w), .D_update(t_d), .neighbor_sel(sel_7), .pixel(RAM_IF_Q),
			.d0(t_d56), .d1(t_d57), .d2(t_d58), .d3(t_d59), .d4(t_d60), .d5(t_d61), .d6(t_d62), .d7(t_d63), 
			.w0(t_w56), .w1(t_w57), .w2(t_w58), .w3(t_w59), .w4(t_w60), .w5(t_w61), .w6(t_w62), .w7(t_w63));

	MIN_1 M0 (.clk(clk),.rst(rst),.d0(t_d0),.d1(t_d1),.d2(t_d2),.d3(t_d3),.d4(t_d4),.d5(t_d5),.d6(t_d6),.d7(t_d7),
			   .w0(t_w0),.w1(t_w1),.w2(t_w2),.w3(t_w3),.w4(t_w4),.w5(t_w5),.w6(t_w6),.w7(t_w7),
			   .d_min(d_min0),.d_min_index(d_min_index0),.w_min(w_min0));
	MIN_1 M1 (.clk(clk),.rst(rst),.d0(t_d8),.d1(t_d9),.d2(t_d10),.d3(t_d11),.d4(t_d12),.d5(t_d13),.d6(t_d14),.d7(t_d15),
			   .w0(t_w8),.w1(t_w9),.w2(t_w10),.w3(t_w11),.w4(t_w12),.w5(t_w13),.w6(t_w14),.w7(t_w15),
			   .d_min(d_min1),.d_min_index(d_min_index1),.w_min(w_min1));
	MIN_1 M2 (.clk(clk),.rst(rst),.d0(t_d16),.d1(t_d17),.d2(t_d18),.d3(t_d19),.d4(t_d20),.d5(t_d21),.d6(t_d22),.d7(t_d23),
			   .w0(t_w16),.w1(t_w17),.w2(t_w18),.w3(t_w19),.w4(t_w20),.w5(t_w21),.w6(t_w22),.w7(t_w23),
			   .d_min(d_min2),.d_min_index(d_min_index2),.w_min(w_min2));
	MIN_1 M3 (.clk(clk),.rst(rst),.d0(t_d24),.d1(t_d25),.d2(t_d26),.d3(t_d27),.d4(t_d28),.d5(t_d29),.d6(t_d30),.d7(t_d31),
			   .w0(t_w24),.w1(t_w25),.w2(t_w26),.w3(t_w27),.w4(t_w28),.w5(t_w29),.w6(t_w30),.w7(t_w31),
			   .d_min(d_min3),.d_min_index(d_min_index3),.w_min(w_min3));
	MIN_1 M4 (.clk(clk),.rst(rst),.d0(t_d32),.d1(t_d33),.d2(t_d34),.d3(t_d35),.d4(t_d36),.d5(t_d37),.d6(t_d38),.d7(t_d39),
			   .w0(t_w32),.w1(t_w33),.w2(t_w34),.w3(t_w35),.w4(t_w36),.w5(t_w37),.w6(t_w38),.w7(t_w39),
			   .d_min(d_min4),.d_min_index(d_min_index4),.w_min(w_min4));
	MIN_1 M5 (.clk(clk),.rst(rst),.d0(t_d40),.d1(t_d41),.d2(t_d42),.d3(t_d43),.d4(t_d44),.d5(t_d45),.d6(t_d46),.d7(t_d47),
			   .w0(t_w40),.w1(t_w41),.w2(t_w42),.w3(t_w43),.w4(t_w44),.w5(t_w45),.w6(t_w46),.w7(t_w47),
			   .d_min(d_min5),.d_min_index(d_min_index5),.w_min(w_min5));
	MIN_1 M6 (.clk(clk),.rst(rst),.d0(t_d48),.d1(t_d49),.d2(t_d50),.d3(t_d51),.d4(t_d52),.d5(t_d53),.d6(t_d54),.d7(t_d55),
			   .w0(t_w48),.w1(t_w49),.w2(t_w50),.w3(t_w51),.w4(t_w52),.w5(t_w53),.w6(t_w54),.w7(t_w55),
			   .d_min(d_min6),.d_min_index(d_min_index6),.w_min(w_min6));
	MIN_1 M7 (.clk(clk),.rst(rst),.d0(t_d56),.d1(t_d57),.d2(t_d58),.d3(t_d59),.d4(t_d60),.d5(t_d61),.d6(t_d62),.d7(t_d63),
			   .w0(t_w56),.w1(t_w57),.w2(t_w58),.w3(t_w59),.w4(t_w60),.w5(t_w61),.w6(t_w62),.w7(t_w63),
			   .d_min(d_min7),.d_min_index(d_min_index7),.w_min(w_min7));
	MIN_2 M8 (.clk(clk),.rst(rst),.d0(d_min0),.d1(d_min1),.d2(d_min2),.d3(d_min3),.d4(d_min4),.d5(d_min5),.d6(d_min6),.d7(d_min7),
			  .w0(w_min0),.w1(w_min1),.w2(w_min2),.w3(w_min3),.w4(w_min4),.w5(w_min5),.w6(w_min6),.w7(w_min7),
			  .index0(d_min_index0),.index1(d_min_index1),.index2(d_min_index2),.index3(d_min_index3),.index4(d_min_index4),.index5(d_min_index5),.index6(d_min_index6),.index7(d_min_index7),
			  .X_c(x_c),.Y_c(y_c),.weight_c(RAM_RESULT_D));
	USS U0 (.clk(clk), .rst(rst), .X_in(3'd0), .X_c(x_c), .Y_c(y_c), .neighbor_sel(sel_0));
	USS U1 (.clk(clk), .rst(rst), .X_in(3'd1), .X_c(x_c), .Y_c(y_c), .neighbor_sel(sel_1));
	USS U2 (.clk(clk), .rst(rst), .X_in(3'd2), .X_c(x_c), .Y_c(y_c), .neighbor_sel(sel_2));
	USS U3 (.clk(clk), .rst(rst), .X_in(3'd3), .X_c(x_c), .Y_c(y_c), .neighbor_sel(sel_3));
	USS U4 (.clk(clk), .rst(rst), .X_in(3'd4), .X_c(x_c), .Y_c(y_c), .neighbor_sel(sel_4));
	USS U5 (.clk(clk), .rst(rst), .X_in(3'd5), .X_c(x_c), .Y_c(y_c), .neighbor_sel(sel_5));
	USS U6 (.clk(clk), .rst(rst), .X_in(3'd6), .X_c(x_c), .Y_c(y_c), .neighbor_sel(sel_6));
	USS U7 (.clk(clk), .rst(rst), .X_in(3'd7), .X_c(x_c), .Y_c(y_c), .neighbor_sel(sel_7));


	initial begin
		case(RAM_W_A)
		18'd0: RAM_W_D = t_w0;
		18'd1: RAM_W_D = t_w1; 
		18'd2: RAM_W_D = t_w2; 
		18'd3: RAM_W_D = t_w3; 
		18'd4: RAM_W_D = t_w4; 
		18'd5: RAM_W_D = t_w5; 
		18'd6: RAM_W_D = t_w6; 
		18'd7: RAM_W_D = t_w7;
		18'd8: RAM_W_D = t_w8;
		18'd9: RAM_W_D = t_w9; 
		18'd10: RAM_W_D = t_w10; 
		18'd11: RAM_W_D = t_w11; 
		18'd12: RAM_W_D = t_w12; 
		18'd13: RAM_W_D = t_w13; 
		18'd14: RAM_W_D = t_w14; 
		18'd15: RAM_W_D = t_w15;
		18'd16: RAM_W_D = t_w16;
		18'd17: RAM_W_D = t_w17; 
		18'd18: RAM_W_D = t_w18; 
		18'd19: RAM_W_D = t_w19; 
		18'd20: RAM_W_D = t_w20; 
		18'd21: RAM_W_D = t_w21; 
		18'd22: RAM_W_D = t_w22; 
		18'd23: RAM_W_D = t_w23;
		18'd24: RAM_W_D = t_w24;
		18'd25: RAM_W_D = t_w25; 
		18'd26: RAM_W_D = t_w26; 
		18'd27: RAM_W_D = t_w27; 
		18'd28: RAM_W_D = t_w28; 
		18'd29: RAM_W_D = t_w29; 
		18'd30: RAM_W_D = t_w30; 
		18'd31: RAM_W_D = t_w31;
		18'd32: RAM_W_D = t_w32;
		18'd33: RAM_W_D = t_w33; 
		18'd34: RAM_W_D = t_w34; 
		18'd35: RAM_W_D = t_w35; 
		18'd36: RAM_W_D = t_w36; 
		18'd37: RAM_W_D = t_w37; 
		18'd38: RAM_W_D = t_w38; 
		18'd39: RAM_W_D = t_w39;
		18'd40: RAM_W_D = t_w40;
		18'd41: RAM_W_D = t_w41; 
		18'd42: RAM_W_D = t_w42; 
		18'd43: RAM_W_D = t_w43; 
		18'd44: RAM_W_D = t_w44; 
		18'd45: RAM_W_D = t_w45; 
		18'd46: RAM_W_D = t_w46; 
		18'd47: RAM_W_D = t_w47;
		18'd48: RAM_W_D = t_w48;
		18'd49: RAM_W_D = t_w49; 
		18'd50: RAM_W_D = t_w50; 
		18'd51: RAM_W_D = t_w51; 
		18'd52: RAM_W_D = t_w52; 
		18'd53: RAM_W_D = t_w53; 
		18'd54: RAM_W_D = t_w54; 
		18'd55: RAM_W_D = t_w55;
		18'd56: RAM_W_D = t_w56;
		18'd57: RAM_W_D = t_w57; 
		18'd58: RAM_W_D = t_w58; 
		18'd59: RAM_W_D = t_w59; 
		18'd60: RAM_W_D = t_w60; 
		18'd61: RAM_W_D = t_w61; 
		18'd62: RAM_W_D = t_w62; 
		18'd63: RAM_W_D = t_w63;
		default: RAM_W_D = 24'b0;
		endcase
	end
endmodule