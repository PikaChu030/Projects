module pattern_gen(
	input clk,
	input rst,
	input en,
	input x,
	output reg p,
	output valid
);


reg [2:0] st, st_ns;
reg valid;
parameter s0 = 3'b000,
		  s1 = 3'b001,
		  s2 = 3'b010,
		  s3 = 3'b011,
		  s4 = 3'b100,
		  s5 = 3'b101,
		  s6 = 3'b110,
		  s7 = 3'b111;

always @(posedge clk or posedge rst) begin
	if (rst) begin
		st <= s0;
	end 
	else if (en) begin
		st <= st_ns;
	end
	else begin
		st <= s0;
	end
end

always @(st or x) begin
	case (st)
	s0: st_ns = s1;
	s1: st_ns = s2;
	s2: st_ns = x? s3:s4;
	s3: st_ns = x? s5:s2;
	s4: st_ns = x? s1:s5;
	s5: st_ns = s6;
	s6: st_ns = s6;
	default : st_ns = s0;
	endcase

	if(st == s6) begin
		valid =1'b0;
	end
	else begin
		valid = 1'b1;
	end
end

always @(st or x) begin
	case (st)
	s0 : p = 1'b1; 
	s1 : p = 1'b0; 
	s2 : p = x? 1'b1:1'b0; 
	s3 : p = 1'b0; 
	s4 : p = x? 1'b1:1'b0; 
	s5 : p = 1'b0; 
	s6 : p = 1'b0; 
	default:p=1'b0;
	endcase
end
endmodule
