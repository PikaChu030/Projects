module Imm_Ext (
input [31:0] inst,
output reg [31:0] imm_ext_out
);

always @ (*) begin
    if (inst[6:2] == 5'b0 || inst[6:2] == 5'b00100 || inst[6:2] == 5'b11001) imm_ext_out = {{20{inst[31]}},inst[31:20]};// I type
    else if (inst[6:2] == 5'b01000) imm_ext_out = {{20{inst[31]}},inst[31:25],inst[11:7]};                              // S type
    else if (inst[6:2] == 5'b11000) imm_ext_out = {{20{inst[31]}},inst[7],inst[30:25],inst[11:8],1'b0};                 // B type
    else if (inst[6:2] == 5'b01101 || inst[6:2] == 5'b00101) imm_ext_out = {inst[31:12],12'b0};                         // U type
    else if (inst[6:2] == 5'b11011) imm_ext_out = {{12{inst[31]}},inst[19:12],inst[20],inst[30:21],1'b0};                // J type
    else    imm_ext_out = 32'b0;                                                                                            // R type
end

endmodule