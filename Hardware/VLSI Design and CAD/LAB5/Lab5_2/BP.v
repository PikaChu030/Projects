module BP(
	input clk,
	input rst,
	input taken,
	output reg p_taken
);


reg[1:0] st, st_ns;

parameter s0 = 2'b00,
		  s1 = 2'b01,
		  s2 = 2'b10,
		  s3 = 2'b11;

always @(posedge clk or posedge rst) begin
	if (rst)
		st <= s0;
	else
		st <= st_ns;
end

always @(st or taken) begin
	case(st) 
	s0: st_ns = taken? s0:s1;
	s1: st_ns = taken? s0:s2; 
	s2: st_ns = taken? s3:s2;
	s3: st_ns = taken? s0:s2;
	endcase
end

always @(st) begin
	case(st)
	s0: p_taken = 1'b1;
	s1: p_taken = 1'b1;
	s2: p_taken = 1'b0;
	s3: p_taken = 1'b0;
	endcase
end
endmodule