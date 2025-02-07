module Adder (
input [31:0] current_pc,
output wire [31:0] adder_out
);

assign adder_out = current_pc + 32'b100;    // adder_out = current_pc + 4


endmodule