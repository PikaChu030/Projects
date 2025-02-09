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
	output [23:0] RAM_W_D;
	output RAM_RESULT_OE;
	output RAM_RESULT_WE;
	output [17:0] RAM_RESULT_A;
	output [23:0] RAM_RESULT_D;
	output done;

// ---------------------- Write down Your design below  ---------------------- //

endmodule