module MAN(
	input clk,
	input rst,
	input [23:0] data_in,
	input wen,
	input [2:0] MAN_A_W,
	
	
	
	output   [10:0] d0_out   ,
	output   [10:0] d1_out   ,
	output   [10:0] d2_out   ,
	output   [10:0] d3_out   ,
	output   [10:0] d4_out   ,
	output   [10:0] d5_out   ,
	output   [10:0] d6_out   ,
	output   [10:0] d7_out);
	
	reg [23:0] weight_0, weight_1, weight_2, weight_3, weight_4, weight_5, weight_6, weight_7;
	reg [23:0] data;
	always @(posedge clk or posedge rst) begin
		if(rst) begin
			weight_0 <= 24'b0;
			weight_1 <= 24'b0;
			weight_2 <= 24'b0;
			weight_3 <= 24'b0;
			weight_4 <= 24'b0;
			weight_5 <= 24'b0;
			weight_6 <= 24'b0;
			weight_7 <= 24'b0;
			data <= 24'b0;
		end
		else if(wen) begin
			if(MAN_A_W == 3'd0) begin
				weight_0 <= data_in;
			end
			else if(MAN_A_W == 3'd1) begin
				weight_1 <= data_in;
			end
			else if(MAN_A_W == 3'd2) begin
				weight_2 <= data_in;
			end
			else if(MAN_A_W == 3'd3) begin
				weight_3 <= data_in;
			end
			else if(MAN_A_W == 3'd4) begin
				weight_4 <= data_in;
			end
			else if(MAN_A_W == 3'd5) begin
				weight_5 <= data_in;
			end
			else if(MAN_A_W == 3'd6) begin
				weight_6 <= data_in;
			end
			else if(MAN_A_W == 3'd7) begin
				weight_7 <= data_in;
			end
			else begin
				weight_0 <= 24'b0;
			end
		end
		else if(wen == 1'b0)begin
			data <= data_in;
		end
	end

		assign d0_out = ((data[7:0]     >= weight_0[7:0]   ? {3'b0,(data[7:0]   - weight_0[7:0])}   : {3'b0,(weight_0[7:0]   - data[7:0])})
			+(data[15:8]    >= weight_0[15:8]  ? {3'b0,(data[15:8]  - weight_0[15:8])}  : {3'b0,(weight_0[15:8]  - data[15:8])})
			+(data[23:16]   >= weight_0[23:16] ? {3'b0,(data[23:16] - weight_0[23:16])} : {3'b0,(weight_0[23:16] - data[23:16])}));

		assign d1_out = ((data[7:0]     >= weight_1[7:0]   ? {3'b0,(data[7:0]   - weight_1[7:0])}   : {3'b0,(weight_1[7:0]   - data[7:0])})
			+(data[15:8]    >= weight_1[15:8]  ? {3'b0,(data[15:8]  - weight_1[15:8])}  : {3'b0,(weight_1[15:8]  - data[15:8])})
			+(data[23:16]   >= weight_1[23:16] ? {3'b0,(data[23:16] - weight_1[23:16])} : {3'b0,(weight_1[23:16] - data[23:16])}));

		assign d2_out = ((data[7:0]     >= weight_2[7:0]   ? {3'b0,(data[7:0]   - weight_2[7:0])}   : {3'b0,(weight_2[7:0]   - data[7:0])})
			+(data[15:8]    >= weight_2[15:8]  ? {3'b0,(data[15:8]  - weight_2[15:8])}  : {3'b0,(weight_2[15:8]  - data[15:8])})
			+(data[23:16]   >= weight_2[23:16] ? {3'b0,(data[23:16] - weight_2[23:16])} : {3'b0,(weight_2[23:16] - data[23:16])}));

		assign d3_out = ((data[7:0]     >= weight_3[7:0]   ? {3'b0,(data[7:0]   - weight_3[7:0])}   : {3'b0,(weight_3[7:0]   - data[7:0])})
			+(data[15:8]    >= weight_3[15:8]  ? {3'b0,(data[15:8]  - weight_3[15:8])}  : {3'b0,(weight_3[15:8]  - data[15:8])})
			+(data[23:16]   >= weight_3[23:16] ? {3'b0,(data[23:16] - weight_3[23:16])} : {3'b0,(weight_3[23:16] - data[23:16])}));

		assign d4_out = ((data[7:0]     >= weight_4[7:0]   ? {3'b0,(data[7:0]   - weight_4[7:0])}   : {3'b0,(weight_4[7:0]   - data[7:0])})
			+(data[15:8]    >= weight_4[15:8]  ? {3'b0,(data[15:8]  - weight_4[15:8])}  : {3'b0,(weight_4[15:8]  - data[15:8])})
			+(data[23:16]   >= weight_4[23:16] ? {3'b0,(data[23:16] - weight_4[23:16])} : {3'b0,(weight_4[23:16] - data[23:16])}));

		assign d5_out = ((data[7:0]     >= weight_5[7:0]   ? {3'b0,(data[7:0]   - weight_5[7:0])}   : {3'b0,(weight_5[7:0]   - data[7:0])})
			+(data[15:8]    >= weight_5[15:8]  ? {3'b0,(data[15:8]  - weight_5[15:8])}  : {3'b0,(weight_5[15:8]  - data[15:8])})
			+(data[23:16]   >= weight_5[23:16] ? {3'b0,(data[23:16] - weight_5[23:16])} : {3'b0,(weight_5[23:16] - data[23:16])}));

		assign d6_out = ((data[7:0]     >= weight_6[7:0]   ? {3'b0,(data[7:0]   - weight_6[7:0])}   : {3'b0,(weight_6[7:0]   - data[7:0])})
			+(data[15:8]    >= weight_6[15:8]  ? {3'b0,(data[15:8]  - weight_6[15:8])}  : {3'b0,(weight_6[15:8]  - data[15:8])})
			+(data[23:16]   >= weight_6[23:16] ? {3'b0,(data[23:16] - weight_6[23:16])} : {3'b0,(weight_6[23:16] - data[23:16])}));

		assign d7_out = ((data[7:0]     >= weight_7[7:0]   ? {3'b0,(data[7:0]   - weight_7[7:0])}   : {3'b0,(weight_7[7:0]   - data[7:0])})
			+(data[15:8]    >= weight_7[15:8]  ? {3'b0,(data[15:8]  - weight_7[15:8])}  : {3'b0,(weight_7[15:8]  - data[15:8])})
			+(data[23:16]   >= weight_7[23:16] ? {3'b0,(data[23:16] - weight_7[23:16])} : {3'b0,(weight_7[23:16] - data[23:16])}));

endmodule
