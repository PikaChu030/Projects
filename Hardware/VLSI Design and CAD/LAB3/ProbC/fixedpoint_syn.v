/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : O-2018.06
// Date      : Wed Mar  9 22:13:26 2022
/////////////////////////////////////////////////////////////


module fixedpoint_DW_mult_uns_0 ( a, b, product );
  input [6:0] a;
  input [7:0] b;
  output [14:0] product;
  wire   n2, n3, n4, n5, n6, n7, n8, n9, n12, n13, n14, n15, n16, n17, n18,
         n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n68, n69;

  SAEDRVT14_ADDH_0P5 U2 ( .A(n2), .B(b[7]), .CO(product[14]), .S(product[13])
         );
  SAEDRVT14_ADDF_V1_1 U3 ( .A(n3), .B(n12), .CI(b[6]), .CO(n2), .S(product[12]) );
  SAEDRVT14_ADDF_V1_1 U4 ( .A(n4), .B(n13), .CI(n14), .CO(n3), .S(product[11])
         );
  SAEDRVT14_ADDF_V1_1 U5 ( .A(n5), .B(n15), .CI(n18), .CO(n4), .S(product[10])
         );
  SAEDRVT14_ADDF_V1_1 U6 ( .A(n6), .B(n19), .CI(n22), .CO(n5), .S(product[9])
         );
  SAEDRVT14_ADDF_V1_1 U7 ( .A(n7), .B(n23), .CI(n26), .CO(n6), .S(product[8])
         );
  SAEDRVT14_ADDF_V1_1 U8 ( .A(n8), .B(n27), .CI(n30), .CO(n7), .S(product[7])
         );
  SAEDRVT14_ADDF_V1_1 U9 ( .A(n9), .B(n31), .CI(n34), .CO(n8), .S(product[6])
         );
  SAEDRVT14_ADDF_V1_1 U13 ( .A(n16), .B(b[5]), .CI(b[7]), .CO(n12), .S(n13) );
  SAEDRVT14_ADDF_V1_1 U14 ( .A(n17), .B(n20), .CI(b[6]), .CO(n14), .S(n15) );
  SAEDRVT14_ADDH_0P5 U15 ( .A(b[4]), .B(b[7]), .CO(n16), .S(n17) );
  SAEDRVT14_ADDF_V1_1 U16 ( .A(n21), .B(n24), .CI(b[5]), .CO(n18), .S(n19) );
  SAEDRVT14_ADDH_0P5 U17 ( .A(b[3]), .B(b[6]), .CO(n20), .S(n21) );
  SAEDRVT14_ADDF_V1_1 U18 ( .A(n28), .B(n25), .CI(b[4]), .CO(n22), .S(n23) );
  SAEDRVT14_ADDH_0P5 U19 ( .A(b[2]), .B(b[5]), .CO(n24), .S(n25) );
  SAEDRVT14_ADDF_V1_1 U20 ( .A(n29), .B(n32), .CI(b[7]), .CO(n26), .S(n27) );
  SAEDRVT14_ADDF_V1_1 U21 ( .A(b[4]), .B(b[1]), .CI(b[3]), .CO(n28), .S(n29)
         );
  SAEDRVT14_ADDF_V1_1 U22 ( .A(n33), .B(b[3]), .CI(b[6]), .CO(n30), .S(n31) );
  SAEDRVT14_ADDH_0P5 U23 ( .A(b[0]), .B(b[2]), .CO(n32), .S(n33) );
  SAEDRVT14_ADDF_V1_1 U24 ( .A(b[2]), .B(b[1]), .CI(b[5]), .CO(n34), .S(n35)
         );
  SAEDRVT14_ADDH_0P5 U25 ( .A(b[1]), .B(b[4]), .CO(n36), .S(n37) );
  SAEDRVT14_AO21_1 U30 ( .A1(n35), .A2(n68), .B(n69), .X(n9) );
  SAEDRVT14_AO22_0P5 U31 ( .A1(n68), .A2(n36), .B1(n35), .B2(n36), .X(n69) );
  SAEDRVT14_AO22_0P5 U32 ( .A1(n37), .A2(b[0]), .B1(b[3]), .B2(b[0]), .X(n68)
         );
endmodule


module fixedpoint_DW01_inc_0 ( A, SUM );
  input [7:0] A;
  output [7:0] SUM;

  wire   [7:2] carry;

  SAEDRVT14_ADDH_0P5 U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  SAEDRVT14_ADDH_0P5 U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  SAEDRVT14_ADDH_0P5 U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  SAEDRVT14_ADDH_0P5 U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  SAEDRVT14_ADDH_0P5 U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  SAEDRVT14_ADDH_0P5 U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  SAEDRVT14_INV_S_1 U1 ( .A(A[0]), .X(SUM[0]) );
  SAEDRVT14_EO2_V1_0P75 U2 ( .A1(carry[7]), .A2(A[7]), .X(SUM[7]) );
endmodule


module fixedpoint ( int_in, result );
  input [7:0] int_in;
  output [7:0] result;
  wire   N2, N3, N4, N5, N6, N7, N8, N9, n2, n3, n4;
  wire   [14:6] temp;
  wire   SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, 
        SYNOPSYS_UNCONNECTED__4, SYNOPSYS_UNCONNECTED__5;

  fixedpoint_DW_mult_uns_0 mult_11 ( .a({n3, n4, n3, n3, n4, n4, n3}), .b(
        int_in), .product({temp, SYNOPSYS_UNCONNECTED__0, 
        SYNOPSYS_UNCONNECTED__1, SYNOPSYS_UNCONNECTED__2, 
        SYNOPSYS_UNCONNECTED__3, SYNOPSYS_UNCONNECTED__4, 
        SYNOPSYS_UNCONNECTED__5}) );
  fixedpoint_DW01_inc_0 add_12 ( .A(temp[14:7]), .SUM({N9, N8, N7, N6, N5, N4, 
        N3, N2}) );
  SAEDRVT14_TIE0_V1_2 U12 ( .X(n4) );
  SAEDRVT14_INV_S_1 U13 ( .A(temp[6]), .X(n2) );
  SAEDRVT14_AO22_1 U14 ( .A1(temp[14]), .A2(n2), .B1(temp[6]), .B2(N9), .X(
        result[7]) );
  SAEDRVT14_AO22_1 U15 ( .A1(temp[7]), .A2(n2), .B1(N2), .B2(temp[6]), .X(
        result[0]) );
  SAEDRVT14_AO22_1 U16 ( .A1(temp[8]), .A2(n2), .B1(N3), .B2(temp[6]), .X(
        result[1]) );
  SAEDRVT14_AO22_1 U17 ( .A1(temp[9]), .A2(n2), .B1(N4), .B2(temp[6]), .X(
        result[2]) );
  SAEDRVT14_AO22_1 U18 ( .A1(temp[10]), .A2(n2), .B1(N5), .B2(temp[6]), .X(
        result[3]) );
  SAEDRVT14_AO22_1 U19 ( .A1(temp[11]), .A2(n2), .B1(N6), .B2(temp[6]), .X(
        result[4]) );
  SAEDRVT14_AO22_1 U20 ( .A1(temp[12]), .A2(n2), .B1(N7), .B2(temp[6]), .X(
        result[5]) );
  SAEDRVT14_AO22_1 U21 ( .A1(temp[13]), .A2(n2), .B1(N8), .B2(temp[6]), .X(
        result[6]) );
  SAEDRVT14_TIE1_4 U22 ( .X(n3) );
endmodule

