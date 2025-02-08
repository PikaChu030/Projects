/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : O-2018.06
// Date      : Wed Mar 30 13:36:43 2022
/////////////////////////////////////////////////////////////


module pattern_gen ( clk, rst, en, x, p, valid );
  input clk, rst, en, x;
  output p, valid;
  wire   N19, N20, N21, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13,
         n14, n15, n16, n17, n18, n19, n20;
  wire   [2:0] st;

  SAEDRVT14_FDPRBQ_V2_0P5 \st_reg[0]  ( .D(N19), .CK(clk), .RD(n1), .Q(st[0])
         );
  SAEDRVT14_FDPRBQ_V2_0P5 \st_reg[2]  ( .D(N21), .CK(clk), .RD(n1), .Q(st[2])
         );
  SAEDRVT14_FDPRBQ_V2_0P5 \st_reg[1]  ( .D(N20), .CK(clk), .RD(n1), .Q(st[1])
         );
  SAEDRVT14_INV_S_0P5 U3 ( .A(rst), .X(n1) );
  SAEDRVT14_OA22_0P75 U26 ( .A1(st[0]), .A2(n17), .B1(n18), .B2(n6), .X(n16)
         );
  SAEDRVT14_INV_S_1 U27 ( .A(n20), .X(n8) );
  SAEDRVT14_INV_S_1 U28 ( .A(n9), .X(n3) );
  SAEDRVT14_ND2_CDC_0P5 U29 ( .A1(n3), .A2(n6), .X(valid) );
  SAEDRVT14_AOI21_0P5 U30 ( .A1(n14), .A2(n19), .B(n7), .X(N19) );
  SAEDRVT14_ND2_CDC_0P5 U31 ( .A1(n6), .A2(n5), .X(n19) );
  SAEDRVT14_INV_S_1 U32 ( .A(n14), .X(n4) );
  SAEDRVT14_AN3_0P75 U33 ( .A1(n9), .A2(n6), .A3(n10), .X(p) );
  SAEDRVT14_OAI21_0P5 U34 ( .A1(st[2]), .A2(st[1]), .B(n8), .X(n10) );
  SAEDRVT14_BUF_ECO_1 U35 ( .A(x), .X(n20) );
  SAEDRVT14_INV_S_1 U36 ( .A(st[2]), .X(n2) );
  SAEDRVT14_ND2_CDC_0P5 U37 ( .A1(st[2]), .A2(st[1]), .X(n9) );
  SAEDRVT14_INV_S_1 U38 ( .A(st[0]), .X(n6) );
  SAEDRVT14_INV_S_1 U39 ( .A(st[1]), .X(n5) );
  SAEDRVT14_NR2_MM_1 U40 ( .A1(st[1]), .A2(n2), .X(n13) );
  SAEDRVT14_INV_S_1 U41 ( .A(en), .X(n7) );
  SAEDRVT14_OR3_1 U42 ( .A1(st[2]), .A2(n5), .A3(n8), .X(n14) );
  SAEDRVT14_AOI21_0P5 U43 ( .A1(n11), .A2(n12), .B(n7), .X(N21) );
  SAEDRVT14_OAI21_0P5 U44 ( .A1(n15), .A2(n3), .B(n6), .X(n11) );
  SAEDRVT14_OAI21_0P5 U45 ( .A1(n13), .A2(n4), .B(st[0]), .X(n12) );
  SAEDRVT14_AOI21_0P5 U46 ( .A1(n2), .A2(n5), .B(n20), .X(n15) );
  SAEDRVT14_NR2_MM_1 U47 ( .A1(n16), .A2(n7), .X(N20) );
  SAEDRVT14_AOI21_0P5 U48 ( .A1(n2), .A2(n8), .B(n5), .X(n18) );
  SAEDRVT14_AOI21_0P5 U49 ( .A1(n20), .A2(st[1]), .B(n3), .X(n17) );
endmodule

