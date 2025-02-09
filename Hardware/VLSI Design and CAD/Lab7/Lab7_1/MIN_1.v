/////////////////////////////////////////////////////////////////////
// ---------------------- IVCAD 2022 Spring ---------------------- //
// ---------------------- Version : v.1.10  ---------------------- //
// ---------------------- Date : 2022.04.13 ---------------------- //
// ------------------------ MIN_1 module --------------------------//
// ----------------- Feb. 2022 Willie authored --------------------//
/////////////////////////////////////////////////////////////////////

module MIN_1(clk,rst,d0,d1,d2,d3,d4,d5,d6,d7,w0,w1,w2,w3,w4,w5,w6,w7,d_min,d_min_index,w_min);

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
	
// ---------------------- output  ---------------------- //
	output reg [10:0] d_min;
	output reg [2:0]  d_min_index;
	output reg [23:0] w_min;

// ---------------------- Write down Your design below  ---------------------- //
	wire [10:0] temp_0,temp_1,temp_2,temp_3,temp_4,temp_5,temp_6;

	assign temp_0 = (d0 <= d1)? d0 : d1;
	assign temp_1 = (d2 <= d3)? d2 : d3;
  	assign temp_2 = (d4 <= d5)? d4 : d5;
  	assign temp_3 = (d6 <= d7)? d6 : d7;
  	assign temp_4 = (temp_0 <= temp_1)? temp_0 : temp_1;
  	assign temp_5 = (temp_2 <= temp_3)? temp_2 : temp_3;
  	assign temp_6 = (temp_4 <= temp_5)? temp_4 : temp_5;

	always @(posedge clk or posedge rst) begin
		if(rst) begin
			d_min <= 11'd0;
			d_min_index <= 3'd0;
			w_min <= 24'd0;
		end
	end
	always @(*) begin
		if (temp_6 == d7) begin
        	d_min = temp_6;
        	d_min_index = 3'd7;
			w_min = w7;
    	end
    	else if (temp_6 == d6) begin
        	d_min = temp_6;
        	d_min_index = 3'd6;
			w_min = w6;
    	end
    	else if (temp_6 == d5) begin
        	d_min = temp_6;
        	d_min_index = 3'd5;
			w_min = w5;
    	end
    	else if (temp_6 == d4) begin
        	d_min = temp_6;
        	d_min_index = 3'd4;
			w_min = w4;
    	end
    	else if (temp_6 == d3) begin
       		d_min = temp_6;
       		d_min_index = 3'd3;
			w_min = w3;
    	end
    	else if (temp_6 == d2) begin
        	d_min = temp_6;
       		d_min_index = 3'd2;
			w_min = w2;
    	end
    	else if (temp_6 == d1) begin
        	d_min = temp_6;
        	d_min_index = 3'd1;
			w_min = w1;
    	end
    	else if (temp_6 == d0) begin
        	d_min = temp_6;
       		d_min_index = 3'd0;
			w_min = w0;
    	end
    	else begin
        	d_min = 10'd0;
        	d_min_index = 3'd0;
			w_min = w0;
    	end
	end
endmodule

