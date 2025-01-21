`include "./src/ALU.v"
`include "./src/Decoder.v"
`include "./src/Imm_Ext.v"
`include "./src/JB_Unit.v"
`include "./src/LD_Filter.v"
`include "./src/RegFile.v"
`include "./src/Adder.v"
`include "./src/Reg_PC.v"
`include "./src/Reg_W.v"
`include "./src/Reg_M.v"
`include "./src/Reg_E.v"
`include "./src/Reg_D.v"
`include "./src/Mux.v"
`include "./src/Controller.v"

module Top (
    input clk,
    input rst,
    input [31:0] im_inst,
    input [31:0] reg_w_in_ld_data,
    output [15:0] current_pc_15_0,
    output [15:0] reg_m_out_alu_out_15_0,
    output [3:0] F_im_w_en,
    output [3:0] M_dm_w_en,
    output [31:0] reg_m_out_rs2_data
);

wire stall;
wire [31:0] current_pc;
wire next_pc_sel;
wire [31:0] jb_pc;
wire [31:0] next_pc;
MUX_PC mux_next_pc (
    .signal(next_pc_sel),
	.input0(current_pc),
    .input1(jb_pc),
    .mux_out(next_pc)
);

Reg_PC reg_pc (
    .clk(clk),
    .rst(rst),
    .stall(stall),
    .next_pc(next_pc),
    .current_pc(current_pc)
);

assign current_pc_15_0 = current_pc[15:0];

wire [31:0] reg_d_pc;
wire [31:0] reg_d_inst;
Reg_D reg_d (
    .clk(clk),
    .rst(rst),
    .stall(stall),
    .jb(next_pc_sel),
    .Din_pc(current_pc),
    .Din_inst(im_inst),
    .Dout_pc(reg_d_pc),
    .Dout_inst(reg_d_inst)
);

wire [4:0] dc_op;
wire [2:0] dc_f3;
wire [6:0] dc_f7;
wire [4:0] dc_rs1_index;
wire [4:0] dc_rs2_index;
wire [4:0] dc_rd_index;
Decoder decoder(
    .inst(reg_d_inst),
    .dc_out_opcode(dc_op),
    .dc_out_func3(dc_f3),
    .dc_out_func7(dc_f7),
    .dc_out_rs1_index(dc_rs1_index),
    .dc_out_rs2_index(dc_rs2_index),
    .dc_out_rd_index(dc_rd_index)
);

wire W_wb_en;
wire [31:0] wb_data;
wire [4:0] W_rd_index;
wire [31:0] regfile_rs1_data;
wire [31:0] regfile_rs2_data;
RegFile regfile(
    .clk(clk),
    .rst(rst),
    .wb_en(W_wb_en),
    .wb_data(wb_data),
    .rd_index(W_rd_index),
    .rs1_index(dc_rs1_index),
    .rs2_index(dc_rs2_index),
    .rs1_data_out(regfile_rs1_data),
    .rs2_data_out(regfile_rs2_data)
);

wire D_rs1_data_sel;
wire [31:0] mux_regfile_1_rs1_data;
MUX_2 mux_regfile_1 (
    .signal(D_rs1_data_sel),
    .input0(regfile_rs1_data),
    .input1(wb_data),
    .mux_out(mux_regfile_1_rs1_data)
);

wire D_rs2_data_sel;
wire [31:0] mux_regfile_2_rs2_data;
MUX_2 mux_regfile_2 (
    .signal(D_rs2_data_sel),
    .input0(regfile_rs2_data),
    .input1(wb_data),
    .mux_out(mux_regfile_2_rs2_data)
);

wire [31:0] reg_e_pc;
wire [31:0] ie_sext_imme;
wire [31:0] reg_e_rs1_data;
wire [31:0] reg_e_rs2_data;
wire [31:0] reg_e_sext_imme;
Reg_E reg_e (
    .clk(clk),
    .rst(rst),
    .stall(stall),
    .jb(next_pc_sel),
    .Ein_pc(reg_d_pc),
    .Ein_rs1_data(mux_regfile_1_rs1_data),
    .Ein_rs2_data(mux_regfile_2_rs2_data),
    .Ein_sext_imm(ie_sext_imme),
    .Eout_pc(reg_e_pc),
    .Eout_rs1_data(reg_e_rs1_data),
    .Eout_rs2_data(reg_e_rs2_data),
    .Eout_sext_imm(reg_e_sext_imme)
);

wire [1:0] E_rs1_data_sel;
wire [31:0] reg_m_out_alu_out;
wire [31:0] newest_rs1_data;
MUX_3 mux_reg_e_1 (
    .signal(E_rs1_data_sel),
    .input0(wb_data),
    .input1(reg_m_out_alu_out),
    .input2(reg_e_rs1_data),
    .mux_out(newest_rs1_data)
);

wire [1:0] E_rs2_data_sel;
wire [31:0] newest_rs2_data;
MUX_3 mux_reg_e_2 (
    .signal(E_rs2_data_sel),
    .input0(wb_data),
    .input1(reg_m_out_alu_out),
    .input2(reg_e_rs2_data),
    .mux_out(newest_rs2_data)
);

wire E_alu_op1_sel;
wire [31:0] mux_alu_1_data;
MUX_2 mux_alu_1 (
    .signal(E_alu_op1_sel),
    .input0(newest_rs1_data),
    .input1(reg_e_pc),
    .mux_out(mux_alu_1_data)
);

wire E_alu_op2_sel;
wire [31:0] mux_alu_2_data;
MUX_2 mux_alu_2 (
    .signal(E_alu_op2_sel),
    .input0(newest_rs2_data),
    .input1(reg_e_sext_imme),
    .mux_out(mux_alu_2_data)
);

wire [4:0] E_op;
wire [2:0] E_f3;
wire [6:0] E_f7;
wire [31:0] reg_m_in_alu_out;
ALU alu (
    .opcode(E_op),
    .func3(E_f3),
    .func7(E_f7),
    .operand1(mux_alu_1_data),
    .operand2(mux_alu_2_data),
    .alu_out(reg_m_in_alu_out)
);

//wire [31:0] reg_m_out_rs2_data;
Reg_M reg_m (
    .clk(clk),
    .rst(rst),
    .Min_alu_out(reg_m_in_alu_out),
    .Min_rs2_data(newest_rs2_data),
    .Mout_alu_out(reg_m_out_alu_out),
    .Mout_rs2_data(reg_m_out_rs2_data)
);

assign reg_m_out_alu_out_15_0 = reg_m_out_alu_out[15:0];
//wire [3:0] M_dm_w_en;
//wire [31:0] reg_w_in_ld_data;
/*SRAM dm (
    .clk(clk),
    .w_en(M_dm_w_en),
    .address(reg_m_out_alu_out[15:0]),
    .write_data(reg_m_out_rs2_data),
    .read_data(reg_w_in_ld_data)
);*/

wire [31:0] reg_w_out_alu_out;
wire [31:0] reg_w_out_ld_data;
Reg_W reg_w (
    .clk(clk),
    .rst(rst),
    .Win_alu_out(reg_m_out_alu_out),
    .Win_ld_data(reg_w_in_ld_data),
    .Wout_alu_out(reg_w_out_alu_out),
    .Wout_ld_data(reg_w_out_ld_data)
);

wire [2:0] W_f3;
wire [31:0] ld_data_f;
LD_Filter ld_filter(
    .func3(W_f3),
    .ld_data(reg_w_out_ld_data),
    .ld_data_f(ld_data_f)
);

wire W_wb_data_sel;
MUX_2 mux_ld_filter (
    .signal(W_wb_data_sel),
    .input0(ld_data_f),
    .input1(reg_w_out_alu_out),
    .mux_out(wb_data)
);

Imm_Ext imm_ext(
    .inst(reg_d_inst),
    .imm_ext_out(ie_sext_imme)
);

wire E_jb_op1_sel;
wire [31:0] mux_jb_out;
MUX_2 mux_jb (
    .signal(E_jb_op1_sel),
    .input0(newest_rs1_data),
    .input1(reg_e_pc),
    .mux_out(mux_jb_out)
);

JB_Unit jb_unit(
    .operand1(mux_jb_out),
    .operand2(reg_e_sext_imme),
    .jb_out(jb_pc)
);

Controller controller(
    .clk(clk),
    .rst(rst),
    .alu_out(reg_m_in_alu_out[0]),
    .op(dc_op),
    .f3(dc_f3),
    .rd(dc_rd_index),
    .rs1(dc_rs1_index),
    .rs2(dc_rs2_index),
    .f7(dc_f7),
    .stall(stall),
    .next_pc_sel(next_pc_sel),
    .F_im_w_en(F_im_w_en),
    .D_rs1_data_sel(D_rs1_data_sel),
    .D_rs2_data_sel(D_rs2_data_sel),
    .E_op(E_op),
    .E_f3(E_f3),
    .E_f7(E_f7),
    .E_rs1_data_sel(E_rs1_data_sel),
    .E_rs2_data_sel(E_rs2_data_sel),
    .E_alu_op1_sel(E_alu_op1_sel),
    .E_alu_op2_sel(E_alu_op2_sel),
    .E_jb_op1_sel(E_jb_op1_sel),
    .W_f3(W_f3),
    .W_rd(W_rd_index),
    .W_wb_en(W_wb_en),
    .W_wb_data_sel(W_wb_data_sel),
    .M_dm_w_en(M_dm_w_en)   
);

endmodule
