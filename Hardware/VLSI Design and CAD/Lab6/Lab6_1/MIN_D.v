module MIN_D(
	input clk,
	input rst,
	
	input [10:0] d0,
	input [10:0] d1,
	input [10:0] d2,
	input [10:0] d3,
	input [10:0] d4,
	input [10:0] d5,
	input [10:0] d6,
	input [10:0] d7,
	output reg[10:0] d_min,
	output reg[2:0]  d_min_pos);


	wire [10:0] temp_0,temp_1,temp_2,temp_3,temp_4,temp_5,temp_6;

	assign temp_0 = (d0 <= d1)? d0 : d1;
	assign temp_1 = (d2 <= d3)? d2 : d3;
  	assign temp_2 = (d4 <= d5)? d4 : d5;
  	assign temp_3 = (d6 <= d7)? d6 : d7;
  	assign temp_4 = (temp_0 <= temp_1)? temp_0 : temp_1;
  	assign temp_5 = (temp_2 <= temp_3)? temp_2 : temp_3;
  	assign temp_6 = (temp_4 <= temp_5)? temp_4 : temp_5;
	reg t;
	
	always @(posedge clk or posedge rst) begin
		if(rst) begin
			t <= 1'b0;	
		end
		else begin
			t <= 1'b1;
		end
	end
	always @(*) begin
	if (temp_6 == d7) begin
        	d_min = temp_6;
        	d_min_pos = 3'd7;
    	end
    	else if (temp_6 == d6) begin
        	d_min = temp_6;
        	d_min_pos = 3'd6;
    	end
    	else if (temp_6 == d5) begin
        	d_min = temp_6;
        	d_min_pos = 3'd5;
    	end
    	else if (temp_6 == d4) begin
        	d_min = temp_6;
        	d_min_pos = 3'd4;
    	end
    	else if (temp_6 == d3) begin
       		d_min = temp_6;
       		d_min_pos = 3'd3;
    	end
    	else if (temp_6 == d2) begin
        	d_min = temp_6;
       		d_min_pos = 3'd2;
    	end
    	else if (temp_6 == d1) begin
        	d_min = temp_6;
        	d_min_pos = 3'd1;
    	end
    	else if (temp_6 == d0) begin
        	d_min = temp_6;
       		d_min_pos = 3'd0;
    	end
    	else begin
        	d_min = 11'd0;
        	d_min_pos = 3'd0;
    	end
	end
endmodule
