/////////////////////////////////////////////////////////////////////
// ---------------------- IVCAD 2022 Spring ---------------------- //
// ---------------------- Version : v.1.10  ---------------------- //
// ---------------------- Date : 2022.04.13 ---------------------- //
// ------------------------- USS module ---------------------------//
// ----------------- Feb. 2022 Willie authored --------------------//
/////////////////////////////////////////////////////////////////////

module USS(clk, rst, X_in, X_c, Y_c, neighbor_sel);

// ---------------------- input  ---------------------- //
	input clk;
	input rst;
	input [2:0] X_in;
	input [2:0] X_c;
	input [2:0] Y_c;
	
// ---------------------- output  ---------------------- //
	output reg [15:0] neighbor_sel;
	
// ---------------------- Write down Your design below  ---------------------- //
	reg [2:0] x_t0,x_t1,x_t2,x_t3;
	reg [2:0] y_t0,y_t1,y_t2,y_t3;


	always @(*) begin
		y_t0 = Y_c + 3'd1;        // y + 1
		y_t1 = Y_c - 3'd1;        // y - 1
		y_t2 = Y_c + 3'd2;        // y + 2
		y_t3 = Y_c - 3'd2;        // y - 2
	end

	always @(*) begin
		neighbor_sel = 16'b11111111_11111111;
		if(X_in == Y_c) begin                //和center同一行   
			if(X_c == 3'd0) begin
				neighbor_sel = 16'b00011011_11111111;
			end
			else if(X_c == 3'd1) begin
				neighbor_sel = 16'b01000110_11111111;
			end
			else if(X_c == 3'd2) begin
				neighbor_sel = 16'b10010001_10111111;
			end
			else if(X_c == 3'd3) begin
				neighbor_sel = 16'b11100100_01101111;
			end
			else if(X_c == 3'd4) begin
				neighbor_sel = 16'b11111001_00011011;
			end
			else if(X_c == 3'd5) begin
				neighbor_sel = 16'b11111110_01000110;
			end
			else if(X_c == 3'd6) begin
				neighbor_sel = 16'b11111111_10010001;
			end
			else if(X_c == 3'd7) begin
				neighbor_sel = 16'b11111111_11100100;
			end
			else begin
				neighbor_sel = 16'b11111111_11111111;
			end
		end
		else if(X_in == y_t0  || X_in ==  y_t1) begin  //y+-1
			if(X_c == 3'd0) begin
				neighbor_sel = 16'b01011011_11111111;
			end
			else if(X_c == 3'd1) begin
				neighbor_sel = 16'b01010110_11111111;
			end
			else if(X_c == 3'd2) begin
				neighbor_sel = 16'b10010101_10111111;
			end
			else if(X_c == 3'd3) begin
				neighbor_sel = 16'b11100101_01101111;
			end
			else if(X_c == 3'd4) begin
				neighbor_sel = 16'b11111001_01010111;
			end
			else if(X_c == 3'd5) begin
				neighbor_sel = 16'b11111110_01010101;
			end
			else if(X_c == 3'd6) begin
				neighbor_sel = 16'b11111111_10010101;
			end
			else if(X_c == 3'd7) begin
				neighbor_sel = 16'b11111111_11100101;
			end
			else begin
				neighbor_sel = 16'b11111111_11111111;
			end
		end
		else if(X_in ==  y_t2  ||  X_in ==  y_t3) begin    //y+-2
			if(X_c == 3'd0) begin
				neighbor_sel = 16'b10101011_11111111;
			end
			else if(X_c == 3'd1) begin
				neighbor_sel = 16'b10101010_11111111;
			end
			else if(X_c == 3'd2) begin
				neighbor_sel = 16'b10101010_10111111;
			end
			else if(X_c == 3'd3) begin
				neighbor_sel = 16'b11101010_10101111;
			end
			else if(X_c == 3'd4) begin
				neighbor_sel = 16'b11111010_10101011;
			end
			else if(X_c == 3'd5) begin
				neighbor_sel = 16'b11111110_10101010;
			end
			else if(X_c == 3'd6) begin
				neighbor_sel = 16'b11111111_10101010;
			end
			else if(X_c == 3'd7) begin
				neighbor_sel = 16'b11111111_11101010;
			end
			else begin
				neighbor_sel = 16'b11111111_11111111;
			end
		end
		else begin
			neighbor_sel = 16'b11111111_11111111;
		end


	end
endmodule

