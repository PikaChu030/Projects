/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : O-2018.06
// Date      : Tue Mar 29 14:17:20 2022
/////////////////////////////////////////////////////////////


module BP ( clk, rst, taken, p_taken );
  input clk, rst, taken;
  output p_taken;
  wire   n1, n3, n4;
  wire   [1:0] st;
  wire   [1:0] st_ns;

  SAEDRVT14_FDPRBQ_V2_0P5 \st_reg[0]  ( .D(st_ns[0]), .CK(clk), .RD(n1), .Q(
        st[0]) );
  SAEDRVT14_FDPRBQ_V2_0P5 \st_reg[1]  ( .D(st_ns[1]), .CK(clk), .RD(n1), .Q(
        st[1]) );
  SAEDRVT14_INV_S_0P5 U3 ( .A(rst), .X(n1) );
  SAEDRVT14_OAI22_1 U9 ( .A1(taken), .A2(n3), .B1(st[0]), .B2(p_taken), .X(
        st_ns[1]) );
  SAEDRVT14_INV_S_1 U10 ( .A(st[0]), .X(n3) );
  SAEDRVT14_NR2_MM_1 U11 ( .A1(st[0]), .A2(n4), .X(st_ns[0]) );
  SAEDRVT14_EO2_V1_0P75 U12 ( .A1(taken), .A2(st[1]), .X(n4) );
  SAEDRVT14_INV_S_1 U13 ( .A(st[1]), .X(p_taken) );
endmodule

