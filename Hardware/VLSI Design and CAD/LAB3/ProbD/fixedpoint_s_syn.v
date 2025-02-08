/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : O-2018.06
// Date      : Thu Mar 10 15:37:42 2022
/////////////////////////////////////////////////////////////


module fixedpoint_s_DW01_inc_0 ( A, SUM );
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


module fixedpoint_s_DW_mult_tc_0 ( a, b, product );
  input [7:0] a;
  input [7:0] b;
  output [15:0] product;
  wire   n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n45, \b[0] , \b[1] , \b[2] , n77, n78, n79,
         n80, n81, n82, n83;
  assign n45 = b[4];
  assign \b[0]  = b[0];
  assign product[0] = \b[0] ;
  assign \b[1]  = b[1];
  assign product[1] = \b[1] ;
  assign \b[2]  = b[2];
  assign product[2] = \b[2] ;

  SAEDRVT14_ADDF_V1_1 U3 ( .A(n3), .B(n13), .CI(n14), .CO(n2), .S(product[12])
         );
  SAEDRVT14_ADDF_V1_1 U4 ( .A(n4), .B(n15), .CI(n16), .CO(n3), .S(product[11])
         );
  SAEDRVT14_ADDF_V1_1 U5 ( .A(n5), .B(n17), .CI(n20), .CO(n4), .S(product[10])
         );
  SAEDRVT14_ADDF_V1_1 U6 ( .A(n6), .B(n21), .CI(n24), .CO(n5), .S(product[9])
         );
  SAEDRVT14_ADDF_V1_1 U7 ( .A(n7), .B(n25), .CI(n28), .CO(n6), .S(product[8])
         );
  SAEDRVT14_ADDF_V1_1 U8 ( .A(n8), .B(n29), .CI(n32), .CO(n7), .S(product[7])
         );
  SAEDRVT14_ADDF_V1_1 U9 ( .A(n9), .B(n33), .CI(n34), .CO(n8), .S(product[6])
         );
  SAEDRVT14_ADDF_V1_1 U10 ( .A(n10), .B(n35), .CI(\b[0] ), .CO(n9), .S(
        product[5]) );
  SAEDRVT14_ADDF_V1_1 U11 ( .A(n11), .B(n45), .CI(\b[1] ), .CO(n10), .S(
        product[4]) );
  SAEDRVT14_ADDH_0P5 U12 ( .A(b[3]), .B(\b[0] ), .CO(n11), .S(product[3]) );
  SAEDRVT14_ADDF_V1_1 U13 ( .A(n78), .B(n79), .CI(n77), .CO(n12), .S(n13) );
  SAEDRVT14_ADDF_V1_1 U14 ( .A(n18), .B(b[6]), .CI(n45), .CO(n14), .S(n15) );
  SAEDRVT14_ADDF_V1_1 U15 ( .A(n19), .B(n22), .CI(b[5]), .CO(n16), .S(n17) );
  SAEDRVT14_ADDF_V1_1 U18 ( .A(n23), .B(n26), .CI(b[6]), .CO(n20), .S(n21) );
  SAEDRVT14_ADDH_0P5 U19 ( .A(n45), .B(n80), .CO(n22), .S(n23) );
  SAEDRVT14_ADDF_V1_1 U20 ( .A(n27), .B(n30), .CI(b[5]), .CO(n24), .S(n25) );
  SAEDRVT14_ADDH_0P5 U21 ( .A(b[3]), .B(n81), .CO(n26), .S(n27) );
  SAEDRVT14_ADDF_V1_1 U22 ( .A(n31), .B(\b[2] ), .CI(n77), .CO(n28), .S(n29)
         );
  SAEDRVT14_ADDH_0P5 U23 ( .A(n45), .B(n82), .CO(n30), .S(n31) );
  SAEDRVT14_ADDF_V1_1 U24 ( .A(b[3]), .B(\b[1] ), .CI(b[6]), .CO(n32), .S(n33)
         );
  SAEDRVT14_ADDH_0P5 U25 ( .A(\b[2] ), .B(b[5]), .CO(n34), .S(n35) );
  SAEDRVT14_INV_S_1 U38 ( .A(\b[0] ), .X(n82) );
  SAEDRVT14_INV_S_1 U39 ( .A(\b[1] ), .X(n81) );
  SAEDRVT14_INV_S_1 U40 ( .A(\b[2] ), .X(n80) );
  SAEDRVT14_INV_S_1 U41 ( .A(b[5]), .X(n78) );
  SAEDRVT14_INV_S_1 U42 ( .A(n45), .X(n79) );
  SAEDRVT14_INV_S_1 U43 ( .A(b[7]), .X(n77) );
  SAEDRVT14_EO2_V1_0P75 U44 ( .A1(b[6]), .A2(n83), .X(product[13]) );
  SAEDRVT14_EO2_V1_0P75 U45 ( .A1(n2), .A2(n12), .X(n83) );
  SAEDRVT14_EO2_V1_0P75 U46 ( .A1(b[3]), .A2(n77), .X(n19) );
  SAEDRVT14_ND2_CDC_0P5 U47 ( .A1(b[3]), .A2(b[7]), .X(n18) );
endmodule


module fixedpoint_s ( int_in, result );
  input [7:0] int_in;
  output [7:0] result;
  wire   N12, N13, N14, N15, N16, N17, N18, N19, N70, N71, N72, N73, N74, N75,
         N76, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n20,
         n21, n22;
  wire   [13:0] temp;
  wire   SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1;
  assign result[0] = N70;
  assign result[1] = N71;
  assign result[2] = N72;
  assign result[3] = N73;
  assign result[4] = N74;
  assign result[5] = N75;
  assign result[6] = N76;

  SAEDRVT14_AO32_1 U22 ( .A1(n17), .A2(result[7]), .A3(n10), .B1(n11), .B2(n20), .X(n7) );
  SAEDRVT14_OA2BB2_V1_1 U23 ( .A1(N19), .A2(n14), .B1(n14), .B2(n18), .X(n12)
         );
  SAEDRVT14_NR4_0P75 U24 ( .A1(temp[1]), .A2(temp[0]), .A3(temp[2]), .A4(n15), 
        .X(n10) );
  fixedpoint_s_DW01_inc_0 r301 ( .A(temp[13:6]), .SUM({N19, N18, N17, N16, N15, 
        N14, N13, N12}) );
  fixedpoint_s_DW_mult_tc_0 mult_11 ( .a({n21, n22, n21, n22, n21, n22, n22, 
        n21}), .b(int_in), .product({SYNOPSYS_UNCONNECTED__0, 
        SYNOPSYS_UNCONNECTED__1, temp}) );
  SAEDRVT14_TIE0_V1_2 U25 ( .X(n22) );
  SAEDRVT14_NR2_MM_1 U26 ( .A1(n20), .A2(n10), .X(n14) );
  SAEDRVT14_INV_S_1 U27 ( .A(n12), .X(n17) );
  SAEDRVT14_ND2_CDC_0P5 U28 ( .A1(n12), .A2(result[7]), .X(n11) );
  SAEDRVT14_INV_S_1 U29 ( .A(temp[13]), .X(n18) );
  SAEDRVT14_INV_S_1 U30 ( .A(temp[5]), .X(n20) );
  SAEDRVT14_AN2_MM_1 U31 ( .A1(temp[5]), .A2(n13), .X(n6) );
  SAEDRVT14_OAI21_0P5 U32 ( .A1(n10), .A2(n12), .B(result[7]), .X(n13) );
  SAEDRVT14_AO221_0P5 U33 ( .A1(N12), .A2(n6), .B1(temp[6]), .B2(n7), .C(n8), 
        .X(N70) );
  SAEDRVT14_AO221_0P5 U34 ( .A1(N13), .A2(n6), .B1(temp[7]), .B2(n7), .C(n8), 
        .X(N71) );
  SAEDRVT14_AO221_0P5 U35 ( .A1(N14), .A2(n6), .B1(temp[8]), .B2(n7), .C(n8), 
        .X(N72) );
  SAEDRVT14_AO221_0P5 U36 ( .A1(N15), .A2(n6), .B1(temp[9]), .B2(n7), .C(n8), 
        .X(N73) );
  SAEDRVT14_AO221_0P5 U37 ( .A1(N16), .A2(n6), .B1(temp[10]), .B2(n7), .C(n8), 
        .X(N74) );
  SAEDRVT14_AO221_0P5 U38 ( .A1(N17), .A2(n6), .B1(temp[11]), .B2(n7), .C(n8), 
        .X(N75) );
  SAEDRVT14_AO221_0P5 U39 ( .A1(N18), .A2(n6), .B1(temp[12]), .B2(n7), .C(n8), 
        .X(N76) );
  SAEDRVT14_OR2_1 U40 ( .A1(temp[4]), .A2(temp[3]), .X(n15) );
  SAEDRVT14_AN2_MM_1 U41 ( .A1(n9), .A2(int_in[7]), .X(n8) );
  SAEDRVT14_OAI22_1 U42 ( .A1(temp[5]), .A2(n18), .B1(n16), .B2(n20), .X(n9)
         );
  SAEDRVT14_INV_S_1 U43 ( .A(N19), .X(n16) );
  SAEDRVT14_INV_S_1 U44 ( .A(int_in[7]), .X(result[7]) );
  SAEDRVT14_TIE1_4 U45 ( .X(n21) );
endmodule

