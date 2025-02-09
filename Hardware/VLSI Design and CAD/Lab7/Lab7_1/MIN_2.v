/////////////////////////////////////////////////////////////////////
// ---------------------- IVCAD 2022 Spring ---------------------- //
// ---------------------- Version : v.1.10  ---------------------- //
// ---------------------- Date : 2022.04.13 ---------------------- //
// ------------------------ MIN_2 module --------------------------//
// ----------------- Feb. 2022 Willie authored --------------------//
/////////////////////////////////////////////////////////////////////

module MIN_2(clk,rst,d0,d1,d2,d3,d4,d5,d6,d7,w0,w1,w2,w3,w4,w5,w6,w7,index0,index1,index2,index3,index4,index5,index6,index7,X_c,Y_c,weight_c);

// ---------------------- input  ---------------------- //
	input clk;
	input rst;
	input [10:0] d0;
	input [10:0] d1;
	input [10:0] d2;
	input [10:0] d3;
	input [10:0] d4;
	input [10:0] d5;
	input [10:0] d6;
	input [10:0] d7;
	input [23:0] w0;
	input [23:0] w1;
	input [23:0] w2;
	input [23:0] w3;
	input [23:0] w4;
	input [23:0] w5;
	input [23:0] w6;
	input [23:0] w7;
	input [2:0] index0;
	input [2:0] index1;
	input [2:0] index2;
	input [2:0] index3;
	input [2:0] index4;
	input [2:0] index5;
	input [2:0] index6;
	input [2:0] index7;

// ---------------------- output  ---------------------- //
	output reg [2:0] X_c;
	output reg [2:0] Y_c;
	output reg [23:0] weight_c;
	
// ---------------------- Write down Your design below  ---------------------- //
	wire [10:0] temp_0,temp_1,temp_2,temp_3,temp_4,temp_5,temp_6,temp_7;

	assign temp_0 = (d0 <= d1)? d0 : d1;
	assign temp_1 = (d2 <= d3)? d2 : d3;
  	assign temp_2 = (d4 <= d5)? d4 : d5;
  	assign temp_3 = (d6 <= d7)? d6 : d7;
  	assign temp_4 = (temp_0 <= temp_1)? temp_0 : temp_1;
  	assign temp_5 = (temp_2 <= temp_3)? temp_2 : temp_3;
  	assign temp_6 = (temp_4 <= temp_5)? temp_4 : temp_5;

	always @(posedge clk or posedge rst) begin
		if(rst) begin
			X_c <= 3'd0;
			Y_c <= 3'd0;
			weight_c <= 24'd0;
		end
	end

	always @(*) begin
		if(temp_6 == d7) begin
			X_c = index7;
			Y_c = 3'd7; 
			weight_c = w7;
		end
		else if (temp_6 == d6) begin
			X_c = index6;
			Y_c = 3'd6;
			weight_c = w6;
		end
		else if (temp_5 == d5) begin
			X_c = index5;
			Y_c = 3'd5;
			weight_c = w5;
		end
		else if (temp_4 == d4) begin
			X_c = index4;
			Y_c = 3'd4;
			weight_c = w4;
		end
		else if (temp_3 == d3) begin
			X_c = index3;
			Y_c = 3'd3;
			weight_c = w3;
		end
		else if (temp_2 == d2) begin
			X_c = index2;
			Y_c = 3'd2;
			weight_c = w2;
		end
		else if (temp_1 == d1) begin
			X_c = index1;
			Y_c = 3'd1;
			weight_c = w1;
		end
		else if (temp_0 == d0) begin
			X_c = index0;
			Y_c = 3'd0;
			weight_c = w0;
		end
		else begin
			X_c = index0;
			Y_c = 3'd0;
			weight_c = w0;
		end
	end
endmodule

