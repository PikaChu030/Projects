module Controller (
input clk,
input rst,
input alu_out,
input [4:0] op,
input [2:0] f3,
input [4:0] rd,
input [4:0] rs1,
input [4:0] rs2,
input [6:0] f7,
output wire stall,
output reg next_pc_sel,
output reg [3:0] F_im_w_en,
output wire D_rs1_data_sel,
output wire D_rs2_data_sel,
output reg [4:0] E_op,
output reg [2:0] E_f3,
output reg [6:0] E_f7,
output wire [1:0] E_rs1_data_sel,
output wire [1:0] E_rs2_data_sel,
output reg E_alu_op1_sel,
output reg E_alu_op2_sel,
output reg E_jb_op1_sel,
output reg [2:0] W_f3,
output reg [4:0] W_rd,
output reg W_wb_en,
output reg [4:0] W_rd_index,
output reg W_wb_data_sel,
output reg [3:0] M_dm_w_en
);
reg [4:0] E_rd;
reg [4:0] E_rs1;
reg [4:0] E_rs2;
reg [4:0] M_op;
reg [2:0] M_f3;
reg [4:0] M_rd;
reg [4:0] W_op;

wire is_DE_overlap;
wire is_D_rs1_E_rd_overlap;
wire is_D_use_rs1;
wire is_D_rs2_E_rd_overlap;
wire is_D_use_rs2;

wire is_D_rs1_W_rd_overlap;
wire is_W_use_rd;
wire is_D_rs2_W_rd_overlap;

wire is_E_rs1_M_rd_overlap;
wire is_E_rs1_W_rd_overlap;
wire is_E_use_rs1;
wire is_M_use_rd;
wire is_E_rs2_M_rd_overlap;
wire is_E_rs2_W_rd_overlap;
wire is_E_use_rs2;

// stall => set when load instruction @ E and instruction uses load's WB data @ D
assign    stall = (E_op == 5'b00000) & is_DE_overlap;
assign    is_DE_overlap = (is_D_rs1_E_rd_overlap | is_D_rs2_E_rd_overlap);
assign    is_D_rs1_E_rd_overlap = is_D_use_rs1 & (rs1 == E_rd) & E_rd != 0;
assign    is_D_use_rs1 = (op == 5'b01101 || op == 5'b00101 || op == 5'b11011) ? 1'b0 : 1'b1;   // R, I, S, B Type use rs1
assign    is_D_rs2_E_rd_overlap = is_D_use_rs2 & (rs2 == E_rd) & E_rd != 0;
assign    is_D_use_rs2 = (op == 5'b01100 || op == 5'b01000 || op == 5'b11000) ? 1'b1 : 1'b0;   // R, S, B Type use rs2

// D_rs1_data_sel => immediately read the WB rs1 data 
assign    D_rs1_data_sel = is_D_rs1_W_rd_overlap ? 1'd1 : 1'd0;
assign    is_D_rs1_W_rd_overlap = is_D_use_rs1 & is_W_use_rd & (rs1 == W_rd) & W_rd != 0;
assign    is_W_use_rd = (W_op == 5'b11000 || W_op == 5'b01000) ? 1'b0 : 1'b1;                      // S, B Type don't use rd

// D_rs2_data_sel => immediately read the WB rs2 data 
assign    D_rs2_data_sel = is_D_rs2_W_rd_overlap ? 1'd1 : 1'd0;
assign    is_D_rs2_W_rd_overlap = is_D_use_rs2 & is_W_use_rd & (rs2 == W_rd) & W_rd != 0;

// E_rs1_data_sel => get the newest rs1 data
assign    E_rs1_data_sel = is_E_rs1_M_rd_overlap ? 2'd1 :
          is_E_rs1_W_rd_overlap ? 2'd0 : 2'd2;
assign    is_E_rs1_W_rd_overlap = is_E_use_rs1 & is_W_use_rd & (E_rs1 == W_rd) & W_rd != 0;
assign    is_E_rs1_M_rd_overlap = is_E_use_rs1 & is_M_use_rd & (E_rs1 == M_rd) & M_rd != 0;
assign    is_E_use_rs1 = (E_op == 5'b01101 || E_op == 5'b00101 || E_op == 5'b11011) ? 1'b0 : 1'b1;   // R, I, S, B Type use rs1
assign    is_M_use_rd = (M_op == 5'b11000 || M_op == 5'b01000) ? 1'b0 : 1'b1;                      // S, B Type don't use rd

// E_rs2_data_sel => get the newest rs2 data
assign    E_rs2_data_sel = is_E_rs2_M_rd_overlap ? 2'd1 :
          is_E_rs2_W_rd_overlap ? 2'd0 : 2'd2;
assign    is_E_rs2_W_rd_overlap = is_E_use_rs2 & is_W_use_rd & (E_rs2 == W_rd) & W_rd != 0;
assign    is_E_rs2_M_rd_overlap = is_E_use_rs2 & is_M_use_rd & (E_rs2 == M_rd) & M_rd != 0;
assign    is_E_use_rs2 = (E_op == 5'b01100 || E_op == 5'b01000 || E_op == 5'b11000) ? 1'b1 : 1'b0;   // R, S, B Type use rs2

always @(*) begin
    // next_pc_sel => op == jal, jalr, B && alu_out[0] == 1
    if (E_op == 5'b11011 || E_op == 5'b11001 || (E_op == 5'b11000 && alu_out == 1))  next_pc_sel = 1;
    else  next_pc_sel = 0;

    // F_im_w_en => prevent writing data into im
    F_im_w_en = 4'd0;

    // M_dm_w_en => sb, sh, sw into dm
    if (M_op == 5'b01000) begin
        if (M_f3 == 3'b000) M_dm_w_en = 4'b0001;       // sb 
        else if (M_f3 == 3'b001) M_dm_w_en = 4'b0011;  // sh
        else if (M_f3 == 3'b010) M_dm_w_en = 4'b1111;  // sw
        else                     M_dm_w_en = 4'b0000;  // exception
    end
    else  M_dm_w_en = 4'b0000;                         // exception

    // W_wb_en => RegFile uses rd (whether write back data into RegFile)
    if (W_op == 5'b01100 || W_op == 5'b00100 || W_op == 5'b00000 || W_op == 5'b11001 ||
        W_op == 5'b11011 || W_op == 5'b00101 || W_op == 5'b01101)  W_wb_en = 1;
    else W_wb_en = 0;

    // W_rd_index => write back register destination index
    W_rd_index = W_rd;

    // E_alu_op1_sel => AUIPC, JAL, JALR -> current_pc (select alu op1 (rs1 / pc))
    if (E_op == 5'b00101 || E_op == 5'b11001 || E_op == 5'b11011)  E_alu_op1_sel = 1;   
    else  E_alu_op1_sel = 0;

    // E_alu_op2_sel => R, Branch -> rs2 (select alu op2 (rs2 / imm))
    if (E_op == 5'b01100 || E_op == 5'b11000)  E_alu_op2_sel = 0;  // JAL, JALR no op2
    else  E_alu_op2_sel = 1;

    // E_jb_op1_sel => select jb_unit op1 (rs1 / pc)
    if (E_op == 5'b11001)  E_jb_op1_sel = 0;
    else  E_jb_op1_sel = 1;

    // W_wb_data_sel => lb, lh, lw, lbu, lhu (select WB data: ALU result, extended load data)
    if (W_op == 5'b00000) W_wb_data_sel = 0;
    else                  W_wb_data_sel = 1;       // exception

end

always @(posedge clk or posedge rst) begin
    // pass op, f3, rd, rs1, rs2, f7
    if (rst) begin                                  // all nop
        E_op <= 5'b00100;
        E_f3 <= 3'd0;
        E_f7 <= 7'd0;
        E_rd <= 5'd0;
        E_rs1 <= 5'd0;
        E_rs2 <= 5'd0;
        M_op <= 5'b00100;
        M_f3 <= 3'd0;
        M_rd <= 5'd0;
        W_op <= 5'b00100;
        W_f3 <= 3'd0;
        W_rd <= 5'd0;
    end
    else if (stall == 1'b1 || next_pc_sel == 1'b1) begin       // addi x0, x0, 0
        E_op <= 5'b00100;
        E_f3 <= 3'd0;
        E_f7 <= 7'd0;
        E_rd <= 5'd0;
        E_rs1 <= 5'd0;
        E_rs2 <= 5'd0;
        M_op <= E_op;
        M_f3 <= E_f3;
        M_rd <= E_rd;
        W_op <= M_op;
        W_f3 <= M_f3;
        W_rd <= M_rd;
    end
    else begin
        E_op <= op;
        E_f3 <= f3;
        E_rd <= rd;
        E_rs1 <= rs1;
        E_rs2 <= rs2;
        E_f7 <= f7;
        M_op <= E_op;
        M_f3 <= E_f3;
        M_rd <= E_rd;
        W_op <= M_op;
        W_f3 <= M_f3;
        W_rd <= M_rd;
    end
end
    
endmodule
