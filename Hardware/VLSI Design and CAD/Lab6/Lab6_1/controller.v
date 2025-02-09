module controller(
	input clk,
	input rst,
	output reg done,
	//RAM1
	input  [23:0]RAM1_Q,
	output reg RAM1_OE,
	output reg [19:0]RAM1_A,
	//RAM2_WE
	output reg RAM2_WE,
	output reg [19:0]RAM2_A,
	//MAN0~7
	output reg[23:0] RAM1_Q_latch,
	output reg wen0,
	output reg wen1,
	output reg wen2,
	output reg wen3,
	output reg wen4,
	output reg wen5,
	output reg wen6,
	output reg wen7,
	output reg [2:0] MAN_A_WEIGHT);

	reg [19:0] counter_1; 
	reg [2:0] st, n_st; 
	parameter s0 = 3'b000, //Initial status
			  s1 = 3'b001, // wr_weigth
			  s2 = 3'b010, // calculate and wr_ans
			  s3 = 3'b011; // done !!

	always @(posedge clk or posedge rst) begin
		if(rst) begin
			st <= s0;
			counter_1 <= 20'd0;
			
		end
		else begin
			counter_1 <= counter_1 + 20'd1;
			st <= n_st;	
		end
	end

	always @(*) begin
		case (st)
			s0: begin
				wen0 = 1'b0;
				wen1 = 1'b0;
				wen2 = 1'b0;
				wen3 = 1'b0;
				wen4 = 1'b0;
				wen5 = 1'b0;
				wen6 = 1'b0;
				wen7 = 1'b0;
				RAM1_OE = 1'b0;
				RAM2_WE = 1'b0;
				RAM1_A = 20'b0;
				RAM2_A = 20'b0;
				MAN_A_WEIGHT = 3'b0;
				RAM1_Q_latch = 24'b0;
				done = 1'b0;
				n_st = s1;
 
			end

			s1:begin

				RAM1_OE = 1'b1;
				RAM2_WE = 1'b0;
				RAM1_A = counter_1 - 20'd1;
				RAM2_A = 20'b0;
				RAM1_Q_latch = RAM1_Q;
				MAN_A_WEIGHT = RAM1_A % 8;
				if(RAM1_A / 8 == 0) begin
					wen0 = 1'b1;
					wen1 = 1'b0;
					wen2 = 1'b0;
					wen3 = 1'b0;
					wen4 = 1'b0;
					wen5 = 1'b0;
					wen6 = 1'b0;
					wen7 = 1'b0;
				end
				else if (RAM1_A / 8 == 1) begin
					wen0 = 1'b0;
					wen1 = 1'b1;
					wen2 = 1'b0;
					wen3 = 1'b0;
					wen4 = 1'b0;
					wen5 = 1'b0;
					wen6 = 1'b0;
					wen7 = 1'b0;
				end
				else if (RAM1_A / 8 == 2) begin
					wen0 = 1'b0;
					wen1 = 1'b0;
					wen2 = 1'b1;
					wen3 = 1'b0;
					wen4 = 1'b0;
					wen5 = 1'b0;
					wen6 = 1'b0;
					wen7 = 1'b0;
				end

				else if (RAM1_A/ 8 == 3) begin
					wen0 = 1'b0;
					wen1 = 1'b0;
					wen2 = 1'b0;
					wen3 = 1'b1;
					wen4 = 1'b0;
					wen5 = 1'b0;
					wen6 = 1'b0;
					wen7 = 1'b0;
				end
				else if (RAM1_A / 8 == 4) begin
					wen0 = 1'b0;
					wen1 = 1'b0;
					wen2 = 1'b0;
					wen3 = 1'b0;
					wen4 = 1'b1;
					wen5 = 1'b0;
					wen6 = 1'b0;
					wen7 = 1'b0;

				end
				else if (RAM1_A/ 8 == 5) begin
					wen0 = 1'b0;
					wen1 = 1'b0;
					wen2 = 1'b0;
					wen3 = 1'b0;
					wen4 = 1'b0;
					wen5 = 1'b1;
					wen6 = 1'b0;
					wen7 = 1'b0;

				end
				else if (RAM1_A / 8 == 6) begin
					wen0 = 1'b0;
					wen1 = 1'b0;
					wen2 = 1'b0;
					wen3 = 1'b0;
					wen4 = 1'b0;
					wen5 = 1'b0;
					wen6 = 1'b1;
					wen7 = 1'b0;

				end
				else if (RAM1_A / 8 == 7) begin
					wen0 = 1'b0;
					wen1 = 1'b0;
					wen2 = 1'b0;
					wen3 = 1'b0;
					wen4 = 1'b0;
					wen5 = 1'b0;
					wen6 = 1'b0;
					wen7 = 1'b1;
				end
				else begin
					wen0 = 1'b0;
					wen1 = 1'b0;
					wen2 = 1'b0;
					wen3 = 1'b0;
					wen4 = 1'b0;
					wen5 = 1'b0;
					wen6 = 1'b0;
					wen7 = 1'b1;
				end
				if(counter_1 == 20'd64) begin
					n_st = s2;
				end
				else begin
					n_st = s1;
				end

				done = 1'b0;
			end

			s2:begin
				wen0 = 1'b0;
				wen1 = 1'b0;
				wen2 = 1'b0;
				wen3 = 1'b0;
				wen4 = 1'b0;
				wen5 = 1'b0;
				wen6 = 1'b0;
				wen7 = 1'b0;

				RAM1_OE = 1'b1;
				RAM2_WE = 1'b1;

				RAM1_A = counter_1 - 20'd1;
				RAM2_A = counter_1 - 20'd67;
				MAN_A_WEIGHT = 3'b0;
				RAM1_Q_latch = RAM1_Q;
				if(counter_1 == 20'd4162) begin
					n_st = s3;
					done = 1'b1;
				end
				else begin
					n_st = s2;
					done = 1'b0;
				end
			end

			s3:begin
				wen0 = 1'b0;
				wen1 = 1'b0;
				wen2 = 1'b0;
				wen3 = 1'b0;
				wen4 = 1'b0;
				wen5 = 1'b0;
				wen6 = 1'b0;
				wen7 = 1'b0;
				RAM1_OE = 1'b0;
				RAM2_WE = 1'b0;
				RAM1_A = 20'b0;
				RAM2_A = 20'b0;
				MAN_A_WEIGHT = 3'b0;
				RAM1_Q_latch = 24'b0;
				done = 1'b1;
				n_st = s3;
			end
			default : begin
				wen0 = 1'b0;
				wen1 = 1'b0;
				wen2 = 1'b0;
				wen3 = 1'b0;
				wen4 = 1'b0;
				wen5 = 1'b0;
				wen6 = 1'b0;
				wen7 = 1'b0;
				RAM1_OE = 1'b0;
				RAM2_WE = 1'b0;
				RAM1_A = 20'b0;
				RAM2_A = 20'b0;
				MAN_A_WEIGHT = 3'b0;
				RAM1_Q_latch = 24'b0;
				done = 1'b0;
				n_st = s0;
			end

		endcase 
	end
endmodule
