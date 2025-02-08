/////////////////////////////////////////////////////////////////////
// ---------------------- IVCAD 2020 Spring ---------------------- //
// ---------------------- Editor: Tseng Hsin-Yu (Sylvia) --------- //
// ---------------------- Version : v.1.00  ---------------------- //
// ---------------------- Date : 2020.02    ---------------------- //
// ---------------------- det_1001  ------------------------------ // 
/////////////////////////////////////////////////////////////////////
module det_1001(clk,rst,d,q,num);

 //---------I/O ports-----------//
  input clk,rst;
  input d;
  output reg q;
  output reg [1:0] num;
 //-----------------------------//
 reg [2:0] st,st_ns;
 parameter s0 = 3'b000,
           s1 = 3'b001,
           s2 = 3'b010,
           s3 = 3'b011,
           s4 = 3'b100;

always @(posedge clk or posedge rst) begin
    if (rst) begin
        st <= s0;
	num <= 2'b0;
    end
    else begin
        st <= st_ns;
        num <= q?num + 2'b1 : num;
    end
end

always @(st or d) begin
    case (st)
    s0: st_ns = d? s1:s0;
    s1: st_ns = d? s1:s2;
    s2: st_ns = d? s1:s3;
    s3: st_ns = d? s4:s0;
    s4: st_ns = d? s1:s2;
    default: st_ns = s0;
    endcase
end

always @(st) begin
    case (st) 
    s0: q = 1'b0;
    s1: q = 1'b0;
    s2: q = 1'b0;
    s3: q = 1'b0;
    s4: q = 1'b1;
    default: q = 1'b0;
    endcase
end
endmodule
