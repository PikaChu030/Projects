module Reg_D (
input clk,
input rst,
input stall,
input jb,
input [31:0] Din_pc,
input [31:0] Din_inst,
output reg [31:0] Dout_pc,
output reg [31:0] Dout_inst
);

always @ (posedge clk or posedge rst) begin
    if (rst) begin
        Dout_pc <= 32'd0;                         // initialize
        Dout_inst <= 32'd0;
    end
    else if (stall == 1'b1) begin
        Dout_pc <= Dout_pc;                       // keep
        Dout_inst <= Dout_inst;                   // keep
    end
    else if (jb == 1'b1) begin
        Dout_pc <= 32'd19;                        // nop
        Dout_inst <= 32'd19;                      // nop 
    end
    else begin
        Dout_pc <= Din_pc;                       
        Dout_inst <= Din_inst;                     
    end
end
endmodule