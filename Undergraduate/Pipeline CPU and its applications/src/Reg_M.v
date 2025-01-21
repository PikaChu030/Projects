module Reg_M (
input clk,
input rst,
input [31:0] Min_alu_out,
input [31:0] Min_rs2_data,
output reg [31:0] Mout_alu_out,
output reg [31:0] Mout_rs2_data
);

always @ (posedge clk or posedge rst) begin
    if (rst) begin
        Mout_alu_out <= 32'd0;                         // initialize
        Mout_rs2_data <= 32'd0;
    end
    else begin
        Mout_alu_out <= Min_alu_out;
        Mout_rs2_data <= Min_rs2_data;
    end
end

endmodule