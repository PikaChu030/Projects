/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : O-2018.06
// Date      : Fri Apr 15 11:51:31 2022
/////////////////////////////////////////////////////////////


module top_DW01_dec_0 ( A, SUM );
  input [19:0] A;
  output [19:0] SUM;
  wire   n1, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21;

  SAEDRVT14_INV_S_1 U1 ( .A(A[0]), .X(SUM[0]) );
  SAEDRVT14_INV_S_1 U2 ( .A(A[10]), .X(n3) );
  SAEDRVT14_INV_S_1 U3 ( .A(n14), .X(n1) );
  SAEDRVT14_AO21_1 U4 ( .A1(n4), .A2(A[9]), .B(n5), .X(SUM[9]) );
  SAEDRVT14_AO21B_0P5 U5 ( .A1(n6), .A2(A[8]), .B(n4), .X(SUM[8]) );
  SAEDRVT14_AO21B_0P5 U6 ( .A1(n7), .A2(A[7]), .B(n6), .X(SUM[7]) );
  SAEDRVT14_AO21B_0P5 U7 ( .A1(n8), .A2(A[6]), .B(n7), .X(SUM[6]) );
  SAEDRVT14_AO21B_0P5 U8 ( .A1(n9), .A2(A[5]), .B(n8), .X(SUM[5]) );
  SAEDRVT14_AO21B_0P5 U9 ( .A1(n10), .A2(A[4]), .B(n9), .X(SUM[4]) );
  SAEDRVT14_AO21B_0P5 U10 ( .A1(n11), .A2(A[3]), .B(n10), .X(SUM[3]) );
  SAEDRVT14_AO21B_0P5 U11 ( .A1(n12), .A2(A[2]), .B(n11), .X(SUM[2]) );
  SAEDRVT14_AO21B_0P5 U12 ( .A1(A[0]), .A2(A[1]), .B(n12), .X(SUM[1]) );
  SAEDRVT14_EO2_V1_0P75 U13 ( .A1(A[19]), .A2(n13), .X(SUM[19]) );
  SAEDRVT14_NR2_1 U14 ( .A1(A[18]), .A2(n1), .X(n13) );
  SAEDRVT14_EO2_V1_0P75 U15 ( .A1(A[18]), .A2(n14), .X(SUM[18]) );
  SAEDRVT14_AO21_1 U16 ( .A1(n15), .A2(A[17]), .B(n14), .X(SUM[17]) );
  SAEDRVT14_NR2_1 U17 ( .A1(n15), .A2(A[17]), .X(n14) );
  SAEDRVT14_AO21B_0P5 U18 ( .A1(n16), .A2(A[16]), .B(n15), .X(SUM[16]) );
  SAEDRVT14_OR2_0P5 U19 ( .A1(n16), .A2(A[16]), .X(n15) );
  SAEDRVT14_AO21B_0P5 U20 ( .A1(n17), .A2(A[15]), .B(n16), .X(SUM[15]) );
  SAEDRVT14_OR2_0P5 U21 ( .A1(n17), .A2(A[15]), .X(n16) );
  SAEDRVT14_AO21B_0P5 U22 ( .A1(n18), .A2(A[14]), .B(n17), .X(SUM[14]) );
  SAEDRVT14_OR2_0P5 U23 ( .A1(n18), .A2(A[14]), .X(n17) );
  SAEDRVT14_AO21B_0P5 U24 ( .A1(n19), .A2(A[13]), .B(n18), .X(SUM[13]) );
  SAEDRVT14_OR2_0P5 U25 ( .A1(n19), .A2(A[13]), .X(n18) );
  SAEDRVT14_AO21B_0P5 U26 ( .A1(n20), .A2(A[12]), .B(n19), .X(SUM[12]) );
  SAEDRVT14_OR2_0P5 U27 ( .A1(n20), .A2(A[12]), .X(n19) );
  SAEDRVT14_AO21B_0P5 U28 ( .A1(n21), .A2(A[11]), .B(n20), .X(SUM[11]) );
  SAEDRVT14_OR2_0P5 U29 ( .A1(n21), .A2(A[11]), .X(n20) );
  SAEDRVT14_OAI21_0P5 U30 ( .A1(n5), .A2(n3), .B(n21), .X(SUM[10]) );
  SAEDRVT14_ND2_CDC_0P5 U31 ( .A1(n5), .A2(n3), .X(n21) );
  SAEDRVT14_NR2_1 U32 ( .A1(n4), .A2(A[9]), .X(n5) );
  SAEDRVT14_OR2_0P5 U33 ( .A1(n6), .A2(A[8]), .X(n4) );
  SAEDRVT14_OR2_0P5 U34 ( .A1(n7), .A2(A[7]), .X(n6) );
  SAEDRVT14_OR2_0P5 U35 ( .A1(n8), .A2(A[6]), .X(n7) );
  SAEDRVT14_OR2_0P5 U36 ( .A1(n9), .A2(A[5]), .X(n8) );
  SAEDRVT14_OR2_0P5 U37 ( .A1(n10), .A2(A[4]), .X(n9) );
  SAEDRVT14_OR2_0P5 U38 ( .A1(n11), .A2(A[3]), .X(n10) );
  SAEDRVT14_OR2_0P5 U39 ( .A1(n12), .A2(A[2]), .X(n11) );
  SAEDRVT14_ND2B_U_0P5 U40 ( .A(A[1]), .B(SUM[0]), .X(n12) );
endmodule


module top_DW01_inc_0 ( A, SUM );
  input [19:0] A;
  output [19:0] SUM;

  wire   [19:2] carry;

  SAEDRVT14_ADDH_0P5 U1_1_18 ( .A(A[18]), .B(carry[18]), .CO(carry[19]), .S(
        SUM[18]) );
  SAEDRVT14_ADDH_0P5 U1_1_10 ( .A(A[10]), .B(carry[10]), .CO(carry[11]), .S(
        SUM[10]) );
  SAEDRVT14_ADDH_0P5 U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  SAEDRVT14_ADDH_0P5 U1_1_11 ( .A(A[11]), .B(carry[11]), .CO(carry[12]), .S(
        SUM[11]) );
  SAEDRVT14_ADDH_0P5 U1_1_14 ( .A(A[14]), .B(carry[14]), .CO(carry[15]), .S(
        SUM[14]) );
  SAEDRVT14_ADDH_0P5 U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  SAEDRVT14_ADDH_0P5 U1_1_7 ( .A(A[7]), .B(carry[7]), .CO(carry[8]), .S(SUM[7]) );
  SAEDRVT14_ADDH_0P5 U1_1_15 ( .A(A[15]), .B(carry[15]), .CO(carry[16]), .S(
        SUM[15]) );
  SAEDRVT14_ADDH_0P5 U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  SAEDRVT14_ADDH_0P5 U1_1_13 ( .A(A[13]), .B(carry[13]), .CO(carry[14]), .S(
        SUM[13]) );
  SAEDRVT14_ADDH_0P5 U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  SAEDRVT14_ADDH_0P5 U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  SAEDRVT14_ADDH_0P5 U1_1_12 ( .A(A[12]), .B(carry[12]), .CO(carry[13]), .S(
        SUM[12]) );
  SAEDRVT14_ADDH_0P5 U1_1_9 ( .A(A[9]), .B(carry[9]), .CO(carry[10]), .S(
        SUM[9]) );
  SAEDRVT14_ADDH_0P5 U1_1_17 ( .A(A[17]), .B(carry[17]), .CO(carry[18]), .S(
        SUM[17]) );
  SAEDRVT14_ADDH_0P5 U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  SAEDRVT14_ADDH_0P5 U1_1_8 ( .A(A[8]), .B(carry[8]), .CO(carry[9]), .S(SUM[8]) );
  SAEDRVT14_ADDH_0P5 U1_1_16 ( .A(A[16]), .B(carry[16]), .CO(carry[17]), .S(
        SUM[16]) );
  SAEDRVT14_INV_S_1 U1 ( .A(A[0]), .X(SUM[0]) );
  SAEDRVT14_EO2_V1_0P75 U2 ( .A1(carry[19]), .A2(A[19]), .X(SUM[19]) );
endmodule


module top ( clk, rst, RAM1_Q, RAM1_D, RAM1_A, RAM1_WE, RAM1_OE, RAM2_Q, 
        RAM2_D, RAM2_A, RAM2_WE, RAM2_OE, RAM3_D, RAM3_A, RAM3_WE, RAM3_OE, 
        done );
  input [23:0] RAM1_Q;
  output [23:0] RAM1_D;
  output [19:0] RAM1_A;
  input [23:0] RAM2_Q;
  output [23:0] RAM2_D;
  output [19:0] RAM2_A;
  output [23:0] RAM3_D;
  output [19:0] RAM3_A;
  input clk, rst;
  output RAM1_WE, RAM1_OE, RAM2_WE, RAM2_OE, RAM3_WE, RAM3_OE, done;
  wire   \*Logic0* , N5, N6, N7, N8, N9, N10, N11, N12, N13, N14, N15, N16,
         N17, N18, N19, N20, N21, N22, N23, N24, N26, N27, N28, N29, N30, N31,
         N32, N33, N34, N35, N36, N37, N38, N39, N40, N41, N42, N43, N44, N45,
         N46, N47, N48, N49, N50, N51, N52, N53, N54, N55, N56, N57, N58, N59,
         N60, N61, N62, N63, N64, N65, n6, n7, n8, n9, n10, n11, n12, n13, n14,
         n15, n16, \sub_73/carry[2] , \sub_73/carry[3] , \sub_73/carry[4] ,
         \sub_73/carry[5] , \sub_73/carry[6] , \sub_73/carry[7] ,
         \sub_73/carry[8] , \sub_73/carry[9] , \sub_73/carry[10] ,
         \sub_73/carry[11] , \sub_73/carry[12] , \sub_73/carry[13] ,
         \sub_73/carry[14] , \sub_73/carry[15] , \sub_73/carry[16] ,
         \sub_73/carry[17] , \sub_73/carry[18] , \sub_73/carry[19] , n17, n18,
         n19, n20, n21, n22, n23, RAM1_OE, n25, n26, n27;
  wire   [1:0] st;
  wire   [19:0] counter;
  wire   [1:0] n_st;
  assign RAM3_OE = \*Logic0* ;
  assign RAM2_WE = \*Logic0* ;
  assign RAM2_D[0] = \*Logic0* ;
  assign RAM2_D[1] = \*Logic0* ;
  assign RAM2_D[2] = \*Logic0* ;
  assign RAM2_D[3] = \*Logic0* ;
  assign RAM2_D[4] = \*Logic0* ;
  assign RAM2_D[5] = \*Logic0* ;
  assign RAM2_D[6] = \*Logic0* ;
  assign RAM2_D[7] = \*Logic0* ;
  assign RAM2_D[8] = \*Logic0* ;
  assign RAM2_D[9] = \*Logic0* ;
  assign RAM2_D[10] = \*Logic0* ;
  assign RAM2_D[11] = \*Logic0* ;
  assign RAM2_D[12] = \*Logic0* ;
  assign RAM2_D[13] = \*Logic0* ;
  assign RAM2_D[14] = \*Logic0* ;
  assign RAM2_D[15] = \*Logic0* ;
  assign RAM2_D[16] = \*Logic0* ;
  assign RAM2_D[17] = \*Logic0* ;
  assign RAM2_D[18] = \*Logic0* ;
  assign RAM2_D[19] = \*Logic0* ;
  assign RAM2_D[20] = \*Logic0* ;
  assign RAM2_D[21] = \*Logic0* ;
  assign RAM2_D[22] = \*Logic0* ;
  assign RAM2_D[23] = \*Logic0* ;
  assign RAM1_WE = \*Logic0* ;
  assign RAM1_D[0] = \*Logic0* ;
  assign RAM1_D[1] = \*Logic0* ;
  assign RAM1_D[2] = \*Logic0* ;
  assign RAM1_D[3] = \*Logic0* ;
  assign RAM1_D[4] = \*Logic0* ;
  assign RAM1_D[5] = \*Logic0* ;
  assign RAM1_D[6] = \*Logic0* ;
  assign RAM1_D[7] = \*Logic0* ;
  assign RAM1_D[8] = \*Logic0* ;
  assign RAM1_D[9] = \*Logic0* ;
  assign RAM1_D[10] = \*Logic0* ;
  assign RAM1_D[11] = \*Logic0* ;
  assign RAM1_D[12] = \*Logic0* ;
  assign RAM1_D[13] = \*Logic0* ;
  assign RAM1_D[14] = \*Logic0* ;
  assign RAM1_D[15] = \*Logic0* ;
  assign RAM1_D[16] = \*Logic0* ;
  assign RAM1_D[17] = \*Logic0* ;
  assign RAM1_D[18] = \*Logic0* ;
  assign RAM1_D[19] = \*Logic0* ;
  assign RAM1_D[20] = \*Logic0* ;
  assign RAM1_D[21] = \*Logic0* ;
  assign RAM1_D[22] = \*Logic0* ;
  assign RAM1_D[23] = \*Logic0* ;
  assign done = n_st[1];
  assign RAM3_WE = RAM1_OE;
  assign RAM2_OE = RAM1_OE;

  SAEDRVT14_AO21B_0P5 U103 ( .A1(n6), .A2(RAM1_OE), .B(n7), .X(n_st[0]) );
  top_DW01_dec_0 sub_72 ( .A(counter), .SUM({N45, N44, N43, N42, N41, N40, N39, 
        N38, N37, N36, N35, N34, N33, N32, N31, N30, N29, N28, N27, N26}) );
  top_DW01_inc_0 add_40 ( .A(counter), .SUM({N24, N23, N22, N21, N20, N19, N18, 
        N17, N16, N15, N14, N13, N12, N11, N10, N9, N8, N7, N6, N5}) );
  SAEDRVT14_FDPRBQ_V2_1 \st_reg[1]  ( .D(n_st[1]), .CK(clk), .RD(n25), .Q(
        st[1]) );
  SAEDRVT14_FDPRBQ_V2_1 \st_reg[0]  ( .D(n_st[0]), .CK(clk), .RD(n25), .Q(
        st[0]) );
  SAEDRVT14_FDPRBQ_V2_1 \counter_reg[19]  ( .D(N24), .CK(clk), .RD(n25), .Q(
        counter[19]) );
  SAEDRVT14_FDPRBQ_V2_1 \counter_reg[10]  ( .D(N15), .CK(clk), .RD(n25), .Q(
        counter[10]) );
  SAEDRVT14_FDPRBQ_V2_1 \counter_reg[6]  ( .D(N11), .CK(clk), .RD(n25), .Q(
        counter[6]) );
  SAEDRVT14_FDPRBQ_V2_1 \counter_reg[11]  ( .D(N16), .CK(clk), .RD(n25), .Q(
        counter[11]) );
  SAEDRVT14_FDPRBQ_V2_1 \counter_reg[14]  ( .D(N19), .CK(clk), .RD(n25), .Q(
        counter[14]) );
  SAEDRVT14_FDPRBQ_V2_1 \counter_reg[2]  ( .D(N7), .CK(clk), .RD(n25), .Q(
        counter[2]) );
  SAEDRVT14_FDPRBQ_V2_1 \counter_reg[7]  ( .D(N12), .CK(clk), .RD(n25), .Q(
        counter[7]) );
  SAEDRVT14_FDPRBQ_V2_1 \counter_reg[15]  ( .D(N20), .CK(clk), .RD(n25), .Q(
        counter[15]) );
  SAEDRVT14_FDPRBQ_V2_1 \counter_reg[5]  ( .D(N10), .CK(clk), .RD(n25), .Q(
        counter[5]) );
  SAEDRVT14_FDPRBQ_V2_1 \counter_reg[13]  ( .D(N18), .CK(clk), .RD(n25), .Q(
        counter[13]) );
  SAEDRVT14_FDPRBQ_V2_1 \counter_reg[18]  ( .D(N23), .CK(clk), .RD(n25), .Q(
        counter[18]) );
  SAEDRVT14_FDPRBQ_V2_1 \counter_reg[4]  ( .D(N9), .CK(clk), .RD(n25), .Q(
        counter[4]) );
  SAEDRVT14_FDPRBQ_V2_1 \counter_reg[1]  ( .D(N6), .CK(clk), .RD(n25), .Q(
        counter[1]) );
  SAEDRVT14_FDPRBQ_V2_1 \counter_reg[12]  ( .D(N17), .CK(clk), .RD(n25), .Q(
        counter[12]) );
  SAEDRVT14_FDPRBQ_V2_1 \counter_reg[9]  ( .D(N14), .CK(clk), .RD(n25), .Q(
        counter[9]) );
  SAEDRVT14_FDPRBQ_V2_1 \counter_reg[17]  ( .D(N22), .CK(clk), .RD(n25), .Q(
        counter[17]) );
  SAEDRVT14_FDPRBQ_V2_1 \counter_reg[3]  ( .D(N8), .CK(clk), .RD(n25), .Q(
        counter[3]) );
  SAEDRVT14_FDPRBQ_V2_1 \counter_reg[8]  ( .D(N13), .CK(clk), .RD(n25), .Q(
        counter[8]) );
  SAEDRVT14_FDPRBQ_V2_1 \counter_reg[16]  ( .D(N21), .CK(clk), .RD(n25), .Q(
        counter[16]) );
  SAEDRVT14_FDPRBQ_V2_1 \counter_reg[0]  ( .D(N5), .CK(clk), .RD(n25), .Q(
        counter[0]) );
  SAEDRVT14_TIE0_V1_2 U104 ( .X(\*Logic0* ) );
  SAEDRVT14_BUF_ECO_1 U105 ( .A(n26), .X(n19) );
  SAEDRVT14_BUF_ECO_1 U106 ( .A(n26), .X(n20) );
  SAEDRVT14_BUF_ECO_1 U107 ( .A(n26), .X(n18) );
  SAEDRVT14_BUF_ECO_1 U108 ( .A(n26), .X(n21) );
  SAEDRVT14_BUF_ECO_1 U109 ( .A(n26), .X(n17) );
  SAEDRVT14_BUF_ECO_1 U110 ( .A(n26), .X(n22) );
  SAEDRVT14_BUF_ECO_1 U111 ( .A(n26), .X(n23) );
  SAEDRVT14_BUF_ECO_1 U112 ( .A(n26), .X(RAM1_OE) );
  SAEDRVT14_INV_S_1 U113 ( .A(n8), .X(n26) );
  SAEDRVT14_AN2_MM_1 U114 ( .A1(N26), .A2(n22), .X(RAM2_A[0]) );
  SAEDRVT14_AN2_MM_1 U115 ( .A1(N36), .A2(n22), .X(RAM2_A[10]) );
  SAEDRVT14_AN2_MM_1 U116 ( .A1(RAM1_Q[0]), .A2(n19), .X(RAM3_D[0]) );
  SAEDRVT14_AN2_MM_1 U117 ( .A1(RAM1_Q[1]), .A2(n18), .X(RAM3_D[1]) );
  SAEDRVT14_AN2_MM_1 U118 ( .A1(RAM1_Q[2]), .A2(n17), .X(RAM3_D[2]) );
  SAEDRVT14_AN2_MM_1 U119 ( .A1(RAM1_Q[3]), .A2(n17), .X(RAM3_D[3]) );
  SAEDRVT14_AN2_MM_1 U120 ( .A1(RAM1_Q[4]), .A2(n17), .X(RAM3_D[4]) );
  SAEDRVT14_AN2_MM_1 U121 ( .A1(RAM1_Q[5]), .A2(n17), .X(RAM3_D[5]) );
  SAEDRVT14_AN2_MM_1 U122 ( .A1(RAM1_Q[6]), .A2(n17), .X(RAM3_D[6]) );
  SAEDRVT14_AN2_MM_1 U123 ( .A1(RAM1_Q[7]), .A2(n17), .X(RAM3_D[7]) );
  SAEDRVT14_AN2_MM_1 U124 ( .A1(RAM1_Q[8]), .A2(n17), .X(RAM3_D[8]) );
  SAEDRVT14_AN2_MM_1 U125 ( .A1(RAM1_Q[9]), .A2(n17), .X(RAM3_D[9]) );
  SAEDRVT14_AN2_MM_1 U126 ( .A1(RAM1_Q[10]), .A2(n19), .X(RAM3_D[10]) );
  SAEDRVT14_AN2_MM_1 U127 ( .A1(RAM1_Q[11]), .A2(n18), .X(RAM3_D[11]) );
  SAEDRVT14_AN2_MM_1 U128 ( .A1(RAM1_Q[12]), .A2(n18), .X(RAM3_D[12]) );
  SAEDRVT14_AN2_MM_1 U129 ( .A1(RAM1_Q[13]), .A2(n18), .X(RAM3_D[13]) );
  SAEDRVT14_AN2_MM_1 U130 ( .A1(RAM1_Q[14]), .A2(n20), .X(RAM3_D[14]) );
  SAEDRVT14_AN2_MM_1 U131 ( .A1(RAM1_Q[15]), .A2(n18), .X(RAM3_D[15]) );
  SAEDRVT14_AN2_MM_1 U132 ( .A1(RAM1_Q[16]), .A2(n18), .X(RAM3_D[16]) );
  SAEDRVT14_AN2_MM_1 U133 ( .A1(RAM1_Q[17]), .A2(n18), .X(RAM3_D[17]) );
  SAEDRVT14_AN2_MM_1 U134 ( .A1(RAM1_Q[18]), .A2(n18), .X(RAM3_D[18]) );
  SAEDRVT14_AN2_MM_1 U135 ( .A1(RAM1_Q[19]), .A2(n18), .X(RAM3_D[19]) );
  SAEDRVT14_AN2_MM_1 U136 ( .A1(RAM1_Q[20]), .A2(n18), .X(RAM3_D[20]) );
  SAEDRVT14_AN2_MM_1 U137 ( .A1(RAM1_Q[21]), .A2(n18), .X(RAM3_D[21]) );
  SAEDRVT14_AN2_MM_1 U138 ( .A1(RAM1_Q[22]), .A2(n17), .X(RAM3_D[22]) );
  SAEDRVT14_AN2_MM_1 U139 ( .A1(RAM1_Q[23]), .A2(n17), .X(RAM3_D[23]) );
  SAEDRVT14_AN2_MM_1 U140 ( .A1(RAM2_Q[0]), .A2(n17), .X(RAM1_A[0]) );
  SAEDRVT14_AN2_MM_1 U141 ( .A1(RAM2_Q[1]), .A2(n23), .X(RAM1_A[1]) );
  SAEDRVT14_AN2_MM_1 U142 ( .A1(RAM2_Q[2]), .A2(n23), .X(RAM1_A[2]) );
  SAEDRVT14_AN2_MM_1 U143 ( .A1(RAM2_Q[3]), .A2(n23), .X(RAM1_A[3]) );
  SAEDRVT14_AN2_MM_1 U144 ( .A1(RAM2_Q[4]), .A2(n23), .X(RAM1_A[4]) );
  SAEDRVT14_AN2_MM_1 U145 ( .A1(RAM2_Q[5]), .A2(n23), .X(RAM1_A[5]) );
  SAEDRVT14_AN2_MM_1 U146 ( .A1(RAM2_Q[6]), .A2(n23), .X(RAM1_A[6]) );
  SAEDRVT14_AN2_MM_1 U147 ( .A1(RAM2_Q[7]), .A2(n23), .X(RAM1_A[7]) );
  SAEDRVT14_AN2_MM_1 U148 ( .A1(RAM2_Q[8]), .A2(n23), .X(RAM1_A[8]) );
  SAEDRVT14_AN2_MM_1 U149 ( .A1(RAM2_Q[9]), .A2(n22), .X(RAM1_A[9]) );
  SAEDRVT14_AN2_MM_1 U150 ( .A1(RAM2_Q[10]), .A2(RAM1_OE), .X(RAM1_A[10]) );
  SAEDRVT14_AN2_MM_1 U151 ( .A1(RAM2_Q[11]), .A2(RAM1_OE), .X(RAM1_A[11]) );
  SAEDRVT14_AN2_MM_1 U152 ( .A1(RAM2_Q[12]), .A2(RAM1_OE), .X(RAM1_A[12]) );
  SAEDRVT14_AN2_MM_1 U153 ( .A1(RAM2_Q[13]), .A2(RAM1_OE), .X(RAM1_A[13]) );
  SAEDRVT14_AN2_MM_1 U154 ( .A1(RAM2_Q[14]), .A2(RAM1_OE), .X(RAM1_A[14]) );
  SAEDRVT14_AN2_MM_1 U155 ( .A1(RAM2_Q[15]), .A2(RAM1_OE), .X(RAM1_A[15]) );
  SAEDRVT14_AN2_MM_1 U156 ( .A1(RAM2_Q[16]), .A2(RAM1_OE), .X(RAM1_A[16]) );
  SAEDRVT14_AN2_MM_1 U157 ( .A1(RAM2_Q[17]), .A2(n23), .X(RAM1_A[17]) );
  SAEDRVT14_AN2_MM_1 U158 ( .A1(RAM2_Q[18]), .A2(n23), .X(RAM1_A[18]) );
  SAEDRVT14_AN2_MM_1 U159 ( .A1(RAM2_Q[19]), .A2(n23), .X(RAM1_A[19]) );
  SAEDRVT14_INV_S_1 U160 ( .A(rst), .X(n25) );
  SAEDRVT14_OAI22_1 U161 ( .A1(st[0]), .A2(n27), .B1(n6), .B2(n8), .X(n_st[1])
         );
  SAEDRVT14_ND2_CDC_0P5 U162 ( .A1(st[0]), .A2(n27), .X(n8) );
  SAEDRVT14_EO2_V1_0P75 U163 ( .A1(st[1]), .A2(st[0]), .X(n7) );
  SAEDRVT14_OR4_1 U164 ( .A1(n9), .A2(n10), .A3(n11), .A4(n12), .X(n6) );
  SAEDRVT14_OR4_1 U165 ( .A1(counter[14]), .A2(counter[13]), .A3(counter[15]), 
        .A4(n16), .X(n9) );
  SAEDRVT14_OR4_1 U166 ( .A1(counter[19]), .A2(counter[18]), .A3(counter[2]), 
        .A4(n13), .X(n12) );
  SAEDRVT14_OR4_1 U167 ( .A1(counter[6]), .A2(counter[5]), .A3(counter[7]), 
        .A4(n14), .X(n11) );
  SAEDRVT14_OR4_1 U168 ( .A1(counter[11]), .A2(counter[10]), .A3(counter[0]), 
        .A4(n15), .X(n10) );
  SAEDRVT14_ND2_CDC_0P5 U169 ( .A1(counter[1]), .A2(counter[12]), .X(n15) );
  SAEDRVT14_INV_S_1 U170 ( .A(st[1]), .X(n27) );
  SAEDRVT14_OR2_1 U171 ( .A1(counter[9]), .A2(counter[8]), .X(n14) );
  SAEDRVT14_OR2_1 U172 ( .A1(counter[17]), .A2(counter[16]), .X(n16) );
  SAEDRVT14_OR2_1 U173 ( .A1(counter[4]), .A2(counter[3]), .X(n13) );
  SAEDRVT14_AN2_MM_1 U174 ( .A1(N44), .A2(n22), .X(RAM2_A[18]) );
  SAEDRVT14_AN2_MM_1 U175 ( .A1(N46), .A2(n21), .X(RAM3_A[0]) );
  SAEDRVT14_INV_S_1 U176 ( .A(counter[0]), .X(N46) );
  SAEDRVT14_AN2_MM_1 U177 ( .A1(N47), .A2(n19), .X(RAM3_A[1]) );
  SAEDRVT14_AN2_MM_1 U178 ( .A1(N48), .A2(n19), .X(RAM3_A[2]) );
  SAEDRVT14_AN2_MM_1 U179 ( .A1(N49), .A2(n19), .X(RAM3_A[3]) );
  SAEDRVT14_AN2_MM_1 U180 ( .A1(N50), .A2(n19), .X(RAM3_A[4]) );
  SAEDRVT14_AN2_MM_1 U181 ( .A1(N51), .A2(n19), .X(RAM3_A[5]) );
  SAEDRVT14_AN2_MM_1 U182 ( .A1(N52), .A2(n19), .X(RAM3_A[6]) );
  SAEDRVT14_AN2_MM_1 U183 ( .A1(N53), .A2(n19), .X(RAM3_A[7]) );
  SAEDRVT14_AN2_MM_1 U184 ( .A1(N54), .A2(n19), .X(RAM3_A[8]) );
  SAEDRVT14_AN2_MM_1 U185 ( .A1(N55), .A2(n19), .X(RAM3_A[9]) );
  SAEDRVT14_AN2_MM_1 U186 ( .A1(N56), .A2(n20), .X(RAM3_A[10]) );
  SAEDRVT14_AN2_MM_1 U187 ( .A1(N57), .A2(n20), .X(RAM3_A[11]) );
  SAEDRVT14_AN2_MM_1 U188 ( .A1(N58), .A2(n20), .X(RAM3_A[12]) );
  SAEDRVT14_AN2_MM_1 U189 ( .A1(N59), .A2(n20), .X(RAM3_A[13]) );
  SAEDRVT14_AN2_MM_1 U190 ( .A1(N60), .A2(n20), .X(RAM3_A[14]) );
  SAEDRVT14_AN2_MM_1 U191 ( .A1(N61), .A2(n20), .X(RAM3_A[15]) );
  SAEDRVT14_AN2_MM_1 U192 ( .A1(N62), .A2(n20), .X(RAM3_A[16]) );
  SAEDRVT14_AN2_MM_1 U193 ( .A1(N63), .A2(n20), .X(RAM3_A[17]) );
  SAEDRVT14_AN2_MM_1 U194 ( .A1(N64), .A2(n20), .X(RAM3_A[18]) );
  SAEDRVT14_AN2_MM_1 U195 ( .A1(N65), .A2(n20), .X(RAM3_A[19]) );
  SAEDRVT14_AN2_MM_1 U196 ( .A1(N27), .A2(n21), .X(RAM2_A[1]) );
  SAEDRVT14_AN2_MM_1 U197 ( .A1(N28), .A2(n21), .X(RAM2_A[2]) );
  SAEDRVT14_AN2_MM_1 U198 ( .A1(N29), .A2(n21), .X(RAM2_A[3]) );
  SAEDRVT14_AN2_MM_1 U199 ( .A1(N30), .A2(n21), .X(RAM2_A[4]) );
  SAEDRVT14_AN2_MM_1 U200 ( .A1(N31), .A2(n21), .X(RAM2_A[5]) );
  SAEDRVT14_AN2_MM_1 U201 ( .A1(N32), .A2(n21), .X(RAM2_A[6]) );
  SAEDRVT14_AN2_MM_1 U202 ( .A1(N33), .A2(n21), .X(RAM2_A[7]) );
  SAEDRVT14_AN2_MM_1 U203 ( .A1(N34), .A2(n21), .X(RAM2_A[8]) );
  SAEDRVT14_AN2_MM_1 U204 ( .A1(N35), .A2(n21), .X(RAM2_A[9]) );
  SAEDRVT14_AN2_MM_1 U205 ( .A1(N37), .A2(n22), .X(RAM2_A[11]) );
  SAEDRVT14_AN2_MM_1 U206 ( .A1(N38), .A2(n22), .X(RAM2_A[12]) );
  SAEDRVT14_AN2_MM_1 U207 ( .A1(N39), .A2(n22), .X(RAM2_A[13]) );
  SAEDRVT14_AN2_MM_1 U208 ( .A1(N40), .A2(n22), .X(RAM2_A[14]) );
  SAEDRVT14_AN2_MM_1 U209 ( .A1(N41), .A2(n22), .X(RAM2_A[15]) );
  SAEDRVT14_AN2_MM_1 U210 ( .A1(N42), .A2(n22), .X(RAM2_A[16]) );
  SAEDRVT14_AN2_MM_1 U211 ( .A1(N43), .A2(n22), .X(RAM2_A[17]) );
  SAEDRVT14_AN2_MM_1 U212 ( .A1(N45), .A2(n21), .X(RAM2_A[19]) );
  SAEDRVT14_EN2_1 U213 ( .A1(counter[19]), .A2(\sub_73/carry[19] ), .X(N65) );
  SAEDRVT14_OR2_0P5 U214 ( .A1(counter[18]), .A2(\sub_73/carry[18] ), .X(
        \sub_73/carry[19] ) );
  SAEDRVT14_EN2_1 U215 ( .A1(\sub_73/carry[18] ), .A2(counter[18]), .X(N64) );
  SAEDRVT14_OR2_0P5 U216 ( .A1(counter[17]), .A2(\sub_73/carry[17] ), .X(
        \sub_73/carry[18] ) );
  SAEDRVT14_EN2_1 U217 ( .A1(\sub_73/carry[17] ), .A2(counter[17]), .X(N63) );
  SAEDRVT14_OR2_0P5 U218 ( .A1(counter[16]), .A2(\sub_73/carry[16] ), .X(
        \sub_73/carry[17] ) );
  SAEDRVT14_EN2_1 U219 ( .A1(\sub_73/carry[16] ), .A2(counter[16]), .X(N62) );
  SAEDRVT14_OR2_0P5 U220 ( .A1(counter[15]), .A2(\sub_73/carry[15] ), .X(
        \sub_73/carry[16] ) );
  SAEDRVT14_EN2_1 U221 ( .A1(\sub_73/carry[15] ), .A2(counter[15]), .X(N61) );
  SAEDRVT14_OR2_0P5 U222 ( .A1(counter[14]), .A2(\sub_73/carry[14] ), .X(
        \sub_73/carry[15] ) );
  SAEDRVT14_EN2_1 U223 ( .A1(\sub_73/carry[14] ), .A2(counter[14]), .X(N60) );
  SAEDRVT14_OR2_0P5 U224 ( .A1(counter[13]), .A2(\sub_73/carry[13] ), .X(
        \sub_73/carry[14] ) );
  SAEDRVT14_EN2_1 U225 ( .A1(\sub_73/carry[13] ), .A2(counter[13]), .X(N59) );
  SAEDRVT14_OR2_0P5 U226 ( .A1(counter[12]), .A2(\sub_73/carry[12] ), .X(
        \sub_73/carry[13] ) );
  SAEDRVT14_EN2_1 U227 ( .A1(\sub_73/carry[12] ), .A2(counter[12]), .X(N58) );
  SAEDRVT14_OR2_0P5 U228 ( .A1(counter[11]), .A2(\sub_73/carry[11] ), .X(
        \sub_73/carry[12] ) );
  SAEDRVT14_EN2_1 U229 ( .A1(\sub_73/carry[11] ), .A2(counter[11]), .X(N57) );
  SAEDRVT14_OR2_0P5 U230 ( .A1(counter[10]), .A2(\sub_73/carry[10] ), .X(
        \sub_73/carry[11] ) );
  SAEDRVT14_EN2_1 U231 ( .A1(\sub_73/carry[10] ), .A2(counter[10]), .X(N56) );
  SAEDRVT14_OR2_0P5 U232 ( .A1(counter[9]), .A2(\sub_73/carry[9] ), .X(
        \sub_73/carry[10] ) );
  SAEDRVT14_EN2_1 U233 ( .A1(\sub_73/carry[9] ), .A2(counter[9]), .X(N55) );
  SAEDRVT14_OR2_0P5 U234 ( .A1(counter[8]), .A2(\sub_73/carry[8] ), .X(
        \sub_73/carry[9] ) );
  SAEDRVT14_EN2_1 U235 ( .A1(\sub_73/carry[8] ), .A2(counter[8]), .X(N54) );
  SAEDRVT14_OR2_0P5 U236 ( .A1(counter[7]), .A2(\sub_73/carry[7] ), .X(
        \sub_73/carry[8] ) );
  SAEDRVT14_EN2_1 U237 ( .A1(\sub_73/carry[7] ), .A2(counter[7]), .X(N53) );
  SAEDRVT14_OR2_0P5 U238 ( .A1(counter[6]), .A2(\sub_73/carry[6] ), .X(
        \sub_73/carry[7] ) );
  SAEDRVT14_EN2_1 U239 ( .A1(\sub_73/carry[6] ), .A2(counter[6]), .X(N52) );
  SAEDRVT14_OR2_0P5 U240 ( .A1(counter[5]), .A2(\sub_73/carry[5] ), .X(
        \sub_73/carry[6] ) );
  SAEDRVT14_EN2_1 U241 ( .A1(\sub_73/carry[5] ), .A2(counter[5]), .X(N51) );
  SAEDRVT14_OR2_0P5 U242 ( .A1(counter[4]), .A2(\sub_73/carry[4] ), .X(
        \sub_73/carry[5] ) );
  SAEDRVT14_EN2_1 U243 ( .A1(\sub_73/carry[4] ), .A2(counter[4]), .X(N50) );
  SAEDRVT14_OR2_0P5 U244 ( .A1(counter[3]), .A2(\sub_73/carry[3] ), .X(
        \sub_73/carry[4] ) );
  SAEDRVT14_EN2_1 U245 ( .A1(\sub_73/carry[3] ), .A2(counter[3]), .X(N49) );
  SAEDRVT14_OR2_0P5 U246 ( .A1(counter[2]), .A2(\sub_73/carry[2] ), .X(
        \sub_73/carry[3] ) );
  SAEDRVT14_EN2_1 U247 ( .A1(\sub_73/carry[2] ), .A2(counter[2]), .X(N48) );
  SAEDRVT14_AN2_1 U248 ( .A1(counter[0]), .A2(counter[1]), .X(
        \sub_73/carry[2] ) );
  SAEDRVT14_EO2_V1_0P75 U249 ( .A1(counter[1]), .A2(counter[0]), .X(N47) );
endmodule

