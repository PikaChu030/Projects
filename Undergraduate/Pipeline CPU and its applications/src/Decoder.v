module Decoder (
input [31:0] inst,
output reg [4:0] dc_out_opcode,
output reg [2:0] dc_out_func3,
output reg [6:0] dc_out_func7,
output reg [4:0] dc_out_rs1_index,
output reg [4:0] dc_out_rs2_index,
output reg [4:0] dc_out_rd_index
);

always @(*) begin
    if (inst) begin
        dc_out_func7 = inst[31:25];
        dc_out_rs2_index = inst[24:20];
        dc_out_rs1_index = inst[19:15];
        dc_out_func3 = inst[14:12];
        dc_out_rd_index = inst[11:7];
        dc_out_opcode = inst[6:2];
    end
    else begin
        dc_out_func7 = 7'b0;
        dc_out_rs2_index = 5'b0;
        dc_out_rs1_index = 5'b0;
        dc_out_func3 = 3'b0;
        dc_out_rd_index = 5'b0;
        dc_out_opcode = 5'b0;
    end
end

endmodule
