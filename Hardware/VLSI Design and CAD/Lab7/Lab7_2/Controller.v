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
	output D_update;
	output W_update;
	output [17:0] RAM_IF_A;
	output RAM_IF_OE;
	output [17:0] RAM_W_A;
	output RAM_W_WE;
	output [17:0] RAM_RESULT_A;
	output RAM_RESULT_WE;
	output done;
	
// ---------------------- Write down Your design below  ---------------------- //

endmodule 