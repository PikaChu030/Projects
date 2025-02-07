module MUX_PC (
input signal,
input [31:0] input0,
input [31:0] input1,
output [31:0] mux_out
);
wire _;
// 2-1 mux
assign {_, mux_out} = (signal) ? input1 : input0 + 32'b100;

endmodule

module MUX_2 (
input signal,
input [31:0] input0,
input [31:0] input1,
output [31:0] mux_out
);

// 2-1 mux
assign mux_out = (signal) ? input1 : input0;

endmodule

module MUX_3 (
input [1:0] signal,
input [31:0] input0,
input [31:0] input1,
input [31:0] input2,
output [31:0] mux_out
);

// 3-1 mux
assign mux_out = (signal == 2'b01) ? input1 : (signal == 2'b00) ? input0 : input2;

endmodule
