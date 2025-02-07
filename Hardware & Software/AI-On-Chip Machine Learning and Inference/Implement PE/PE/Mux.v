module Mux(
    input sel,
    input [23:0] a,
    input [23:0] b,
    output [23:0] c);

    assign c = (sel) ? a : b;
endmodule