module Reg_E (
input clk,
input rst,
input stall,
input jb,
input [31:0] Ein_pc,
input [31:0] Ein_rs1_data,
input [31:0] Ein_rs2_data,
input [31:0] Ein_sext_imm,
output reg [31:0] Eout_pc,
output reg [31:0] Eout_rs1_data,
output reg [31:0] Eout_rs2_data,
output reg [31:0] Eout_sext_imm
);

always @ (posedge clk or posedge rst) begin
    if (rst) begin
        Eout_pc <= 32'd0;                         // initialize
        Eout_rs1_data <= 32'd0;
        Eout_rs2_data <= 32'd0;
        Eout_sext_imm <= 32'd0;
    end
    else if (stall == 1'b1 || jb == 1'b1) begin
        Eout_pc <= 32'd19;                        // nop
        Eout_rs1_data <= 32'd19;                  // nop
        Eout_rs2_data <= 32'd19;                  // nop
        Eout_sext_imm <= 32'd19;                  // nop
    end
    else begin
        Eout_pc <= Ein_pc;                       
        Eout_rs1_data <= Ein_rs1_data;                 
        Eout_rs2_data <= Ein_rs2_data;                 
        Eout_sext_imm <= Ein_sext_imm;          
    end
end
endmodule