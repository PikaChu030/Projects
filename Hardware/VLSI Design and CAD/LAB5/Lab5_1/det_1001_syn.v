/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : O-2018.06
// Date      : Tue Mar 29 13:54:39 2022
/////////////////////////////////////////////////////////////


module det_1001 ( clk, rst, d, q, num );
  output [1:0] num;
  input clk, rst, d;
  output q;
  wire   N19, N20, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10;
  wire   [2:0] st;
  wire   [2:0] st_ns;

  SAEDRVT14_FDPRBQ_V2_0P5 \st_reg[0]  ( .D(st_ns[0]), .CK(clk), .RD(n1), .Q(
        st[0]) );
  SAEDRVT14_FDPRBQ_V2_0P5 \st_reg[1]  ( .D(st_ns[1]), .CK(clk), .RD(n1), .Q(
        st[1]) );
  SAEDRVT14_FDPRBQ_V2_0P5 \st_reg[2]  ( .D(st_ns[2]), .CK(clk), .RD(n1), .Q(
        st[2]) );
  SAEDRVT14_FDPRBQ_V2_0P5 \num_reg[0]  ( .D(N19), .CK(clk), .RD(n1), .Q(num[0]) );
  SAEDRVT14_FDPRBQ_V2_0P5 \num_reg[1]  ( .D(N20), .CK(clk), .RD(n1), .Q(num[1]) );
  SAEDRVT14_INV_S_0P5 U3 ( .A(rst), .X(n1) );
  SAEDRVT14_OAI21_0P5 U19 ( .A1(n6), .A2(n9), .B(n2), .X(st_ns[0]) );
  SAEDRVT14_OAI21_0P5 U20 ( .A1(n5), .A2(n3), .B(n4), .X(n9) );
  SAEDRVT14_INV_S_1 U21 ( .A(n7), .X(n2) );
  SAEDRVT14_INV_S_1 U22 ( .A(d), .X(n6) );
  SAEDRVT14_AN4_1 U23 ( .A1(st[1]), .A2(st[0]), .A3(d), .A4(n3), .X(st_ns[2])
         );
  SAEDRVT14_OA31_1 U24 ( .A1(n7), .A2(q), .A3(n8), .B(n6), .X(st_ns[1]) );
  SAEDRVT14_AN3_0P75 U25 ( .A1(n4), .A2(n3), .A3(st[0]), .X(n8) );
  SAEDRVT14_INV_S_1 U26 ( .A(st[2]), .X(n3) );
  SAEDRVT14_INV_S_1 U27 ( .A(st[0]), .X(n5) );
  SAEDRVT14_INV_S_1 U28 ( .A(st[1]), .X(n4) );
  SAEDRVT14_EO2_V1_0P75 U29 ( .A1(num[1]), .A2(n10), .X(N20) );
  SAEDRVT14_AN2_MM_1 U30 ( .A1(q), .A2(num[0]), .X(n10) );
  SAEDRVT14_EO2_V1_0P75 U31 ( .A1(num[0]), .A2(q), .X(N19) );
  SAEDRVT14_AN3_0P75 U32 ( .A1(n4), .A2(n5), .A3(st[2]), .X(q) );
  SAEDRVT14_AN3_0P75 U33 ( .A1(n3), .A2(n5), .A3(st[1]), .X(n7) );
endmodule

