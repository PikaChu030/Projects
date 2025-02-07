module Reg_W (
input clk,
input rst,
input [31:0] Win_alu_out,
input [31:0] Win_ld_data,
output reg [31:0] Wout_alu_out,
output reg [31:0] Wout_ld_data
);

always @ (posedge clk or posedge rst) begin
    if (rst) begin
        Wout_alu_out <= 32'd0;                         // initialize
        Wout_ld_data <= 32'd0;
    end
    else begin
        Wout_alu_out <= Win_alu_out;
        Wout_ld_data <= Win_ld_data;
    end
end

endmodule