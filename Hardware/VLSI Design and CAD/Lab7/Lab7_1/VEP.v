/////////////////////////////////////////////////////////////////////
// ---------------------- IVCAD 2022 Spring ---------------------- //
// ---------------------- Version : v.1.10  ---------------------- //
// ---------------------- Date : 2022.04.13 ---------------------- //
// ------------------------ VEP module --------------------------//
// ----------------- Feb. 2022 Willie authored --------------------//
/////////////////////////////////////////////////////////////////////

module VEP(clk, rst, W_update, D_update, neighbor_sel, pixel,
				d0, d1, d2, d3, d4, d5, d6, d7, w0, w1, w2, w3, w4, w5, w6, w7);

// ---------------------- input  ---------------------- //
	input clk; 
	input rst; 
	input W_update;
	input D_update;
	input [15:0] neighbor_sel; 
	input [23:0] pixel; 
	
// ---------------------- output   ---------------------- //
	output reg [10:0] d0;
	output reg [10:0] d1;
	output reg [10:0] d2;
	output reg [10:0] d3;
	output reg [10:0] d4;
	output reg [10:0] d5;
	output reg [10:0] d6;
	output reg [10:0] d7;
	output reg [23:0] w0;
	output reg [23:0] w1;
	output reg [23:0] w2;
	output reg [23:0] w3;
	output reg [23:0] w4;
	output reg [23:0] w5;
	output reg [23:0] w6;
	output reg [23:0] w7;
	
// ---------------------- Write down Your design below  ---------------------- //
	always @(posedge clk or posedge rst) begin
		if(rst) begin
			d0   <= 24'd0;
			d1   <= 24'd0;
			d2   <= 24'd0;
			d3   <= 24'd0;
			d4   <= 24'd0;
			d5   <= 24'd0;
			d6   <= 24'd0;
			d7   <= 24'd0;
			w0   <= 24'b01111101_01111101_01111101;
			w1   <= 24'b01111101_01111101_01111101;
			w2   <= 24'b01111101_01111101_01111101;
			w3   <= 24'b01111101_01111101_01111101;
			w4   <= 24'b01111101_01111101_01111101;
			w5   <= 24'b01111101_01111101_01111101;
			w6   <= 24'b01111101_01111101_01111101;
			w7   <= 24'b01111101_01111101_01111101;
		end
		else begin
	
		end
	end

	always @(*) begin       //calculate manhattan
		if(D_update) begin
			d0 = ((pixel[7:0]     >= w0[7:0]   ? pixel[7:0]   - w0[7:0]   : w0[7:0]   - pixel[7:0])
				+(pixel[15:8]    >= w0[15:8]  ? pixel[15:8]  - w0[15:8]  : w0[15:8]  - pixel[15:8])
				+(pixel[23:16]   >= w0[23:16] ? pixel[23:16] - w0[23:16] : w0[23:16] - pixel[23:16]));

			d1 = ((pixel[7:0]     >= w1[7:0]   ? pixel[7:0]   - w1[7:0]   : w1[7:0]   - pixel[7:0])
				+(pixel[15:8]    >= w1[15:8]  ? pixel[15:8]  - w1[15:8]  : w1[15:8]  - pixel[15:8])
				+(pixel[23:16]   >= w1[23:16] ? pixel[23:16] - w1[23:16] : w1[23:16] - pixel[23:16]));

			d2 = ((pixel[7:0]     >= w2[7:0]   ? pixel[7:0]   - w2[7:0]   : w2[7:0]   - pixel[7:0])
				+(pixel[15:8]    >= w2[15:8]  ? pixel[15:8]  - w2[15:8]  : w2[15:8]  - pixel[15:8])
				+(pixel[23:16]   >= w2[23:16] ? pixel[23:16] - w2[23:16] : w2[23:16] - pixel[23:16]));

			d3 = ((pixel[7:0]     >= w3[7:0]   ? pixel[7:0]   - w3[7:0]   : w3[7:0]   - pixel[7:0])
				+(pixel[15:8]    >= w3[15:8]  ? pixel[15:8]  - w3[15:8]  : w3[15:8]  - pixel[15:8])
				+(pixel[23:16]   >= w3[23:16] ? pixel[23:16] - w3[23:16] : w3[23:16] - pixel[23:16]));

			d4 = ((pixel[7:0]     >= w4[7:0]   ? pixel[7:0]   - w4[7:0]   : w4[7:0]   - pixel[7:0])
				+(pixel[15:8]    >= w4[15:8]  ? pixel[15:8]  - w4[15:8]  : w4[15:8]  - pixel[15:8])
				+(pixel[23:16]   >= w4[23:16] ? pixel[23:16] - w4[23:16] : w4[23:16] - pixel[23:16]));

			d5 = ((pixel[7:0]     >= w5[7:0]   ? pixel[7:0]   - w5[7:0]   : w5[7:0]   - pixel[7:0])
				+(pixel[15:8]    >= w5[15:8]  ? pixel[15:8]  - w5[15:8]  : w5[15:8]  - pixel[15:8])
				+(pixel[23:16]   >= w5[23:16] ? pixel[23:16] - w5[23:16] : w5[23:16] - pixel[23:16]));

			d6 = ((pixel[7:0]     >= w6[7:0]   ? pixel[7:0]   - w6[7:0]   : w6[7:0]   - pixel[7:0])
				+(pixel[15:8]    >= w6[15:8]  ? pixel[15:8]  - w6[15:8]  : w6[15:8]  - pixel[15:8])
				+(pixel[23:16]   >= w6[23:16] ? pixel[23:16] - w6[23:16] : w6[23:16] - pixel[23:16]));

			d7 = ((pixel[7:0]     >= w7[7:0]   ? pixel[7:0]   - w7[7:0]   : w7[7:0]   - pixel[7:0])
				+(pixel[15:8]    >= w7[15:8]  ? pixel[15:8]  - w7[15:8]  : w7[15:8]  - pixel[15:8])
				+(pixel[23:16]   >= w7[23:16] ? pixel[23:16] - w7[23:16] : w7[23:16] - pixel[23:16]));
		end
		else begin
			
		end
	end

	always @(*) begin         //calculate weights
		if(W_update) begin
			case(neighbor_sel[1:0])
			2'b00:begin
				w0 = w0 + $signed(d0) >>> 2;
			end
			2'b01:begin
				w0 = w0 + $signed(d0) >>> 4;
			end
			2'b10:begin
				w0 = w0 + $signed(d0) >>> 5;
			end
			2'b11:begin
				w0 = w0;
			end
			default:begin
				w0 = w0;
			end
			endcase

			case(neighbor_sel[3:2])
			2'b00:begin
				w1 = w1 + $signed(d1) >>> 2;
			end
			2'b01:begin
				w1 = w1 + $signed(d1) >>> 4;
			end
			2'b10:begin
				w1 = w1 + $signed(d1) >>> 5;
			end
			2'b11:begin
				w1 = w1;
			end
			default:begin
				w1 = w1;
			end
			endcase

			case(neighbor_sel[5:4])
			2'b00:begin
				w2 = w2 + $signed(d2) >>> 2;
			end
			2'b01:begin
				w2 = w2 + $signed(d2) >>> 4;
			end
			2'b10:begin
				w2 = w2 + $signed(d2) >>> 5;
			end
			2'b11:begin
				w2 = w2;
			end
			default:begin
				w2 = w2;
			end
			endcase

			case(neighbor_sel[7:6])
			2'b00:begin
				w3 = w3 + $signed(d3) >>> 2;
			end
			2'b01:begin
				w3 = w3 + $signed(d3) >>> 4;
			end
			2'b10:begin
				w3 = w3 + $signed(d3) >>> 5;
			end
			2'b11:begin
				w3 = w3;
			end
			endcase

			case(neighbor_sel[9:8])
			2'b00:begin
				w4 = w4 + $signed(d4) >>> 2;
			end
			2'b01:begin
				w4 = w4 + $signed(d4) >>> 4;
			end
			2'b10:begin
				w4 = w4 + $signed(d4) >>> 5;
			end
			2'b11:begin
				w4 = w4;
			end
			default:begin
				w4 = w4;
			end
			endcase

			case(neighbor_sel[11:10])
			2'b00:begin
				w5 = w5 + $signed(d5) >>> 2;
			end
			2'b01:begin
				w5 = w5 + $signed(d5) >>> 4;
			end
			2'b10:begin
				w5 = w5 + $signed(d5) >>> 5;
			end
			2'b11:begin
				w5 = w5;
			end
			default:begin
				w5 = w5;
			end
			endcase

			case(neighbor_sel[13:12])
			2'b00:begin
				w6 = w6 + $signed(d6) >>> 2;
			end
			2'b01:begin
				w6 = w6 + $signed(d6) >>> 4;
			end
			2'b10:begin
				w6 = w6 + $signed(d6) >>> 5;
			end
			2'b11:begin
				w6 = w6;
			end
			default:begin
				w5 = w6;
			end
			endcase

			case(neighbor_sel[15:14])
			2'b00:begin
				w7 = w7 + $signed(d7) >>> 2;
			end
			2'b01:begin
				w7 = w7 + $signed(d7) >>> 4;
			end
			2'b10:begin
				w7 = w7 + $signed(d7) >>> 5;
			end
			2'b11:begin
				w7 = w7;
			end
			default:begin
				w7 = w7;
			end
			endcase
		end
	end
endmodule
