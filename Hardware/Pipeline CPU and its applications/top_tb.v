`timescale 1ns/10ps
`define CYCLE 10    // Cycle time
`include "./Top.v"
`include "./src/SRAM.v"

module top_tb;
  reg clk;
  reg rst;
  wire [31:0] im_inst;
  wire [15:0] current_pc_15_0;
  wire [15:0] reg_m_out_alu_out_15_0;
  wire [3:0] F_im_w_en;
  wire [3:0] M_dm_w_en;
  wire [31:0] reg_w_in_ld_data;
  wire [31:0] reg_m_out_rs2_data;

  Top top(
    .clk(clk),
    .rst(rst),
    .im_inst(im_inst),
    .current_pc_15_0(current_pc_15_0),
    .reg_m_out_alu_out_15_0(reg_m_out_alu_out_15_0),
    .F_im_w_en(F_im_w_en),
    .M_dm_w_en(M_dm_w_en),
    .reg_w_in_ld_data(reg_w_in_ld_data),
    .reg_m_out_rs2_data(reg_m_out_rs2_data)
  );

  SRAM im(
    .clk(clk),
    .w_en(F_im_w_en),
    .address(current_pc_15_0),
    .write_data(32'd0),
    .read_data(im_inst)
  );

  SRAM dm(
    .clk(clk),
    .w_en(M_dm_w_en),
    .address(reg_m_out_alu_out_15_0),
    .write_data(reg_m_out_rs2_data),
    .read_data(reg_w_in_ld_data)
  );

  always #(`CYCLE/2) clk = ~clk;

  initial begin
    // Load program and preset data to im & dm 
    $readmemh("m_code_combine.hex", im.mem);
    clk = 0; rst = 1;
    #(`CYCLE) rst = 0;
  end

  initial begin
	  // $dumpvars();
	  // $dumpfile("wave.fsdb");
      $monitor($time," inst=%h",im_inst);
      wait(dm.mem[65532] == 8'hff);
      $display("\ndone\n");
      $display("dm[0] = %d",dm.mem[0]);
      $display("dm[4] = %d",dm.mem[4]);
      $display("dm[8] = %d",dm.mem[8]);
      $display("dm[12] = %d",dm.mem[12]);
      $display("dm[16] = %d",dm.mem[16]);
      $display("dm[20] = %d",dm.mem[20]);
      $display("dm[24] = %d",dm.mem[24]);
      $finish;
  end

  initial begin
//    #1000000 $finish;
  end

endmodule
