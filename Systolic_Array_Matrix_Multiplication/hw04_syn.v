/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Sat May  4 19:42:11 2019
/////////////////////////////////////////////////////////////


module PE_0_DW01_inc_0 ( A, SUM );
  input [7:0] A;
  output [7:0] SUM;

  wire   [7:2] carry;

  ADDHXL U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHXL U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  ADDHXL U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHXL U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHXL U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHXL U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  CLKINVX1 U1 ( .A(A[0]), .Y(SUM[0]) );
  XOR2X1 U2 ( .A(carry[7]), .B(A[7]), .Y(SUM[7]) );
endmodule


module PE_0_DW01_add_0 ( A, B, CI, SUM, CO );
  input [7:0] A;
  input [7:0] B;
  output [7:0] SUM;
  input CI;
  output CO;
  wire   n1, n2;
  wire   [7:1] carry;

  ADDFXL U1_1 ( .A(A[1]), .B(B[1]), .CI(carry[1]), .CO(carry[2]), .S(SUM[1])
         );
  ADDFXL U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  ADDFXL U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFXL U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  ADDFXL U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  ADDFXL U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  XOR3X1 U1_7 ( .A(A[7]), .B(B[7]), .C(carry[7]), .Y(SUM[7]) );
  XNOR2X1 U1 ( .A(B[0]), .B(n1), .Y(SUM[0]) );
  NOR2X1 U2 ( .A(n1), .B(n2), .Y(carry[1]) );
  CLKINVX1 U3 ( .A(B[0]), .Y(n2) );
  CLKINVX1 U4 ( .A(A[0]), .Y(n1) );
endmodule


module PE_0_DW_mult_uns_0 ( a, b, product );
  input [7:0] a;
  input [7:0] b;
  output [15:0] product;
  wire   n2, n3, n4, n5, n6, n7, n18, n19, n20, n21, n22, n23, n24, n25, n26,
         n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40,
         n41, n42, n43, n46, n48, n49, n51, n52, n53, n55, n56, n57, n58, n60,
         n61, n62, n63, n64, n66, n67, n68, n69, n70, n71, n73, n74, n75, n76,
         n77, n78, n123, n124, n125, n126, n127, n128, n129, n130, n131, n132,
         n133, n134, n135, n136, n137, n138, n139, n140, n141, n142, n143,
         n144, n145, n146, n147, n148, n149, n150, n151, n152, n153, n154;

  ADDFXL U3 ( .A(n20), .B(n27), .CI(n3), .CO(n2), .S(product[6]) );
  ADDFXL U4 ( .A(n28), .B(n34), .CI(n4), .CO(n3), .S(product[5]) );
  ADDFXL U5 ( .A(n35), .B(n38), .CI(n5), .CO(n4), .S(product[4]) );
  ADDFXL U6 ( .A(n39), .B(n41), .CI(n6), .CO(n5), .S(product[3]) );
  ADDFXL U7 ( .A(n7), .B(n64), .CI(n43), .CO(n6), .S(product[2]) );
  ADDHXL U8 ( .A(n71), .B(n78), .CO(n7), .S(product[1]) );
  CMPR42X1 U19 ( .A(n60), .B(n55), .C(n26), .D(n29), .ICI(n23), .S(n20), .ICO(
        n18), .CO(n19) );
  CMPR42X1 U20 ( .A(n73), .B(n51), .C(n66), .D(n31), .ICI(n25), .S(n23), .ICO(
        n21), .CO(n22) );
  ADDHXL U21 ( .A(n48), .B(n46), .CO(n24), .S(n25) );
  CMPR42X1 U22 ( .A(n67), .B(n61), .C(n33), .D(n32), .ICI(n30), .S(n28), .ICO(
        n26), .CO(n27) );
  ADDFXL U23 ( .A(n56), .B(n74), .CI(n36), .CO(n29), .S(n30) );
  ADDHXL U24 ( .A(n52), .B(n49), .CO(n31), .S(n32) );
  CMPR42X1 U25 ( .A(n75), .B(n62), .C(n68), .D(n40), .ICI(n37), .S(n35), .ICO(
        n33), .CO(n34) );
  ADDHXL U26 ( .A(n57), .B(n53), .CO(n36), .S(n37) );
  ADDFXL U27 ( .A(n69), .B(n76), .CI(n42), .CO(n38), .S(n39) );
  ADDHXL U28 ( .A(n63), .B(n58), .CO(n40), .S(n41) );
  ADDHXL U29 ( .A(n77), .B(n70), .CO(n42), .S(n43) );
  CLKINVX1 U84 ( .A(a[0]), .Y(n134) );
  CLKINVX1 U85 ( .A(b[0]), .Y(n128) );
  CLKINVX1 U86 ( .A(b[1]), .Y(n127) );
  CLKINVX1 U87 ( .A(a[1]), .Y(n133) );
  CLKINVX1 U88 ( .A(b[2]), .Y(n126) );
  CLKINVX1 U89 ( .A(a[2]), .Y(n132) );
  CLKINVX1 U90 ( .A(a[3]), .Y(n131) );
  CLKINVX1 U91 ( .A(b[3]), .Y(n125) );
  CLKINVX1 U92 ( .A(b[4]), .Y(n124) );
  CLKINVX1 U93 ( .A(a[4]), .Y(n130) );
  CLKINVX1 U94 ( .A(a[5]), .Y(n129) );
  CLKINVX1 U95 ( .A(b[5]), .Y(n123) );
  XOR2X1 U96 ( .A(n135), .B(n136), .Y(product[7]) );
  XOR2X1 U97 ( .A(n137), .B(n138), .Y(n136) );
  XOR2X1 U98 ( .A(n18), .B(n139), .Y(n138) );
  NOR2X1 U99 ( .A(n131), .B(n124), .Y(n139) );
  XOR2X1 U100 ( .A(n140), .B(n141), .Y(n137) );
  XOR2X1 U101 ( .A(n142), .B(n143), .Y(n141) );
  XOR2X1 U102 ( .A(n144), .B(n145), .Y(n143) );
  NAND2X1 U103 ( .A(b[5]), .B(a[2]), .Y(n145) );
  NAND2X1 U104 ( .A(b[6]), .B(a[1]), .Y(n144) );
  XOR2X1 U105 ( .A(n146), .B(n147), .Y(n142) );
  NAND2X1 U106 ( .A(b[3]), .B(a[4]), .Y(n147) );
  NAND2X1 U107 ( .A(b[1]), .B(a[6]), .Y(n146) );
  XOR2X1 U108 ( .A(n148), .B(n149), .Y(n140) );
  XOR2X1 U109 ( .A(n150), .B(n151), .Y(n149) );
  NAND2X1 U110 ( .A(b[0]), .B(a[7]), .Y(n151) );
  NAND2X1 U111 ( .A(b[2]), .B(a[5]), .Y(n150) );
  XNOR2X1 U112 ( .A(n24), .B(n152), .Y(n148) );
  NAND2X1 U113 ( .A(b[7]), .B(a[0]), .Y(n152) );
  XOR2X1 U114 ( .A(n153), .B(n154), .Y(n135) );
  XNOR2X1 U115 ( .A(n2), .B(n19), .Y(n154) );
  XNOR2X1 U116 ( .A(n22), .B(n21), .Y(n153) );
  NOR2X1 U117 ( .A(n134), .B(n128), .Y(product[0]) );
  NOR2X1 U118 ( .A(n134), .B(n127), .Y(n78) );
  NOR2X1 U119 ( .A(n134), .B(n126), .Y(n77) );
  NOR2X1 U120 ( .A(n134), .B(n125), .Y(n76) );
  NOR2X1 U121 ( .A(n134), .B(n124), .Y(n75) );
  NOR2X1 U122 ( .A(n134), .B(n123), .Y(n74) );
  AND2X1 U123 ( .A(b[6]), .B(a[0]), .Y(n73) );
  NOR2X1 U124 ( .A(n128), .B(n133), .Y(n71) );
  NOR2X1 U125 ( .A(n127), .B(n133), .Y(n70) );
  NOR2X1 U126 ( .A(n126), .B(n133), .Y(n69) );
  NOR2X1 U127 ( .A(n125), .B(n133), .Y(n68) );
  NOR2X1 U128 ( .A(n133), .B(n124), .Y(n67) );
  NOR2X1 U129 ( .A(n133), .B(n123), .Y(n66) );
  NOR2X1 U130 ( .A(n128), .B(n132), .Y(n64) );
  NOR2X1 U131 ( .A(n127), .B(n132), .Y(n63) );
  NOR2X1 U132 ( .A(n126), .B(n132), .Y(n62) );
  NOR2X1 U133 ( .A(n125), .B(n132), .Y(n61) );
  NOR2X1 U134 ( .A(n132), .B(n124), .Y(n60) );
  NOR2X1 U135 ( .A(n128), .B(n131), .Y(n58) );
  NOR2X1 U136 ( .A(n127), .B(n131), .Y(n57) );
  NOR2X1 U137 ( .A(n126), .B(n131), .Y(n56) );
  NOR2X1 U138 ( .A(n125), .B(n131), .Y(n55) );
  NOR2X1 U139 ( .A(n128), .B(n130), .Y(n53) );
  NOR2X1 U140 ( .A(n127), .B(n130), .Y(n52) );
  NOR2X1 U141 ( .A(n126), .B(n130), .Y(n51) );
  NOR2X1 U142 ( .A(n129), .B(n128), .Y(n49) );
  NOR2X1 U143 ( .A(n129), .B(n127), .Y(n48) );
  AND2X1 U144 ( .A(a[6]), .B(b[0]), .Y(n46) );
endmodule


module PE_0 ( clk, rst_n, START, A, B, Aout, Bout, Cout, DONE );
  input [7:0] A;
  input [7:0] B;
  output [7:0] Aout;
  output [7:0] Bout;
  output [7:0] Cout;
  input clk, rst_n, START;
  output DONE;
  wire   start, N9, N10, N11, N12, N13, N14, N15, N16, N17, N18, N19, N20, N21,
         N65, N66, N67, N68, N69, N70, N71, N72, N73, N74, N75, N76, N77, N78,
         N79, N80, N92, N93, N94, N95, N96, N97, N98, N99, n5, n8, n10, n11,
         n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25,
         n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39,
         n2, n3, n4, n6, n7;
  wire   [1:0] state;
  wire   [2:0] count;
  wire   [7:0] c;
  wire   [7:0] triggerCount;
  wire   [7:0] a;
  wire   [7:0] b;
  wire   SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, 
        SYNOPSYS_UNCONNECTED__4, SYNOPSYS_UNCONNECTED__5, 
        SYNOPSYS_UNCONNECTED__6, SYNOPSYS_UNCONNECTED__7;

  PE_0_DW01_inc_0 add_98 ( .A(triggerCount), .SUM({N99, N98, N97, N96, N95, 
        N94, N93, N92}) );
  PE_0_DW01_add_0 add_88 ( .A(c), .B({N72, N71, N70, N69, N68, N67, N66, N65}), 
        .CI(1'b0), .SUM({N80, N79, N78, N77, N76, N75, N74, N73}) );
  PE_0_DW_mult_uns_0 r319 ( .a(a), .b(b), .product({SYNOPSYS_UNCONNECTED__0, 
        SYNOPSYS_UNCONNECTED__1, SYNOPSYS_UNCONNECTED__2, 
        SYNOPSYS_UNCONNECTED__3, SYNOPSYS_UNCONNECTED__4, 
        SYNOPSYS_UNCONNECTED__5, SYNOPSYS_UNCONNECTED__6, 
        SYNOPSYS_UNCONNECTED__7, N72, N71, N70, N69, N68, N67, N66, N65}) );
  DFFQX1 \Cout_reg[7]  ( .D(n24), .CK(clk), .Q(Cout[7]) );
  DFFQX1 \Cout_reg[6]  ( .D(n25), .CK(clk), .Q(Cout[6]) );
  DFFQX1 \Cout_reg[5]  ( .D(n26), .CK(clk), .Q(Cout[5]) );
  DFFQX1 \Cout_reg[4]  ( .D(n27), .CK(clk), .Q(Cout[4]) );
  DFFQX1 \Cout_reg[3]  ( .D(n28), .CK(clk), .Q(Cout[3]) );
  DFFQX1 \Cout_reg[2]  ( .D(n29), .CK(clk), .Q(Cout[2]) );
  DFFQX1 \Cout_reg[1]  ( .D(n30), .CK(clk), .Q(Cout[1]) );
  DFFQX1 \Cout_reg[0]  ( .D(n31), .CK(clk), .Q(Cout[0]) );
  DFFQX1 \c_reg[7]  ( .D(N21), .CK(clk), .Q(c[7]) );
  DFFQX1 \count_reg[1]  ( .D(N12), .CK(clk), .Q(count[1]) );
  DFFQX1 \count_reg[0]  ( .D(N11), .CK(clk), .Q(count[0]) );
  DFFX1 \count_reg[2]  ( .D(N13), .CK(clk), .QN(n8) );
  DFFTRX1 start_reg ( .D(START), .RN(rst_n), .CK(clk), .Q(start), .QN(n5) );
  DFFQX1 \state_reg[1]  ( .D(N10), .CK(clk), .Q(state[1]) );
  DFFQX1 \state_reg[0]  ( .D(N9), .CK(clk), .Q(state[0]) );
  DFFQX1 \c_reg[1]  ( .D(N15), .CK(clk), .Q(c[1]) );
  DFFQX1 \c_reg[2]  ( .D(N16), .CK(clk), .Q(c[2]) );
  DFFQX1 \c_reg[3]  ( .D(N17), .CK(clk), .Q(c[3]) );
  DFFQX1 \c_reg[4]  ( .D(N18), .CK(clk), .Q(c[4]) );
  DFFQX1 \c_reg[5]  ( .D(N19), .CK(clk), .Q(c[5]) );
  DFFQX1 \c_reg[6]  ( .D(N20), .CK(clk), .Q(c[6]) );
  DFFQX1 \triggerCount_reg[7]  ( .D(n39), .CK(clk), .Q(triggerCount[7]) );
  DFFQX1 \c_reg[0]  ( .D(N14), .CK(clk), .Q(c[0]) );
  DFFQX1 \triggerCount_reg[0]  ( .D(n38), .CK(clk), .Q(triggerCount[0]) );
  DFFQX1 \triggerCount_reg[1]  ( .D(n37), .CK(clk), .Q(triggerCount[1]) );
  DFFQX1 \triggerCount_reg[2]  ( .D(n36), .CK(clk), .Q(triggerCount[2]) );
  DFFQX1 \triggerCount_reg[5]  ( .D(n33), .CK(clk), .Q(triggerCount[5]) );
  DFFQX1 \triggerCount_reg[6]  ( .D(n32), .CK(clk), .Q(triggerCount[6]) );
  DFFQX1 \triggerCount_reg[4]  ( .D(n34), .CK(clk), .Q(triggerCount[4]) );
  DFFQX1 \triggerCount_reg[3]  ( .D(n35), .CK(clk), .Q(triggerCount[3]) );
  DFFTRX1 \a_reg[7]  ( .D(A[7]), .RN(rst_n), .CK(clk), .Q(a[7]) );
  DFFTRX1 \b_reg[7]  ( .D(B[7]), .RN(rst_n), .CK(clk), .Q(b[7]) );
  DFFTRX1 DONE_reg ( .D(n17), .RN(n7), .CK(clk), .Q(DONE) );
  DFFTRX1 \a_reg[6]  ( .D(A[6]), .RN(rst_n), .CK(clk), .Q(a[6]) );
  DFFTRX1 \b_reg[6]  ( .D(B[6]), .RN(rst_n), .CK(clk), .Q(b[6]) );
  DFFTRX1 \a_reg[5]  ( .D(A[5]), .RN(rst_n), .CK(clk), .Q(a[5]) );
  DFFTRX1 \a_reg[4]  ( .D(A[4]), .RN(rst_n), .CK(clk), .Q(a[4]) );
  DFFTRX1 \b_reg[5]  ( .D(B[5]), .RN(rst_n), .CK(clk), .Q(b[5]) );
  DFFTRX1 \b_reg[4]  ( .D(B[4]), .RN(rst_n), .CK(clk), .Q(b[4]) );
  DFFTRX1 \a_reg[3]  ( .D(A[3]), .RN(rst_n), .CK(clk), .Q(a[3]) );
  DFFTRX1 \a_reg[2]  ( .D(A[2]), .RN(rst_n), .CK(clk), .Q(a[2]) );
  DFFTRX1 \a_reg[1]  ( .D(A[1]), .RN(rst_n), .CK(clk), .Q(a[1]) );
  DFFTRX1 \b_reg[3]  ( .D(B[3]), .RN(rst_n), .CK(clk), .Q(b[3]) );
  DFFTRX1 \b_reg[2]  ( .D(B[2]), .RN(rst_n), .CK(clk), .Q(b[2]) );
  DFFTRX1 \b_reg[1]  ( .D(B[1]), .RN(rst_n), .CK(clk), .Q(b[1]) );
  DFFTRX1 \a_reg[0]  ( .D(A[0]), .RN(rst_n), .CK(clk), .Q(a[0]) );
  DFFTRX1 \b_reg[0]  ( .D(B[0]), .RN(rst_n), .CK(clk), .Q(b[0]) );
  DFFTRX1 \Bout_reg[7]  ( .D(B[7]), .RN(rst_n), .CK(clk), .Q(Bout[7]) );
  DFFTRX1 \Bout_reg[6]  ( .D(B[6]), .RN(rst_n), .CK(clk), .Q(Bout[6]) );
  DFFTRX1 \Bout_reg[5]  ( .D(B[5]), .RN(rst_n), .CK(clk), .Q(Bout[5]) );
  DFFTRX1 \Bout_reg[4]  ( .D(B[4]), .RN(rst_n), .CK(clk), .Q(Bout[4]) );
  DFFTRX1 \Bout_reg[3]  ( .D(B[3]), .RN(rst_n), .CK(clk), .Q(Bout[3]) );
  DFFTRX1 \Bout_reg[2]  ( .D(B[2]), .RN(rst_n), .CK(clk), .Q(Bout[2]) );
  DFFTRX1 \Bout_reg[1]  ( .D(B[1]), .RN(rst_n), .CK(clk), .Q(Bout[1]) );
  DFFTRX1 \Bout_reg[0]  ( .D(B[0]), .RN(rst_n), .CK(clk), .Q(Bout[0]) );
  DFFTRX1 \Aout_reg[7]  ( .D(A[7]), .RN(rst_n), .CK(clk), .Q(Aout[7]) );
  DFFTRX1 \Aout_reg[6]  ( .D(A[6]), .RN(rst_n), .CK(clk), .Q(Aout[6]) );
  DFFTRX1 \Aout_reg[5]  ( .D(A[5]), .RN(rst_n), .CK(clk), .Q(Aout[5]) );
  DFFTRX1 \Aout_reg[4]  ( .D(A[4]), .RN(rst_n), .CK(clk), .Q(Aout[4]) );
  DFFTRX1 \Aout_reg[3]  ( .D(A[3]), .RN(rst_n), .CK(clk), .Q(Aout[3]) );
  DFFTRX1 \Aout_reg[2]  ( .D(A[2]), .RN(rst_n), .CK(clk), .Q(Aout[2]) );
  DFFTRX1 \Aout_reg[1]  ( .D(A[1]), .RN(rst_n), .CK(clk), .Q(Aout[1]) );
  DFFTRX1 \Aout_reg[0]  ( .D(A[0]), .RN(rst_n), .CK(clk), .Q(Aout[0]) );
  AOI221XL U3 ( .A0(n14), .A1(n15), .B0(n6), .B1(state[1]), .C0(n2), .Y(n13)
         );
  CLKINVX1 U4 ( .A(n19), .Y(n4) );
  CLKINVX1 U5 ( .A(n12), .Y(n7) );
  AO22X1 U6 ( .A0(N71), .A1(n4), .B0(N79), .B1(n3), .Y(N20) );
  AO22X1 U8 ( .A0(N70), .A1(n4), .B0(N78), .B1(n3), .Y(N19) );
  AO22X1 U9 ( .A0(N69), .A1(n4), .B0(N77), .B1(n3), .Y(N18) );
  AO22X1 U10 ( .A0(N66), .A1(n4), .B0(N74), .B1(n3), .Y(N15) );
  AO22X1 U11 ( .A0(N68), .A1(n4), .B0(N76), .B1(n3), .Y(N17) );
  AO22X1 U12 ( .A0(N67), .A1(n4), .B0(N75), .B1(n3), .Y(N16) );
  AO22X1 U13 ( .A0(N65), .A1(n4), .B0(N73), .B1(n3), .Y(N14) );
  NAND2X1 U14 ( .A(rst_n), .B(n15), .Y(n12) );
  NAND2X1 U15 ( .A(n17), .B(n7), .Y(n19) );
  CLKINVX1 U16 ( .A(n20), .Y(n3) );
  CLKINVX1 U17 ( .A(n15), .Y(n6) );
  NOR2X1 U18 ( .A(n12), .B(n14), .Y(N9) );
  AO22X1 U19 ( .A0(N72), .A1(n4), .B0(N80), .B1(n3), .Y(N21) );
  NOR2BX1 U20 ( .AN(state[1]), .B(state[0]), .Y(n15) );
  OAI21XL U21 ( .A0(n17), .A1(n12), .B0(n18), .Y(n16) );
  OAI211X1 U22 ( .A0(state[0]), .A1(start), .B0(n6), .C0(rst_n), .Y(n18) );
  NAND4BX1 U23 ( .AN(triggerCount[0]), .B(triggerCount[7]), .C(n22), .D(n23), 
        .Y(n14) );
  NOR2X1 U24 ( .A(triggerCount[2]), .B(triggerCount[1]), .Y(n22) );
  NOR4X1 U25 ( .A(triggerCount[6]), .B(triggerCount[5]), .C(triggerCount[4]), 
        .D(triggerCount[3]), .Y(n23) );
  NOR2BX1 U26 ( .AN(n14), .B(n8), .Y(n17) );
  NOR3X1 U27 ( .A(n12), .B(n13), .C(n8), .Y(n11) );
  NAND3X1 U28 ( .A(n14), .B(n8), .C(n7), .Y(n20) );
  AO21X1 U29 ( .A0(n8), .A1(n7), .B0(n13), .Y(n10) );
  OAI21XL U30 ( .A0(count[0]), .A1(n20), .B0(n19), .Y(N11) );
  AO22X1 U31 ( .A0(n16), .A1(triggerCount[7]), .B0(N99), .B1(n4), .Y(n39) );
  AO22X1 U32 ( .A0(n16), .A1(triggerCount[0]), .B0(N92), .B1(n4), .Y(n38) );
  AO22X1 U33 ( .A0(Cout[1]), .A1(n10), .B0(c[1]), .B1(n11), .Y(n30) );
  AO22X1 U34 ( .A0(Cout[2]), .A1(n10), .B0(c[2]), .B1(n11), .Y(n29) );
  AO22X1 U35 ( .A0(Cout[3]), .A1(n10), .B0(c[3]), .B1(n11), .Y(n28) );
  AO22X1 U36 ( .A0(Cout[4]), .A1(n10), .B0(c[4]), .B1(n11), .Y(n27) );
  AO22X1 U37 ( .A0(Cout[5]), .A1(n10), .B0(c[5]), .B1(n11), .Y(n26) );
  AO22X1 U38 ( .A0(Cout[6]), .A1(n10), .B0(c[6]), .B1(n11), .Y(n25) );
  AO22X1 U39 ( .A0(Cout[7]), .A1(n10), .B0(c[7]), .B1(n11), .Y(n24) );
  AO22X1 U40 ( .A0(Cout[0]), .A1(n10), .B0(c[0]), .B1(n11), .Y(n31) );
  AO22X1 U41 ( .A0(n16), .A1(triggerCount[6]), .B0(N98), .B1(n4), .Y(n32) );
  AO22X1 U42 ( .A0(n16), .A1(triggerCount[5]), .B0(N97), .B1(n4), .Y(n33) );
  AO22X1 U43 ( .A0(n16), .A1(triggerCount[4]), .B0(N96), .B1(n4), .Y(n34) );
  AO22X1 U44 ( .A0(n16), .A1(triggerCount[3]), .B0(N95), .B1(n4), .Y(n35) );
  AO22X1 U45 ( .A0(n16), .A1(triggerCount[2]), .B0(N94), .B1(n4), .Y(n36) );
  AO22X1 U46 ( .A0(n16), .A1(triggerCount[1]), .B0(N93), .B1(n4), .Y(n37) );
  AND3X2 U47 ( .A(count[1]), .B(n3), .C(count[0]), .Y(N13) );
  NOR2X1 U48 ( .A(n21), .B(n20), .Y(N12) );
  XNOR2X1 U49 ( .A(count[0]), .B(count[1]), .Y(n21) );
  OAI31XL U50 ( .A0(n5), .A1(state[0]), .A2(n2), .B0(n12), .Y(N10) );
  CLKINVX1 U51 ( .A(rst_n), .Y(n2) );
endmodule


module PE_15_DW01_inc_0 ( A, SUM );
  input [7:0] A;
  output [7:0] SUM;

  wire   [7:2] carry;

  ADDHXL U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHXL U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  ADDHXL U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHXL U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHXL U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHXL U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  CLKINVX1 U1 ( .A(A[0]), .Y(SUM[0]) );
  XOR2X1 U2 ( .A(carry[7]), .B(A[7]), .Y(SUM[7]) );
endmodule


module PE_15_DW01_add_0 ( A, B, CI, SUM, CO );
  input [7:0] A;
  input [7:0] B;
  output [7:0] SUM;
  input CI;
  output CO;
  wire   n1, n2;
  wire   [7:1] carry;

  ADDFXL U1_1 ( .A(A[1]), .B(B[1]), .CI(carry[1]), .CO(carry[2]), .S(SUM[1])
         );
  ADDFXL U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  ADDFXL U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFXL U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  ADDFXL U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  ADDFXL U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  XOR3X1 U1_7 ( .A(A[7]), .B(B[7]), .C(carry[7]), .Y(SUM[7]) );
  XNOR2X1 U1 ( .A(B[0]), .B(n1), .Y(SUM[0]) );
  NOR2X1 U2 ( .A(n1), .B(n2), .Y(carry[1]) );
  CLKINVX1 U3 ( .A(B[0]), .Y(n2) );
  CLKINVX1 U4 ( .A(A[0]), .Y(n1) );
endmodule


module PE_15_DW_mult_uns_0 ( a, b, product );
  input [7:0] a;
  input [7:0] b;
  output [15:0] product;
  wire   n2, n3, n4, n5, n6, n7, n18, n19, n20, n21, n22, n23, n24, n25, n26,
         n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40,
         n41, n42, n43, n46, n48, n49, n51, n52, n53, n55, n56, n57, n58, n60,
         n61, n62, n63, n64, n66, n67, n68, n69, n70, n71, n73, n74, n75, n76,
         n77, n78, n123, n124, n125, n126, n127, n128, n129, n130, n131, n132,
         n133, n134, n135, n136, n137, n138, n139, n140, n141, n142, n143,
         n144, n145, n146, n147, n148, n149, n150, n151, n152, n153, n154;

  ADDFXL U3 ( .A(n20), .B(n27), .CI(n3), .CO(n2), .S(product[6]) );
  ADDFXL U4 ( .A(n28), .B(n34), .CI(n4), .CO(n3), .S(product[5]) );
  ADDFXL U5 ( .A(n35), .B(n38), .CI(n5), .CO(n4), .S(product[4]) );
  ADDFXL U6 ( .A(n39), .B(n41), .CI(n6), .CO(n5), .S(product[3]) );
  ADDFXL U7 ( .A(n7), .B(n64), .CI(n43), .CO(n6), .S(product[2]) );
  ADDHXL U8 ( .A(n71), .B(n78), .CO(n7), .S(product[1]) );
  CMPR42X1 U19 ( .A(n60), .B(n55), .C(n26), .D(n29), .ICI(n23), .S(n20), .ICO(
        n18), .CO(n19) );
  CMPR42X1 U20 ( .A(n73), .B(n51), .C(n66), .D(n31), .ICI(n25), .S(n23), .ICO(
        n21), .CO(n22) );
  ADDHXL U21 ( .A(n48), .B(n46), .CO(n24), .S(n25) );
  CMPR42X1 U22 ( .A(n67), .B(n61), .C(n33), .D(n32), .ICI(n30), .S(n28), .ICO(
        n26), .CO(n27) );
  ADDFXL U23 ( .A(n56), .B(n74), .CI(n36), .CO(n29), .S(n30) );
  ADDHXL U24 ( .A(n52), .B(n49), .CO(n31), .S(n32) );
  CMPR42X1 U25 ( .A(n75), .B(n62), .C(n68), .D(n40), .ICI(n37), .S(n35), .ICO(
        n33), .CO(n34) );
  ADDHXL U26 ( .A(n57), .B(n53), .CO(n36), .S(n37) );
  ADDFXL U27 ( .A(n69), .B(n76), .CI(n42), .CO(n38), .S(n39) );
  ADDHXL U28 ( .A(n63), .B(n58), .CO(n40), .S(n41) );
  ADDHXL U29 ( .A(n77), .B(n70), .CO(n42), .S(n43) );
  CLKINVX1 U84 ( .A(a[0]), .Y(n134) );
  CLKINVX1 U85 ( .A(b[0]), .Y(n128) );
  CLKINVX1 U86 ( .A(b[1]), .Y(n127) );
  CLKINVX1 U87 ( .A(a[1]), .Y(n133) );
  CLKINVX1 U88 ( .A(b[2]), .Y(n126) );
  CLKINVX1 U89 ( .A(a[2]), .Y(n132) );
  CLKINVX1 U90 ( .A(a[3]), .Y(n131) );
  CLKINVX1 U91 ( .A(b[3]), .Y(n125) );
  CLKINVX1 U92 ( .A(b[4]), .Y(n124) );
  CLKINVX1 U93 ( .A(a[4]), .Y(n130) );
  CLKINVX1 U94 ( .A(a[5]), .Y(n129) );
  CLKINVX1 U95 ( .A(b[5]), .Y(n123) );
  XOR2X1 U96 ( .A(n135), .B(n136), .Y(product[7]) );
  XOR2X1 U97 ( .A(n137), .B(n138), .Y(n136) );
  XOR2X1 U98 ( .A(n18), .B(n139), .Y(n138) );
  NOR2X1 U99 ( .A(n131), .B(n124), .Y(n139) );
  XOR2X1 U100 ( .A(n140), .B(n141), .Y(n137) );
  XOR2X1 U101 ( .A(n142), .B(n143), .Y(n141) );
  XOR2X1 U102 ( .A(n144), .B(n145), .Y(n143) );
  NAND2X1 U103 ( .A(b[5]), .B(a[2]), .Y(n145) );
  NAND2X1 U104 ( .A(b[6]), .B(a[1]), .Y(n144) );
  XOR2X1 U105 ( .A(n146), .B(n147), .Y(n142) );
  NAND2X1 U106 ( .A(b[3]), .B(a[4]), .Y(n147) );
  NAND2X1 U107 ( .A(b[1]), .B(a[6]), .Y(n146) );
  XOR2X1 U108 ( .A(n148), .B(n149), .Y(n140) );
  XOR2X1 U109 ( .A(n150), .B(n151), .Y(n149) );
  NAND2X1 U110 ( .A(b[0]), .B(a[7]), .Y(n151) );
  NAND2X1 U111 ( .A(b[2]), .B(a[5]), .Y(n150) );
  XNOR2X1 U112 ( .A(n24), .B(n152), .Y(n148) );
  NAND2X1 U113 ( .A(b[7]), .B(a[0]), .Y(n152) );
  XOR2X1 U114 ( .A(n153), .B(n154), .Y(n135) );
  XNOR2X1 U115 ( .A(n2), .B(n19), .Y(n154) );
  XNOR2X1 U116 ( .A(n22), .B(n21), .Y(n153) );
  NOR2X1 U117 ( .A(n134), .B(n128), .Y(product[0]) );
  NOR2X1 U118 ( .A(n134), .B(n127), .Y(n78) );
  NOR2X1 U119 ( .A(n134), .B(n126), .Y(n77) );
  NOR2X1 U120 ( .A(n134), .B(n125), .Y(n76) );
  NOR2X1 U121 ( .A(n134), .B(n124), .Y(n75) );
  NOR2X1 U122 ( .A(n134), .B(n123), .Y(n74) );
  AND2X1 U123 ( .A(b[6]), .B(a[0]), .Y(n73) );
  NOR2X1 U124 ( .A(n128), .B(n133), .Y(n71) );
  NOR2X1 U125 ( .A(n127), .B(n133), .Y(n70) );
  NOR2X1 U126 ( .A(n126), .B(n133), .Y(n69) );
  NOR2X1 U127 ( .A(n125), .B(n133), .Y(n68) );
  NOR2X1 U128 ( .A(n133), .B(n124), .Y(n67) );
  NOR2X1 U129 ( .A(n133), .B(n123), .Y(n66) );
  NOR2X1 U130 ( .A(n128), .B(n132), .Y(n64) );
  NOR2X1 U131 ( .A(n127), .B(n132), .Y(n63) );
  NOR2X1 U132 ( .A(n126), .B(n132), .Y(n62) );
  NOR2X1 U133 ( .A(n125), .B(n132), .Y(n61) );
  NOR2X1 U134 ( .A(n132), .B(n124), .Y(n60) );
  NOR2X1 U135 ( .A(n128), .B(n131), .Y(n58) );
  NOR2X1 U136 ( .A(n127), .B(n131), .Y(n57) );
  NOR2X1 U137 ( .A(n126), .B(n131), .Y(n56) );
  NOR2X1 U138 ( .A(n125), .B(n131), .Y(n55) );
  NOR2X1 U139 ( .A(n128), .B(n130), .Y(n53) );
  NOR2X1 U140 ( .A(n127), .B(n130), .Y(n52) );
  NOR2X1 U141 ( .A(n126), .B(n130), .Y(n51) );
  NOR2X1 U142 ( .A(n129), .B(n128), .Y(n49) );
  NOR2X1 U143 ( .A(n129), .B(n127), .Y(n48) );
  AND2X1 U144 ( .A(a[6]), .B(b[0]), .Y(n46) );
endmodule


module PE_15 ( clk, rst_n, START, A, B, Aout, Bout, Cout, DONE );
  input [7:0] A;
  input [7:0] B;
  output [7:0] Aout;
  output [7:0] Bout;
  output [7:0] Cout;
  input clk, rst_n, START;
  output DONE;
  wire   start, N9, N10, N11, N12, N13, N14, N15, N16, N17, N18, N19, N20, N21,
         N65, N66, N67, N68, N69, N70, N71, N72, N73, N74, N75, N76, N77, N78,
         N79, N80, N92, N93, N94, N95, N96, N97, N98, N99, n2, n3, n4, n6, n7,
         n9, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51,
         n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65,
         n66, n67, n68, n69;
  wire   [1:0] state;
  wire   [2:0] count;
  wire   [7:0] c;
  wire   [7:0] triggerCount;
  wire   [7:0] a;
  wire   [7:0] b;
  wire   SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, 
        SYNOPSYS_UNCONNECTED__4, SYNOPSYS_UNCONNECTED__5, 
        SYNOPSYS_UNCONNECTED__6, SYNOPSYS_UNCONNECTED__7;

  PE_15_DW01_inc_0 add_98 ( .A(triggerCount), .SUM({N99, N98, N97, N96, N95, 
        N94, N93, N92}) );
  PE_15_DW01_add_0 add_88 ( .A(c), .B({N72, N71, N70, N69, N68, N67, N66, N65}), .CI(1'b0), .SUM({N80, N79, N78, N77, N76, N75, N74, N73}) );
  PE_15_DW_mult_uns_0 r319 ( .a(a), .b(b), .product({SYNOPSYS_UNCONNECTED__0, 
        SYNOPSYS_UNCONNECTED__1, SYNOPSYS_UNCONNECTED__2, 
        SYNOPSYS_UNCONNECTED__3, SYNOPSYS_UNCONNECTED__4, 
        SYNOPSYS_UNCONNECTED__5, SYNOPSYS_UNCONNECTED__6, 
        SYNOPSYS_UNCONNECTED__7, N72, N71, N70, N69, N68, N67, N66, N65}) );
  DFFQX1 \Cout_reg[7]  ( .D(n53), .CK(clk), .Q(Cout[7]) );
  DFFQX1 \Cout_reg[6]  ( .D(n52), .CK(clk), .Q(Cout[6]) );
  DFFQX1 \Cout_reg[5]  ( .D(n51), .CK(clk), .Q(Cout[5]) );
  DFFQX1 \Cout_reg[4]  ( .D(n50), .CK(clk), .Q(Cout[4]) );
  DFFQX1 \Cout_reg[3]  ( .D(n49), .CK(clk), .Q(Cout[3]) );
  DFFQX1 \Cout_reg[2]  ( .D(n48), .CK(clk), .Q(Cout[2]) );
  DFFQX1 \Cout_reg[1]  ( .D(n47), .CK(clk), .Q(Cout[1]) );
  DFFQX1 \Cout_reg[0]  ( .D(n46), .CK(clk), .Q(Cout[0]) );
  DFFQX1 \c_reg[7]  ( .D(N21), .CK(clk), .Q(c[7]) );
  DFFQX1 \count_reg[1]  ( .D(N12), .CK(clk), .Q(count[1]) );
  DFFQX1 \count_reg[0]  ( .D(N11), .CK(clk), .Q(count[0]) );
  DFFX1 \count_reg[2]  ( .D(N13), .CK(clk), .QN(n68) );
  DFFTRX1 start_reg ( .D(START), .RN(rst_n), .CK(clk), .Q(start), .QN(n69) );
  DFFQX1 \state_reg[1]  ( .D(N10), .CK(clk), .Q(state[1]) );
  DFFQX1 \state_reg[0]  ( .D(N9), .CK(clk), .Q(state[0]) );
  DFFQX1 \c_reg[1]  ( .D(N15), .CK(clk), .Q(c[1]) );
  DFFQX1 \c_reg[2]  ( .D(N16), .CK(clk), .Q(c[2]) );
  DFFQX1 \c_reg[3]  ( .D(N17), .CK(clk), .Q(c[3]) );
  DFFQX1 \c_reg[4]  ( .D(N18), .CK(clk), .Q(c[4]) );
  DFFQX1 \c_reg[5]  ( .D(N19), .CK(clk), .Q(c[5]) );
  DFFQX1 \c_reg[6]  ( .D(N20), .CK(clk), .Q(c[6]) );
  DFFQX1 \triggerCount_reg[7]  ( .D(n9), .CK(clk), .Q(triggerCount[7]) );
  DFFQX1 \c_reg[0]  ( .D(N14), .CK(clk), .Q(c[0]) );
  DFFQX1 \triggerCount_reg[0]  ( .D(n39), .CK(clk), .Q(triggerCount[0]) );
  DFFQX1 \triggerCount_reg[1]  ( .D(n40), .CK(clk), .Q(triggerCount[1]) );
  DFFQX1 \triggerCount_reg[2]  ( .D(n41), .CK(clk), .Q(triggerCount[2]) );
  DFFQX1 \triggerCount_reg[5]  ( .D(n44), .CK(clk), .Q(triggerCount[5]) );
  DFFQX1 \triggerCount_reg[6]  ( .D(n45), .CK(clk), .Q(triggerCount[6]) );
  DFFQX1 \triggerCount_reg[4]  ( .D(n43), .CK(clk), .Q(triggerCount[4]) );
  DFFQX1 \triggerCount_reg[3]  ( .D(n42), .CK(clk), .Q(triggerCount[3]) );
  DFFTRX1 \a_reg[7]  ( .D(A[7]), .RN(rst_n), .CK(clk), .Q(a[7]) );
  DFFTRX1 \b_reg[7]  ( .D(B[7]), .RN(rst_n), .CK(clk), .Q(b[7]) );
  DFFTRX1 DONE_reg ( .D(n60), .RN(n7), .CK(clk), .Q(DONE) );
  DFFTRX1 \a_reg[6]  ( .D(A[6]), .RN(rst_n), .CK(clk), .Q(a[6]) );
  DFFTRX1 \b_reg[6]  ( .D(B[6]), .RN(rst_n), .CK(clk), .Q(b[6]) );
  DFFTRX1 \a_reg[5]  ( .D(A[5]), .RN(rst_n), .CK(clk), .Q(a[5]) );
  DFFTRX1 \a_reg[4]  ( .D(A[4]), .RN(rst_n), .CK(clk), .Q(a[4]) );
  DFFTRX1 \b_reg[5]  ( .D(B[5]), .RN(rst_n), .CK(clk), .Q(b[5]) );
  DFFTRX1 \b_reg[4]  ( .D(B[4]), .RN(rst_n), .CK(clk), .Q(b[4]) );
  DFFTRX1 \a_reg[3]  ( .D(A[3]), .RN(rst_n), .CK(clk), .Q(a[3]) );
  DFFTRX1 \a_reg[2]  ( .D(A[2]), .RN(rst_n), .CK(clk), .Q(a[2]) );
  DFFTRX1 \a_reg[1]  ( .D(A[1]), .RN(rst_n), .CK(clk), .Q(a[1]) );
  DFFTRX1 \b_reg[3]  ( .D(B[3]), .RN(rst_n), .CK(clk), .Q(b[3]) );
  DFFTRX1 \b_reg[2]  ( .D(B[2]), .RN(rst_n), .CK(clk), .Q(b[2]) );
  DFFTRX1 \b_reg[1]  ( .D(B[1]), .RN(rst_n), .CK(clk), .Q(b[1]) );
  DFFTRX1 \a_reg[0]  ( .D(A[0]), .RN(rst_n), .CK(clk), .Q(a[0]) );
  DFFTRX1 \b_reg[0]  ( .D(B[0]), .RN(rst_n), .CK(clk), .Q(b[0]) );
  DFFTRX1 \Bout_reg[7]  ( .D(B[7]), .RN(rst_n), .CK(clk), .Q(Bout[7]) );
  DFFTRX1 \Bout_reg[6]  ( .D(B[6]), .RN(rst_n), .CK(clk), .Q(Bout[6]) );
  DFFTRX1 \Bout_reg[5]  ( .D(B[5]), .RN(rst_n), .CK(clk), .Q(Bout[5]) );
  DFFTRX1 \Bout_reg[4]  ( .D(B[4]), .RN(rst_n), .CK(clk), .Q(Bout[4]) );
  DFFTRX1 \Bout_reg[3]  ( .D(B[3]), .RN(rst_n), .CK(clk), .Q(Bout[3]) );
  DFFTRX1 \Bout_reg[2]  ( .D(B[2]), .RN(rst_n), .CK(clk), .Q(Bout[2]) );
  DFFTRX1 \Bout_reg[1]  ( .D(B[1]), .RN(rst_n), .CK(clk), .Q(Bout[1]) );
  DFFTRX1 \Bout_reg[0]  ( .D(B[0]), .RN(rst_n), .CK(clk), .Q(Bout[0]) );
  DFFTRX1 \Aout_reg[7]  ( .D(A[7]), .RN(rst_n), .CK(clk), .Q(Aout[7]) );
  DFFTRX1 \Aout_reg[6]  ( .D(A[6]), .RN(rst_n), .CK(clk), .Q(Aout[6]) );
  DFFTRX1 \Aout_reg[5]  ( .D(A[5]), .RN(rst_n), .CK(clk), .Q(Aout[5]) );
  DFFTRX1 \Aout_reg[4]  ( .D(A[4]), .RN(rst_n), .CK(clk), .Q(Aout[4]) );
  DFFTRX1 \Aout_reg[3]  ( .D(A[3]), .RN(rst_n), .CK(clk), .Q(Aout[3]) );
  DFFTRX1 \Aout_reg[2]  ( .D(A[2]), .RN(rst_n), .CK(clk), .Q(Aout[2]) );
  DFFTRX1 \Aout_reg[1]  ( .D(A[1]), .RN(rst_n), .CK(clk), .Q(Aout[1]) );
  DFFTRX1 \Aout_reg[0]  ( .D(A[0]), .RN(rst_n), .CK(clk), .Q(Aout[0]) );
  AOI221XL U3 ( .A0(n63), .A1(n62), .B0(n6), .B1(state[1]), .C0(n2), .Y(n64)
         );
  CLKINVX1 U4 ( .A(n58), .Y(n4) );
  CLKINVX1 U5 ( .A(n65), .Y(n7) );
  AO22X1 U6 ( .A0(N71), .A1(n4), .B0(N79), .B1(n3), .Y(N20) );
  AO22X1 U8 ( .A0(N70), .A1(n4), .B0(N78), .B1(n3), .Y(N19) );
  AO22X1 U9 ( .A0(N69), .A1(n4), .B0(N77), .B1(n3), .Y(N18) );
  AO22X1 U10 ( .A0(N66), .A1(n4), .B0(N74), .B1(n3), .Y(N15) );
  AO22X1 U11 ( .A0(N68), .A1(n4), .B0(N76), .B1(n3), .Y(N17) );
  AO22X1 U12 ( .A0(N67), .A1(n4), .B0(N75), .B1(n3), .Y(N16) );
  AO22X1 U13 ( .A0(N65), .A1(n4), .B0(N73), .B1(n3), .Y(N14) );
  NAND2X1 U14 ( .A(rst_n), .B(n62), .Y(n65) );
  NAND2X1 U15 ( .A(n60), .B(n7), .Y(n58) );
  CLKINVX1 U16 ( .A(n57), .Y(n3) );
  CLKINVX1 U17 ( .A(n62), .Y(n6) );
  NOR2X1 U18 ( .A(n65), .B(n63), .Y(N9) );
  AO22X1 U19 ( .A0(N72), .A1(n4), .B0(N80), .B1(n3), .Y(N21) );
  NOR2BX1 U20 ( .AN(state[1]), .B(state[0]), .Y(n62) );
  OAI21XL U21 ( .A0(n60), .A1(n65), .B0(n59), .Y(n61) );
  OAI211X1 U22 ( .A0(state[0]), .A1(start), .B0(n6), .C0(rst_n), .Y(n59) );
  NAND4BX1 U23 ( .AN(triggerCount[0]), .B(triggerCount[7]), .C(n55), .D(n54), 
        .Y(n63) );
  NOR2X1 U24 ( .A(triggerCount[2]), .B(triggerCount[1]), .Y(n55) );
  NOR4X1 U25 ( .A(triggerCount[6]), .B(triggerCount[5]), .C(triggerCount[4]), 
        .D(triggerCount[3]), .Y(n54) );
  NOR2BX1 U26 ( .AN(n63), .B(n68), .Y(n60) );
  NOR3X1 U27 ( .A(n65), .B(n64), .C(n68), .Y(n66) );
  NAND3X1 U28 ( .A(n63), .B(n68), .C(n7), .Y(n57) );
  AO21X1 U29 ( .A0(n68), .A1(n7), .B0(n64), .Y(n67) );
  OAI21XL U30 ( .A0(count[0]), .A1(n57), .B0(n58), .Y(N11) );
  AO22X1 U31 ( .A0(n61), .A1(triggerCount[7]), .B0(N99), .B1(n4), .Y(n9) );
  AO22X1 U32 ( .A0(n61), .A1(triggerCount[0]), .B0(N92), .B1(n4), .Y(n39) );
  AO22X1 U33 ( .A0(Cout[1]), .A1(n67), .B0(c[1]), .B1(n66), .Y(n47) );
  AO22X1 U34 ( .A0(Cout[2]), .A1(n67), .B0(c[2]), .B1(n66), .Y(n48) );
  AO22X1 U35 ( .A0(Cout[3]), .A1(n67), .B0(c[3]), .B1(n66), .Y(n49) );
  AO22X1 U36 ( .A0(Cout[4]), .A1(n67), .B0(c[4]), .B1(n66), .Y(n50) );
  AO22X1 U37 ( .A0(Cout[5]), .A1(n67), .B0(c[5]), .B1(n66), .Y(n51) );
  AO22X1 U38 ( .A0(Cout[6]), .A1(n67), .B0(c[6]), .B1(n66), .Y(n52) );
  AO22X1 U39 ( .A0(Cout[7]), .A1(n67), .B0(c[7]), .B1(n66), .Y(n53) );
  AO22X1 U40 ( .A0(Cout[0]), .A1(n67), .B0(c[0]), .B1(n66), .Y(n46) );
  AO22X1 U41 ( .A0(n61), .A1(triggerCount[6]), .B0(N98), .B1(n4), .Y(n45) );
  AO22X1 U42 ( .A0(n61), .A1(triggerCount[5]), .B0(N97), .B1(n4), .Y(n44) );
  AO22X1 U43 ( .A0(n61), .A1(triggerCount[4]), .B0(N96), .B1(n4), .Y(n43) );
  AO22X1 U44 ( .A0(n61), .A1(triggerCount[3]), .B0(N95), .B1(n4), .Y(n42) );
  AO22X1 U45 ( .A0(n61), .A1(triggerCount[2]), .B0(N94), .B1(n4), .Y(n41) );
  AO22X1 U46 ( .A0(n61), .A1(triggerCount[1]), .B0(N93), .B1(n4), .Y(n40) );
  AND3X2 U47 ( .A(count[1]), .B(n3), .C(count[0]), .Y(N13) );
  NOR2X1 U48 ( .A(n56), .B(n57), .Y(N12) );
  XNOR2X1 U49 ( .A(count[0]), .B(count[1]), .Y(n56) );
  OAI31XL U50 ( .A0(n69), .A1(state[0]), .A2(n2), .B0(n65), .Y(N10) );
  CLKINVX1 U51 ( .A(rst_n), .Y(n2) );
endmodule


module PE_14_DW01_inc_0 ( A, SUM );
  input [7:0] A;
  output [7:0] SUM;

  wire   [7:2] carry;

  ADDHXL U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHXL U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  ADDHXL U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHXL U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHXL U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHXL U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  CLKINVX1 U1 ( .A(A[0]), .Y(SUM[0]) );
  XOR2X1 U2 ( .A(carry[7]), .B(A[7]), .Y(SUM[7]) );
endmodule


module PE_14_DW01_add_0 ( A, B, CI, SUM, CO );
  input [7:0] A;
  input [7:0] B;
  output [7:0] SUM;
  input CI;
  output CO;
  wire   n1, n2;
  wire   [7:1] carry;

  ADDFXL U1_1 ( .A(A[1]), .B(B[1]), .CI(carry[1]), .CO(carry[2]), .S(SUM[1])
         );
  ADDFXL U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  ADDFXL U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFXL U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  ADDFXL U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  ADDFXL U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  XOR3X1 U1_7 ( .A(A[7]), .B(B[7]), .C(carry[7]), .Y(SUM[7]) );
  XNOR2X1 U1 ( .A(B[0]), .B(n1), .Y(SUM[0]) );
  NOR2X1 U2 ( .A(n1), .B(n2), .Y(carry[1]) );
  CLKINVX1 U3 ( .A(B[0]), .Y(n2) );
  CLKINVX1 U4 ( .A(A[0]), .Y(n1) );
endmodule


module PE_14_DW_mult_uns_0 ( a, b, product );
  input [7:0] a;
  input [7:0] b;
  output [15:0] product;
  wire   n2, n3, n4, n5, n6, n7, n18, n19, n20, n21, n22, n23, n24, n25, n26,
         n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40,
         n41, n42, n43, n46, n48, n49, n51, n52, n53, n55, n56, n57, n58, n60,
         n61, n62, n63, n64, n66, n67, n68, n69, n70, n71, n73, n74, n75, n76,
         n77, n78, n123, n124, n125, n126, n127, n128, n129, n130, n131, n132,
         n133, n134, n135, n136, n137, n138, n139, n140, n141, n142, n143,
         n144, n145, n146, n147, n148, n149, n150, n151, n152, n153, n154;

  ADDFXL U3 ( .A(n20), .B(n27), .CI(n3), .CO(n2), .S(product[6]) );
  ADDFXL U4 ( .A(n28), .B(n34), .CI(n4), .CO(n3), .S(product[5]) );
  ADDFXL U5 ( .A(n35), .B(n38), .CI(n5), .CO(n4), .S(product[4]) );
  ADDFXL U6 ( .A(n39), .B(n41), .CI(n6), .CO(n5), .S(product[3]) );
  ADDFXL U7 ( .A(n7), .B(n64), .CI(n43), .CO(n6), .S(product[2]) );
  ADDHXL U8 ( .A(n71), .B(n78), .CO(n7), .S(product[1]) );
  CMPR42X1 U19 ( .A(n60), .B(n55), .C(n26), .D(n29), .ICI(n23), .S(n20), .ICO(
        n18), .CO(n19) );
  CMPR42X1 U20 ( .A(n73), .B(n51), .C(n66), .D(n31), .ICI(n25), .S(n23), .ICO(
        n21), .CO(n22) );
  ADDHXL U21 ( .A(n48), .B(n46), .CO(n24), .S(n25) );
  CMPR42X1 U22 ( .A(n67), .B(n61), .C(n33), .D(n32), .ICI(n30), .S(n28), .ICO(
        n26), .CO(n27) );
  ADDFXL U23 ( .A(n56), .B(n74), .CI(n36), .CO(n29), .S(n30) );
  ADDHXL U24 ( .A(n52), .B(n49), .CO(n31), .S(n32) );
  CMPR42X1 U25 ( .A(n75), .B(n62), .C(n68), .D(n40), .ICI(n37), .S(n35), .ICO(
        n33), .CO(n34) );
  ADDHXL U26 ( .A(n57), .B(n53), .CO(n36), .S(n37) );
  ADDFXL U27 ( .A(n69), .B(n76), .CI(n42), .CO(n38), .S(n39) );
  ADDHXL U28 ( .A(n63), .B(n58), .CO(n40), .S(n41) );
  ADDHXL U29 ( .A(n77), .B(n70), .CO(n42), .S(n43) );
  CLKINVX1 U84 ( .A(a[0]), .Y(n134) );
  CLKINVX1 U85 ( .A(b[0]), .Y(n128) );
  CLKINVX1 U86 ( .A(b[1]), .Y(n127) );
  CLKINVX1 U87 ( .A(a[1]), .Y(n133) );
  CLKINVX1 U88 ( .A(b[2]), .Y(n126) );
  CLKINVX1 U89 ( .A(a[2]), .Y(n132) );
  CLKINVX1 U90 ( .A(a[3]), .Y(n131) );
  CLKINVX1 U91 ( .A(b[3]), .Y(n125) );
  CLKINVX1 U92 ( .A(b[4]), .Y(n124) );
  CLKINVX1 U93 ( .A(a[4]), .Y(n130) );
  CLKINVX1 U94 ( .A(a[5]), .Y(n129) );
  CLKINVX1 U95 ( .A(b[5]), .Y(n123) );
  XOR2X1 U96 ( .A(n135), .B(n136), .Y(product[7]) );
  XOR2X1 U97 ( .A(n137), .B(n138), .Y(n136) );
  XOR2X1 U98 ( .A(n18), .B(n139), .Y(n138) );
  NOR2X1 U99 ( .A(n131), .B(n124), .Y(n139) );
  XOR2X1 U100 ( .A(n140), .B(n141), .Y(n137) );
  XOR2X1 U101 ( .A(n142), .B(n143), .Y(n141) );
  XOR2X1 U102 ( .A(n144), .B(n145), .Y(n143) );
  NAND2X1 U103 ( .A(b[5]), .B(a[2]), .Y(n145) );
  NAND2X1 U104 ( .A(b[6]), .B(a[1]), .Y(n144) );
  XOR2X1 U105 ( .A(n146), .B(n147), .Y(n142) );
  NAND2X1 U106 ( .A(b[3]), .B(a[4]), .Y(n147) );
  NAND2X1 U107 ( .A(b[1]), .B(a[6]), .Y(n146) );
  XOR2X1 U108 ( .A(n148), .B(n149), .Y(n140) );
  XOR2X1 U109 ( .A(n150), .B(n151), .Y(n149) );
  NAND2X1 U110 ( .A(b[0]), .B(a[7]), .Y(n151) );
  NAND2X1 U111 ( .A(b[2]), .B(a[5]), .Y(n150) );
  XNOR2X1 U112 ( .A(n24), .B(n152), .Y(n148) );
  NAND2X1 U113 ( .A(b[7]), .B(a[0]), .Y(n152) );
  XOR2X1 U114 ( .A(n153), .B(n154), .Y(n135) );
  XNOR2X1 U115 ( .A(n2), .B(n19), .Y(n154) );
  XNOR2X1 U116 ( .A(n22), .B(n21), .Y(n153) );
  NOR2X1 U117 ( .A(n134), .B(n128), .Y(product[0]) );
  NOR2X1 U118 ( .A(n134), .B(n127), .Y(n78) );
  NOR2X1 U119 ( .A(n134), .B(n126), .Y(n77) );
  NOR2X1 U120 ( .A(n134), .B(n125), .Y(n76) );
  NOR2X1 U121 ( .A(n134), .B(n124), .Y(n75) );
  NOR2X1 U122 ( .A(n134), .B(n123), .Y(n74) );
  AND2X1 U123 ( .A(b[6]), .B(a[0]), .Y(n73) );
  NOR2X1 U124 ( .A(n128), .B(n133), .Y(n71) );
  NOR2X1 U125 ( .A(n127), .B(n133), .Y(n70) );
  NOR2X1 U126 ( .A(n126), .B(n133), .Y(n69) );
  NOR2X1 U127 ( .A(n125), .B(n133), .Y(n68) );
  NOR2X1 U128 ( .A(n133), .B(n124), .Y(n67) );
  NOR2X1 U129 ( .A(n133), .B(n123), .Y(n66) );
  NOR2X1 U130 ( .A(n128), .B(n132), .Y(n64) );
  NOR2X1 U131 ( .A(n127), .B(n132), .Y(n63) );
  NOR2X1 U132 ( .A(n126), .B(n132), .Y(n62) );
  NOR2X1 U133 ( .A(n125), .B(n132), .Y(n61) );
  NOR2X1 U134 ( .A(n132), .B(n124), .Y(n60) );
  NOR2X1 U135 ( .A(n128), .B(n131), .Y(n58) );
  NOR2X1 U136 ( .A(n127), .B(n131), .Y(n57) );
  NOR2X1 U137 ( .A(n126), .B(n131), .Y(n56) );
  NOR2X1 U138 ( .A(n125), .B(n131), .Y(n55) );
  NOR2X1 U139 ( .A(n128), .B(n130), .Y(n53) );
  NOR2X1 U140 ( .A(n127), .B(n130), .Y(n52) );
  NOR2X1 U141 ( .A(n126), .B(n130), .Y(n51) );
  NOR2X1 U142 ( .A(n129), .B(n128), .Y(n49) );
  NOR2X1 U143 ( .A(n129), .B(n127), .Y(n48) );
  AND2X1 U144 ( .A(a[6]), .B(b[0]), .Y(n46) );
endmodule


module PE_14 ( clk, rst_n, START, A, B, Aout, Bout, Cout, DONE );
  input [7:0] A;
  input [7:0] B;
  output [7:0] Aout;
  output [7:0] Bout;
  output [7:0] Cout;
  input clk, rst_n, START;
  output DONE;
  wire   start, N9, N10, N11, N12, N13, N14, N15, N16, N17, N18, N19, N20, N21,
         N65, N66, N67, N68, N69, N70, N71, N72, N73, N74, N75, N76, N77, N78,
         N79, N80, N92, N93, N94, N95, N96, N97, N98, N99, n2, n3, n4, n6, n7,
         n9, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51,
         n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65,
         n66, n67, n68, n69;
  wire   [1:0] state;
  wire   [2:0] count;
  wire   [7:0] c;
  wire   [7:0] triggerCount;
  wire   [7:0] a;
  wire   [7:0] b;
  wire   SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, 
        SYNOPSYS_UNCONNECTED__4, SYNOPSYS_UNCONNECTED__5, 
        SYNOPSYS_UNCONNECTED__6, SYNOPSYS_UNCONNECTED__7;

  PE_14_DW01_inc_0 add_98 ( .A(triggerCount), .SUM({N99, N98, N97, N96, N95, 
        N94, N93, N92}) );
  PE_14_DW01_add_0 add_88 ( .A(c), .B({N72, N71, N70, N69, N68, N67, N66, N65}), .CI(1'b0), .SUM({N80, N79, N78, N77, N76, N75, N74, N73}) );
  PE_14_DW_mult_uns_0 r319 ( .a(a), .b(b), .product({SYNOPSYS_UNCONNECTED__0, 
        SYNOPSYS_UNCONNECTED__1, SYNOPSYS_UNCONNECTED__2, 
        SYNOPSYS_UNCONNECTED__3, SYNOPSYS_UNCONNECTED__4, 
        SYNOPSYS_UNCONNECTED__5, SYNOPSYS_UNCONNECTED__6, 
        SYNOPSYS_UNCONNECTED__7, N72, N71, N70, N69, N68, N67, N66, N65}) );
  DFFQX1 \Cout_reg[7]  ( .D(n53), .CK(clk), .Q(Cout[7]) );
  DFFQX1 \Cout_reg[6]  ( .D(n52), .CK(clk), .Q(Cout[6]) );
  DFFQX1 \Cout_reg[5]  ( .D(n51), .CK(clk), .Q(Cout[5]) );
  DFFQX1 \Cout_reg[4]  ( .D(n50), .CK(clk), .Q(Cout[4]) );
  DFFQX1 \Cout_reg[3]  ( .D(n49), .CK(clk), .Q(Cout[3]) );
  DFFQX1 \Cout_reg[2]  ( .D(n48), .CK(clk), .Q(Cout[2]) );
  DFFQX1 \Cout_reg[1]  ( .D(n47), .CK(clk), .Q(Cout[1]) );
  DFFQX1 \Cout_reg[0]  ( .D(n46), .CK(clk), .Q(Cout[0]) );
  DFFQX1 \c_reg[7]  ( .D(N21), .CK(clk), .Q(c[7]) );
  DFFQX1 \count_reg[1]  ( .D(N12), .CK(clk), .Q(count[1]) );
  DFFQX1 \count_reg[0]  ( .D(N11), .CK(clk), .Q(count[0]) );
  DFFX1 \count_reg[2]  ( .D(N13), .CK(clk), .QN(n68) );
  DFFTRX1 start_reg ( .D(START), .RN(rst_n), .CK(clk), .Q(start), .QN(n69) );
  DFFQX1 \state_reg[1]  ( .D(N10), .CK(clk), .Q(state[1]) );
  DFFQX1 \state_reg[0]  ( .D(N9), .CK(clk), .Q(state[0]) );
  DFFQX1 \c_reg[1]  ( .D(N15), .CK(clk), .Q(c[1]) );
  DFFQX1 \c_reg[2]  ( .D(N16), .CK(clk), .Q(c[2]) );
  DFFQX1 \c_reg[3]  ( .D(N17), .CK(clk), .Q(c[3]) );
  DFFQX1 \c_reg[4]  ( .D(N18), .CK(clk), .Q(c[4]) );
  DFFQX1 \c_reg[5]  ( .D(N19), .CK(clk), .Q(c[5]) );
  DFFQX1 \c_reg[6]  ( .D(N20), .CK(clk), .Q(c[6]) );
  DFFQX1 \triggerCount_reg[7]  ( .D(n9), .CK(clk), .Q(triggerCount[7]) );
  DFFQX1 \c_reg[0]  ( .D(N14), .CK(clk), .Q(c[0]) );
  DFFQX1 \triggerCount_reg[0]  ( .D(n39), .CK(clk), .Q(triggerCount[0]) );
  DFFQX1 \triggerCount_reg[1]  ( .D(n40), .CK(clk), .Q(triggerCount[1]) );
  DFFQX1 \triggerCount_reg[2]  ( .D(n41), .CK(clk), .Q(triggerCount[2]) );
  DFFQX1 \triggerCount_reg[5]  ( .D(n44), .CK(clk), .Q(triggerCount[5]) );
  DFFQX1 \triggerCount_reg[6]  ( .D(n45), .CK(clk), .Q(triggerCount[6]) );
  DFFQX1 \triggerCount_reg[4]  ( .D(n43), .CK(clk), .Q(triggerCount[4]) );
  DFFQX1 \triggerCount_reg[3]  ( .D(n42), .CK(clk), .Q(triggerCount[3]) );
  DFFTRX1 \a_reg[7]  ( .D(A[7]), .RN(rst_n), .CK(clk), .Q(a[7]) );
  DFFTRX1 \b_reg[7]  ( .D(B[7]), .RN(rst_n), .CK(clk), .Q(b[7]) );
  DFFTRX1 DONE_reg ( .D(n60), .RN(n7), .CK(clk), .Q(DONE) );
  DFFTRX1 \a_reg[6]  ( .D(A[6]), .RN(rst_n), .CK(clk), .Q(a[6]) );
  DFFTRX1 \b_reg[6]  ( .D(B[6]), .RN(rst_n), .CK(clk), .Q(b[6]) );
  DFFTRX1 \a_reg[5]  ( .D(A[5]), .RN(rst_n), .CK(clk), .Q(a[5]) );
  DFFTRX1 \a_reg[4]  ( .D(A[4]), .RN(rst_n), .CK(clk), .Q(a[4]) );
  DFFTRX1 \b_reg[5]  ( .D(B[5]), .RN(rst_n), .CK(clk), .Q(b[5]) );
  DFFTRX1 \b_reg[4]  ( .D(B[4]), .RN(rst_n), .CK(clk), .Q(b[4]) );
  DFFTRX1 \a_reg[3]  ( .D(A[3]), .RN(rst_n), .CK(clk), .Q(a[3]) );
  DFFTRX1 \a_reg[2]  ( .D(A[2]), .RN(rst_n), .CK(clk), .Q(a[2]) );
  DFFTRX1 \a_reg[1]  ( .D(A[1]), .RN(rst_n), .CK(clk), .Q(a[1]) );
  DFFTRX1 \b_reg[3]  ( .D(B[3]), .RN(rst_n), .CK(clk), .Q(b[3]) );
  DFFTRX1 \b_reg[2]  ( .D(B[2]), .RN(rst_n), .CK(clk), .Q(b[2]) );
  DFFTRX1 \b_reg[1]  ( .D(B[1]), .RN(rst_n), .CK(clk), .Q(b[1]) );
  DFFTRX1 \a_reg[0]  ( .D(A[0]), .RN(rst_n), .CK(clk), .Q(a[0]) );
  DFFTRX1 \b_reg[0]  ( .D(B[0]), .RN(rst_n), .CK(clk), .Q(b[0]) );
  DFFTRX1 \Bout_reg[7]  ( .D(B[7]), .RN(rst_n), .CK(clk), .Q(Bout[7]) );
  DFFTRX1 \Bout_reg[6]  ( .D(B[6]), .RN(rst_n), .CK(clk), .Q(Bout[6]) );
  DFFTRX1 \Bout_reg[5]  ( .D(B[5]), .RN(rst_n), .CK(clk), .Q(Bout[5]) );
  DFFTRX1 \Bout_reg[4]  ( .D(B[4]), .RN(rst_n), .CK(clk), .Q(Bout[4]) );
  DFFTRX1 \Bout_reg[3]  ( .D(B[3]), .RN(rst_n), .CK(clk), .Q(Bout[3]) );
  DFFTRX1 \Bout_reg[2]  ( .D(B[2]), .RN(rst_n), .CK(clk), .Q(Bout[2]) );
  DFFTRX1 \Bout_reg[1]  ( .D(B[1]), .RN(rst_n), .CK(clk), .Q(Bout[1]) );
  DFFTRX1 \Bout_reg[0]  ( .D(B[0]), .RN(rst_n), .CK(clk), .Q(Bout[0]) );
  DFFTRX1 \Aout_reg[7]  ( .D(A[7]), .RN(rst_n), .CK(clk), .Q(Aout[7]) );
  DFFTRX1 \Aout_reg[6]  ( .D(A[6]), .RN(rst_n), .CK(clk), .Q(Aout[6]) );
  DFFTRX1 \Aout_reg[5]  ( .D(A[5]), .RN(rst_n), .CK(clk), .Q(Aout[5]) );
  DFFTRX1 \Aout_reg[4]  ( .D(A[4]), .RN(rst_n), .CK(clk), .Q(Aout[4]) );
  DFFTRX1 \Aout_reg[3]  ( .D(A[3]), .RN(rst_n), .CK(clk), .Q(Aout[3]) );
  DFFTRX1 \Aout_reg[2]  ( .D(A[2]), .RN(rst_n), .CK(clk), .Q(Aout[2]) );
  DFFTRX1 \Aout_reg[1]  ( .D(A[1]), .RN(rst_n), .CK(clk), .Q(Aout[1]) );
  DFFTRX1 \Aout_reg[0]  ( .D(A[0]), .RN(rst_n), .CK(clk), .Q(Aout[0]) );
  AOI221XL U3 ( .A0(n63), .A1(n62), .B0(n6), .B1(state[1]), .C0(n2), .Y(n64)
         );
  CLKINVX1 U4 ( .A(n58), .Y(n4) );
  CLKINVX1 U5 ( .A(n65), .Y(n7) );
  AO22X1 U6 ( .A0(N71), .A1(n4), .B0(N79), .B1(n3), .Y(N20) );
  AO22X1 U8 ( .A0(N70), .A1(n4), .B0(N78), .B1(n3), .Y(N19) );
  AO22X1 U9 ( .A0(N69), .A1(n4), .B0(N77), .B1(n3), .Y(N18) );
  AO22X1 U10 ( .A0(N66), .A1(n4), .B0(N74), .B1(n3), .Y(N15) );
  AO22X1 U11 ( .A0(N68), .A1(n4), .B0(N76), .B1(n3), .Y(N17) );
  AO22X1 U12 ( .A0(N67), .A1(n4), .B0(N75), .B1(n3), .Y(N16) );
  AO22X1 U13 ( .A0(N65), .A1(n4), .B0(N73), .B1(n3), .Y(N14) );
  NAND2X1 U14 ( .A(rst_n), .B(n62), .Y(n65) );
  NAND2X1 U15 ( .A(n60), .B(n7), .Y(n58) );
  CLKINVX1 U16 ( .A(n57), .Y(n3) );
  CLKINVX1 U17 ( .A(n62), .Y(n6) );
  NOR2X1 U18 ( .A(n65), .B(n63), .Y(N9) );
  AO22X1 U19 ( .A0(N72), .A1(n4), .B0(N80), .B1(n3), .Y(N21) );
  NOR2BX1 U20 ( .AN(state[1]), .B(state[0]), .Y(n62) );
  OAI21XL U21 ( .A0(n60), .A1(n65), .B0(n59), .Y(n61) );
  OAI211X1 U22 ( .A0(state[0]), .A1(start), .B0(n6), .C0(rst_n), .Y(n59) );
  NAND4BX1 U23 ( .AN(triggerCount[0]), .B(triggerCount[7]), .C(n55), .D(n54), 
        .Y(n63) );
  NOR2X1 U24 ( .A(triggerCount[2]), .B(triggerCount[1]), .Y(n55) );
  NOR4X1 U25 ( .A(triggerCount[6]), .B(triggerCount[5]), .C(triggerCount[4]), 
        .D(triggerCount[3]), .Y(n54) );
  NOR2BX1 U26 ( .AN(n63), .B(n68), .Y(n60) );
  NOR3X1 U27 ( .A(n65), .B(n64), .C(n68), .Y(n66) );
  NAND3X1 U28 ( .A(n63), .B(n68), .C(n7), .Y(n57) );
  AO21X1 U29 ( .A0(n68), .A1(n7), .B0(n64), .Y(n67) );
  OAI21XL U30 ( .A0(count[0]), .A1(n57), .B0(n58), .Y(N11) );
  AO22X1 U31 ( .A0(n61), .A1(triggerCount[7]), .B0(N99), .B1(n4), .Y(n9) );
  AO22X1 U32 ( .A0(n61), .A1(triggerCount[0]), .B0(N92), .B1(n4), .Y(n39) );
  AO22X1 U33 ( .A0(Cout[1]), .A1(n67), .B0(c[1]), .B1(n66), .Y(n47) );
  AO22X1 U34 ( .A0(Cout[2]), .A1(n67), .B0(c[2]), .B1(n66), .Y(n48) );
  AO22X1 U35 ( .A0(Cout[3]), .A1(n67), .B0(c[3]), .B1(n66), .Y(n49) );
  AO22X1 U36 ( .A0(Cout[4]), .A1(n67), .B0(c[4]), .B1(n66), .Y(n50) );
  AO22X1 U37 ( .A0(Cout[5]), .A1(n67), .B0(c[5]), .B1(n66), .Y(n51) );
  AO22X1 U38 ( .A0(Cout[6]), .A1(n67), .B0(c[6]), .B1(n66), .Y(n52) );
  AO22X1 U39 ( .A0(Cout[7]), .A1(n67), .B0(c[7]), .B1(n66), .Y(n53) );
  AO22X1 U40 ( .A0(Cout[0]), .A1(n67), .B0(c[0]), .B1(n66), .Y(n46) );
  AO22X1 U41 ( .A0(n61), .A1(triggerCount[6]), .B0(N98), .B1(n4), .Y(n45) );
  AO22X1 U42 ( .A0(n61), .A1(triggerCount[5]), .B0(N97), .B1(n4), .Y(n44) );
  AO22X1 U43 ( .A0(n61), .A1(triggerCount[4]), .B0(N96), .B1(n4), .Y(n43) );
  AO22X1 U44 ( .A0(n61), .A1(triggerCount[3]), .B0(N95), .B1(n4), .Y(n42) );
  AO22X1 U45 ( .A0(n61), .A1(triggerCount[2]), .B0(N94), .B1(n4), .Y(n41) );
  AO22X1 U46 ( .A0(n61), .A1(triggerCount[1]), .B0(N93), .B1(n4), .Y(n40) );
  AND3X2 U47 ( .A(count[1]), .B(n3), .C(count[0]), .Y(N13) );
  NOR2X1 U48 ( .A(n56), .B(n57), .Y(N12) );
  XNOR2X1 U49 ( .A(count[0]), .B(count[1]), .Y(n56) );
  OAI31XL U50 ( .A0(n69), .A1(state[0]), .A2(n2), .B0(n65), .Y(N10) );
  CLKINVX1 U51 ( .A(rst_n), .Y(n2) );
endmodule


module PE_13_DW01_inc_0 ( A, SUM );
  input [7:0] A;
  output [7:0] SUM;

  wire   [7:2] carry;

  ADDHXL U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHXL U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  ADDHXL U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHXL U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHXL U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHXL U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  CLKINVX1 U1 ( .A(A[0]), .Y(SUM[0]) );
  XOR2X1 U2 ( .A(carry[7]), .B(A[7]), .Y(SUM[7]) );
endmodule


module PE_13_DW01_add_0 ( A, B, CI, SUM, CO );
  input [7:0] A;
  input [7:0] B;
  output [7:0] SUM;
  input CI;
  output CO;
  wire   n1, n2;
  wire   [7:1] carry;

  ADDFXL U1_1 ( .A(A[1]), .B(B[1]), .CI(carry[1]), .CO(carry[2]), .S(SUM[1])
         );
  ADDFXL U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  ADDFXL U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFXL U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  ADDFXL U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  ADDFXL U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  XOR3X1 U1_7 ( .A(A[7]), .B(B[7]), .C(carry[7]), .Y(SUM[7]) );
  XNOR2X1 U1 ( .A(B[0]), .B(n1), .Y(SUM[0]) );
  NOR2X1 U2 ( .A(n1), .B(n2), .Y(carry[1]) );
  CLKINVX1 U3 ( .A(B[0]), .Y(n2) );
  CLKINVX1 U4 ( .A(A[0]), .Y(n1) );
endmodule


module PE_13_DW_mult_uns_0 ( a, b, product );
  input [7:0] a;
  input [7:0] b;
  output [15:0] product;
  wire   n2, n3, n4, n5, n6, n7, n18, n19, n20, n21, n22, n23, n24, n25, n26,
         n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40,
         n41, n42, n43, n46, n48, n49, n51, n52, n53, n55, n56, n57, n58, n60,
         n61, n62, n63, n64, n66, n67, n68, n69, n70, n71, n73, n74, n75, n76,
         n77, n78, n123, n124, n125, n126, n127, n128, n129, n130, n131, n132,
         n133, n134, n135, n136, n137, n138, n139, n140, n141, n142, n143,
         n144, n145, n146, n147, n148, n149, n150, n151, n152, n153, n154;

  ADDFXL U3 ( .A(n20), .B(n27), .CI(n3), .CO(n2), .S(product[6]) );
  ADDFXL U4 ( .A(n28), .B(n34), .CI(n4), .CO(n3), .S(product[5]) );
  ADDFXL U5 ( .A(n35), .B(n38), .CI(n5), .CO(n4), .S(product[4]) );
  ADDFXL U6 ( .A(n39), .B(n41), .CI(n6), .CO(n5), .S(product[3]) );
  ADDFXL U7 ( .A(n7), .B(n64), .CI(n43), .CO(n6), .S(product[2]) );
  ADDHXL U8 ( .A(n71), .B(n78), .CO(n7), .S(product[1]) );
  CMPR42X1 U19 ( .A(n60), .B(n55), .C(n26), .D(n29), .ICI(n23), .S(n20), .ICO(
        n18), .CO(n19) );
  CMPR42X1 U20 ( .A(n73), .B(n51), .C(n66), .D(n31), .ICI(n25), .S(n23), .ICO(
        n21), .CO(n22) );
  ADDHXL U21 ( .A(n48), .B(n46), .CO(n24), .S(n25) );
  CMPR42X1 U22 ( .A(n67), .B(n61), .C(n33), .D(n32), .ICI(n30), .S(n28), .ICO(
        n26), .CO(n27) );
  ADDFXL U23 ( .A(n56), .B(n74), .CI(n36), .CO(n29), .S(n30) );
  ADDHXL U24 ( .A(n52), .B(n49), .CO(n31), .S(n32) );
  CMPR42X1 U25 ( .A(n75), .B(n62), .C(n68), .D(n40), .ICI(n37), .S(n35), .ICO(
        n33), .CO(n34) );
  ADDHXL U26 ( .A(n57), .B(n53), .CO(n36), .S(n37) );
  ADDFXL U27 ( .A(n69), .B(n76), .CI(n42), .CO(n38), .S(n39) );
  ADDHXL U28 ( .A(n63), .B(n58), .CO(n40), .S(n41) );
  ADDHXL U29 ( .A(n77), .B(n70), .CO(n42), .S(n43) );
  CLKINVX1 U84 ( .A(a[0]), .Y(n134) );
  CLKINVX1 U85 ( .A(b[0]), .Y(n128) );
  CLKINVX1 U86 ( .A(b[1]), .Y(n127) );
  CLKINVX1 U87 ( .A(a[1]), .Y(n133) );
  CLKINVX1 U88 ( .A(b[2]), .Y(n126) );
  CLKINVX1 U89 ( .A(a[2]), .Y(n132) );
  CLKINVX1 U90 ( .A(a[3]), .Y(n131) );
  CLKINVX1 U91 ( .A(b[3]), .Y(n125) );
  CLKINVX1 U92 ( .A(b[4]), .Y(n124) );
  CLKINVX1 U93 ( .A(a[4]), .Y(n130) );
  CLKINVX1 U94 ( .A(a[5]), .Y(n129) );
  CLKINVX1 U95 ( .A(b[5]), .Y(n123) );
  XOR2X1 U96 ( .A(n135), .B(n136), .Y(product[7]) );
  XOR2X1 U97 ( .A(n137), .B(n138), .Y(n136) );
  XOR2X1 U98 ( .A(n18), .B(n139), .Y(n138) );
  NOR2X1 U99 ( .A(n131), .B(n124), .Y(n139) );
  XOR2X1 U100 ( .A(n140), .B(n141), .Y(n137) );
  XOR2X1 U101 ( .A(n142), .B(n143), .Y(n141) );
  XOR2X1 U102 ( .A(n144), .B(n145), .Y(n143) );
  NAND2X1 U103 ( .A(b[5]), .B(a[2]), .Y(n145) );
  NAND2X1 U104 ( .A(b[6]), .B(a[1]), .Y(n144) );
  XOR2X1 U105 ( .A(n146), .B(n147), .Y(n142) );
  NAND2X1 U106 ( .A(b[3]), .B(a[4]), .Y(n147) );
  NAND2X1 U107 ( .A(b[1]), .B(a[6]), .Y(n146) );
  XOR2X1 U108 ( .A(n148), .B(n149), .Y(n140) );
  XOR2X1 U109 ( .A(n150), .B(n151), .Y(n149) );
  NAND2X1 U110 ( .A(b[0]), .B(a[7]), .Y(n151) );
  NAND2X1 U111 ( .A(b[2]), .B(a[5]), .Y(n150) );
  XNOR2X1 U112 ( .A(n24), .B(n152), .Y(n148) );
  NAND2X1 U113 ( .A(b[7]), .B(a[0]), .Y(n152) );
  XOR2X1 U114 ( .A(n153), .B(n154), .Y(n135) );
  XNOR2X1 U115 ( .A(n2), .B(n19), .Y(n154) );
  XNOR2X1 U116 ( .A(n22), .B(n21), .Y(n153) );
  NOR2X1 U117 ( .A(n134), .B(n128), .Y(product[0]) );
  NOR2X1 U118 ( .A(n134), .B(n127), .Y(n78) );
  NOR2X1 U119 ( .A(n134), .B(n126), .Y(n77) );
  NOR2X1 U120 ( .A(n134), .B(n125), .Y(n76) );
  NOR2X1 U121 ( .A(n134), .B(n124), .Y(n75) );
  NOR2X1 U122 ( .A(n134), .B(n123), .Y(n74) );
  AND2X1 U123 ( .A(b[6]), .B(a[0]), .Y(n73) );
  NOR2X1 U124 ( .A(n128), .B(n133), .Y(n71) );
  NOR2X1 U125 ( .A(n127), .B(n133), .Y(n70) );
  NOR2X1 U126 ( .A(n126), .B(n133), .Y(n69) );
  NOR2X1 U127 ( .A(n125), .B(n133), .Y(n68) );
  NOR2X1 U128 ( .A(n133), .B(n124), .Y(n67) );
  NOR2X1 U129 ( .A(n133), .B(n123), .Y(n66) );
  NOR2X1 U130 ( .A(n128), .B(n132), .Y(n64) );
  NOR2X1 U131 ( .A(n127), .B(n132), .Y(n63) );
  NOR2X1 U132 ( .A(n126), .B(n132), .Y(n62) );
  NOR2X1 U133 ( .A(n125), .B(n132), .Y(n61) );
  NOR2X1 U134 ( .A(n132), .B(n124), .Y(n60) );
  NOR2X1 U135 ( .A(n128), .B(n131), .Y(n58) );
  NOR2X1 U136 ( .A(n127), .B(n131), .Y(n57) );
  NOR2X1 U137 ( .A(n126), .B(n131), .Y(n56) );
  NOR2X1 U138 ( .A(n125), .B(n131), .Y(n55) );
  NOR2X1 U139 ( .A(n128), .B(n130), .Y(n53) );
  NOR2X1 U140 ( .A(n127), .B(n130), .Y(n52) );
  NOR2X1 U141 ( .A(n126), .B(n130), .Y(n51) );
  NOR2X1 U142 ( .A(n129), .B(n128), .Y(n49) );
  NOR2X1 U143 ( .A(n129), .B(n127), .Y(n48) );
  AND2X1 U144 ( .A(a[6]), .B(b[0]), .Y(n46) );
endmodule


module PE_13 ( clk, rst_n, START, A, B, Aout, Bout, Cout, DONE );
  input [7:0] A;
  input [7:0] B;
  output [7:0] Aout;
  output [7:0] Bout;
  output [7:0] Cout;
  input clk, rst_n, START;
  output DONE;
  wire   start, N9, N10, N11, N12, N13, N14, N15, N16, N17, N18, N19, N20, N21,
         N65, N66, N67, N68, N69, N70, N71, N72, N73, N74, N75, N76, N77, N78,
         N79, N80, N92, N93, N94, N95, N96, N97, N98, N99, n2, n3, n4, n6, n7,
         n9, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51,
         n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65,
         n66, n67, n68, n69;
  wire   [1:0] state;
  wire   [2:0] count;
  wire   [7:0] c;
  wire   [7:0] triggerCount;
  wire   [7:0] a;
  wire   [7:0] b;
  wire   SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, 
        SYNOPSYS_UNCONNECTED__4, SYNOPSYS_UNCONNECTED__5, 
        SYNOPSYS_UNCONNECTED__6, SYNOPSYS_UNCONNECTED__7;

  PE_13_DW01_inc_0 add_98 ( .A(triggerCount), .SUM({N99, N98, N97, N96, N95, 
        N94, N93, N92}) );
  PE_13_DW01_add_0 add_88 ( .A(c), .B({N72, N71, N70, N69, N68, N67, N66, N65}), .CI(1'b0), .SUM({N80, N79, N78, N77, N76, N75, N74, N73}) );
  PE_13_DW_mult_uns_0 r319 ( .a(a), .b(b), .product({SYNOPSYS_UNCONNECTED__0, 
        SYNOPSYS_UNCONNECTED__1, SYNOPSYS_UNCONNECTED__2, 
        SYNOPSYS_UNCONNECTED__3, SYNOPSYS_UNCONNECTED__4, 
        SYNOPSYS_UNCONNECTED__5, SYNOPSYS_UNCONNECTED__6, 
        SYNOPSYS_UNCONNECTED__7, N72, N71, N70, N69, N68, N67, N66, N65}) );
  DFFQX1 \Cout_reg[7]  ( .D(n53), .CK(clk), .Q(Cout[7]) );
  DFFQX1 \Cout_reg[6]  ( .D(n52), .CK(clk), .Q(Cout[6]) );
  DFFQX1 \Cout_reg[5]  ( .D(n51), .CK(clk), .Q(Cout[5]) );
  DFFQX1 \Cout_reg[4]  ( .D(n50), .CK(clk), .Q(Cout[4]) );
  DFFQX1 \Cout_reg[3]  ( .D(n49), .CK(clk), .Q(Cout[3]) );
  DFFQX1 \Cout_reg[2]  ( .D(n48), .CK(clk), .Q(Cout[2]) );
  DFFQX1 \Cout_reg[1]  ( .D(n47), .CK(clk), .Q(Cout[1]) );
  DFFQX1 \Cout_reg[0]  ( .D(n46), .CK(clk), .Q(Cout[0]) );
  DFFQX1 \c_reg[7]  ( .D(N21), .CK(clk), .Q(c[7]) );
  DFFQX1 \count_reg[1]  ( .D(N12), .CK(clk), .Q(count[1]) );
  DFFQX1 \count_reg[0]  ( .D(N11), .CK(clk), .Q(count[0]) );
  DFFX1 \count_reg[2]  ( .D(N13), .CK(clk), .QN(n68) );
  DFFTRX1 start_reg ( .D(START), .RN(rst_n), .CK(clk), .Q(start), .QN(n69) );
  DFFQX1 \state_reg[1]  ( .D(N10), .CK(clk), .Q(state[1]) );
  DFFQX1 \state_reg[0]  ( .D(N9), .CK(clk), .Q(state[0]) );
  DFFQX1 \c_reg[1]  ( .D(N15), .CK(clk), .Q(c[1]) );
  DFFQX1 \c_reg[2]  ( .D(N16), .CK(clk), .Q(c[2]) );
  DFFQX1 \c_reg[3]  ( .D(N17), .CK(clk), .Q(c[3]) );
  DFFQX1 \c_reg[4]  ( .D(N18), .CK(clk), .Q(c[4]) );
  DFFQX1 \c_reg[5]  ( .D(N19), .CK(clk), .Q(c[5]) );
  DFFQX1 \c_reg[6]  ( .D(N20), .CK(clk), .Q(c[6]) );
  DFFQX1 \triggerCount_reg[7]  ( .D(n9), .CK(clk), .Q(triggerCount[7]) );
  DFFQX1 \c_reg[0]  ( .D(N14), .CK(clk), .Q(c[0]) );
  DFFQX1 \triggerCount_reg[0]  ( .D(n39), .CK(clk), .Q(triggerCount[0]) );
  DFFQX1 \triggerCount_reg[1]  ( .D(n40), .CK(clk), .Q(triggerCount[1]) );
  DFFQX1 \triggerCount_reg[2]  ( .D(n41), .CK(clk), .Q(triggerCount[2]) );
  DFFQX1 \triggerCount_reg[5]  ( .D(n44), .CK(clk), .Q(triggerCount[5]) );
  DFFQX1 \triggerCount_reg[6]  ( .D(n45), .CK(clk), .Q(triggerCount[6]) );
  DFFQX1 \triggerCount_reg[4]  ( .D(n43), .CK(clk), .Q(triggerCount[4]) );
  DFFQX1 \triggerCount_reg[3]  ( .D(n42), .CK(clk), .Q(triggerCount[3]) );
  DFFTRX1 \a_reg[7]  ( .D(A[7]), .RN(rst_n), .CK(clk), .Q(a[7]) );
  DFFTRX1 \b_reg[7]  ( .D(B[7]), .RN(rst_n), .CK(clk), .Q(b[7]) );
  DFFTRX1 DONE_reg ( .D(n60), .RN(n7), .CK(clk), .Q(DONE) );
  DFFTRX1 \a_reg[6]  ( .D(A[6]), .RN(rst_n), .CK(clk), .Q(a[6]) );
  DFFTRX1 \b_reg[6]  ( .D(B[6]), .RN(rst_n), .CK(clk), .Q(b[6]) );
  DFFTRX1 \a_reg[5]  ( .D(A[5]), .RN(rst_n), .CK(clk), .Q(a[5]) );
  DFFTRX1 \a_reg[4]  ( .D(A[4]), .RN(rst_n), .CK(clk), .Q(a[4]) );
  DFFTRX1 \b_reg[5]  ( .D(B[5]), .RN(rst_n), .CK(clk), .Q(b[5]) );
  DFFTRX1 \b_reg[4]  ( .D(B[4]), .RN(rst_n), .CK(clk), .Q(b[4]) );
  DFFTRX1 \a_reg[3]  ( .D(A[3]), .RN(rst_n), .CK(clk), .Q(a[3]) );
  DFFTRX1 \a_reg[2]  ( .D(A[2]), .RN(rst_n), .CK(clk), .Q(a[2]) );
  DFFTRX1 \a_reg[1]  ( .D(A[1]), .RN(rst_n), .CK(clk), .Q(a[1]) );
  DFFTRX1 \b_reg[3]  ( .D(B[3]), .RN(rst_n), .CK(clk), .Q(b[3]) );
  DFFTRX1 \b_reg[2]  ( .D(B[2]), .RN(rst_n), .CK(clk), .Q(b[2]) );
  DFFTRX1 \b_reg[1]  ( .D(B[1]), .RN(rst_n), .CK(clk), .Q(b[1]) );
  DFFTRX1 \a_reg[0]  ( .D(A[0]), .RN(rst_n), .CK(clk), .Q(a[0]) );
  DFFTRX1 \b_reg[0]  ( .D(B[0]), .RN(rst_n), .CK(clk), .Q(b[0]) );
  DFFTRX1 \Bout_reg[7]  ( .D(B[7]), .RN(rst_n), .CK(clk), .Q(Bout[7]) );
  DFFTRX1 \Bout_reg[6]  ( .D(B[6]), .RN(rst_n), .CK(clk), .Q(Bout[6]) );
  DFFTRX1 \Bout_reg[5]  ( .D(B[5]), .RN(rst_n), .CK(clk), .Q(Bout[5]) );
  DFFTRX1 \Bout_reg[4]  ( .D(B[4]), .RN(rst_n), .CK(clk), .Q(Bout[4]) );
  DFFTRX1 \Bout_reg[3]  ( .D(B[3]), .RN(rst_n), .CK(clk), .Q(Bout[3]) );
  DFFTRX1 \Bout_reg[2]  ( .D(B[2]), .RN(rst_n), .CK(clk), .Q(Bout[2]) );
  DFFTRX1 \Bout_reg[1]  ( .D(B[1]), .RN(rst_n), .CK(clk), .Q(Bout[1]) );
  DFFTRX1 \Bout_reg[0]  ( .D(B[0]), .RN(rst_n), .CK(clk), .Q(Bout[0]) );
  DFFTRX1 \Aout_reg[7]  ( .D(A[7]), .RN(rst_n), .CK(clk), .Q(Aout[7]) );
  DFFTRX1 \Aout_reg[6]  ( .D(A[6]), .RN(rst_n), .CK(clk), .Q(Aout[6]) );
  DFFTRX1 \Aout_reg[5]  ( .D(A[5]), .RN(rst_n), .CK(clk), .Q(Aout[5]) );
  DFFTRX1 \Aout_reg[4]  ( .D(A[4]), .RN(rst_n), .CK(clk), .Q(Aout[4]) );
  DFFTRX1 \Aout_reg[3]  ( .D(A[3]), .RN(rst_n), .CK(clk), .Q(Aout[3]) );
  DFFTRX1 \Aout_reg[2]  ( .D(A[2]), .RN(rst_n), .CK(clk), .Q(Aout[2]) );
  DFFTRX1 \Aout_reg[1]  ( .D(A[1]), .RN(rst_n), .CK(clk), .Q(Aout[1]) );
  DFFTRX1 \Aout_reg[0]  ( .D(A[0]), .RN(rst_n), .CK(clk), .Q(Aout[0]) );
  AOI221XL U3 ( .A0(n63), .A1(n62), .B0(n6), .B1(state[1]), .C0(n2), .Y(n64)
         );
  CLKINVX1 U4 ( .A(n58), .Y(n4) );
  CLKINVX1 U5 ( .A(n65), .Y(n7) );
  AO22X1 U6 ( .A0(N71), .A1(n4), .B0(N79), .B1(n3), .Y(N20) );
  AO22X1 U8 ( .A0(N70), .A1(n4), .B0(N78), .B1(n3), .Y(N19) );
  AO22X1 U9 ( .A0(N69), .A1(n4), .B0(N77), .B1(n3), .Y(N18) );
  AO22X1 U10 ( .A0(N66), .A1(n4), .B0(N74), .B1(n3), .Y(N15) );
  AO22X1 U11 ( .A0(N68), .A1(n4), .B0(N76), .B1(n3), .Y(N17) );
  AO22X1 U12 ( .A0(N67), .A1(n4), .B0(N75), .B1(n3), .Y(N16) );
  AO22X1 U13 ( .A0(N65), .A1(n4), .B0(N73), .B1(n3), .Y(N14) );
  NAND2X1 U14 ( .A(rst_n), .B(n62), .Y(n65) );
  NAND2X1 U15 ( .A(n60), .B(n7), .Y(n58) );
  CLKINVX1 U16 ( .A(n57), .Y(n3) );
  CLKINVX1 U17 ( .A(n62), .Y(n6) );
  NOR2X1 U18 ( .A(n65), .B(n63), .Y(N9) );
  AO22X1 U19 ( .A0(N72), .A1(n4), .B0(N80), .B1(n3), .Y(N21) );
  NOR2BX1 U20 ( .AN(state[1]), .B(state[0]), .Y(n62) );
  OAI21XL U21 ( .A0(n60), .A1(n65), .B0(n59), .Y(n61) );
  OAI211X1 U22 ( .A0(state[0]), .A1(start), .B0(n6), .C0(rst_n), .Y(n59) );
  NAND4BX1 U23 ( .AN(triggerCount[0]), .B(triggerCount[7]), .C(n55), .D(n54), 
        .Y(n63) );
  NOR2X1 U24 ( .A(triggerCount[2]), .B(triggerCount[1]), .Y(n55) );
  NOR4X1 U25 ( .A(triggerCount[6]), .B(triggerCount[5]), .C(triggerCount[4]), 
        .D(triggerCount[3]), .Y(n54) );
  NOR2BX1 U26 ( .AN(n63), .B(n68), .Y(n60) );
  NOR3X1 U27 ( .A(n65), .B(n64), .C(n68), .Y(n66) );
  NAND3X1 U28 ( .A(n63), .B(n68), .C(n7), .Y(n57) );
  AO21X1 U29 ( .A0(n68), .A1(n7), .B0(n64), .Y(n67) );
  OAI21XL U30 ( .A0(count[0]), .A1(n57), .B0(n58), .Y(N11) );
  AO22X1 U31 ( .A0(n61), .A1(triggerCount[7]), .B0(N99), .B1(n4), .Y(n9) );
  AO22X1 U32 ( .A0(n61), .A1(triggerCount[0]), .B0(N92), .B1(n4), .Y(n39) );
  AO22X1 U33 ( .A0(Cout[1]), .A1(n67), .B0(c[1]), .B1(n66), .Y(n47) );
  AO22X1 U34 ( .A0(Cout[2]), .A1(n67), .B0(c[2]), .B1(n66), .Y(n48) );
  AO22X1 U35 ( .A0(Cout[3]), .A1(n67), .B0(c[3]), .B1(n66), .Y(n49) );
  AO22X1 U36 ( .A0(Cout[4]), .A1(n67), .B0(c[4]), .B1(n66), .Y(n50) );
  AO22X1 U37 ( .A0(Cout[5]), .A1(n67), .B0(c[5]), .B1(n66), .Y(n51) );
  AO22X1 U38 ( .A0(Cout[6]), .A1(n67), .B0(c[6]), .B1(n66), .Y(n52) );
  AO22X1 U39 ( .A0(Cout[7]), .A1(n67), .B0(c[7]), .B1(n66), .Y(n53) );
  AO22X1 U40 ( .A0(Cout[0]), .A1(n67), .B0(c[0]), .B1(n66), .Y(n46) );
  AO22X1 U41 ( .A0(n61), .A1(triggerCount[6]), .B0(N98), .B1(n4), .Y(n45) );
  AO22X1 U42 ( .A0(n61), .A1(triggerCount[5]), .B0(N97), .B1(n4), .Y(n44) );
  AO22X1 U43 ( .A0(n61), .A1(triggerCount[4]), .B0(N96), .B1(n4), .Y(n43) );
  AO22X1 U44 ( .A0(n61), .A1(triggerCount[3]), .B0(N95), .B1(n4), .Y(n42) );
  AO22X1 U45 ( .A0(n61), .A1(triggerCount[2]), .B0(N94), .B1(n4), .Y(n41) );
  AO22X1 U46 ( .A0(n61), .A1(triggerCount[1]), .B0(N93), .B1(n4), .Y(n40) );
  AND3X2 U47 ( .A(count[1]), .B(n3), .C(count[0]), .Y(N13) );
  NOR2X1 U48 ( .A(n56), .B(n57), .Y(N12) );
  XNOR2X1 U49 ( .A(count[0]), .B(count[1]), .Y(n56) );
  OAI31XL U50 ( .A0(n69), .A1(state[0]), .A2(n2), .B0(n65), .Y(N10) );
  CLKINVX1 U51 ( .A(rst_n), .Y(n2) );
endmodule


module PE_12_DW01_inc_0 ( A, SUM );
  input [7:0] A;
  output [7:0] SUM;

  wire   [7:2] carry;

  ADDHXL U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHXL U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  ADDHXL U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHXL U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHXL U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHXL U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  CLKINVX1 U1 ( .A(A[0]), .Y(SUM[0]) );
  XOR2X1 U2 ( .A(carry[7]), .B(A[7]), .Y(SUM[7]) );
endmodule


module PE_12_DW01_add_0 ( A, B, CI, SUM, CO );
  input [7:0] A;
  input [7:0] B;
  output [7:0] SUM;
  input CI;
  output CO;
  wire   n1, n2;
  wire   [7:1] carry;

  ADDFXL U1_1 ( .A(A[1]), .B(B[1]), .CI(carry[1]), .CO(carry[2]), .S(SUM[1])
         );
  ADDFXL U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  ADDFXL U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFXL U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  ADDFXL U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  ADDFXL U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  XOR3X1 U1_7 ( .A(A[7]), .B(B[7]), .C(carry[7]), .Y(SUM[7]) );
  XNOR2X1 U1 ( .A(B[0]), .B(n1), .Y(SUM[0]) );
  NOR2X1 U2 ( .A(n1), .B(n2), .Y(carry[1]) );
  CLKINVX1 U3 ( .A(B[0]), .Y(n2) );
  CLKINVX1 U4 ( .A(A[0]), .Y(n1) );
endmodule


module PE_12_DW_mult_uns_0 ( a, b, product );
  input [7:0] a;
  input [7:0] b;
  output [15:0] product;
  wire   n2, n3, n4, n5, n6, n7, n18, n19, n20, n21, n22, n23, n24, n25, n26,
         n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40,
         n41, n42, n43, n46, n48, n49, n51, n52, n53, n55, n56, n57, n58, n60,
         n61, n62, n63, n64, n66, n67, n68, n69, n70, n71, n73, n74, n75, n76,
         n77, n78, n123, n124, n125, n126, n127, n128, n129, n130, n131, n132,
         n133, n134, n135, n136, n137, n138, n139, n140, n141, n142, n143,
         n144, n145, n146, n147, n148, n149, n150, n151, n152, n153, n154;

  ADDFXL U3 ( .A(n20), .B(n27), .CI(n3), .CO(n2), .S(product[6]) );
  ADDFXL U4 ( .A(n28), .B(n34), .CI(n4), .CO(n3), .S(product[5]) );
  ADDFXL U5 ( .A(n35), .B(n38), .CI(n5), .CO(n4), .S(product[4]) );
  ADDFXL U6 ( .A(n39), .B(n41), .CI(n6), .CO(n5), .S(product[3]) );
  ADDFXL U7 ( .A(n7), .B(n64), .CI(n43), .CO(n6), .S(product[2]) );
  ADDHXL U8 ( .A(n71), .B(n78), .CO(n7), .S(product[1]) );
  CMPR42X1 U19 ( .A(n60), .B(n55), .C(n26), .D(n29), .ICI(n23), .S(n20), .ICO(
        n18), .CO(n19) );
  CMPR42X1 U20 ( .A(n73), .B(n51), .C(n66), .D(n31), .ICI(n25), .S(n23), .ICO(
        n21), .CO(n22) );
  ADDHXL U21 ( .A(n48), .B(n46), .CO(n24), .S(n25) );
  CMPR42X1 U22 ( .A(n67), .B(n61), .C(n33), .D(n32), .ICI(n30), .S(n28), .ICO(
        n26), .CO(n27) );
  ADDFXL U23 ( .A(n56), .B(n74), .CI(n36), .CO(n29), .S(n30) );
  ADDHXL U24 ( .A(n52), .B(n49), .CO(n31), .S(n32) );
  CMPR42X1 U25 ( .A(n75), .B(n62), .C(n68), .D(n40), .ICI(n37), .S(n35), .ICO(
        n33), .CO(n34) );
  ADDHXL U26 ( .A(n57), .B(n53), .CO(n36), .S(n37) );
  ADDFXL U27 ( .A(n69), .B(n76), .CI(n42), .CO(n38), .S(n39) );
  ADDHXL U28 ( .A(n63), .B(n58), .CO(n40), .S(n41) );
  ADDHXL U29 ( .A(n77), .B(n70), .CO(n42), .S(n43) );
  CLKINVX1 U84 ( .A(a[0]), .Y(n134) );
  CLKINVX1 U85 ( .A(b[0]), .Y(n128) );
  CLKINVX1 U86 ( .A(b[1]), .Y(n127) );
  CLKINVX1 U87 ( .A(a[1]), .Y(n133) );
  CLKINVX1 U88 ( .A(b[2]), .Y(n126) );
  CLKINVX1 U89 ( .A(a[2]), .Y(n132) );
  CLKINVX1 U90 ( .A(a[3]), .Y(n131) );
  CLKINVX1 U91 ( .A(b[3]), .Y(n125) );
  CLKINVX1 U92 ( .A(b[4]), .Y(n124) );
  CLKINVX1 U93 ( .A(a[4]), .Y(n130) );
  CLKINVX1 U94 ( .A(a[5]), .Y(n129) );
  CLKINVX1 U95 ( .A(b[5]), .Y(n123) );
  XOR2X1 U96 ( .A(n135), .B(n136), .Y(product[7]) );
  XOR2X1 U97 ( .A(n137), .B(n138), .Y(n136) );
  XOR2X1 U98 ( .A(n18), .B(n139), .Y(n138) );
  NOR2X1 U99 ( .A(n131), .B(n124), .Y(n139) );
  XOR2X1 U100 ( .A(n140), .B(n141), .Y(n137) );
  XOR2X1 U101 ( .A(n142), .B(n143), .Y(n141) );
  XOR2X1 U102 ( .A(n144), .B(n145), .Y(n143) );
  NAND2X1 U103 ( .A(b[5]), .B(a[2]), .Y(n145) );
  NAND2X1 U104 ( .A(b[6]), .B(a[1]), .Y(n144) );
  XOR2X1 U105 ( .A(n146), .B(n147), .Y(n142) );
  NAND2X1 U106 ( .A(b[3]), .B(a[4]), .Y(n147) );
  NAND2X1 U107 ( .A(b[1]), .B(a[6]), .Y(n146) );
  XOR2X1 U108 ( .A(n148), .B(n149), .Y(n140) );
  XOR2X1 U109 ( .A(n150), .B(n151), .Y(n149) );
  NAND2X1 U110 ( .A(b[0]), .B(a[7]), .Y(n151) );
  NAND2X1 U111 ( .A(b[2]), .B(a[5]), .Y(n150) );
  XNOR2X1 U112 ( .A(n24), .B(n152), .Y(n148) );
  NAND2X1 U113 ( .A(b[7]), .B(a[0]), .Y(n152) );
  XOR2X1 U114 ( .A(n153), .B(n154), .Y(n135) );
  XNOR2X1 U115 ( .A(n2), .B(n19), .Y(n154) );
  XNOR2X1 U116 ( .A(n22), .B(n21), .Y(n153) );
  NOR2X1 U117 ( .A(n134), .B(n128), .Y(product[0]) );
  NOR2X1 U118 ( .A(n134), .B(n127), .Y(n78) );
  NOR2X1 U119 ( .A(n134), .B(n126), .Y(n77) );
  NOR2X1 U120 ( .A(n134), .B(n125), .Y(n76) );
  NOR2X1 U121 ( .A(n134), .B(n124), .Y(n75) );
  NOR2X1 U122 ( .A(n134), .B(n123), .Y(n74) );
  AND2X1 U123 ( .A(b[6]), .B(a[0]), .Y(n73) );
  NOR2X1 U124 ( .A(n128), .B(n133), .Y(n71) );
  NOR2X1 U125 ( .A(n127), .B(n133), .Y(n70) );
  NOR2X1 U126 ( .A(n126), .B(n133), .Y(n69) );
  NOR2X1 U127 ( .A(n125), .B(n133), .Y(n68) );
  NOR2X1 U128 ( .A(n133), .B(n124), .Y(n67) );
  NOR2X1 U129 ( .A(n133), .B(n123), .Y(n66) );
  NOR2X1 U130 ( .A(n128), .B(n132), .Y(n64) );
  NOR2X1 U131 ( .A(n127), .B(n132), .Y(n63) );
  NOR2X1 U132 ( .A(n126), .B(n132), .Y(n62) );
  NOR2X1 U133 ( .A(n125), .B(n132), .Y(n61) );
  NOR2X1 U134 ( .A(n132), .B(n124), .Y(n60) );
  NOR2X1 U135 ( .A(n128), .B(n131), .Y(n58) );
  NOR2X1 U136 ( .A(n127), .B(n131), .Y(n57) );
  NOR2X1 U137 ( .A(n126), .B(n131), .Y(n56) );
  NOR2X1 U138 ( .A(n125), .B(n131), .Y(n55) );
  NOR2X1 U139 ( .A(n128), .B(n130), .Y(n53) );
  NOR2X1 U140 ( .A(n127), .B(n130), .Y(n52) );
  NOR2X1 U141 ( .A(n126), .B(n130), .Y(n51) );
  NOR2X1 U142 ( .A(n129), .B(n128), .Y(n49) );
  NOR2X1 U143 ( .A(n129), .B(n127), .Y(n48) );
  AND2X1 U144 ( .A(a[6]), .B(b[0]), .Y(n46) );
endmodule


module PE_12 ( clk, rst_n, START, A, B, Aout, Bout, Cout, DONE );
  input [7:0] A;
  input [7:0] B;
  output [7:0] Aout;
  output [7:0] Bout;
  output [7:0] Cout;
  input clk, rst_n, START;
  output DONE;
  wire   start, N9, N10, N11, N12, N13, N14, N15, N16, N17, N18, N19, N20, N21,
         N65, N66, N67, N68, N69, N70, N71, N72, N73, N74, N75, N76, N77, N78,
         N79, N80, N92, N93, N94, N95, N96, N97, N98, N99, n2, n3, n4, n6, n7,
         n9, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51,
         n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65,
         n66, n67, n68, n69;
  wire   [1:0] state;
  wire   [2:0] count;
  wire   [7:0] c;
  wire   [7:0] triggerCount;
  wire   [7:0] a;
  wire   [7:0] b;
  wire   SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, 
        SYNOPSYS_UNCONNECTED__4, SYNOPSYS_UNCONNECTED__5, 
        SYNOPSYS_UNCONNECTED__6, SYNOPSYS_UNCONNECTED__7;

  PE_12_DW01_inc_0 add_98 ( .A(triggerCount), .SUM({N99, N98, N97, N96, N95, 
        N94, N93, N92}) );
  PE_12_DW01_add_0 add_88 ( .A(c), .B({N72, N71, N70, N69, N68, N67, N66, N65}), .CI(1'b0), .SUM({N80, N79, N78, N77, N76, N75, N74, N73}) );
  PE_12_DW_mult_uns_0 r319 ( .a(a), .b(b), .product({SYNOPSYS_UNCONNECTED__0, 
        SYNOPSYS_UNCONNECTED__1, SYNOPSYS_UNCONNECTED__2, 
        SYNOPSYS_UNCONNECTED__3, SYNOPSYS_UNCONNECTED__4, 
        SYNOPSYS_UNCONNECTED__5, SYNOPSYS_UNCONNECTED__6, 
        SYNOPSYS_UNCONNECTED__7, N72, N71, N70, N69, N68, N67, N66, N65}) );
  DFFQX1 \Cout_reg[7]  ( .D(n53), .CK(clk), .Q(Cout[7]) );
  DFFQX1 \Cout_reg[6]  ( .D(n52), .CK(clk), .Q(Cout[6]) );
  DFFQX1 \Cout_reg[5]  ( .D(n51), .CK(clk), .Q(Cout[5]) );
  DFFQX1 \Cout_reg[4]  ( .D(n50), .CK(clk), .Q(Cout[4]) );
  DFFQX1 \Cout_reg[3]  ( .D(n49), .CK(clk), .Q(Cout[3]) );
  DFFQX1 \Cout_reg[2]  ( .D(n48), .CK(clk), .Q(Cout[2]) );
  DFFQX1 \Cout_reg[1]  ( .D(n47), .CK(clk), .Q(Cout[1]) );
  DFFQX1 \Cout_reg[0]  ( .D(n46), .CK(clk), .Q(Cout[0]) );
  DFFQX1 \c_reg[7]  ( .D(N21), .CK(clk), .Q(c[7]) );
  DFFQX1 \count_reg[1]  ( .D(N12), .CK(clk), .Q(count[1]) );
  DFFQX1 \count_reg[0]  ( .D(N11), .CK(clk), .Q(count[0]) );
  DFFX1 \count_reg[2]  ( .D(N13), .CK(clk), .QN(n68) );
  DFFTRX1 start_reg ( .D(START), .RN(rst_n), .CK(clk), .Q(start), .QN(n69) );
  DFFQX1 \state_reg[1]  ( .D(N10), .CK(clk), .Q(state[1]) );
  DFFQX1 \state_reg[0]  ( .D(N9), .CK(clk), .Q(state[0]) );
  DFFQX1 \c_reg[1]  ( .D(N15), .CK(clk), .Q(c[1]) );
  DFFQX1 \c_reg[2]  ( .D(N16), .CK(clk), .Q(c[2]) );
  DFFQX1 \c_reg[3]  ( .D(N17), .CK(clk), .Q(c[3]) );
  DFFQX1 \c_reg[4]  ( .D(N18), .CK(clk), .Q(c[4]) );
  DFFQX1 \c_reg[5]  ( .D(N19), .CK(clk), .Q(c[5]) );
  DFFQX1 \c_reg[6]  ( .D(N20), .CK(clk), .Q(c[6]) );
  DFFQX1 \triggerCount_reg[7]  ( .D(n9), .CK(clk), .Q(triggerCount[7]) );
  DFFQX1 \c_reg[0]  ( .D(N14), .CK(clk), .Q(c[0]) );
  DFFQX1 \triggerCount_reg[0]  ( .D(n39), .CK(clk), .Q(triggerCount[0]) );
  DFFQX1 \triggerCount_reg[1]  ( .D(n40), .CK(clk), .Q(triggerCount[1]) );
  DFFQX1 \triggerCount_reg[2]  ( .D(n41), .CK(clk), .Q(triggerCount[2]) );
  DFFQX1 \triggerCount_reg[5]  ( .D(n44), .CK(clk), .Q(triggerCount[5]) );
  DFFQX1 \triggerCount_reg[6]  ( .D(n45), .CK(clk), .Q(triggerCount[6]) );
  DFFQX1 \triggerCount_reg[4]  ( .D(n43), .CK(clk), .Q(triggerCount[4]) );
  DFFQX1 \triggerCount_reg[3]  ( .D(n42), .CK(clk), .Q(triggerCount[3]) );
  DFFTRX1 \a_reg[7]  ( .D(A[7]), .RN(rst_n), .CK(clk), .Q(a[7]) );
  DFFTRX1 \b_reg[7]  ( .D(B[7]), .RN(rst_n), .CK(clk), .Q(b[7]) );
  DFFTRX1 DONE_reg ( .D(n60), .RN(n7), .CK(clk), .Q(DONE) );
  DFFTRX1 \a_reg[6]  ( .D(A[6]), .RN(rst_n), .CK(clk), .Q(a[6]) );
  DFFTRX1 \b_reg[6]  ( .D(B[6]), .RN(rst_n), .CK(clk), .Q(b[6]) );
  DFFTRX1 \a_reg[5]  ( .D(A[5]), .RN(rst_n), .CK(clk), .Q(a[5]) );
  DFFTRX1 \a_reg[4]  ( .D(A[4]), .RN(rst_n), .CK(clk), .Q(a[4]) );
  DFFTRX1 \b_reg[5]  ( .D(B[5]), .RN(rst_n), .CK(clk), .Q(b[5]) );
  DFFTRX1 \b_reg[4]  ( .D(B[4]), .RN(rst_n), .CK(clk), .Q(b[4]) );
  DFFTRX1 \a_reg[3]  ( .D(A[3]), .RN(rst_n), .CK(clk), .Q(a[3]) );
  DFFTRX1 \a_reg[2]  ( .D(A[2]), .RN(rst_n), .CK(clk), .Q(a[2]) );
  DFFTRX1 \a_reg[1]  ( .D(A[1]), .RN(rst_n), .CK(clk), .Q(a[1]) );
  DFFTRX1 \b_reg[3]  ( .D(B[3]), .RN(rst_n), .CK(clk), .Q(b[3]) );
  DFFTRX1 \b_reg[2]  ( .D(B[2]), .RN(rst_n), .CK(clk), .Q(b[2]) );
  DFFTRX1 \b_reg[1]  ( .D(B[1]), .RN(rst_n), .CK(clk), .Q(b[1]) );
  DFFTRX1 \a_reg[0]  ( .D(A[0]), .RN(rst_n), .CK(clk), .Q(a[0]) );
  DFFTRX1 \b_reg[0]  ( .D(B[0]), .RN(rst_n), .CK(clk), .Q(b[0]) );
  DFFTRX1 \Bout_reg[7]  ( .D(B[7]), .RN(rst_n), .CK(clk), .Q(Bout[7]) );
  DFFTRX1 \Bout_reg[6]  ( .D(B[6]), .RN(rst_n), .CK(clk), .Q(Bout[6]) );
  DFFTRX1 \Bout_reg[5]  ( .D(B[5]), .RN(rst_n), .CK(clk), .Q(Bout[5]) );
  DFFTRX1 \Bout_reg[4]  ( .D(B[4]), .RN(rst_n), .CK(clk), .Q(Bout[4]) );
  DFFTRX1 \Bout_reg[3]  ( .D(B[3]), .RN(rst_n), .CK(clk), .Q(Bout[3]) );
  DFFTRX1 \Bout_reg[2]  ( .D(B[2]), .RN(rst_n), .CK(clk), .Q(Bout[2]) );
  DFFTRX1 \Bout_reg[1]  ( .D(B[1]), .RN(rst_n), .CK(clk), .Q(Bout[1]) );
  DFFTRX1 \Bout_reg[0]  ( .D(B[0]), .RN(rst_n), .CK(clk), .Q(Bout[0]) );
  DFFTRX1 \Aout_reg[7]  ( .D(A[7]), .RN(rst_n), .CK(clk), .Q(Aout[7]) );
  DFFTRX1 \Aout_reg[6]  ( .D(A[6]), .RN(rst_n), .CK(clk), .Q(Aout[6]) );
  DFFTRX1 \Aout_reg[5]  ( .D(A[5]), .RN(rst_n), .CK(clk), .Q(Aout[5]) );
  DFFTRX1 \Aout_reg[4]  ( .D(A[4]), .RN(rst_n), .CK(clk), .Q(Aout[4]) );
  DFFTRX1 \Aout_reg[3]  ( .D(A[3]), .RN(rst_n), .CK(clk), .Q(Aout[3]) );
  DFFTRX1 \Aout_reg[2]  ( .D(A[2]), .RN(rst_n), .CK(clk), .Q(Aout[2]) );
  DFFTRX1 \Aout_reg[1]  ( .D(A[1]), .RN(rst_n), .CK(clk), .Q(Aout[1]) );
  DFFTRX1 \Aout_reg[0]  ( .D(A[0]), .RN(rst_n), .CK(clk), .Q(Aout[0]) );
  AOI221XL U3 ( .A0(n63), .A1(n62), .B0(n6), .B1(state[1]), .C0(n2), .Y(n64)
         );
  CLKINVX1 U4 ( .A(n58), .Y(n4) );
  CLKINVX1 U5 ( .A(n65), .Y(n7) );
  AO22X1 U6 ( .A0(N71), .A1(n4), .B0(N79), .B1(n3), .Y(N20) );
  AO22X1 U8 ( .A0(N70), .A1(n4), .B0(N78), .B1(n3), .Y(N19) );
  AO22X1 U9 ( .A0(N69), .A1(n4), .B0(N77), .B1(n3), .Y(N18) );
  AO22X1 U10 ( .A0(N66), .A1(n4), .B0(N74), .B1(n3), .Y(N15) );
  AO22X1 U11 ( .A0(N68), .A1(n4), .B0(N76), .B1(n3), .Y(N17) );
  AO22X1 U12 ( .A0(N67), .A1(n4), .B0(N75), .B1(n3), .Y(N16) );
  AO22X1 U13 ( .A0(N65), .A1(n4), .B0(N73), .B1(n3), .Y(N14) );
  NAND2X1 U14 ( .A(rst_n), .B(n62), .Y(n65) );
  NAND2X1 U15 ( .A(n60), .B(n7), .Y(n58) );
  CLKINVX1 U16 ( .A(n57), .Y(n3) );
  CLKINVX1 U17 ( .A(n62), .Y(n6) );
  NOR2X1 U18 ( .A(n65), .B(n63), .Y(N9) );
  AO22X1 U19 ( .A0(N72), .A1(n4), .B0(N80), .B1(n3), .Y(N21) );
  NOR2BX1 U20 ( .AN(state[1]), .B(state[0]), .Y(n62) );
  OAI21XL U21 ( .A0(n60), .A1(n65), .B0(n59), .Y(n61) );
  OAI211X1 U22 ( .A0(state[0]), .A1(start), .B0(n6), .C0(rst_n), .Y(n59) );
  NAND4BX1 U23 ( .AN(triggerCount[0]), .B(triggerCount[7]), .C(n55), .D(n54), 
        .Y(n63) );
  NOR2X1 U24 ( .A(triggerCount[2]), .B(triggerCount[1]), .Y(n55) );
  NOR4X1 U25 ( .A(triggerCount[6]), .B(triggerCount[5]), .C(triggerCount[4]), 
        .D(triggerCount[3]), .Y(n54) );
  NOR2BX1 U26 ( .AN(n63), .B(n68), .Y(n60) );
  NOR3X1 U27 ( .A(n65), .B(n64), .C(n68), .Y(n66) );
  NAND3X1 U28 ( .A(n63), .B(n68), .C(n7), .Y(n57) );
  AO21X1 U29 ( .A0(n68), .A1(n7), .B0(n64), .Y(n67) );
  OAI21XL U30 ( .A0(count[0]), .A1(n57), .B0(n58), .Y(N11) );
  AO22X1 U31 ( .A0(n61), .A1(triggerCount[7]), .B0(N99), .B1(n4), .Y(n9) );
  AO22X1 U32 ( .A0(n61), .A1(triggerCount[0]), .B0(N92), .B1(n4), .Y(n39) );
  AO22X1 U33 ( .A0(Cout[1]), .A1(n67), .B0(c[1]), .B1(n66), .Y(n47) );
  AO22X1 U34 ( .A0(Cout[2]), .A1(n67), .B0(c[2]), .B1(n66), .Y(n48) );
  AO22X1 U35 ( .A0(Cout[3]), .A1(n67), .B0(c[3]), .B1(n66), .Y(n49) );
  AO22X1 U36 ( .A0(Cout[4]), .A1(n67), .B0(c[4]), .B1(n66), .Y(n50) );
  AO22X1 U37 ( .A0(Cout[5]), .A1(n67), .B0(c[5]), .B1(n66), .Y(n51) );
  AO22X1 U38 ( .A0(Cout[6]), .A1(n67), .B0(c[6]), .B1(n66), .Y(n52) );
  AO22X1 U39 ( .A0(Cout[7]), .A1(n67), .B0(c[7]), .B1(n66), .Y(n53) );
  AO22X1 U40 ( .A0(Cout[0]), .A1(n67), .B0(c[0]), .B1(n66), .Y(n46) );
  AO22X1 U41 ( .A0(n61), .A1(triggerCount[6]), .B0(N98), .B1(n4), .Y(n45) );
  AO22X1 U42 ( .A0(n61), .A1(triggerCount[5]), .B0(N97), .B1(n4), .Y(n44) );
  AO22X1 U43 ( .A0(n61), .A1(triggerCount[4]), .B0(N96), .B1(n4), .Y(n43) );
  AO22X1 U44 ( .A0(n61), .A1(triggerCount[3]), .B0(N95), .B1(n4), .Y(n42) );
  AO22X1 U45 ( .A0(n61), .A1(triggerCount[2]), .B0(N94), .B1(n4), .Y(n41) );
  AO22X1 U46 ( .A0(n61), .A1(triggerCount[1]), .B0(N93), .B1(n4), .Y(n40) );
  AND3X2 U47 ( .A(count[1]), .B(n3), .C(count[0]), .Y(N13) );
  NOR2X1 U48 ( .A(n56), .B(n57), .Y(N12) );
  XNOR2X1 U49 ( .A(count[0]), .B(count[1]), .Y(n56) );
  OAI31XL U50 ( .A0(n69), .A1(state[0]), .A2(n2), .B0(n65), .Y(N10) );
  CLKINVX1 U51 ( .A(rst_n), .Y(n2) );
endmodule


module PE_11_DW01_inc_0 ( A, SUM );
  input [7:0] A;
  output [7:0] SUM;

  wire   [7:2] carry;

  ADDHXL U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHXL U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  ADDHXL U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHXL U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHXL U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHXL U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  CLKINVX1 U1 ( .A(A[0]), .Y(SUM[0]) );
  XOR2X1 U2 ( .A(carry[7]), .B(A[7]), .Y(SUM[7]) );
endmodule


module PE_11_DW01_add_0 ( A, B, CI, SUM, CO );
  input [7:0] A;
  input [7:0] B;
  output [7:0] SUM;
  input CI;
  output CO;
  wire   n1, n2;
  wire   [7:1] carry;

  ADDFXL U1_1 ( .A(A[1]), .B(B[1]), .CI(carry[1]), .CO(carry[2]), .S(SUM[1])
         );
  ADDFXL U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  ADDFXL U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFXL U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  ADDFXL U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  ADDFXL U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  XOR3X1 U1_7 ( .A(A[7]), .B(B[7]), .C(carry[7]), .Y(SUM[7]) );
  XNOR2X1 U1 ( .A(B[0]), .B(n1), .Y(SUM[0]) );
  NOR2X1 U2 ( .A(n1), .B(n2), .Y(carry[1]) );
  CLKINVX1 U3 ( .A(B[0]), .Y(n2) );
  CLKINVX1 U4 ( .A(A[0]), .Y(n1) );
endmodule


module PE_11_DW_mult_uns_0 ( a, b, product );
  input [7:0] a;
  input [7:0] b;
  output [15:0] product;
  wire   n2, n3, n4, n5, n6, n7, n18, n19, n20, n21, n22, n23, n24, n25, n26,
         n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40,
         n41, n42, n43, n46, n48, n49, n51, n52, n53, n55, n56, n57, n58, n60,
         n61, n62, n63, n64, n66, n67, n68, n69, n70, n71, n73, n74, n75, n76,
         n77, n78, n123, n124, n125, n126, n127, n128, n129, n130, n131, n132,
         n133, n134, n135, n136, n137, n138, n139, n140, n141, n142, n143,
         n144, n145, n146, n147, n148, n149, n150, n151, n152, n153, n154;

  ADDFXL U3 ( .A(n20), .B(n27), .CI(n3), .CO(n2), .S(product[6]) );
  ADDFXL U4 ( .A(n28), .B(n34), .CI(n4), .CO(n3), .S(product[5]) );
  ADDFXL U5 ( .A(n35), .B(n38), .CI(n5), .CO(n4), .S(product[4]) );
  ADDFXL U6 ( .A(n39), .B(n41), .CI(n6), .CO(n5), .S(product[3]) );
  ADDFXL U7 ( .A(n7), .B(n64), .CI(n43), .CO(n6), .S(product[2]) );
  ADDHXL U8 ( .A(n71), .B(n78), .CO(n7), .S(product[1]) );
  CMPR42X1 U19 ( .A(n60), .B(n55), .C(n26), .D(n29), .ICI(n23), .S(n20), .ICO(
        n18), .CO(n19) );
  CMPR42X1 U20 ( .A(n73), .B(n51), .C(n66), .D(n31), .ICI(n25), .S(n23), .ICO(
        n21), .CO(n22) );
  ADDHXL U21 ( .A(n48), .B(n46), .CO(n24), .S(n25) );
  CMPR42X1 U22 ( .A(n67), .B(n61), .C(n33), .D(n32), .ICI(n30), .S(n28), .ICO(
        n26), .CO(n27) );
  ADDFXL U23 ( .A(n56), .B(n74), .CI(n36), .CO(n29), .S(n30) );
  ADDHXL U24 ( .A(n52), .B(n49), .CO(n31), .S(n32) );
  CMPR42X1 U25 ( .A(n75), .B(n62), .C(n68), .D(n40), .ICI(n37), .S(n35), .ICO(
        n33), .CO(n34) );
  ADDHXL U26 ( .A(n57), .B(n53), .CO(n36), .S(n37) );
  ADDFXL U27 ( .A(n69), .B(n76), .CI(n42), .CO(n38), .S(n39) );
  ADDHXL U28 ( .A(n63), .B(n58), .CO(n40), .S(n41) );
  ADDHXL U29 ( .A(n77), .B(n70), .CO(n42), .S(n43) );
  CLKINVX1 U84 ( .A(a[0]), .Y(n134) );
  CLKINVX1 U85 ( .A(b[0]), .Y(n128) );
  CLKINVX1 U86 ( .A(b[1]), .Y(n127) );
  CLKINVX1 U87 ( .A(a[1]), .Y(n133) );
  CLKINVX1 U88 ( .A(b[2]), .Y(n126) );
  CLKINVX1 U89 ( .A(a[2]), .Y(n132) );
  CLKINVX1 U90 ( .A(a[3]), .Y(n131) );
  CLKINVX1 U91 ( .A(b[3]), .Y(n125) );
  CLKINVX1 U92 ( .A(b[4]), .Y(n124) );
  CLKINVX1 U93 ( .A(a[4]), .Y(n130) );
  CLKINVX1 U94 ( .A(a[5]), .Y(n129) );
  CLKINVX1 U95 ( .A(b[5]), .Y(n123) );
  XOR2X1 U96 ( .A(n135), .B(n136), .Y(product[7]) );
  XOR2X1 U97 ( .A(n137), .B(n138), .Y(n136) );
  XOR2X1 U98 ( .A(n18), .B(n139), .Y(n138) );
  NOR2X1 U99 ( .A(n131), .B(n124), .Y(n139) );
  XOR2X1 U100 ( .A(n140), .B(n141), .Y(n137) );
  XOR2X1 U101 ( .A(n142), .B(n143), .Y(n141) );
  XOR2X1 U102 ( .A(n144), .B(n145), .Y(n143) );
  NAND2X1 U103 ( .A(b[5]), .B(a[2]), .Y(n145) );
  NAND2X1 U104 ( .A(b[6]), .B(a[1]), .Y(n144) );
  XOR2X1 U105 ( .A(n146), .B(n147), .Y(n142) );
  NAND2X1 U106 ( .A(b[3]), .B(a[4]), .Y(n147) );
  NAND2X1 U107 ( .A(b[1]), .B(a[6]), .Y(n146) );
  XOR2X1 U108 ( .A(n148), .B(n149), .Y(n140) );
  XOR2X1 U109 ( .A(n150), .B(n151), .Y(n149) );
  NAND2X1 U110 ( .A(b[0]), .B(a[7]), .Y(n151) );
  NAND2X1 U111 ( .A(b[2]), .B(a[5]), .Y(n150) );
  XNOR2X1 U112 ( .A(n24), .B(n152), .Y(n148) );
  NAND2X1 U113 ( .A(b[7]), .B(a[0]), .Y(n152) );
  XOR2X1 U114 ( .A(n153), .B(n154), .Y(n135) );
  XNOR2X1 U115 ( .A(n2), .B(n19), .Y(n154) );
  XNOR2X1 U116 ( .A(n22), .B(n21), .Y(n153) );
  NOR2X1 U117 ( .A(n134), .B(n128), .Y(product[0]) );
  NOR2X1 U118 ( .A(n134), .B(n127), .Y(n78) );
  NOR2X1 U119 ( .A(n134), .B(n126), .Y(n77) );
  NOR2X1 U120 ( .A(n134), .B(n125), .Y(n76) );
  NOR2X1 U121 ( .A(n134), .B(n124), .Y(n75) );
  NOR2X1 U122 ( .A(n134), .B(n123), .Y(n74) );
  AND2X1 U123 ( .A(b[6]), .B(a[0]), .Y(n73) );
  NOR2X1 U124 ( .A(n128), .B(n133), .Y(n71) );
  NOR2X1 U125 ( .A(n127), .B(n133), .Y(n70) );
  NOR2X1 U126 ( .A(n126), .B(n133), .Y(n69) );
  NOR2X1 U127 ( .A(n125), .B(n133), .Y(n68) );
  NOR2X1 U128 ( .A(n133), .B(n124), .Y(n67) );
  NOR2X1 U129 ( .A(n133), .B(n123), .Y(n66) );
  NOR2X1 U130 ( .A(n128), .B(n132), .Y(n64) );
  NOR2X1 U131 ( .A(n127), .B(n132), .Y(n63) );
  NOR2X1 U132 ( .A(n126), .B(n132), .Y(n62) );
  NOR2X1 U133 ( .A(n125), .B(n132), .Y(n61) );
  NOR2X1 U134 ( .A(n132), .B(n124), .Y(n60) );
  NOR2X1 U135 ( .A(n128), .B(n131), .Y(n58) );
  NOR2X1 U136 ( .A(n127), .B(n131), .Y(n57) );
  NOR2X1 U137 ( .A(n126), .B(n131), .Y(n56) );
  NOR2X1 U138 ( .A(n125), .B(n131), .Y(n55) );
  NOR2X1 U139 ( .A(n128), .B(n130), .Y(n53) );
  NOR2X1 U140 ( .A(n127), .B(n130), .Y(n52) );
  NOR2X1 U141 ( .A(n126), .B(n130), .Y(n51) );
  NOR2X1 U142 ( .A(n129), .B(n128), .Y(n49) );
  NOR2X1 U143 ( .A(n129), .B(n127), .Y(n48) );
  AND2X1 U144 ( .A(a[6]), .B(b[0]), .Y(n46) );
endmodule


module PE_11 ( clk, rst_n, START, A, B, Aout, Bout, Cout, DONE );
  input [7:0] A;
  input [7:0] B;
  output [7:0] Aout;
  output [7:0] Bout;
  output [7:0] Cout;
  input clk, rst_n, START;
  output DONE;
  wire   start, N9, N10, N11, N12, N13, N14, N15, N16, N17, N18, N19, N20, N21,
         N65, N66, N67, N68, N69, N70, N71, N72, N73, N74, N75, N76, N77, N78,
         N79, N80, N92, N93, N94, N95, N96, N97, N98, N99, n2, n3, n4, n6, n7,
         n9, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51,
         n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65,
         n66, n67, n68, n69;
  wire   [1:0] state;
  wire   [2:0] count;
  wire   [7:0] c;
  wire   [7:0] triggerCount;
  wire   [7:0] a;
  wire   [7:0] b;
  wire   SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, 
        SYNOPSYS_UNCONNECTED__4, SYNOPSYS_UNCONNECTED__5, 
        SYNOPSYS_UNCONNECTED__6, SYNOPSYS_UNCONNECTED__7;

  PE_11_DW01_inc_0 add_98 ( .A(triggerCount), .SUM({N99, N98, N97, N96, N95, 
        N94, N93, N92}) );
  PE_11_DW01_add_0 add_88 ( .A(c), .B({N72, N71, N70, N69, N68, N67, N66, N65}), .CI(1'b0), .SUM({N80, N79, N78, N77, N76, N75, N74, N73}) );
  PE_11_DW_mult_uns_0 r319 ( .a(a), .b(b), .product({SYNOPSYS_UNCONNECTED__0, 
        SYNOPSYS_UNCONNECTED__1, SYNOPSYS_UNCONNECTED__2, 
        SYNOPSYS_UNCONNECTED__3, SYNOPSYS_UNCONNECTED__4, 
        SYNOPSYS_UNCONNECTED__5, SYNOPSYS_UNCONNECTED__6, 
        SYNOPSYS_UNCONNECTED__7, N72, N71, N70, N69, N68, N67, N66, N65}) );
  DFFQX1 \Cout_reg[7]  ( .D(n53), .CK(clk), .Q(Cout[7]) );
  DFFQX1 \Cout_reg[6]  ( .D(n52), .CK(clk), .Q(Cout[6]) );
  DFFQX1 \Cout_reg[5]  ( .D(n51), .CK(clk), .Q(Cout[5]) );
  DFFQX1 \Cout_reg[4]  ( .D(n50), .CK(clk), .Q(Cout[4]) );
  DFFQX1 \Cout_reg[3]  ( .D(n49), .CK(clk), .Q(Cout[3]) );
  DFFQX1 \Cout_reg[2]  ( .D(n48), .CK(clk), .Q(Cout[2]) );
  DFFQX1 \Cout_reg[1]  ( .D(n47), .CK(clk), .Q(Cout[1]) );
  DFFQX1 \Cout_reg[0]  ( .D(n46), .CK(clk), .Q(Cout[0]) );
  DFFQX1 \c_reg[7]  ( .D(N21), .CK(clk), .Q(c[7]) );
  DFFQX1 \count_reg[1]  ( .D(N12), .CK(clk), .Q(count[1]) );
  DFFQX1 \count_reg[0]  ( .D(N11), .CK(clk), .Q(count[0]) );
  DFFX1 \count_reg[2]  ( .D(N13), .CK(clk), .QN(n68) );
  DFFTRX1 start_reg ( .D(START), .RN(rst_n), .CK(clk), .Q(start), .QN(n69) );
  DFFQX1 \state_reg[1]  ( .D(N10), .CK(clk), .Q(state[1]) );
  DFFQX1 \state_reg[0]  ( .D(N9), .CK(clk), .Q(state[0]) );
  DFFQX1 \c_reg[1]  ( .D(N15), .CK(clk), .Q(c[1]) );
  DFFQX1 \c_reg[2]  ( .D(N16), .CK(clk), .Q(c[2]) );
  DFFQX1 \c_reg[3]  ( .D(N17), .CK(clk), .Q(c[3]) );
  DFFQX1 \c_reg[4]  ( .D(N18), .CK(clk), .Q(c[4]) );
  DFFQX1 \c_reg[5]  ( .D(N19), .CK(clk), .Q(c[5]) );
  DFFQX1 \c_reg[6]  ( .D(N20), .CK(clk), .Q(c[6]) );
  DFFQX1 \triggerCount_reg[7]  ( .D(n9), .CK(clk), .Q(triggerCount[7]) );
  DFFQX1 \c_reg[0]  ( .D(N14), .CK(clk), .Q(c[0]) );
  DFFQX1 \triggerCount_reg[0]  ( .D(n39), .CK(clk), .Q(triggerCount[0]) );
  DFFQX1 \triggerCount_reg[1]  ( .D(n40), .CK(clk), .Q(triggerCount[1]) );
  DFFQX1 \triggerCount_reg[2]  ( .D(n41), .CK(clk), .Q(triggerCount[2]) );
  DFFQX1 \triggerCount_reg[5]  ( .D(n44), .CK(clk), .Q(triggerCount[5]) );
  DFFQX1 \triggerCount_reg[6]  ( .D(n45), .CK(clk), .Q(triggerCount[6]) );
  DFFQX1 \triggerCount_reg[4]  ( .D(n43), .CK(clk), .Q(triggerCount[4]) );
  DFFQX1 \triggerCount_reg[3]  ( .D(n42), .CK(clk), .Q(triggerCount[3]) );
  DFFTRX1 \a_reg[7]  ( .D(A[7]), .RN(rst_n), .CK(clk), .Q(a[7]) );
  DFFTRX1 \b_reg[7]  ( .D(B[7]), .RN(rst_n), .CK(clk), .Q(b[7]) );
  DFFTRX1 DONE_reg ( .D(n60), .RN(n7), .CK(clk), .Q(DONE) );
  DFFTRX1 \a_reg[6]  ( .D(A[6]), .RN(rst_n), .CK(clk), .Q(a[6]) );
  DFFTRX1 \b_reg[6]  ( .D(B[6]), .RN(rst_n), .CK(clk), .Q(b[6]) );
  DFFTRX1 \a_reg[5]  ( .D(A[5]), .RN(rst_n), .CK(clk), .Q(a[5]) );
  DFFTRX1 \a_reg[4]  ( .D(A[4]), .RN(rst_n), .CK(clk), .Q(a[4]) );
  DFFTRX1 \b_reg[5]  ( .D(B[5]), .RN(rst_n), .CK(clk), .Q(b[5]) );
  DFFTRX1 \b_reg[4]  ( .D(B[4]), .RN(rst_n), .CK(clk), .Q(b[4]) );
  DFFTRX1 \a_reg[3]  ( .D(A[3]), .RN(rst_n), .CK(clk), .Q(a[3]) );
  DFFTRX1 \a_reg[2]  ( .D(A[2]), .RN(rst_n), .CK(clk), .Q(a[2]) );
  DFFTRX1 \a_reg[1]  ( .D(A[1]), .RN(rst_n), .CK(clk), .Q(a[1]) );
  DFFTRX1 \b_reg[3]  ( .D(B[3]), .RN(rst_n), .CK(clk), .Q(b[3]) );
  DFFTRX1 \b_reg[2]  ( .D(B[2]), .RN(rst_n), .CK(clk), .Q(b[2]) );
  DFFTRX1 \b_reg[1]  ( .D(B[1]), .RN(rst_n), .CK(clk), .Q(b[1]) );
  DFFTRX1 \a_reg[0]  ( .D(A[0]), .RN(rst_n), .CK(clk), .Q(a[0]) );
  DFFTRX1 \b_reg[0]  ( .D(B[0]), .RN(rst_n), .CK(clk), .Q(b[0]) );
  DFFTRX1 \Bout_reg[7]  ( .D(B[7]), .RN(rst_n), .CK(clk), .Q(Bout[7]) );
  DFFTRX1 \Bout_reg[6]  ( .D(B[6]), .RN(rst_n), .CK(clk), .Q(Bout[6]) );
  DFFTRX1 \Bout_reg[5]  ( .D(B[5]), .RN(rst_n), .CK(clk), .Q(Bout[5]) );
  DFFTRX1 \Bout_reg[4]  ( .D(B[4]), .RN(rst_n), .CK(clk), .Q(Bout[4]) );
  DFFTRX1 \Bout_reg[3]  ( .D(B[3]), .RN(rst_n), .CK(clk), .Q(Bout[3]) );
  DFFTRX1 \Bout_reg[2]  ( .D(B[2]), .RN(rst_n), .CK(clk), .Q(Bout[2]) );
  DFFTRX1 \Bout_reg[1]  ( .D(B[1]), .RN(rst_n), .CK(clk), .Q(Bout[1]) );
  DFFTRX1 \Bout_reg[0]  ( .D(B[0]), .RN(rst_n), .CK(clk), .Q(Bout[0]) );
  DFFTRX1 \Aout_reg[7]  ( .D(A[7]), .RN(rst_n), .CK(clk), .Q(Aout[7]) );
  DFFTRX1 \Aout_reg[6]  ( .D(A[6]), .RN(rst_n), .CK(clk), .Q(Aout[6]) );
  DFFTRX1 \Aout_reg[5]  ( .D(A[5]), .RN(rst_n), .CK(clk), .Q(Aout[5]) );
  DFFTRX1 \Aout_reg[4]  ( .D(A[4]), .RN(rst_n), .CK(clk), .Q(Aout[4]) );
  DFFTRX1 \Aout_reg[3]  ( .D(A[3]), .RN(rst_n), .CK(clk), .Q(Aout[3]) );
  DFFTRX1 \Aout_reg[2]  ( .D(A[2]), .RN(rst_n), .CK(clk), .Q(Aout[2]) );
  DFFTRX1 \Aout_reg[1]  ( .D(A[1]), .RN(rst_n), .CK(clk), .Q(Aout[1]) );
  DFFTRX1 \Aout_reg[0]  ( .D(A[0]), .RN(rst_n), .CK(clk), .Q(Aout[0]) );
  AOI221XL U3 ( .A0(n63), .A1(n62), .B0(n6), .B1(state[1]), .C0(n2), .Y(n64)
         );
  CLKINVX1 U4 ( .A(n58), .Y(n4) );
  CLKINVX1 U5 ( .A(n65), .Y(n7) );
  AO22X1 U6 ( .A0(N71), .A1(n4), .B0(N79), .B1(n3), .Y(N20) );
  AO22X1 U8 ( .A0(N70), .A1(n4), .B0(N78), .B1(n3), .Y(N19) );
  AO22X1 U9 ( .A0(N69), .A1(n4), .B0(N77), .B1(n3), .Y(N18) );
  AO22X1 U10 ( .A0(N66), .A1(n4), .B0(N74), .B1(n3), .Y(N15) );
  AO22X1 U11 ( .A0(N68), .A1(n4), .B0(N76), .B1(n3), .Y(N17) );
  AO22X1 U12 ( .A0(N67), .A1(n4), .B0(N75), .B1(n3), .Y(N16) );
  AO22X1 U13 ( .A0(N65), .A1(n4), .B0(N73), .B1(n3), .Y(N14) );
  NAND2X1 U14 ( .A(rst_n), .B(n62), .Y(n65) );
  NAND2X1 U15 ( .A(n60), .B(n7), .Y(n58) );
  CLKINVX1 U16 ( .A(n57), .Y(n3) );
  CLKINVX1 U17 ( .A(n62), .Y(n6) );
  NOR2X1 U18 ( .A(n65), .B(n63), .Y(N9) );
  AO22X1 U19 ( .A0(N72), .A1(n4), .B0(N80), .B1(n3), .Y(N21) );
  NOR2BX1 U20 ( .AN(state[1]), .B(state[0]), .Y(n62) );
  OAI21XL U21 ( .A0(n60), .A1(n65), .B0(n59), .Y(n61) );
  OAI211X1 U22 ( .A0(state[0]), .A1(start), .B0(n6), .C0(rst_n), .Y(n59) );
  NAND4BX1 U23 ( .AN(triggerCount[0]), .B(triggerCount[7]), .C(n55), .D(n54), 
        .Y(n63) );
  NOR2X1 U24 ( .A(triggerCount[2]), .B(triggerCount[1]), .Y(n55) );
  NOR4X1 U25 ( .A(triggerCount[6]), .B(triggerCount[5]), .C(triggerCount[4]), 
        .D(triggerCount[3]), .Y(n54) );
  NOR2BX1 U26 ( .AN(n63), .B(n68), .Y(n60) );
  NOR3X1 U27 ( .A(n65), .B(n64), .C(n68), .Y(n66) );
  NAND3X1 U28 ( .A(n63), .B(n68), .C(n7), .Y(n57) );
  AO21X1 U29 ( .A0(n68), .A1(n7), .B0(n64), .Y(n67) );
  OAI21XL U30 ( .A0(count[0]), .A1(n57), .B0(n58), .Y(N11) );
  AO22X1 U31 ( .A0(n61), .A1(triggerCount[7]), .B0(N99), .B1(n4), .Y(n9) );
  AO22X1 U32 ( .A0(n61), .A1(triggerCount[0]), .B0(N92), .B1(n4), .Y(n39) );
  AO22X1 U33 ( .A0(Cout[1]), .A1(n67), .B0(c[1]), .B1(n66), .Y(n47) );
  AO22X1 U34 ( .A0(Cout[2]), .A1(n67), .B0(c[2]), .B1(n66), .Y(n48) );
  AO22X1 U35 ( .A0(Cout[3]), .A1(n67), .B0(c[3]), .B1(n66), .Y(n49) );
  AO22X1 U36 ( .A0(Cout[4]), .A1(n67), .B0(c[4]), .B1(n66), .Y(n50) );
  AO22X1 U37 ( .A0(Cout[5]), .A1(n67), .B0(c[5]), .B1(n66), .Y(n51) );
  AO22X1 U38 ( .A0(Cout[6]), .A1(n67), .B0(c[6]), .B1(n66), .Y(n52) );
  AO22X1 U39 ( .A0(Cout[7]), .A1(n67), .B0(c[7]), .B1(n66), .Y(n53) );
  AO22X1 U40 ( .A0(Cout[0]), .A1(n67), .B0(c[0]), .B1(n66), .Y(n46) );
  AO22X1 U41 ( .A0(n61), .A1(triggerCount[6]), .B0(N98), .B1(n4), .Y(n45) );
  AO22X1 U42 ( .A0(n61), .A1(triggerCount[5]), .B0(N97), .B1(n4), .Y(n44) );
  AO22X1 U43 ( .A0(n61), .A1(triggerCount[4]), .B0(N96), .B1(n4), .Y(n43) );
  AO22X1 U44 ( .A0(n61), .A1(triggerCount[3]), .B0(N95), .B1(n4), .Y(n42) );
  AO22X1 U45 ( .A0(n61), .A1(triggerCount[2]), .B0(N94), .B1(n4), .Y(n41) );
  AO22X1 U46 ( .A0(n61), .A1(triggerCount[1]), .B0(N93), .B1(n4), .Y(n40) );
  AND3X2 U47 ( .A(count[1]), .B(n3), .C(count[0]), .Y(N13) );
  NOR2X1 U48 ( .A(n56), .B(n57), .Y(N12) );
  XNOR2X1 U49 ( .A(count[0]), .B(count[1]), .Y(n56) );
  OAI31XL U50 ( .A0(n69), .A1(state[0]), .A2(n2), .B0(n65), .Y(N10) );
  CLKINVX1 U51 ( .A(rst_n), .Y(n2) );
endmodule


module PE_10_DW01_inc_0 ( A, SUM );
  input [7:0] A;
  output [7:0] SUM;

  wire   [7:2] carry;

  ADDHXL U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHXL U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  ADDHXL U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHXL U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHXL U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHXL U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  CLKINVX1 U1 ( .A(A[0]), .Y(SUM[0]) );
  XOR2X1 U2 ( .A(carry[7]), .B(A[7]), .Y(SUM[7]) );
endmodule


module PE_10_DW01_add_0 ( A, B, CI, SUM, CO );
  input [7:0] A;
  input [7:0] B;
  output [7:0] SUM;
  input CI;
  output CO;
  wire   n1, n2;
  wire   [7:1] carry;

  ADDFXL U1_1 ( .A(A[1]), .B(B[1]), .CI(carry[1]), .CO(carry[2]), .S(SUM[1])
         );
  ADDFXL U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  ADDFXL U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFXL U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  ADDFXL U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  ADDFXL U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  XOR3X1 U1_7 ( .A(A[7]), .B(B[7]), .C(carry[7]), .Y(SUM[7]) );
  XNOR2X1 U1 ( .A(B[0]), .B(n1), .Y(SUM[0]) );
  NOR2X1 U2 ( .A(n1), .B(n2), .Y(carry[1]) );
  CLKINVX1 U3 ( .A(B[0]), .Y(n2) );
  CLKINVX1 U4 ( .A(A[0]), .Y(n1) );
endmodule


module PE_10_DW_mult_uns_0 ( a, b, product );
  input [7:0] a;
  input [7:0] b;
  output [15:0] product;
  wire   n2, n3, n4, n5, n6, n7, n18, n19, n20, n21, n22, n23, n24, n25, n26,
         n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40,
         n41, n42, n43, n46, n48, n49, n51, n52, n53, n55, n56, n57, n58, n60,
         n61, n62, n63, n64, n66, n67, n68, n69, n70, n71, n73, n74, n75, n76,
         n77, n78, n123, n124, n125, n126, n127, n128, n129, n130, n131, n132,
         n133, n134, n135, n136, n137, n138, n139, n140, n141, n142, n143,
         n144, n145, n146, n147, n148, n149, n150, n151, n152, n153, n154;

  ADDFXL U3 ( .A(n20), .B(n27), .CI(n3), .CO(n2), .S(product[6]) );
  ADDFXL U4 ( .A(n28), .B(n34), .CI(n4), .CO(n3), .S(product[5]) );
  ADDFXL U5 ( .A(n35), .B(n38), .CI(n5), .CO(n4), .S(product[4]) );
  ADDFXL U6 ( .A(n39), .B(n41), .CI(n6), .CO(n5), .S(product[3]) );
  ADDFXL U7 ( .A(n7), .B(n64), .CI(n43), .CO(n6), .S(product[2]) );
  ADDHXL U8 ( .A(n71), .B(n78), .CO(n7), .S(product[1]) );
  CMPR42X1 U19 ( .A(n60), .B(n55), .C(n26), .D(n29), .ICI(n23), .S(n20), .ICO(
        n18), .CO(n19) );
  CMPR42X1 U20 ( .A(n73), .B(n51), .C(n66), .D(n31), .ICI(n25), .S(n23), .ICO(
        n21), .CO(n22) );
  ADDHXL U21 ( .A(n48), .B(n46), .CO(n24), .S(n25) );
  CMPR42X1 U22 ( .A(n67), .B(n61), .C(n33), .D(n32), .ICI(n30), .S(n28), .ICO(
        n26), .CO(n27) );
  ADDFXL U23 ( .A(n56), .B(n74), .CI(n36), .CO(n29), .S(n30) );
  ADDHXL U24 ( .A(n52), .B(n49), .CO(n31), .S(n32) );
  CMPR42X1 U25 ( .A(n75), .B(n62), .C(n68), .D(n40), .ICI(n37), .S(n35), .ICO(
        n33), .CO(n34) );
  ADDHXL U26 ( .A(n57), .B(n53), .CO(n36), .S(n37) );
  ADDFXL U27 ( .A(n69), .B(n76), .CI(n42), .CO(n38), .S(n39) );
  ADDHXL U28 ( .A(n63), .B(n58), .CO(n40), .S(n41) );
  ADDHXL U29 ( .A(n77), .B(n70), .CO(n42), .S(n43) );
  CLKINVX1 U84 ( .A(a[0]), .Y(n134) );
  CLKINVX1 U85 ( .A(b[0]), .Y(n128) );
  CLKINVX1 U86 ( .A(b[1]), .Y(n127) );
  CLKINVX1 U87 ( .A(a[1]), .Y(n133) );
  CLKINVX1 U88 ( .A(b[2]), .Y(n126) );
  CLKINVX1 U89 ( .A(a[2]), .Y(n132) );
  CLKINVX1 U90 ( .A(a[3]), .Y(n131) );
  CLKINVX1 U91 ( .A(b[3]), .Y(n125) );
  CLKINVX1 U92 ( .A(b[4]), .Y(n124) );
  CLKINVX1 U93 ( .A(a[4]), .Y(n130) );
  CLKINVX1 U94 ( .A(a[5]), .Y(n129) );
  CLKINVX1 U95 ( .A(b[5]), .Y(n123) );
  XOR2X1 U96 ( .A(n135), .B(n136), .Y(product[7]) );
  XOR2X1 U97 ( .A(n137), .B(n138), .Y(n136) );
  XOR2X1 U98 ( .A(n18), .B(n139), .Y(n138) );
  NOR2X1 U99 ( .A(n131), .B(n124), .Y(n139) );
  XOR2X1 U100 ( .A(n140), .B(n141), .Y(n137) );
  XOR2X1 U101 ( .A(n142), .B(n143), .Y(n141) );
  XOR2X1 U102 ( .A(n144), .B(n145), .Y(n143) );
  NAND2X1 U103 ( .A(b[5]), .B(a[2]), .Y(n145) );
  NAND2X1 U104 ( .A(b[6]), .B(a[1]), .Y(n144) );
  XOR2X1 U105 ( .A(n146), .B(n147), .Y(n142) );
  NAND2X1 U106 ( .A(b[3]), .B(a[4]), .Y(n147) );
  NAND2X1 U107 ( .A(b[1]), .B(a[6]), .Y(n146) );
  XOR2X1 U108 ( .A(n148), .B(n149), .Y(n140) );
  XOR2X1 U109 ( .A(n150), .B(n151), .Y(n149) );
  NAND2X1 U110 ( .A(b[0]), .B(a[7]), .Y(n151) );
  NAND2X1 U111 ( .A(b[2]), .B(a[5]), .Y(n150) );
  XNOR2X1 U112 ( .A(n24), .B(n152), .Y(n148) );
  NAND2X1 U113 ( .A(b[7]), .B(a[0]), .Y(n152) );
  XOR2X1 U114 ( .A(n153), .B(n154), .Y(n135) );
  XNOR2X1 U115 ( .A(n2), .B(n19), .Y(n154) );
  XNOR2X1 U116 ( .A(n22), .B(n21), .Y(n153) );
  NOR2X1 U117 ( .A(n134), .B(n128), .Y(product[0]) );
  NOR2X1 U118 ( .A(n134), .B(n127), .Y(n78) );
  NOR2X1 U119 ( .A(n134), .B(n126), .Y(n77) );
  NOR2X1 U120 ( .A(n134), .B(n125), .Y(n76) );
  NOR2X1 U121 ( .A(n134), .B(n124), .Y(n75) );
  NOR2X1 U122 ( .A(n134), .B(n123), .Y(n74) );
  AND2X1 U123 ( .A(b[6]), .B(a[0]), .Y(n73) );
  NOR2X1 U124 ( .A(n128), .B(n133), .Y(n71) );
  NOR2X1 U125 ( .A(n127), .B(n133), .Y(n70) );
  NOR2X1 U126 ( .A(n126), .B(n133), .Y(n69) );
  NOR2X1 U127 ( .A(n125), .B(n133), .Y(n68) );
  NOR2X1 U128 ( .A(n133), .B(n124), .Y(n67) );
  NOR2X1 U129 ( .A(n133), .B(n123), .Y(n66) );
  NOR2X1 U130 ( .A(n128), .B(n132), .Y(n64) );
  NOR2X1 U131 ( .A(n127), .B(n132), .Y(n63) );
  NOR2X1 U132 ( .A(n126), .B(n132), .Y(n62) );
  NOR2X1 U133 ( .A(n125), .B(n132), .Y(n61) );
  NOR2X1 U134 ( .A(n132), .B(n124), .Y(n60) );
  NOR2X1 U135 ( .A(n128), .B(n131), .Y(n58) );
  NOR2X1 U136 ( .A(n127), .B(n131), .Y(n57) );
  NOR2X1 U137 ( .A(n126), .B(n131), .Y(n56) );
  NOR2X1 U138 ( .A(n125), .B(n131), .Y(n55) );
  NOR2X1 U139 ( .A(n128), .B(n130), .Y(n53) );
  NOR2X1 U140 ( .A(n127), .B(n130), .Y(n52) );
  NOR2X1 U141 ( .A(n126), .B(n130), .Y(n51) );
  NOR2X1 U142 ( .A(n129), .B(n128), .Y(n49) );
  NOR2X1 U143 ( .A(n129), .B(n127), .Y(n48) );
  AND2X1 U144 ( .A(a[6]), .B(b[0]), .Y(n46) );
endmodule


module PE_10 ( clk, rst_n, START, A, B, Aout, Bout, Cout, DONE );
  input [7:0] A;
  input [7:0] B;
  output [7:0] Aout;
  output [7:0] Bout;
  output [7:0] Cout;
  input clk, rst_n, START;
  output DONE;
  wire   start, N9, N10, N11, N12, N13, N14, N15, N16, N17, N18, N19, N20, N21,
         N65, N66, N67, N68, N69, N70, N71, N72, N73, N74, N75, N76, N77, N78,
         N79, N80, N92, N93, N94, N95, N96, N97, N98, N99, n2, n3, n4, n6, n7,
         n9, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51,
         n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65,
         n66, n67, n68, n69;
  wire   [1:0] state;
  wire   [2:0] count;
  wire   [7:0] c;
  wire   [7:0] triggerCount;
  wire   [7:0] a;
  wire   [7:0] b;
  wire   SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, 
        SYNOPSYS_UNCONNECTED__4, SYNOPSYS_UNCONNECTED__5, 
        SYNOPSYS_UNCONNECTED__6, SYNOPSYS_UNCONNECTED__7;

  PE_10_DW01_inc_0 add_98 ( .A(triggerCount), .SUM({N99, N98, N97, N96, N95, 
        N94, N93, N92}) );
  PE_10_DW01_add_0 add_88 ( .A(c), .B({N72, N71, N70, N69, N68, N67, N66, N65}), .CI(1'b0), .SUM({N80, N79, N78, N77, N76, N75, N74, N73}) );
  PE_10_DW_mult_uns_0 r319 ( .a(a), .b(b), .product({SYNOPSYS_UNCONNECTED__0, 
        SYNOPSYS_UNCONNECTED__1, SYNOPSYS_UNCONNECTED__2, 
        SYNOPSYS_UNCONNECTED__3, SYNOPSYS_UNCONNECTED__4, 
        SYNOPSYS_UNCONNECTED__5, SYNOPSYS_UNCONNECTED__6, 
        SYNOPSYS_UNCONNECTED__7, N72, N71, N70, N69, N68, N67, N66, N65}) );
  DFFQX1 \Cout_reg[7]  ( .D(n53), .CK(clk), .Q(Cout[7]) );
  DFFQX1 \Cout_reg[6]  ( .D(n52), .CK(clk), .Q(Cout[6]) );
  DFFQX1 \Cout_reg[5]  ( .D(n51), .CK(clk), .Q(Cout[5]) );
  DFFQX1 \Cout_reg[4]  ( .D(n50), .CK(clk), .Q(Cout[4]) );
  DFFQX1 \Cout_reg[3]  ( .D(n49), .CK(clk), .Q(Cout[3]) );
  DFFQX1 \Cout_reg[2]  ( .D(n48), .CK(clk), .Q(Cout[2]) );
  DFFQX1 \Cout_reg[1]  ( .D(n47), .CK(clk), .Q(Cout[1]) );
  DFFQX1 \Cout_reg[0]  ( .D(n46), .CK(clk), .Q(Cout[0]) );
  DFFQX1 \c_reg[7]  ( .D(N21), .CK(clk), .Q(c[7]) );
  DFFQX1 \count_reg[1]  ( .D(N12), .CK(clk), .Q(count[1]) );
  DFFQX1 \count_reg[0]  ( .D(N11), .CK(clk), .Q(count[0]) );
  DFFX1 \count_reg[2]  ( .D(N13), .CK(clk), .QN(n68) );
  DFFTRX1 start_reg ( .D(START), .RN(rst_n), .CK(clk), .Q(start), .QN(n69) );
  DFFQX1 \state_reg[1]  ( .D(N10), .CK(clk), .Q(state[1]) );
  DFFQX1 \state_reg[0]  ( .D(N9), .CK(clk), .Q(state[0]) );
  DFFQX1 \c_reg[1]  ( .D(N15), .CK(clk), .Q(c[1]) );
  DFFQX1 \c_reg[2]  ( .D(N16), .CK(clk), .Q(c[2]) );
  DFFQX1 \c_reg[3]  ( .D(N17), .CK(clk), .Q(c[3]) );
  DFFQX1 \c_reg[4]  ( .D(N18), .CK(clk), .Q(c[4]) );
  DFFQX1 \c_reg[5]  ( .D(N19), .CK(clk), .Q(c[5]) );
  DFFQX1 \c_reg[6]  ( .D(N20), .CK(clk), .Q(c[6]) );
  DFFQX1 \triggerCount_reg[7]  ( .D(n9), .CK(clk), .Q(triggerCount[7]) );
  DFFQX1 \c_reg[0]  ( .D(N14), .CK(clk), .Q(c[0]) );
  DFFQX1 \triggerCount_reg[0]  ( .D(n39), .CK(clk), .Q(triggerCount[0]) );
  DFFQX1 \triggerCount_reg[1]  ( .D(n40), .CK(clk), .Q(triggerCount[1]) );
  DFFQX1 \triggerCount_reg[2]  ( .D(n41), .CK(clk), .Q(triggerCount[2]) );
  DFFQX1 \triggerCount_reg[5]  ( .D(n44), .CK(clk), .Q(triggerCount[5]) );
  DFFQX1 \triggerCount_reg[6]  ( .D(n45), .CK(clk), .Q(triggerCount[6]) );
  DFFQX1 \triggerCount_reg[4]  ( .D(n43), .CK(clk), .Q(triggerCount[4]) );
  DFFQX1 \triggerCount_reg[3]  ( .D(n42), .CK(clk), .Q(triggerCount[3]) );
  DFFTRX1 \a_reg[7]  ( .D(A[7]), .RN(rst_n), .CK(clk), .Q(a[7]) );
  DFFTRX1 \b_reg[7]  ( .D(B[7]), .RN(rst_n), .CK(clk), .Q(b[7]) );
  DFFTRX1 DONE_reg ( .D(n60), .RN(n7), .CK(clk), .Q(DONE) );
  DFFTRX1 \a_reg[6]  ( .D(A[6]), .RN(rst_n), .CK(clk), .Q(a[6]) );
  DFFTRX1 \b_reg[6]  ( .D(B[6]), .RN(rst_n), .CK(clk), .Q(b[6]) );
  DFFTRX1 \a_reg[5]  ( .D(A[5]), .RN(rst_n), .CK(clk), .Q(a[5]) );
  DFFTRX1 \a_reg[4]  ( .D(A[4]), .RN(rst_n), .CK(clk), .Q(a[4]) );
  DFFTRX1 \b_reg[5]  ( .D(B[5]), .RN(rst_n), .CK(clk), .Q(b[5]) );
  DFFTRX1 \b_reg[4]  ( .D(B[4]), .RN(rst_n), .CK(clk), .Q(b[4]) );
  DFFTRX1 \a_reg[3]  ( .D(A[3]), .RN(rst_n), .CK(clk), .Q(a[3]) );
  DFFTRX1 \a_reg[2]  ( .D(A[2]), .RN(rst_n), .CK(clk), .Q(a[2]) );
  DFFTRX1 \a_reg[1]  ( .D(A[1]), .RN(rst_n), .CK(clk), .Q(a[1]) );
  DFFTRX1 \b_reg[3]  ( .D(B[3]), .RN(rst_n), .CK(clk), .Q(b[3]) );
  DFFTRX1 \b_reg[2]  ( .D(B[2]), .RN(rst_n), .CK(clk), .Q(b[2]) );
  DFFTRX1 \b_reg[1]  ( .D(B[1]), .RN(rst_n), .CK(clk), .Q(b[1]) );
  DFFTRX1 \a_reg[0]  ( .D(A[0]), .RN(rst_n), .CK(clk), .Q(a[0]) );
  DFFTRX1 \b_reg[0]  ( .D(B[0]), .RN(rst_n), .CK(clk), .Q(b[0]) );
  DFFTRX1 \Bout_reg[7]  ( .D(B[7]), .RN(rst_n), .CK(clk), .Q(Bout[7]) );
  DFFTRX1 \Bout_reg[6]  ( .D(B[6]), .RN(rst_n), .CK(clk), .Q(Bout[6]) );
  DFFTRX1 \Bout_reg[5]  ( .D(B[5]), .RN(rst_n), .CK(clk), .Q(Bout[5]) );
  DFFTRX1 \Bout_reg[4]  ( .D(B[4]), .RN(rst_n), .CK(clk), .Q(Bout[4]) );
  DFFTRX1 \Bout_reg[3]  ( .D(B[3]), .RN(rst_n), .CK(clk), .Q(Bout[3]) );
  DFFTRX1 \Bout_reg[2]  ( .D(B[2]), .RN(rst_n), .CK(clk), .Q(Bout[2]) );
  DFFTRX1 \Bout_reg[1]  ( .D(B[1]), .RN(rst_n), .CK(clk), .Q(Bout[1]) );
  DFFTRX1 \Bout_reg[0]  ( .D(B[0]), .RN(rst_n), .CK(clk), .Q(Bout[0]) );
  DFFTRX1 \Aout_reg[7]  ( .D(A[7]), .RN(rst_n), .CK(clk), .Q(Aout[7]) );
  DFFTRX1 \Aout_reg[6]  ( .D(A[6]), .RN(rst_n), .CK(clk), .Q(Aout[6]) );
  DFFTRX1 \Aout_reg[5]  ( .D(A[5]), .RN(rst_n), .CK(clk), .Q(Aout[5]) );
  DFFTRX1 \Aout_reg[4]  ( .D(A[4]), .RN(rst_n), .CK(clk), .Q(Aout[4]) );
  DFFTRX1 \Aout_reg[3]  ( .D(A[3]), .RN(rst_n), .CK(clk), .Q(Aout[3]) );
  DFFTRX1 \Aout_reg[2]  ( .D(A[2]), .RN(rst_n), .CK(clk), .Q(Aout[2]) );
  DFFTRX1 \Aout_reg[1]  ( .D(A[1]), .RN(rst_n), .CK(clk), .Q(Aout[1]) );
  DFFTRX1 \Aout_reg[0]  ( .D(A[0]), .RN(rst_n), .CK(clk), .Q(Aout[0]) );
  AOI221XL U3 ( .A0(n63), .A1(n62), .B0(n6), .B1(state[1]), .C0(n2), .Y(n64)
         );
  CLKINVX1 U4 ( .A(n58), .Y(n4) );
  CLKINVX1 U5 ( .A(n65), .Y(n7) );
  AO22X1 U6 ( .A0(N71), .A1(n4), .B0(N79), .B1(n3), .Y(N20) );
  AO22X1 U8 ( .A0(N70), .A1(n4), .B0(N78), .B1(n3), .Y(N19) );
  AO22X1 U9 ( .A0(N69), .A1(n4), .B0(N77), .B1(n3), .Y(N18) );
  AO22X1 U10 ( .A0(N66), .A1(n4), .B0(N74), .B1(n3), .Y(N15) );
  AO22X1 U11 ( .A0(N68), .A1(n4), .B0(N76), .B1(n3), .Y(N17) );
  AO22X1 U12 ( .A0(N67), .A1(n4), .B0(N75), .B1(n3), .Y(N16) );
  AO22X1 U13 ( .A0(N65), .A1(n4), .B0(N73), .B1(n3), .Y(N14) );
  NAND2X1 U14 ( .A(rst_n), .B(n62), .Y(n65) );
  NAND2X1 U15 ( .A(n60), .B(n7), .Y(n58) );
  CLKINVX1 U16 ( .A(n57), .Y(n3) );
  CLKINVX1 U17 ( .A(n62), .Y(n6) );
  NOR2X1 U18 ( .A(n65), .B(n63), .Y(N9) );
  AO22X1 U19 ( .A0(N72), .A1(n4), .B0(N80), .B1(n3), .Y(N21) );
  NOR2BX1 U20 ( .AN(state[1]), .B(state[0]), .Y(n62) );
  OAI21XL U21 ( .A0(n60), .A1(n65), .B0(n59), .Y(n61) );
  OAI211X1 U22 ( .A0(state[0]), .A1(start), .B0(n6), .C0(rst_n), .Y(n59) );
  NAND4BX1 U23 ( .AN(triggerCount[0]), .B(triggerCount[7]), .C(n55), .D(n54), 
        .Y(n63) );
  NOR2X1 U24 ( .A(triggerCount[2]), .B(triggerCount[1]), .Y(n55) );
  NOR4X1 U25 ( .A(triggerCount[6]), .B(triggerCount[5]), .C(triggerCount[4]), 
        .D(triggerCount[3]), .Y(n54) );
  NOR2BX1 U26 ( .AN(n63), .B(n68), .Y(n60) );
  NOR3X1 U27 ( .A(n65), .B(n64), .C(n68), .Y(n66) );
  NAND3X1 U28 ( .A(n63), .B(n68), .C(n7), .Y(n57) );
  AO21X1 U29 ( .A0(n68), .A1(n7), .B0(n64), .Y(n67) );
  OAI21XL U30 ( .A0(count[0]), .A1(n57), .B0(n58), .Y(N11) );
  AO22X1 U31 ( .A0(n61), .A1(triggerCount[7]), .B0(N99), .B1(n4), .Y(n9) );
  AO22X1 U32 ( .A0(n61), .A1(triggerCount[0]), .B0(N92), .B1(n4), .Y(n39) );
  AO22X1 U33 ( .A0(Cout[1]), .A1(n67), .B0(c[1]), .B1(n66), .Y(n47) );
  AO22X1 U34 ( .A0(Cout[2]), .A1(n67), .B0(c[2]), .B1(n66), .Y(n48) );
  AO22X1 U35 ( .A0(Cout[3]), .A1(n67), .B0(c[3]), .B1(n66), .Y(n49) );
  AO22X1 U36 ( .A0(Cout[4]), .A1(n67), .B0(c[4]), .B1(n66), .Y(n50) );
  AO22X1 U37 ( .A0(Cout[5]), .A1(n67), .B0(c[5]), .B1(n66), .Y(n51) );
  AO22X1 U38 ( .A0(Cout[6]), .A1(n67), .B0(c[6]), .B1(n66), .Y(n52) );
  AO22X1 U39 ( .A0(Cout[7]), .A1(n67), .B0(c[7]), .B1(n66), .Y(n53) );
  AO22X1 U40 ( .A0(Cout[0]), .A1(n67), .B0(c[0]), .B1(n66), .Y(n46) );
  AO22X1 U41 ( .A0(n61), .A1(triggerCount[6]), .B0(N98), .B1(n4), .Y(n45) );
  AO22X1 U42 ( .A0(n61), .A1(triggerCount[5]), .B0(N97), .B1(n4), .Y(n44) );
  AO22X1 U43 ( .A0(n61), .A1(triggerCount[4]), .B0(N96), .B1(n4), .Y(n43) );
  AO22X1 U44 ( .A0(n61), .A1(triggerCount[3]), .B0(N95), .B1(n4), .Y(n42) );
  AO22X1 U45 ( .A0(n61), .A1(triggerCount[2]), .B0(N94), .B1(n4), .Y(n41) );
  AO22X1 U46 ( .A0(n61), .A1(triggerCount[1]), .B0(N93), .B1(n4), .Y(n40) );
  AND3X2 U47 ( .A(count[1]), .B(n3), .C(count[0]), .Y(N13) );
  NOR2X1 U48 ( .A(n56), .B(n57), .Y(N12) );
  XNOR2X1 U49 ( .A(count[0]), .B(count[1]), .Y(n56) );
  OAI31XL U50 ( .A0(n69), .A1(state[0]), .A2(n2), .B0(n65), .Y(N10) );
  CLKINVX1 U51 ( .A(rst_n), .Y(n2) );
endmodule


module PE_9_DW01_inc_0 ( A, SUM );
  input [7:0] A;
  output [7:0] SUM;

  wire   [7:2] carry;

  ADDHXL U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHXL U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  ADDHXL U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHXL U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHXL U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHXL U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  CLKINVX1 U1 ( .A(A[0]), .Y(SUM[0]) );
  XOR2X1 U2 ( .A(carry[7]), .B(A[7]), .Y(SUM[7]) );
endmodule


module PE_9_DW01_add_0 ( A, B, CI, SUM, CO );
  input [7:0] A;
  input [7:0] B;
  output [7:0] SUM;
  input CI;
  output CO;
  wire   n1, n2;
  wire   [7:1] carry;

  ADDFXL U1_1 ( .A(A[1]), .B(B[1]), .CI(carry[1]), .CO(carry[2]), .S(SUM[1])
         );
  ADDFXL U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  ADDFXL U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFXL U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  ADDFXL U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  ADDFXL U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  XOR3X1 U1_7 ( .A(A[7]), .B(B[7]), .C(carry[7]), .Y(SUM[7]) );
  XNOR2X1 U1 ( .A(B[0]), .B(n1), .Y(SUM[0]) );
  NOR2X1 U2 ( .A(n1), .B(n2), .Y(carry[1]) );
  CLKINVX1 U3 ( .A(B[0]), .Y(n2) );
  CLKINVX1 U4 ( .A(A[0]), .Y(n1) );
endmodule


module PE_9_DW_mult_uns_0 ( a, b, product );
  input [7:0] a;
  input [7:0] b;
  output [15:0] product;
  wire   n2, n3, n4, n5, n6, n7, n18, n19, n20, n21, n22, n23, n24, n25, n26,
         n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40,
         n41, n42, n43, n46, n48, n49, n51, n52, n53, n55, n56, n57, n58, n60,
         n61, n62, n63, n64, n66, n67, n68, n69, n70, n71, n73, n74, n75, n76,
         n77, n78, n123, n124, n125, n126, n127, n128, n129, n130, n131, n132,
         n133, n134, n135, n136, n137, n138, n139, n140, n141, n142, n143,
         n144, n145, n146, n147, n148, n149, n150, n151, n152, n153, n154;

  ADDFXL U3 ( .A(n20), .B(n27), .CI(n3), .CO(n2), .S(product[6]) );
  ADDFXL U4 ( .A(n28), .B(n34), .CI(n4), .CO(n3), .S(product[5]) );
  ADDFXL U5 ( .A(n35), .B(n38), .CI(n5), .CO(n4), .S(product[4]) );
  ADDFXL U6 ( .A(n39), .B(n41), .CI(n6), .CO(n5), .S(product[3]) );
  ADDFXL U7 ( .A(n7), .B(n64), .CI(n43), .CO(n6), .S(product[2]) );
  ADDHXL U8 ( .A(n71), .B(n78), .CO(n7), .S(product[1]) );
  CMPR42X1 U19 ( .A(n60), .B(n55), .C(n26), .D(n29), .ICI(n23), .S(n20), .ICO(
        n18), .CO(n19) );
  CMPR42X1 U20 ( .A(n73), .B(n51), .C(n66), .D(n31), .ICI(n25), .S(n23), .ICO(
        n21), .CO(n22) );
  ADDHXL U21 ( .A(n48), .B(n46), .CO(n24), .S(n25) );
  CMPR42X1 U22 ( .A(n67), .B(n61), .C(n33), .D(n32), .ICI(n30), .S(n28), .ICO(
        n26), .CO(n27) );
  ADDFXL U23 ( .A(n56), .B(n74), .CI(n36), .CO(n29), .S(n30) );
  ADDHXL U24 ( .A(n52), .B(n49), .CO(n31), .S(n32) );
  CMPR42X1 U25 ( .A(n75), .B(n62), .C(n68), .D(n40), .ICI(n37), .S(n35), .ICO(
        n33), .CO(n34) );
  ADDHXL U26 ( .A(n57), .B(n53), .CO(n36), .S(n37) );
  ADDFXL U27 ( .A(n69), .B(n76), .CI(n42), .CO(n38), .S(n39) );
  ADDHXL U28 ( .A(n63), .B(n58), .CO(n40), .S(n41) );
  ADDHXL U29 ( .A(n77), .B(n70), .CO(n42), .S(n43) );
  CLKINVX1 U84 ( .A(a[0]), .Y(n134) );
  CLKINVX1 U85 ( .A(b[0]), .Y(n128) );
  CLKINVX1 U86 ( .A(b[1]), .Y(n127) );
  CLKINVX1 U87 ( .A(a[1]), .Y(n133) );
  CLKINVX1 U88 ( .A(b[2]), .Y(n126) );
  CLKINVX1 U89 ( .A(a[2]), .Y(n132) );
  CLKINVX1 U90 ( .A(a[3]), .Y(n131) );
  CLKINVX1 U91 ( .A(b[3]), .Y(n125) );
  CLKINVX1 U92 ( .A(b[4]), .Y(n124) );
  CLKINVX1 U93 ( .A(a[4]), .Y(n130) );
  CLKINVX1 U94 ( .A(a[5]), .Y(n129) );
  CLKINVX1 U95 ( .A(b[5]), .Y(n123) );
  XOR2X1 U96 ( .A(n135), .B(n136), .Y(product[7]) );
  XOR2X1 U97 ( .A(n137), .B(n138), .Y(n136) );
  XOR2X1 U98 ( .A(n18), .B(n139), .Y(n138) );
  NOR2X1 U99 ( .A(n131), .B(n124), .Y(n139) );
  XOR2X1 U100 ( .A(n140), .B(n141), .Y(n137) );
  XOR2X1 U101 ( .A(n142), .B(n143), .Y(n141) );
  XOR2X1 U102 ( .A(n144), .B(n145), .Y(n143) );
  NAND2X1 U103 ( .A(b[5]), .B(a[2]), .Y(n145) );
  NAND2X1 U104 ( .A(b[6]), .B(a[1]), .Y(n144) );
  XOR2X1 U105 ( .A(n146), .B(n147), .Y(n142) );
  NAND2X1 U106 ( .A(b[3]), .B(a[4]), .Y(n147) );
  NAND2X1 U107 ( .A(b[1]), .B(a[6]), .Y(n146) );
  XOR2X1 U108 ( .A(n148), .B(n149), .Y(n140) );
  XOR2X1 U109 ( .A(n150), .B(n151), .Y(n149) );
  NAND2X1 U110 ( .A(b[0]), .B(a[7]), .Y(n151) );
  NAND2X1 U111 ( .A(b[2]), .B(a[5]), .Y(n150) );
  XNOR2X1 U112 ( .A(n24), .B(n152), .Y(n148) );
  NAND2X1 U113 ( .A(b[7]), .B(a[0]), .Y(n152) );
  XOR2X1 U114 ( .A(n153), .B(n154), .Y(n135) );
  XNOR2X1 U115 ( .A(n2), .B(n19), .Y(n154) );
  XNOR2X1 U116 ( .A(n22), .B(n21), .Y(n153) );
  NOR2X1 U117 ( .A(n134), .B(n128), .Y(product[0]) );
  NOR2X1 U118 ( .A(n134), .B(n127), .Y(n78) );
  NOR2X1 U119 ( .A(n134), .B(n126), .Y(n77) );
  NOR2X1 U120 ( .A(n134), .B(n125), .Y(n76) );
  NOR2X1 U121 ( .A(n134), .B(n124), .Y(n75) );
  NOR2X1 U122 ( .A(n134), .B(n123), .Y(n74) );
  AND2X1 U123 ( .A(b[6]), .B(a[0]), .Y(n73) );
  NOR2X1 U124 ( .A(n128), .B(n133), .Y(n71) );
  NOR2X1 U125 ( .A(n127), .B(n133), .Y(n70) );
  NOR2X1 U126 ( .A(n126), .B(n133), .Y(n69) );
  NOR2X1 U127 ( .A(n125), .B(n133), .Y(n68) );
  NOR2X1 U128 ( .A(n133), .B(n124), .Y(n67) );
  NOR2X1 U129 ( .A(n133), .B(n123), .Y(n66) );
  NOR2X1 U130 ( .A(n128), .B(n132), .Y(n64) );
  NOR2X1 U131 ( .A(n127), .B(n132), .Y(n63) );
  NOR2X1 U132 ( .A(n126), .B(n132), .Y(n62) );
  NOR2X1 U133 ( .A(n125), .B(n132), .Y(n61) );
  NOR2X1 U134 ( .A(n132), .B(n124), .Y(n60) );
  NOR2X1 U135 ( .A(n128), .B(n131), .Y(n58) );
  NOR2X1 U136 ( .A(n127), .B(n131), .Y(n57) );
  NOR2X1 U137 ( .A(n126), .B(n131), .Y(n56) );
  NOR2X1 U138 ( .A(n125), .B(n131), .Y(n55) );
  NOR2X1 U139 ( .A(n128), .B(n130), .Y(n53) );
  NOR2X1 U140 ( .A(n127), .B(n130), .Y(n52) );
  NOR2X1 U141 ( .A(n126), .B(n130), .Y(n51) );
  NOR2X1 U142 ( .A(n129), .B(n128), .Y(n49) );
  NOR2X1 U143 ( .A(n129), .B(n127), .Y(n48) );
  AND2X1 U144 ( .A(a[6]), .B(b[0]), .Y(n46) );
endmodule


module PE_9 ( clk, rst_n, START, A, B, Aout, Bout, Cout, DONE );
  input [7:0] A;
  input [7:0] B;
  output [7:0] Aout;
  output [7:0] Bout;
  output [7:0] Cout;
  input clk, rst_n, START;
  output DONE;
  wire   start, N9, N10, N11, N12, N13, N14, N15, N16, N17, N18, N19, N20, N21,
         N65, N66, N67, N68, N69, N70, N71, N72, N73, N74, N75, N76, N77, N78,
         N79, N80, N92, N93, N94, N95, N96, N97, N98, N99, n2, n3, n4, n6, n7,
         n9, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51,
         n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65,
         n66, n67, n68, n69;
  wire   [1:0] state;
  wire   [2:0] count;
  wire   [7:0] c;
  wire   [7:0] triggerCount;
  wire   [7:0] a;
  wire   [7:0] b;
  wire   SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, 
        SYNOPSYS_UNCONNECTED__4, SYNOPSYS_UNCONNECTED__5, 
        SYNOPSYS_UNCONNECTED__6, SYNOPSYS_UNCONNECTED__7;

  PE_9_DW01_inc_0 add_98 ( .A(triggerCount), .SUM({N99, N98, N97, N96, N95, 
        N94, N93, N92}) );
  PE_9_DW01_add_0 add_88 ( .A(c), .B({N72, N71, N70, N69, N68, N67, N66, N65}), 
        .CI(1'b0), .SUM({N80, N79, N78, N77, N76, N75, N74, N73}) );
  PE_9_DW_mult_uns_0 r319 ( .a(a), .b(b), .product({SYNOPSYS_UNCONNECTED__0, 
        SYNOPSYS_UNCONNECTED__1, SYNOPSYS_UNCONNECTED__2, 
        SYNOPSYS_UNCONNECTED__3, SYNOPSYS_UNCONNECTED__4, 
        SYNOPSYS_UNCONNECTED__5, SYNOPSYS_UNCONNECTED__6, 
        SYNOPSYS_UNCONNECTED__7, N72, N71, N70, N69, N68, N67, N66, N65}) );
  DFFQX1 \Cout_reg[7]  ( .D(n53), .CK(clk), .Q(Cout[7]) );
  DFFQX1 \Cout_reg[6]  ( .D(n52), .CK(clk), .Q(Cout[6]) );
  DFFQX1 \Cout_reg[5]  ( .D(n51), .CK(clk), .Q(Cout[5]) );
  DFFQX1 \Cout_reg[4]  ( .D(n50), .CK(clk), .Q(Cout[4]) );
  DFFQX1 \Cout_reg[3]  ( .D(n49), .CK(clk), .Q(Cout[3]) );
  DFFQX1 \Cout_reg[2]  ( .D(n48), .CK(clk), .Q(Cout[2]) );
  DFFQX1 \Cout_reg[1]  ( .D(n47), .CK(clk), .Q(Cout[1]) );
  DFFQX1 \Cout_reg[0]  ( .D(n46), .CK(clk), .Q(Cout[0]) );
  DFFQX1 \c_reg[7]  ( .D(N21), .CK(clk), .Q(c[7]) );
  DFFQX1 \count_reg[1]  ( .D(N12), .CK(clk), .Q(count[1]) );
  DFFQX1 \count_reg[0]  ( .D(N11), .CK(clk), .Q(count[0]) );
  DFFX1 \count_reg[2]  ( .D(N13), .CK(clk), .QN(n68) );
  DFFTRX1 start_reg ( .D(START), .RN(rst_n), .CK(clk), .Q(start), .QN(n69) );
  DFFQX1 \state_reg[1]  ( .D(N10), .CK(clk), .Q(state[1]) );
  DFFQX1 \state_reg[0]  ( .D(N9), .CK(clk), .Q(state[0]) );
  DFFQX1 \c_reg[1]  ( .D(N15), .CK(clk), .Q(c[1]) );
  DFFQX1 \c_reg[2]  ( .D(N16), .CK(clk), .Q(c[2]) );
  DFFQX1 \c_reg[3]  ( .D(N17), .CK(clk), .Q(c[3]) );
  DFFQX1 \c_reg[4]  ( .D(N18), .CK(clk), .Q(c[4]) );
  DFFQX1 \c_reg[5]  ( .D(N19), .CK(clk), .Q(c[5]) );
  DFFQX1 \c_reg[6]  ( .D(N20), .CK(clk), .Q(c[6]) );
  DFFQX1 \triggerCount_reg[7]  ( .D(n9), .CK(clk), .Q(triggerCount[7]) );
  DFFQX1 \c_reg[0]  ( .D(N14), .CK(clk), .Q(c[0]) );
  DFFQX1 \triggerCount_reg[0]  ( .D(n39), .CK(clk), .Q(triggerCount[0]) );
  DFFQX1 \triggerCount_reg[1]  ( .D(n40), .CK(clk), .Q(triggerCount[1]) );
  DFFQX1 \triggerCount_reg[2]  ( .D(n41), .CK(clk), .Q(triggerCount[2]) );
  DFFQX1 \triggerCount_reg[5]  ( .D(n44), .CK(clk), .Q(triggerCount[5]) );
  DFFQX1 \triggerCount_reg[6]  ( .D(n45), .CK(clk), .Q(triggerCount[6]) );
  DFFQX1 \triggerCount_reg[4]  ( .D(n43), .CK(clk), .Q(triggerCount[4]) );
  DFFQX1 \triggerCount_reg[3]  ( .D(n42), .CK(clk), .Q(triggerCount[3]) );
  DFFTRX1 \a_reg[7]  ( .D(A[7]), .RN(rst_n), .CK(clk), .Q(a[7]) );
  DFFTRX1 \b_reg[7]  ( .D(B[7]), .RN(rst_n), .CK(clk), .Q(b[7]) );
  DFFTRX1 DONE_reg ( .D(n60), .RN(n7), .CK(clk), .Q(DONE) );
  DFFTRX1 \a_reg[6]  ( .D(A[6]), .RN(rst_n), .CK(clk), .Q(a[6]) );
  DFFTRX1 \b_reg[6]  ( .D(B[6]), .RN(rst_n), .CK(clk), .Q(b[6]) );
  DFFTRX1 \a_reg[5]  ( .D(A[5]), .RN(rst_n), .CK(clk), .Q(a[5]) );
  DFFTRX1 \a_reg[4]  ( .D(A[4]), .RN(rst_n), .CK(clk), .Q(a[4]) );
  DFFTRX1 \b_reg[5]  ( .D(B[5]), .RN(rst_n), .CK(clk), .Q(b[5]) );
  DFFTRX1 \b_reg[4]  ( .D(B[4]), .RN(rst_n), .CK(clk), .Q(b[4]) );
  DFFTRX1 \a_reg[3]  ( .D(A[3]), .RN(rst_n), .CK(clk), .Q(a[3]) );
  DFFTRX1 \a_reg[2]  ( .D(A[2]), .RN(rst_n), .CK(clk), .Q(a[2]) );
  DFFTRX1 \a_reg[1]  ( .D(A[1]), .RN(rst_n), .CK(clk), .Q(a[1]) );
  DFFTRX1 \b_reg[3]  ( .D(B[3]), .RN(rst_n), .CK(clk), .Q(b[3]) );
  DFFTRX1 \b_reg[2]  ( .D(B[2]), .RN(rst_n), .CK(clk), .Q(b[2]) );
  DFFTRX1 \b_reg[1]  ( .D(B[1]), .RN(rst_n), .CK(clk), .Q(b[1]) );
  DFFTRX1 \a_reg[0]  ( .D(A[0]), .RN(rst_n), .CK(clk), .Q(a[0]) );
  DFFTRX1 \b_reg[0]  ( .D(B[0]), .RN(rst_n), .CK(clk), .Q(b[0]) );
  DFFTRX1 \Bout_reg[7]  ( .D(B[7]), .RN(rst_n), .CK(clk), .Q(Bout[7]) );
  DFFTRX1 \Bout_reg[6]  ( .D(B[6]), .RN(rst_n), .CK(clk), .Q(Bout[6]) );
  DFFTRX1 \Bout_reg[5]  ( .D(B[5]), .RN(rst_n), .CK(clk), .Q(Bout[5]) );
  DFFTRX1 \Bout_reg[4]  ( .D(B[4]), .RN(rst_n), .CK(clk), .Q(Bout[4]) );
  DFFTRX1 \Bout_reg[3]  ( .D(B[3]), .RN(rst_n), .CK(clk), .Q(Bout[3]) );
  DFFTRX1 \Bout_reg[2]  ( .D(B[2]), .RN(rst_n), .CK(clk), .Q(Bout[2]) );
  DFFTRX1 \Bout_reg[1]  ( .D(B[1]), .RN(rst_n), .CK(clk), .Q(Bout[1]) );
  DFFTRX1 \Bout_reg[0]  ( .D(B[0]), .RN(rst_n), .CK(clk), .Q(Bout[0]) );
  DFFTRX1 \Aout_reg[7]  ( .D(A[7]), .RN(rst_n), .CK(clk), .Q(Aout[7]) );
  DFFTRX1 \Aout_reg[6]  ( .D(A[6]), .RN(rst_n), .CK(clk), .Q(Aout[6]) );
  DFFTRX1 \Aout_reg[5]  ( .D(A[5]), .RN(rst_n), .CK(clk), .Q(Aout[5]) );
  DFFTRX1 \Aout_reg[4]  ( .D(A[4]), .RN(rst_n), .CK(clk), .Q(Aout[4]) );
  DFFTRX1 \Aout_reg[3]  ( .D(A[3]), .RN(rst_n), .CK(clk), .Q(Aout[3]) );
  DFFTRX1 \Aout_reg[2]  ( .D(A[2]), .RN(rst_n), .CK(clk), .Q(Aout[2]) );
  DFFTRX1 \Aout_reg[1]  ( .D(A[1]), .RN(rst_n), .CK(clk), .Q(Aout[1]) );
  DFFTRX1 \Aout_reg[0]  ( .D(A[0]), .RN(rst_n), .CK(clk), .Q(Aout[0]) );
  AOI221XL U3 ( .A0(n63), .A1(n62), .B0(n6), .B1(state[1]), .C0(n2), .Y(n64)
         );
  CLKINVX1 U4 ( .A(n58), .Y(n4) );
  CLKINVX1 U5 ( .A(n65), .Y(n7) );
  AO22X1 U6 ( .A0(N71), .A1(n4), .B0(N79), .B1(n3), .Y(N20) );
  AO22X1 U8 ( .A0(N70), .A1(n4), .B0(N78), .B1(n3), .Y(N19) );
  AO22X1 U9 ( .A0(N69), .A1(n4), .B0(N77), .B1(n3), .Y(N18) );
  AO22X1 U10 ( .A0(N66), .A1(n4), .B0(N74), .B1(n3), .Y(N15) );
  AO22X1 U11 ( .A0(N68), .A1(n4), .B0(N76), .B1(n3), .Y(N17) );
  AO22X1 U12 ( .A0(N67), .A1(n4), .B0(N75), .B1(n3), .Y(N16) );
  AO22X1 U13 ( .A0(N65), .A1(n4), .B0(N73), .B1(n3), .Y(N14) );
  NAND2X1 U14 ( .A(rst_n), .B(n62), .Y(n65) );
  NAND2X1 U15 ( .A(n60), .B(n7), .Y(n58) );
  CLKINVX1 U16 ( .A(n57), .Y(n3) );
  CLKINVX1 U17 ( .A(n62), .Y(n6) );
  NOR2X1 U18 ( .A(n65), .B(n63), .Y(N9) );
  AO22X1 U19 ( .A0(N72), .A1(n4), .B0(N80), .B1(n3), .Y(N21) );
  NOR2BX1 U20 ( .AN(state[1]), .B(state[0]), .Y(n62) );
  OAI21XL U21 ( .A0(n60), .A1(n65), .B0(n59), .Y(n61) );
  OAI211X1 U22 ( .A0(state[0]), .A1(start), .B0(n6), .C0(rst_n), .Y(n59) );
  NAND4BX1 U23 ( .AN(triggerCount[0]), .B(triggerCount[7]), .C(n55), .D(n54), 
        .Y(n63) );
  NOR2X1 U24 ( .A(triggerCount[2]), .B(triggerCount[1]), .Y(n55) );
  NOR4X1 U25 ( .A(triggerCount[6]), .B(triggerCount[5]), .C(triggerCount[4]), 
        .D(triggerCount[3]), .Y(n54) );
  NOR2BX1 U26 ( .AN(n63), .B(n68), .Y(n60) );
  NOR3X1 U27 ( .A(n65), .B(n64), .C(n68), .Y(n66) );
  NAND3X1 U28 ( .A(n63), .B(n68), .C(n7), .Y(n57) );
  AO21X1 U29 ( .A0(n68), .A1(n7), .B0(n64), .Y(n67) );
  OAI21XL U30 ( .A0(count[0]), .A1(n57), .B0(n58), .Y(N11) );
  AO22X1 U31 ( .A0(n61), .A1(triggerCount[7]), .B0(N99), .B1(n4), .Y(n9) );
  AO22X1 U32 ( .A0(n61), .A1(triggerCount[0]), .B0(N92), .B1(n4), .Y(n39) );
  AO22X1 U33 ( .A0(Cout[1]), .A1(n67), .B0(c[1]), .B1(n66), .Y(n47) );
  AO22X1 U34 ( .A0(Cout[2]), .A1(n67), .B0(c[2]), .B1(n66), .Y(n48) );
  AO22X1 U35 ( .A0(Cout[3]), .A1(n67), .B0(c[3]), .B1(n66), .Y(n49) );
  AO22X1 U36 ( .A0(Cout[4]), .A1(n67), .B0(c[4]), .B1(n66), .Y(n50) );
  AO22X1 U37 ( .A0(Cout[5]), .A1(n67), .B0(c[5]), .B1(n66), .Y(n51) );
  AO22X1 U38 ( .A0(Cout[6]), .A1(n67), .B0(c[6]), .B1(n66), .Y(n52) );
  AO22X1 U39 ( .A0(Cout[7]), .A1(n67), .B0(c[7]), .B1(n66), .Y(n53) );
  AO22X1 U40 ( .A0(Cout[0]), .A1(n67), .B0(c[0]), .B1(n66), .Y(n46) );
  AO22X1 U41 ( .A0(n61), .A1(triggerCount[6]), .B0(N98), .B1(n4), .Y(n45) );
  AO22X1 U42 ( .A0(n61), .A1(triggerCount[5]), .B0(N97), .B1(n4), .Y(n44) );
  AO22X1 U43 ( .A0(n61), .A1(triggerCount[4]), .B0(N96), .B1(n4), .Y(n43) );
  AO22X1 U44 ( .A0(n61), .A1(triggerCount[3]), .B0(N95), .B1(n4), .Y(n42) );
  AO22X1 U45 ( .A0(n61), .A1(triggerCount[2]), .B0(N94), .B1(n4), .Y(n41) );
  AO22X1 U46 ( .A0(n61), .A1(triggerCount[1]), .B0(N93), .B1(n4), .Y(n40) );
  AND3X2 U47 ( .A(count[1]), .B(n3), .C(count[0]), .Y(N13) );
  NOR2X1 U48 ( .A(n56), .B(n57), .Y(N12) );
  XNOR2X1 U49 ( .A(count[0]), .B(count[1]), .Y(n56) );
  OAI31XL U50 ( .A0(n69), .A1(state[0]), .A2(n2), .B0(n65), .Y(N10) );
  CLKINVX1 U51 ( .A(rst_n), .Y(n2) );
endmodule


module PE_8_DW01_inc_0 ( A, SUM );
  input [7:0] A;
  output [7:0] SUM;

  wire   [7:2] carry;

  ADDHXL U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHXL U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  ADDHXL U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHXL U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHXL U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHXL U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  CLKINVX1 U1 ( .A(A[0]), .Y(SUM[0]) );
  XOR2X1 U2 ( .A(carry[7]), .B(A[7]), .Y(SUM[7]) );
endmodule


module PE_8_DW01_add_0 ( A, B, CI, SUM, CO );
  input [7:0] A;
  input [7:0] B;
  output [7:0] SUM;
  input CI;
  output CO;
  wire   n1, n2;
  wire   [7:1] carry;

  ADDFXL U1_1 ( .A(A[1]), .B(B[1]), .CI(carry[1]), .CO(carry[2]), .S(SUM[1])
         );
  ADDFXL U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  ADDFXL U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFXL U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  ADDFXL U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  ADDFXL U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  XOR3X1 U1_7 ( .A(A[7]), .B(B[7]), .C(carry[7]), .Y(SUM[7]) );
  XNOR2X1 U1 ( .A(B[0]), .B(n1), .Y(SUM[0]) );
  NOR2X1 U2 ( .A(n1), .B(n2), .Y(carry[1]) );
  CLKINVX1 U3 ( .A(B[0]), .Y(n2) );
  CLKINVX1 U4 ( .A(A[0]), .Y(n1) );
endmodule


module PE_8_DW_mult_uns_0 ( a, b, product );
  input [7:0] a;
  input [7:0] b;
  output [15:0] product;
  wire   n2, n3, n4, n5, n6, n7, n18, n19, n20, n21, n22, n23, n24, n25, n26,
         n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40,
         n41, n42, n43, n46, n48, n49, n51, n52, n53, n55, n56, n57, n58, n60,
         n61, n62, n63, n64, n66, n67, n68, n69, n70, n71, n73, n74, n75, n76,
         n77, n78, n123, n124, n125, n126, n127, n128, n129, n130, n131, n132,
         n133, n134, n135, n136, n137, n138, n139, n140, n141, n142, n143,
         n144, n145, n146, n147, n148, n149, n150, n151, n152, n153, n154;

  ADDFXL U3 ( .A(n20), .B(n27), .CI(n3), .CO(n2), .S(product[6]) );
  ADDFXL U4 ( .A(n28), .B(n34), .CI(n4), .CO(n3), .S(product[5]) );
  ADDFXL U5 ( .A(n35), .B(n38), .CI(n5), .CO(n4), .S(product[4]) );
  ADDFXL U6 ( .A(n39), .B(n41), .CI(n6), .CO(n5), .S(product[3]) );
  ADDFXL U7 ( .A(n7), .B(n64), .CI(n43), .CO(n6), .S(product[2]) );
  ADDHXL U8 ( .A(n71), .B(n78), .CO(n7), .S(product[1]) );
  CMPR42X1 U19 ( .A(n60), .B(n55), .C(n26), .D(n29), .ICI(n23), .S(n20), .ICO(
        n18), .CO(n19) );
  CMPR42X1 U20 ( .A(n73), .B(n51), .C(n66), .D(n31), .ICI(n25), .S(n23), .ICO(
        n21), .CO(n22) );
  ADDHXL U21 ( .A(n48), .B(n46), .CO(n24), .S(n25) );
  CMPR42X1 U22 ( .A(n67), .B(n61), .C(n33), .D(n32), .ICI(n30), .S(n28), .ICO(
        n26), .CO(n27) );
  ADDFXL U23 ( .A(n56), .B(n74), .CI(n36), .CO(n29), .S(n30) );
  ADDHXL U24 ( .A(n52), .B(n49), .CO(n31), .S(n32) );
  CMPR42X1 U25 ( .A(n75), .B(n62), .C(n68), .D(n40), .ICI(n37), .S(n35), .ICO(
        n33), .CO(n34) );
  ADDHXL U26 ( .A(n57), .B(n53), .CO(n36), .S(n37) );
  ADDFXL U27 ( .A(n69), .B(n76), .CI(n42), .CO(n38), .S(n39) );
  ADDHXL U28 ( .A(n63), .B(n58), .CO(n40), .S(n41) );
  ADDHXL U29 ( .A(n77), .B(n70), .CO(n42), .S(n43) );
  CLKINVX1 U84 ( .A(a[0]), .Y(n134) );
  CLKINVX1 U85 ( .A(b[0]), .Y(n128) );
  CLKINVX1 U86 ( .A(b[1]), .Y(n127) );
  CLKINVX1 U87 ( .A(a[1]), .Y(n133) );
  CLKINVX1 U88 ( .A(b[2]), .Y(n126) );
  CLKINVX1 U89 ( .A(a[2]), .Y(n132) );
  CLKINVX1 U90 ( .A(a[3]), .Y(n131) );
  CLKINVX1 U91 ( .A(b[3]), .Y(n125) );
  CLKINVX1 U92 ( .A(b[4]), .Y(n124) );
  CLKINVX1 U93 ( .A(a[4]), .Y(n130) );
  CLKINVX1 U94 ( .A(a[5]), .Y(n129) );
  CLKINVX1 U95 ( .A(b[5]), .Y(n123) );
  XOR2X1 U96 ( .A(n135), .B(n136), .Y(product[7]) );
  XOR2X1 U97 ( .A(n137), .B(n138), .Y(n136) );
  XOR2X1 U98 ( .A(n18), .B(n139), .Y(n138) );
  NOR2X1 U99 ( .A(n131), .B(n124), .Y(n139) );
  XOR2X1 U100 ( .A(n140), .B(n141), .Y(n137) );
  XOR2X1 U101 ( .A(n142), .B(n143), .Y(n141) );
  XOR2X1 U102 ( .A(n144), .B(n145), .Y(n143) );
  NAND2X1 U103 ( .A(b[5]), .B(a[2]), .Y(n145) );
  NAND2X1 U104 ( .A(b[6]), .B(a[1]), .Y(n144) );
  XOR2X1 U105 ( .A(n146), .B(n147), .Y(n142) );
  NAND2X1 U106 ( .A(b[3]), .B(a[4]), .Y(n147) );
  NAND2X1 U107 ( .A(b[1]), .B(a[6]), .Y(n146) );
  XOR2X1 U108 ( .A(n148), .B(n149), .Y(n140) );
  XOR2X1 U109 ( .A(n150), .B(n151), .Y(n149) );
  NAND2X1 U110 ( .A(b[0]), .B(a[7]), .Y(n151) );
  NAND2X1 U111 ( .A(b[2]), .B(a[5]), .Y(n150) );
  XNOR2X1 U112 ( .A(n24), .B(n152), .Y(n148) );
  NAND2X1 U113 ( .A(b[7]), .B(a[0]), .Y(n152) );
  XOR2X1 U114 ( .A(n153), .B(n154), .Y(n135) );
  XNOR2X1 U115 ( .A(n2), .B(n19), .Y(n154) );
  XNOR2X1 U116 ( .A(n22), .B(n21), .Y(n153) );
  NOR2X1 U117 ( .A(n134), .B(n128), .Y(product[0]) );
  NOR2X1 U118 ( .A(n134), .B(n127), .Y(n78) );
  NOR2X1 U119 ( .A(n134), .B(n126), .Y(n77) );
  NOR2X1 U120 ( .A(n134), .B(n125), .Y(n76) );
  NOR2X1 U121 ( .A(n134), .B(n124), .Y(n75) );
  NOR2X1 U122 ( .A(n134), .B(n123), .Y(n74) );
  AND2X1 U123 ( .A(b[6]), .B(a[0]), .Y(n73) );
  NOR2X1 U124 ( .A(n128), .B(n133), .Y(n71) );
  NOR2X1 U125 ( .A(n127), .B(n133), .Y(n70) );
  NOR2X1 U126 ( .A(n126), .B(n133), .Y(n69) );
  NOR2X1 U127 ( .A(n125), .B(n133), .Y(n68) );
  NOR2X1 U128 ( .A(n133), .B(n124), .Y(n67) );
  NOR2X1 U129 ( .A(n133), .B(n123), .Y(n66) );
  NOR2X1 U130 ( .A(n128), .B(n132), .Y(n64) );
  NOR2X1 U131 ( .A(n127), .B(n132), .Y(n63) );
  NOR2X1 U132 ( .A(n126), .B(n132), .Y(n62) );
  NOR2X1 U133 ( .A(n125), .B(n132), .Y(n61) );
  NOR2X1 U134 ( .A(n132), .B(n124), .Y(n60) );
  NOR2X1 U135 ( .A(n128), .B(n131), .Y(n58) );
  NOR2X1 U136 ( .A(n127), .B(n131), .Y(n57) );
  NOR2X1 U137 ( .A(n126), .B(n131), .Y(n56) );
  NOR2X1 U138 ( .A(n125), .B(n131), .Y(n55) );
  NOR2X1 U139 ( .A(n128), .B(n130), .Y(n53) );
  NOR2X1 U140 ( .A(n127), .B(n130), .Y(n52) );
  NOR2X1 U141 ( .A(n126), .B(n130), .Y(n51) );
  NOR2X1 U142 ( .A(n129), .B(n128), .Y(n49) );
  NOR2X1 U143 ( .A(n129), .B(n127), .Y(n48) );
  AND2X1 U144 ( .A(a[6]), .B(b[0]), .Y(n46) );
endmodule


module PE_8 ( clk, rst_n, START, A, B, Aout, Bout, Cout, DONE );
  input [7:0] A;
  input [7:0] B;
  output [7:0] Aout;
  output [7:0] Bout;
  output [7:0] Cout;
  input clk, rst_n, START;
  output DONE;
  wire   start, N9, N10, N11, N12, N13, N14, N15, N16, N17, N18, N19, N20, N21,
         N65, N66, N67, N68, N69, N70, N71, N72, N73, N74, N75, N76, N77, N78,
         N79, N80, N92, N93, N94, N95, N96, N97, N98, N99, n2, n3, n4, n6, n7,
         n9, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51,
         n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65,
         n66, n67, n68, n69;
  wire   [1:0] state;
  wire   [2:0] count;
  wire   [7:0] c;
  wire   [7:0] triggerCount;
  wire   [7:0] a;
  wire   [7:0] b;
  wire   SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, 
        SYNOPSYS_UNCONNECTED__4, SYNOPSYS_UNCONNECTED__5, 
        SYNOPSYS_UNCONNECTED__6, SYNOPSYS_UNCONNECTED__7;

  PE_8_DW01_inc_0 add_98 ( .A(triggerCount), .SUM({N99, N98, N97, N96, N95, 
        N94, N93, N92}) );
  PE_8_DW01_add_0 add_88 ( .A(c), .B({N72, N71, N70, N69, N68, N67, N66, N65}), 
        .CI(1'b0), .SUM({N80, N79, N78, N77, N76, N75, N74, N73}) );
  PE_8_DW_mult_uns_0 r319 ( .a(a), .b(b), .product({SYNOPSYS_UNCONNECTED__0, 
        SYNOPSYS_UNCONNECTED__1, SYNOPSYS_UNCONNECTED__2, 
        SYNOPSYS_UNCONNECTED__3, SYNOPSYS_UNCONNECTED__4, 
        SYNOPSYS_UNCONNECTED__5, SYNOPSYS_UNCONNECTED__6, 
        SYNOPSYS_UNCONNECTED__7, N72, N71, N70, N69, N68, N67, N66, N65}) );
  DFFQX1 \Cout_reg[7]  ( .D(n53), .CK(clk), .Q(Cout[7]) );
  DFFQX1 \Cout_reg[6]  ( .D(n52), .CK(clk), .Q(Cout[6]) );
  DFFQX1 \Cout_reg[5]  ( .D(n51), .CK(clk), .Q(Cout[5]) );
  DFFQX1 \Cout_reg[4]  ( .D(n50), .CK(clk), .Q(Cout[4]) );
  DFFQX1 \Cout_reg[3]  ( .D(n49), .CK(clk), .Q(Cout[3]) );
  DFFQX1 \Cout_reg[2]  ( .D(n48), .CK(clk), .Q(Cout[2]) );
  DFFQX1 \Cout_reg[1]  ( .D(n47), .CK(clk), .Q(Cout[1]) );
  DFFQX1 \Cout_reg[0]  ( .D(n46), .CK(clk), .Q(Cout[0]) );
  DFFQX1 \c_reg[7]  ( .D(N21), .CK(clk), .Q(c[7]) );
  DFFQX1 \count_reg[1]  ( .D(N12), .CK(clk), .Q(count[1]) );
  DFFQX1 \count_reg[0]  ( .D(N11), .CK(clk), .Q(count[0]) );
  DFFX1 \count_reg[2]  ( .D(N13), .CK(clk), .QN(n68) );
  DFFTRX1 start_reg ( .D(START), .RN(rst_n), .CK(clk), .Q(start), .QN(n69) );
  DFFQX1 \state_reg[1]  ( .D(N10), .CK(clk), .Q(state[1]) );
  DFFQX1 \state_reg[0]  ( .D(N9), .CK(clk), .Q(state[0]) );
  DFFQX1 \c_reg[1]  ( .D(N15), .CK(clk), .Q(c[1]) );
  DFFQX1 \c_reg[2]  ( .D(N16), .CK(clk), .Q(c[2]) );
  DFFQX1 \c_reg[3]  ( .D(N17), .CK(clk), .Q(c[3]) );
  DFFQX1 \c_reg[4]  ( .D(N18), .CK(clk), .Q(c[4]) );
  DFFQX1 \c_reg[5]  ( .D(N19), .CK(clk), .Q(c[5]) );
  DFFQX1 \c_reg[6]  ( .D(N20), .CK(clk), .Q(c[6]) );
  DFFQX1 \triggerCount_reg[7]  ( .D(n9), .CK(clk), .Q(triggerCount[7]) );
  DFFQX1 \c_reg[0]  ( .D(N14), .CK(clk), .Q(c[0]) );
  DFFQX1 \triggerCount_reg[0]  ( .D(n39), .CK(clk), .Q(triggerCount[0]) );
  DFFQX1 \triggerCount_reg[1]  ( .D(n40), .CK(clk), .Q(triggerCount[1]) );
  DFFQX1 \triggerCount_reg[2]  ( .D(n41), .CK(clk), .Q(triggerCount[2]) );
  DFFQX1 \triggerCount_reg[5]  ( .D(n44), .CK(clk), .Q(triggerCount[5]) );
  DFFQX1 \triggerCount_reg[6]  ( .D(n45), .CK(clk), .Q(triggerCount[6]) );
  DFFQX1 \triggerCount_reg[4]  ( .D(n43), .CK(clk), .Q(triggerCount[4]) );
  DFFQX1 \triggerCount_reg[3]  ( .D(n42), .CK(clk), .Q(triggerCount[3]) );
  DFFTRX1 \a_reg[7]  ( .D(A[7]), .RN(rst_n), .CK(clk), .Q(a[7]) );
  DFFTRX1 \b_reg[7]  ( .D(B[7]), .RN(rst_n), .CK(clk), .Q(b[7]) );
  DFFTRX1 DONE_reg ( .D(n60), .RN(n7), .CK(clk), .Q(DONE) );
  DFFTRX1 \a_reg[6]  ( .D(A[6]), .RN(rst_n), .CK(clk), .Q(a[6]) );
  DFFTRX1 \b_reg[6]  ( .D(B[6]), .RN(rst_n), .CK(clk), .Q(b[6]) );
  DFFTRX1 \a_reg[5]  ( .D(A[5]), .RN(rst_n), .CK(clk), .Q(a[5]) );
  DFFTRX1 \a_reg[4]  ( .D(A[4]), .RN(rst_n), .CK(clk), .Q(a[4]) );
  DFFTRX1 \b_reg[5]  ( .D(B[5]), .RN(rst_n), .CK(clk), .Q(b[5]) );
  DFFTRX1 \b_reg[4]  ( .D(B[4]), .RN(rst_n), .CK(clk), .Q(b[4]) );
  DFFTRX1 \a_reg[3]  ( .D(A[3]), .RN(rst_n), .CK(clk), .Q(a[3]) );
  DFFTRX1 \a_reg[2]  ( .D(A[2]), .RN(rst_n), .CK(clk), .Q(a[2]) );
  DFFTRX1 \a_reg[1]  ( .D(A[1]), .RN(rst_n), .CK(clk), .Q(a[1]) );
  DFFTRX1 \b_reg[3]  ( .D(B[3]), .RN(rst_n), .CK(clk), .Q(b[3]) );
  DFFTRX1 \b_reg[2]  ( .D(B[2]), .RN(rst_n), .CK(clk), .Q(b[2]) );
  DFFTRX1 \b_reg[1]  ( .D(B[1]), .RN(rst_n), .CK(clk), .Q(b[1]) );
  DFFTRX1 \a_reg[0]  ( .D(A[0]), .RN(rst_n), .CK(clk), .Q(a[0]) );
  DFFTRX1 \b_reg[0]  ( .D(B[0]), .RN(rst_n), .CK(clk), .Q(b[0]) );
  DFFTRX1 \Bout_reg[7]  ( .D(B[7]), .RN(rst_n), .CK(clk), .Q(Bout[7]) );
  DFFTRX1 \Bout_reg[6]  ( .D(B[6]), .RN(rst_n), .CK(clk), .Q(Bout[6]) );
  DFFTRX1 \Bout_reg[5]  ( .D(B[5]), .RN(rst_n), .CK(clk), .Q(Bout[5]) );
  DFFTRX1 \Bout_reg[4]  ( .D(B[4]), .RN(rst_n), .CK(clk), .Q(Bout[4]) );
  DFFTRX1 \Bout_reg[3]  ( .D(B[3]), .RN(rst_n), .CK(clk), .Q(Bout[3]) );
  DFFTRX1 \Bout_reg[2]  ( .D(B[2]), .RN(rst_n), .CK(clk), .Q(Bout[2]) );
  DFFTRX1 \Bout_reg[1]  ( .D(B[1]), .RN(rst_n), .CK(clk), .Q(Bout[1]) );
  DFFTRX1 \Bout_reg[0]  ( .D(B[0]), .RN(rst_n), .CK(clk), .Q(Bout[0]) );
  DFFTRX1 \Aout_reg[7]  ( .D(A[7]), .RN(rst_n), .CK(clk), .Q(Aout[7]) );
  DFFTRX1 \Aout_reg[6]  ( .D(A[6]), .RN(rst_n), .CK(clk), .Q(Aout[6]) );
  DFFTRX1 \Aout_reg[5]  ( .D(A[5]), .RN(rst_n), .CK(clk), .Q(Aout[5]) );
  DFFTRX1 \Aout_reg[4]  ( .D(A[4]), .RN(rst_n), .CK(clk), .Q(Aout[4]) );
  DFFTRX1 \Aout_reg[3]  ( .D(A[3]), .RN(rst_n), .CK(clk), .Q(Aout[3]) );
  DFFTRX1 \Aout_reg[2]  ( .D(A[2]), .RN(rst_n), .CK(clk), .Q(Aout[2]) );
  DFFTRX1 \Aout_reg[1]  ( .D(A[1]), .RN(rst_n), .CK(clk), .Q(Aout[1]) );
  DFFTRX1 \Aout_reg[0]  ( .D(A[0]), .RN(rst_n), .CK(clk), .Q(Aout[0]) );
  AOI221XL U3 ( .A0(n63), .A1(n62), .B0(n6), .B1(state[1]), .C0(n2), .Y(n64)
         );
  CLKINVX1 U4 ( .A(n58), .Y(n4) );
  CLKINVX1 U5 ( .A(n65), .Y(n7) );
  AO22X1 U6 ( .A0(N71), .A1(n4), .B0(N79), .B1(n3), .Y(N20) );
  AO22X1 U8 ( .A0(N70), .A1(n4), .B0(N78), .B1(n3), .Y(N19) );
  AO22X1 U9 ( .A0(N69), .A1(n4), .B0(N77), .B1(n3), .Y(N18) );
  AO22X1 U10 ( .A0(N66), .A1(n4), .B0(N74), .B1(n3), .Y(N15) );
  AO22X1 U11 ( .A0(N68), .A1(n4), .B0(N76), .B1(n3), .Y(N17) );
  AO22X1 U12 ( .A0(N67), .A1(n4), .B0(N75), .B1(n3), .Y(N16) );
  AO22X1 U13 ( .A0(N65), .A1(n4), .B0(N73), .B1(n3), .Y(N14) );
  NAND2X1 U14 ( .A(rst_n), .B(n62), .Y(n65) );
  NAND2X1 U15 ( .A(n60), .B(n7), .Y(n58) );
  CLKINVX1 U16 ( .A(n57), .Y(n3) );
  CLKINVX1 U17 ( .A(n62), .Y(n6) );
  NOR2X1 U18 ( .A(n65), .B(n63), .Y(N9) );
  AO22X1 U19 ( .A0(N72), .A1(n4), .B0(N80), .B1(n3), .Y(N21) );
  NOR2BX1 U20 ( .AN(state[1]), .B(state[0]), .Y(n62) );
  OAI21XL U21 ( .A0(n60), .A1(n65), .B0(n59), .Y(n61) );
  OAI211X1 U22 ( .A0(state[0]), .A1(start), .B0(n6), .C0(rst_n), .Y(n59) );
  NAND4BX1 U23 ( .AN(triggerCount[0]), .B(triggerCount[7]), .C(n55), .D(n54), 
        .Y(n63) );
  NOR2X1 U24 ( .A(triggerCount[2]), .B(triggerCount[1]), .Y(n55) );
  NOR4X1 U25 ( .A(triggerCount[6]), .B(triggerCount[5]), .C(triggerCount[4]), 
        .D(triggerCount[3]), .Y(n54) );
  NOR2BX1 U26 ( .AN(n63), .B(n68), .Y(n60) );
  NOR3X1 U27 ( .A(n65), .B(n64), .C(n68), .Y(n66) );
  NAND3X1 U28 ( .A(n63), .B(n68), .C(n7), .Y(n57) );
  AO21X1 U29 ( .A0(n68), .A1(n7), .B0(n64), .Y(n67) );
  OAI21XL U30 ( .A0(count[0]), .A1(n57), .B0(n58), .Y(N11) );
  AO22X1 U31 ( .A0(n61), .A1(triggerCount[7]), .B0(N99), .B1(n4), .Y(n9) );
  AO22X1 U32 ( .A0(n61), .A1(triggerCount[0]), .B0(N92), .B1(n4), .Y(n39) );
  AO22X1 U33 ( .A0(Cout[1]), .A1(n67), .B0(c[1]), .B1(n66), .Y(n47) );
  AO22X1 U34 ( .A0(Cout[2]), .A1(n67), .B0(c[2]), .B1(n66), .Y(n48) );
  AO22X1 U35 ( .A0(Cout[3]), .A1(n67), .B0(c[3]), .B1(n66), .Y(n49) );
  AO22X1 U36 ( .A0(Cout[4]), .A1(n67), .B0(c[4]), .B1(n66), .Y(n50) );
  AO22X1 U37 ( .A0(Cout[5]), .A1(n67), .B0(c[5]), .B1(n66), .Y(n51) );
  AO22X1 U38 ( .A0(Cout[6]), .A1(n67), .B0(c[6]), .B1(n66), .Y(n52) );
  AO22X1 U39 ( .A0(Cout[7]), .A1(n67), .B0(c[7]), .B1(n66), .Y(n53) );
  AO22X1 U40 ( .A0(Cout[0]), .A1(n67), .B0(c[0]), .B1(n66), .Y(n46) );
  AO22X1 U41 ( .A0(n61), .A1(triggerCount[6]), .B0(N98), .B1(n4), .Y(n45) );
  AO22X1 U42 ( .A0(n61), .A1(triggerCount[5]), .B0(N97), .B1(n4), .Y(n44) );
  AO22X1 U43 ( .A0(n61), .A1(triggerCount[4]), .B0(N96), .B1(n4), .Y(n43) );
  AO22X1 U44 ( .A0(n61), .A1(triggerCount[3]), .B0(N95), .B1(n4), .Y(n42) );
  AO22X1 U45 ( .A0(n61), .A1(triggerCount[2]), .B0(N94), .B1(n4), .Y(n41) );
  AO22X1 U46 ( .A0(n61), .A1(triggerCount[1]), .B0(N93), .B1(n4), .Y(n40) );
  AND3X2 U47 ( .A(count[1]), .B(n3), .C(count[0]), .Y(N13) );
  NOR2X1 U48 ( .A(n56), .B(n57), .Y(N12) );
  XNOR2X1 U49 ( .A(count[0]), .B(count[1]), .Y(n56) );
  OAI31XL U50 ( .A0(n69), .A1(state[0]), .A2(n2), .B0(n65), .Y(N10) );
  CLKINVX1 U51 ( .A(rst_n), .Y(n2) );
endmodule


module PE_7_DW01_inc_0 ( A, SUM );
  input [7:0] A;
  output [7:0] SUM;

  wire   [7:2] carry;

  ADDHXL U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHXL U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  ADDHXL U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHXL U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHXL U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHXL U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  CLKINVX1 U1 ( .A(A[0]), .Y(SUM[0]) );
  XOR2X1 U2 ( .A(carry[7]), .B(A[7]), .Y(SUM[7]) );
endmodule


module PE_7_DW01_add_0 ( A, B, CI, SUM, CO );
  input [7:0] A;
  input [7:0] B;
  output [7:0] SUM;
  input CI;
  output CO;
  wire   n1, n2;
  wire   [7:1] carry;

  ADDFXL U1_1 ( .A(A[1]), .B(B[1]), .CI(carry[1]), .CO(carry[2]), .S(SUM[1])
         );
  ADDFXL U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  ADDFXL U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFXL U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  ADDFXL U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  ADDFXL U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  XOR3X1 U1_7 ( .A(A[7]), .B(B[7]), .C(carry[7]), .Y(SUM[7]) );
  XNOR2X1 U1 ( .A(B[0]), .B(n1), .Y(SUM[0]) );
  NOR2X1 U2 ( .A(n1), .B(n2), .Y(carry[1]) );
  CLKINVX1 U3 ( .A(B[0]), .Y(n2) );
  CLKINVX1 U4 ( .A(A[0]), .Y(n1) );
endmodule


module PE_7_DW_mult_uns_0 ( a, b, product );
  input [7:0] a;
  input [7:0] b;
  output [15:0] product;
  wire   n2, n3, n4, n5, n6, n7, n18, n19, n20, n21, n22, n23, n24, n25, n26,
         n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40,
         n41, n42, n43, n46, n48, n49, n51, n52, n53, n55, n56, n57, n58, n60,
         n61, n62, n63, n64, n66, n67, n68, n69, n70, n71, n73, n74, n75, n76,
         n77, n78, n123, n124, n125, n126, n127, n128, n129, n130, n131, n132,
         n133, n134, n135, n136, n137, n138, n139, n140, n141, n142, n143,
         n144, n145, n146, n147, n148, n149, n150, n151, n152, n153, n154;

  ADDFXL U3 ( .A(n20), .B(n27), .CI(n3), .CO(n2), .S(product[6]) );
  ADDFXL U4 ( .A(n28), .B(n34), .CI(n4), .CO(n3), .S(product[5]) );
  ADDFXL U5 ( .A(n35), .B(n38), .CI(n5), .CO(n4), .S(product[4]) );
  ADDFXL U6 ( .A(n39), .B(n41), .CI(n6), .CO(n5), .S(product[3]) );
  ADDFXL U7 ( .A(n7), .B(n64), .CI(n43), .CO(n6), .S(product[2]) );
  ADDHXL U8 ( .A(n71), .B(n78), .CO(n7), .S(product[1]) );
  CMPR42X1 U19 ( .A(n60), .B(n55), .C(n26), .D(n29), .ICI(n23), .S(n20), .ICO(
        n18), .CO(n19) );
  CMPR42X1 U20 ( .A(n73), .B(n51), .C(n66), .D(n31), .ICI(n25), .S(n23), .ICO(
        n21), .CO(n22) );
  ADDHXL U21 ( .A(n48), .B(n46), .CO(n24), .S(n25) );
  CMPR42X1 U22 ( .A(n67), .B(n61), .C(n33), .D(n32), .ICI(n30), .S(n28), .ICO(
        n26), .CO(n27) );
  ADDFXL U23 ( .A(n56), .B(n74), .CI(n36), .CO(n29), .S(n30) );
  ADDHXL U24 ( .A(n52), .B(n49), .CO(n31), .S(n32) );
  CMPR42X1 U25 ( .A(n75), .B(n62), .C(n68), .D(n40), .ICI(n37), .S(n35), .ICO(
        n33), .CO(n34) );
  ADDHXL U26 ( .A(n57), .B(n53), .CO(n36), .S(n37) );
  ADDFXL U27 ( .A(n69), .B(n76), .CI(n42), .CO(n38), .S(n39) );
  ADDHXL U28 ( .A(n63), .B(n58), .CO(n40), .S(n41) );
  ADDHXL U29 ( .A(n77), .B(n70), .CO(n42), .S(n43) );
  CLKINVX1 U84 ( .A(a[0]), .Y(n134) );
  CLKINVX1 U85 ( .A(b[0]), .Y(n128) );
  CLKINVX1 U86 ( .A(b[1]), .Y(n127) );
  CLKINVX1 U87 ( .A(a[1]), .Y(n133) );
  CLKINVX1 U88 ( .A(b[2]), .Y(n126) );
  CLKINVX1 U89 ( .A(a[2]), .Y(n132) );
  CLKINVX1 U90 ( .A(a[3]), .Y(n131) );
  CLKINVX1 U91 ( .A(b[3]), .Y(n125) );
  CLKINVX1 U92 ( .A(b[4]), .Y(n124) );
  CLKINVX1 U93 ( .A(a[4]), .Y(n130) );
  CLKINVX1 U94 ( .A(a[5]), .Y(n129) );
  CLKINVX1 U95 ( .A(b[5]), .Y(n123) );
  XOR2X1 U96 ( .A(n135), .B(n136), .Y(product[7]) );
  XOR2X1 U97 ( .A(n137), .B(n138), .Y(n136) );
  XOR2X1 U98 ( .A(n18), .B(n139), .Y(n138) );
  NOR2X1 U99 ( .A(n131), .B(n124), .Y(n139) );
  XOR2X1 U100 ( .A(n140), .B(n141), .Y(n137) );
  XOR2X1 U101 ( .A(n142), .B(n143), .Y(n141) );
  XOR2X1 U102 ( .A(n144), .B(n145), .Y(n143) );
  NAND2X1 U103 ( .A(b[5]), .B(a[2]), .Y(n145) );
  NAND2X1 U104 ( .A(b[6]), .B(a[1]), .Y(n144) );
  XOR2X1 U105 ( .A(n146), .B(n147), .Y(n142) );
  NAND2X1 U106 ( .A(b[3]), .B(a[4]), .Y(n147) );
  NAND2X1 U107 ( .A(b[1]), .B(a[6]), .Y(n146) );
  XOR2X1 U108 ( .A(n148), .B(n149), .Y(n140) );
  XOR2X1 U109 ( .A(n150), .B(n151), .Y(n149) );
  NAND2X1 U110 ( .A(b[0]), .B(a[7]), .Y(n151) );
  NAND2X1 U111 ( .A(b[2]), .B(a[5]), .Y(n150) );
  XNOR2X1 U112 ( .A(n24), .B(n152), .Y(n148) );
  NAND2X1 U113 ( .A(b[7]), .B(a[0]), .Y(n152) );
  XOR2X1 U114 ( .A(n153), .B(n154), .Y(n135) );
  XNOR2X1 U115 ( .A(n2), .B(n19), .Y(n154) );
  XNOR2X1 U116 ( .A(n22), .B(n21), .Y(n153) );
  NOR2X1 U117 ( .A(n134), .B(n128), .Y(product[0]) );
  NOR2X1 U118 ( .A(n134), .B(n127), .Y(n78) );
  NOR2X1 U119 ( .A(n134), .B(n126), .Y(n77) );
  NOR2X1 U120 ( .A(n134), .B(n125), .Y(n76) );
  NOR2X1 U121 ( .A(n134), .B(n124), .Y(n75) );
  NOR2X1 U122 ( .A(n134), .B(n123), .Y(n74) );
  AND2X1 U123 ( .A(b[6]), .B(a[0]), .Y(n73) );
  NOR2X1 U124 ( .A(n128), .B(n133), .Y(n71) );
  NOR2X1 U125 ( .A(n127), .B(n133), .Y(n70) );
  NOR2X1 U126 ( .A(n126), .B(n133), .Y(n69) );
  NOR2X1 U127 ( .A(n125), .B(n133), .Y(n68) );
  NOR2X1 U128 ( .A(n133), .B(n124), .Y(n67) );
  NOR2X1 U129 ( .A(n133), .B(n123), .Y(n66) );
  NOR2X1 U130 ( .A(n128), .B(n132), .Y(n64) );
  NOR2X1 U131 ( .A(n127), .B(n132), .Y(n63) );
  NOR2X1 U132 ( .A(n126), .B(n132), .Y(n62) );
  NOR2X1 U133 ( .A(n125), .B(n132), .Y(n61) );
  NOR2X1 U134 ( .A(n132), .B(n124), .Y(n60) );
  NOR2X1 U135 ( .A(n128), .B(n131), .Y(n58) );
  NOR2X1 U136 ( .A(n127), .B(n131), .Y(n57) );
  NOR2X1 U137 ( .A(n126), .B(n131), .Y(n56) );
  NOR2X1 U138 ( .A(n125), .B(n131), .Y(n55) );
  NOR2X1 U139 ( .A(n128), .B(n130), .Y(n53) );
  NOR2X1 U140 ( .A(n127), .B(n130), .Y(n52) );
  NOR2X1 U141 ( .A(n126), .B(n130), .Y(n51) );
  NOR2X1 U142 ( .A(n129), .B(n128), .Y(n49) );
  NOR2X1 U143 ( .A(n129), .B(n127), .Y(n48) );
  AND2X1 U144 ( .A(a[6]), .B(b[0]), .Y(n46) );
endmodule


module PE_7 ( clk, rst_n, START, A, B, Aout, Bout, Cout, DONE );
  input [7:0] A;
  input [7:0] B;
  output [7:0] Aout;
  output [7:0] Bout;
  output [7:0] Cout;
  input clk, rst_n, START;
  output DONE;
  wire   start, N9, N10, N11, N12, N13, N14, N15, N16, N17, N18, N19, N20, N21,
         N65, N66, N67, N68, N69, N70, N71, N72, N73, N74, N75, N76, N77, N78,
         N79, N80, N92, N93, N94, N95, N96, N97, N98, N99, n2, n3, n4, n6, n7,
         n9, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51,
         n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65,
         n66, n67, n68, n69;
  wire   [1:0] state;
  wire   [2:0] count;
  wire   [7:0] c;
  wire   [7:0] triggerCount;
  wire   [7:0] a;
  wire   [7:0] b;
  wire   SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, 
        SYNOPSYS_UNCONNECTED__4, SYNOPSYS_UNCONNECTED__5, 
        SYNOPSYS_UNCONNECTED__6, SYNOPSYS_UNCONNECTED__7;

  PE_7_DW01_inc_0 add_98 ( .A(triggerCount), .SUM({N99, N98, N97, N96, N95, 
        N94, N93, N92}) );
  PE_7_DW01_add_0 add_88 ( .A(c), .B({N72, N71, N70, N69, N68, N67, N66, N65}), 
        .CI(1'b0), .SUM({N80, N79, N78, N77, N76, N75, N74, N73}) );
  PE_7_DW_mult_uns_0 r319 ( .a(a), .b(b), .product({SYNOPSYS_UNCONNECTED__0, 
        SYNOPSYS_UNCONNECTED__1, SYNOPSYS_UNCONNECTED__2, 
        SYNOPSYS_UNCONNECTED__3, SYNOPSYS_UNCONNECTED__4, 
        SYNOPSYS_UNCONNECTED__5, SYNOPSYS_UNCONNECTED__6, 
        SYNOPSYS_UNCONNECTED__7, N72, N71, N70, N69, N68, N67, N66, N65}) );
  DFFQX1 \Cout_reg[7]  ( .D(n53), .CK(clk), .Q(Cout[7]) );
  DFFQX1 \Cout_reg[6]  ( .D(n52), .CK(clk), .Q(Cout[6]) );
  DFFQX1 \Cout_reg[5]  ( .D(n51), .CK(clk), .Q(Cout[5]) );
  DFFQX1 \Cout_reg[4]  ( .D(n50), .CK(clk), .Q(Cout[4]) );
  DFFQX1 \Cout_reg[3]  ( .D(n49), .CK(clk), .Q(Cout[3]) );
  DFFQX1 \Cout_reg[2]  ( .D(n48), .CK(clk), .Q(Cout[2]) );
  DFFQX1 \Cout_reg[1]  ( .D(n47), .CK(clk), .Q(Cout[1]) );
  DFFQX1 \Cout_reg[0]  ( .D(n46), .CK(clk), .Q(Cout[0]) );
  DFFQX1 \c_reg[7]  ( .D(N21), .CK(clk), .Q(c[7]) );
  DFFQX1 \count_reg[1]  ( .D(N12), .CK(clk), .Q(count[1]) );
  DFFQX1 \count_reg[0]  ( .D(N11), .CK(clk), .Q(count[0]) );
  DFFX1 \count_reg[2]  ( .D(N13), .CK(clk), .QN(n68) );
  DFFTRX1 start_reg ( .D(START), .RN(rst_n), .CK(clk), .Q(start), .QN(n69) );
  DFFQX1 \state_reg[1]  ( .D(N10), .CK(clk), .Q(state[1]) );
  DFFQX1 \state_reg[0]  ( .D(N9), .CK(clk), .Q(state[0]) );
  DFFQX1 \c_reg[1]  ( .D(N15), .CK(clk), .Q(c[1]) );
  DFFQX1 \c_reg[2]  ( .D(N16), .CK(clk), .Q(c[2]) );
  DFFQX1 \c_reg[3]  ( .D(N17), .CK(clk), .Q(c[3]) );
  DFFQX1 \c_reg[4]  ( .D(N18), .CK(clk), .Q(c[4]) );
  DFFQX1 \c_reg[5]  ( .D(N19), .CK(clk), .Q(c[5]) );
  DFFQX1 \c_reg[6]  ( .D(N20), .CK(clk), .Q(c[6]) );
  DFFQX1 \triggerCount_reg[7]  ( .D(n9), .CK(clk), .Q(triggerCount[7]) );
  DFFQX1 \c_reg[0]  ( .D(N14), .CK(clk), .Q(c[0]) );
  DFFQX1 \triggerCount_reg[0]  ( .D(n39), .CK(clk), .Q(triggerCount[0]) );
  DFFQX1 \triggerCount_reg[1]  ( .D(n40), .CK(clk), .Q(triggerCount[1]) );
  DFFQX1 \triggerCount_reg[2]  ( .D(n41), .CK(clk), .Q(triggerCount[2]) );
  DFFQX1 \triggerCount_reg[5]  ( .D(n44), .CK(clk), .Q(triggerCount[5]) );
  DFFQX1 \triggerCount_reg[6]  ( .D(n45), .CK(clk), .Q(triggerCount[6]) );
  DFFQX1 \triggerCount_reg[4]  ( .D(n43), .CK(clk), .Q(triggerCount[4]) );
  DFFQX1 \triggerCount_reg[3]  ( .D(n42), .CK(clk), .Q(triggerCount[3]) );
  DFFTRX1 \a_reg[7]  ( .D(A[7]), .RN(rst_n), .CK(clk), .Q(a[7]) );
  DFFTRX1 \b_reg[7]  ( .D(B[7]), .RN(rst_n), .CK(clk), .Q(b[7]) );
  DFFTRX1 DONE_reg ( .D(n60), .RN(n7), .CK(clk), .Q(DONE) );
  DFFTRX1 \a_reg[6]  ( .D(A[6]), .RN(rst_n), .CK(clk), .Q(a[6]) );
  DFFTRX1 \b_reg[6]  ( .D(B[6]), .RN(rst_n), .CK(clk), .Q(b[6]) );
  DFFTRX1 \a_reg[5]  ( .D(A[5]), .RN(rst_n), .CK(clk), .Q(a[5]) );
  DFFTRX1 \a_reg[4]  ( .D(A[4]), .RN(rst_n), .CK(clk), .Q(a[4]) );
  DFFTRX1 \b_reg[5]  ( .D(B[5]), .RN(rst_n), .CK(clk), .Q(b[5]) );
  DFFTRX1 \b_reg[4]  ( .D(B[4]), .RN(rst_n), .CK(clk), .Q(b[4]) );
  DFFTRX1 \a_reg[3]  ( .D(A[3]), .RN(rst_n), .CK(clk), .Q(a[3]) );
  DFFTRX1 \a_reg[2]  ( .D(A[2]), .RN(rst_n), .CK(clk), .Q(a[2]) );
  DFFTRX1 \a_reg[1]  ( .D(A[1]), .RN(rst_n), .CK(clk), .Q(a[1]) );
  DFFTRX1 \b_reg[3]  ( .D(B[3]), .RN(rst_n), .CK(clk), .Q(b[3]) );
  DFFTRX1 \b_reg[2]  ( .D(B[2]), .RN(rst_n), .CK(clk), .Q(b[2]) );
  DFFTRX1 \b_reg[1]  ( .D(B[1]), .RN(rst_n), .CK(clk), .Q(b[1]) );
  DFFTRX1 \a_reg[0]  ( .D(A[0]), .RN(rst_n), .CK(clk), .Q(a[0]) );
  DFFTRX1 \b_reg[0]  ( .D(B[0]), .RN(rst_n), .CK(clk), .Q(b[0]) );
  DFFTRX1 \Bout_reg[7]  ( .D(B[7]), .RN(rst_n), .CK(clk), .Q(Bout[7]) );
  DFFTRX1 \Bout_reg[6]  ( .D(B[6]), .RN(rst_n), .CK(clk), .Q(Bout[6]) );
  DFFTRX1 \Bout_reg[5]  ( .D(B[5]), .RN(rst_n), .CK(clk), .Q(Bout[5]) );
  DFFTRX1 \Bout_reg[4]  ( .D(B[4]), .RN(rst_n), .CK(clk), .Q(Bout[4]) );
  DFFTRX1 \Bout_reg[3]  ( .D(B[3]), .RN(rst_n), .CK(clk), .Q(Bout[3]) );
  DFFTRX1 \Bout_reg[2]  ( .D(B[2]), .RN(rst_n), .CK(clk), .Q(Bout[2]) );
  DFFTRX1 \Bout_reg[1]  ( .D(B[1]), .RN(rst_n), .CK(clk), .Q(Bout[1]) );
  DFFTRX1 \Bout_reg[0]  ( .D(B[0]), .RN(rst_n), .CK(clk), .Q(Bout[0]) );
  DFFTRX1 \Aout_reg[7]  ( .D(A[7]), .RN(rst_n), .CK(clk), .Q(Aout[7]) );
  DFFTRX1 \Aout_reg[6]  ( .D(A[6]), .RN(rst_n), .CK(clk), .Q(Aout[6]) );
  DFFTRX1 \Aout_reg[5]  ( .D(A[5]), .RN(rst_n), .CK(clk), .Q(Aout[5]) );
  DFFTRX1 \Aout_reg[4]  ( .D(A[4]), .RN(rst_n), .CK(clk), .Q(Aout[4]) );
  DFFTRX1 \Aout_reg[3]  ( .D(A[3]), .RN(rst_n), .CK(clk), .Q(Aout[3]) );
  DFFTRX1 \Aout_reg[2]  ( .D(A[2]), .RN(rst_n), .CK(clk), .Q(Aout[2]) );
  DFFTRX1 \Aout_reg[1]  ( .D(A[1]), .RN(rst_n), .CK(clk), .Q(Aout[1]) );
  DFFTRX1 \Aout_reg[0]  ( .D(A[0]), .RN(rst_n), .CK(clk), .Q(Aout[0]) );
  AOI221XL U3 ( .A0(n63), .A1(n62), .B0(n6), .B1(state[1]), .C0(n2), .Y(n64)
         );
  CLKINVX1 U4 ( .A(n58), .Y(n4) );
  CLKINVX1 U5 ( .A(n65), .Y(n7) );
  AO22X1 U6 ( .A0(N71), .A1(n4), .B0(N79), .B1(n3), .Y(N20) );
  AO22X1 U8 ( .A0(N70), .A1(n4), .B0(N78), .B1(n3), .Y(N19) );
  AO22X1 U9 ( .A0(N69), .A1(n4), .B0(N77), .B1(n3), .Y(N18) );
  AO22X1 U10 ( .A0(N66), .A1(n4), .B0(N74), .B1(n3), .Y(N15) );
  AO22X1 U11 ( .A0(N68), .A1(n4), .B0(N76), .B1(n3), .Y(N17) );
  AO22X1 U12 ( .A0(N67), .A1(n4), .B0(N75), .B1(n3), .Y(N16) );
  AO22X1 U13 ( .A0(N65), .A1(n4), .B0(N73), .B1(n3), .Y(N14) );
  NAND2X1 U14 ( .A(rst_n), .B(n62), .Y(n65) );
  NAND2X1 U15 ( .A(n60), .B(n7), .Y(n58) );
  CLKINVX1 U16 ( .A(n57), .Y(n3) );
  CLKINVX1 U17 ( .A(n62), .Y(n6) );
  NOR2X1 U18 ( .A(n65), .B(n63), .Y(N9) );
  AO22X1 U19 ( .A0(N72), .A1(n4), .B0(N80), .B1(n3), .Y(N21) );
  NOR2BX1 U20 ( .AN(state[1]), .B(state[0]), .Y(n62) );
  OAI21XL U21 ( .A0(n60), .A1(n65), .B0(n59), .Y(n61) );
  OAI211X1 U22 ( .A0(state[0]), .A1(start), .B0(n6), .C0(rst_n), .Y(n59) );
  NAND4BX1 U23 ( .AN(triggerCount[0]), .B(triggerCount[7]), .C(n55), .D(n54), 
        .Y(n63) );
  NOR2X1 U24 ( .A(triggerCount[2]), .B(triggerCount[1]), .Y(n55) );
  NOR4X1 U25 ( .A(triggerCount[6]), .B(triggerCount[5]), .C(triggerCount[4]), 
        .D(triggerCount[3]), .Y(n54) );
  NOR2BX1 U26 ( .AN(n63), .B(n68), .Y(n60) );
  NOR3X1 U27 ( .A(n65), .B(n64), .C(n68), .Y(n66) );
  NAND3X1 U28 ( .A(n63), .B(n68), .C(n7), .Y(n57) );
  AO21X1 U29 ( .A0(n68), .A1(n7), .B0(n64), .Y(n67) );
  OAI21XL U30 ( .A0(count[0]), .A1(n57), .B0(n58), .Y(N11) );
  AO22X1 U31 ( .A0(n61), .A1(triggerCount[7]), .B0(N99), .B1(n4), .Y(n9) );
  AO22X1 U32 ( .A0(n61), .A1(triggerCount[0]), .B0(N92), .B1(n4), .Y(n39) );
  AO22X1 U33 ( .A0(Cout[1]), .A1(n67), .B0(c[1]), .B1(n66), .Y(n47) );
  AO22X1 U34 ( .A0(Cout[2]), .A1(n67), .B0(c[2]), .B1(n66), .Y(n48) );
  AO22X1 U35 ( .A0(Cout[3]), .A1(n67), .B0(c[3]), .B1(n66), .Y(n49) );
  AO22X1 U36 ( .A0(Cout[4]), .A1(n67), .B0(c[4]), .B1(n66), .Y(n50) );
  AO22X1 U37 ( .A0(Cout[5]), .A1(n67), .B0(c[5]), .B1(n66), .Y(n51) );
  AO22X1 U38 ( .A0(Cout[6]), .A1(n67), .B0(c[6]), .B1(n66), .Y(n52) );
  AO22X1 U39 ( .A0(Cout[7]), .A1(n67), .B0(c[7]), .B1(n66), .Y(n53) );
  AO22X1 U40 ( .A0(Cout[0]), .A1(n67), .B0(c[0]), .B1(n66), .Y(n46) );
  AO22X1 U41 ( .A0(n61), .A1(triggerCount[6]), .B0(N98), .B1(n4), .Y(n45) );
  AO22X1 U42 ( .A0(n61), .A1(triggerCount[5]), .B0(N97), .B1(n4), .Y(n44) );
  AO22X1 U43 ( .A0(n61), .A1(triggerCount[4]), .B0(N96), .B1(n4), .Y(n43) );
  AO22X1 U44 ( .A0(n61), .A1(triggerCount[3]), .B0(N95), .B1(n4), .Y(n42) );
  AO22X1 U45 ( .A0(n61), .A1(triggerCount[2]), .B0(N94), .B1(n4), .Y(n41) );
  AO22X1 U46 ( .A0(n61), .A1(triggerCount[1]), .B0(N93), .B1(n4), .Y(n40) );
  AND3X2 U47 ( .A(count[1]), .B(n3), .C(count[0]), .Y(N13) );
  NOR2X1 U48 ( .A(n56), .B(n57), .Y(N12) );
  XNOR2X1 U49 ( .A(count[0]), .B(count[1]), .Y(n56) );
  OAI31XL U50 ( .A0(n69), .A1(state[0]), .A2(n2), .B0(n65), .Y(N10) );
  CLKINVX1 U51 ( .A(rst_n), .Y(n2) );
endmodule


module PE_6_DW01_inc_0 ( A, SUM );
  input [7:0] A;
  output [7:0] SUM;

  wire   [7:2] carry;

  ADDHXL U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHXL U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  ADDHXL U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHXL U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHXL U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHXL U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  CLKINVX1 U1 ( .A(A[0]), .Y(SUM[0]) );
  XOR2X1 U2 ( .A(carry[7]), .B(A[7]), .Y(SUM[7]) );
endmodule


module PE_6_DW01_add_0 ( A, B, CI, SUM, CO );
  input [7:0] A;
  input [7:0] B;
  output [7:0] SUM;
  input CI;
  output CO;
  wire   n1, n2;
  wire   [7:1] carry;

  ADDFXL U1_1 ( .A(A[1]), .B(B[1]), .CI(carry[1]), .CO(carry[2]), .S(SUM[1])
         );
  ADDFXL U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  ADDFXL U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFXL U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  ADDFXL U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  ADDFXL U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  XOR3X1 U1_7 ( .A(A[7]), .B(B[7]), .C(carry[7]), .Y(SUM[7]) );
  XNOR2X1 U1 ( .A(B[0]), .B(n1), .Y(SUM[0]) );
  NOR2X1 U2 ( .A(n1), .B(n2), .Y(carry[1]) );
  CLKINVX1 U3 ( .A(B[0]), .Y(n2) );
  CLKINVX1 U4 ( .A(A[0]), .Y(n1) );
endmodule


module PE_6_DW_mult_uns_0 ( a, b, product );
  input [7:0] a;
  input [7:0] b;
  output [15:0] product;
  wire   n2, n3, n4, n5, n6, n7, n18, n19, n20, n21, n22, n23, n24, n25, n26,
         n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40,
         n41, n42, n43, n46, n48, n49, n51, n52, n53, n55, n56, n57, n58, n60,
         n61, n62, n63, n64, n66, n67, n68, n69, n70, n71, n73, n74, n75, n76,
         n77, n78, n123, n124, n125, n126, n127, n128, n129, n130, n131, n132,
         n133, n134, n135, n136, n137, n138, n139, n140, n141, n142, n143,
         n144, n145, n146, n147, n148, n149, n150, n151, n152, n153, n154;

  ADDFXL U3 ( .A(n20), .B(n27), .CI(n3), .CO(n2), .S(product[6]) );
  ADDFXL U4 ( .A(n28), .B(n34), .CI(n4), .CO(n3), .S(product[5]) );
  ADDFXL U5 ( .A(n35), .B(n38), .CI(n5), .CO(n4), .S(product[4]) );
  ADDFXL U6 ( .A(n39), .B(n41), .CI(n6), .CO(n5), .S(product[3]) );
  ADDFXL U7 ( .A(n7), .B(n64), .CI(n43), .CO(n6), .S(product[2]) );
  ADDHXL U8 ( .A(n71), .B(n78), .CO(n7), .S(product[1]) );
  CMPR42X1 U19 ( .A(n60), .B(n55), .C(n26), .D(n29), .ICI(n23), .S(n20), .ICO(
        n18), .CO(n19) );
  CMPR42X1 U20 ( .A(n73), .B(n51), .C(n66), .D(n31), .ICI(n25), .S(n23), .ICO(
        n21), .CO(n22) );
  ADDHXL U21 ( .A(n48), .B(n46), .CO(n24), .S(n25) );
  CMPR42X1 U22 ( .A(n67), .B(n61), .C(n33), .D(n32), .ICI(n30), .S(n28), .ICO(
        n26), .CO(n27) );
  ADDFXL U23 ( .A(n56), .B(n74), .CI(n36), .CO(n29), .S(n30) );
  ADDHXL U24 ( .A(n52), .B(n49), .CO(n31), .S(n32) );
  CMPR42X1 U25 ( .A(n75), .B(n62), .C(n68), .D(n40), .ICI(n37), .S(n35), .ICO(
        n33), .CO(n34) );
  ADDHXL U26 ( .A(n57), .B(n53), .CO(n36), .S(n37) );
  ADDFXL U27 ( .A(n69), .B(n76), .CI(n42), .CO(n38), .S(n39) );
  ADDHXL U28 ( .A(n63), .B(n58), .CO(n40), .S(n41) );
  ADDHXL U29 ( .A(n77), .B(n70), .CO(n42), .S(n43) );
  CLKINVX1 U84 ( .A(a[0]), .Y(n134) );
  CLKINVX1 U85 ( .A(b[0]), .Y(n128) );
  CLKINVX1 U86 ( .A(b[1]), .Y(n127) );
  CLKINVX1 U87 ( .A(a[1]), .Y(n133) );
  CLKINVX1 U88 ( .A(b[2]), .Y(n126) );
  CLKINVX1 U89 ( .A(a[2]), .Y(n132) );
  CLKINVX1 U90 ( .A(a[3]), .Y(n131) );
  CLKINVX1 U91 ( .A(b[3]), .Y(n125) );
  CLKINVX1 U92 ( .A(b[4]), .Y(n124) );
  CLKINVX1 U93 ( .A(a[4]), .Y(n130) );
  CLKINVX1 U94 ( .A(a[5]), .Y(n129) );
  CLKINVX1 U95 ( .A(b[5]), .Y(n123) );
  XOR2X1 U96 ( .A(n135), .B(n136), .Y(product[7]) );
  XOR2X1 U97 ( .A(n137), .B(n138), .Y(n136) );
  XOR2X1 U98 ( .A(n18), .B(n139), .Y(n138) );
  NOR2X1 U99 ( .A(n131), .B(n124), .Y(n139) );
  XOR2X1 U100 ( .A(n140), .B(n141), .Y(n137) );
  XOR2X1 U101 ( .A(n142), .B(n143), .Y(n141) );
  XOR2X1 U102 ( .A(n144), .B(n145), .Y(n143) );
  NAND2X1 U103 ( .A(b[5]), .B(a[2]), .Y(n145) );
  NAND2X1 U104 ( .A(b[6]), .B(a[1]), .Y(n144) );
  XOR2X1 U105 ( .A(n146), .B(n147), .Y(n142) );
  NAND2X1 U106 ( .A(b[3]), .B(a[4]), .Y(n147) );
  NAND2X1 U107 ( .A(b[1]), .B(a[6]), .Y(n146) );
  XOR2X1 U108 ( .A(n148), .B(n149), .Y(n140) );
  XOR2X1 U109 ( .A(n150), .B(n151), .Y(n149) );
  NAND2X1 U110 ( .A(b[0]), .B(a[7]), .Y(n151) );
  NAND2X1 U111 ( .A(b[2]), .B(a[5]), .Y(n150) );
  XNOR2X1 U112 ( .A(n24), .B(n152), .Y(n148) );
  NAND2X1 U113 ( .A(b[7]), .B(a[0]), .Y(n152) );
  XOR2X1 U114 ( .A(n153), .B(n154), .Y(n135) );
  XNOR2X1 U115 ( .A(n2), .B(n19), .Y(n154) );
  XNOR2X1 U116 ( .A(n22), .B(n21), .Y(n153) );
  NOR2X1 U117 ( .A(n134), .B(n128), .Y(product[0]) );
  NOR2X1 U118 ( .A(n134), .B(n127), .Y(n78) );
  NOR2X1 U119 ( .A(n134), .B(n126), .Y(n77) );
  NOR2X1 U120 ( .A(n134), .B(n125), .Y(n76) );
  NOR2X1 U121 ( .A(n134), .B(n124), .Y(n75) );
  NOR2X1 U122 ( .A(n134), .B(n123), .Y(n74) );
  AND2X1 U123 ( .A(b[6]), .B(a[0]), .Y(n73) );
  NOR2X1 U124 ( .A(n128), .B(n133), .Y(n71) );
  NOR2X1 U125 ( .A(n127), .B(n133), .Y(n70) );
  NOR2X1 U126 ( .A(n126), .B(n133), .Y(n69) );
  NOR2X1 U127 ( .A(n125), .B(n133), .Y(n68) );
  NOR2X1 U128 ( .A(n133), .B(n124), .Y(n67) );
  NOR2X1 U129 ( .A(n133), .B(n123), .Y(n66) );
  NOR2X1 U130 ( .A(n128), .B(n132), .Y(n64) );
  NOR2X1 U131 ( .A(n127), .B(n132), .Y(n63) );
  NOR2X1 U132 ( .A(n126), .B(n132), .Y(n62) );
  NOR2X1 U133 ( .A(n125), .B(n132), .Y(n61) );
  NOR2X1 U134 ( .A(n132), .B(n124), .Y(n60) );
  NOR2X1 U135 ( .A(n128), .B(n131), .Y(n58) );
  NOR2X1 U136 ( .A(n127), .B(n131), .Y(n57) );
  NOR2X1 U137 ( .A(n126), .B(n131), .Y(n56) );
  NOR2X1 U138 ( .A(n125), .B(n131), .Y(n55) );
  NOR2X1 U139 ( .A(n128), .B(n130), .Y(n53) );
  NOR2X1 U140 ( .A(n127), .B(n130), .Y(n52) );
  NOR2X1 U141 ( .A(n126), .B(n130), .Y(n51) );
  NOR2X1 U142 ( .A(n129), .B(n128), .Y(n49) );
  NOR2X1 U143 ( .A(n129), .B(n127), .Y(n48) );
  AND2X1 U144 ( .A(a[6]), .B(b[0]), .Y(n46) );
endmodule


module PE_6 ( clk, rst_n, START, A, B, Aout, Bout, Cout, DONE );
  input [7:0] A;
  input [7:0] B;
  output [7:0] Aout;
  output [7:0] Bout;
  output [7:0] Cout;
  input clk, rst_n, START;
  output DONE;
  wire   start, N9, N10, N11, N12, N13, N14, N15, N16, N17, N18, N19, N20, N21,
         N65, N66, N67, N68, N69, N70, N71, N72, N73, N74, N75, N76, N77, N78,
         N79, N80, N92, N93, N94, N95, N96, N97, N98, N99, n2, n3, n4, n6, n7,
         n9, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51,
         n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65,
         n66, n67, n68, n69;
  wire   [1:0] state;
  wire   [2:0] count;
  wire   [7:0] c;
  wire   [7:0] triggerCount;
  wire   [7:0] a;
  wire   [7:0] b;
  wire   SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, 
        SYNOPSYS_UNCONNECTED__4, SYNOPSYS_UNCONNECTED__5, 
        SYNOPSYS_UNCONNECTED__6, SYNOPSYS_UNCONNECTED__7;

  PE_6_DW01_inc_0 add_98 ( .A(triggerCount), .SUM({N99, N98, N97, N96, N95, 
        N94, N93, N92}) );
  PE_6_DW01_add_0 add_88 ( .A(c), .B({N72, N71, N70, N69, N68, N67, N66, N65}), 
        .CI(1'b0), .SUM({N80, N79, N78, N77, N76, N75, N74, N73}) );
  PE_6_DW_mult_uns_0 r319 ( .a(a), .b(b), .product({SYNOPSYS_UNCONNECTED__0, 
        SYNOPSYS_UNCONNECTED__1, SYNOPSYS_UNCONNECTED__2, 
        SYNOPSYS_UNCONNECTED__3, SYNOPSYS_UNCONNECTED__4, 
        SYNOPSYS_UNCONNECTED__5, SYNOPSYS_UNCONNECTED__6, 
        SYNOPSYS_UNCONNECTED__7, N72, N71, N70, N69, N68, N67, N66, N65}) );
  DFFQX1 \Cout_reg[7]  ( .D(n53), .CK(clk), .Q(Cout[7]) );
  DFFQX1 \Cout_reg[6]  ( .D(n52), .CK(clk), .Q(Cout[6]) );
  DFFQX1 \Cout_reg[5]  ( .D(n51), .CK(clk), .Q(Cout[5]) );
  DFFQX1 \Cout_reg[4]  ( .D(n50), .CK(clk), .Q(Cout[4]) );
  DFFQX1 \Cout_reg[3]  ( .D(n49), .CK(clk), .Q(Cout[3]) );
  DFFQX1 \Cout_reg[2]  ( .D(n48), .CK(clk), .Q(Cout[2]) );
  DFFQX1 \Cout_reg[1]  ( .D(n47), .CK(clk), .Q(Cout[1]) );
  DFFQX1 \Cout_reg[0]  ( .D(n46), .CK(clk), .Q(Cout[0]) );
  DFFQX1 \c_reg[7]  ( .D(N21), .CK(clk), .Q(c[7]) );
  DFFQX1 \count_reg[1]  ( .D(N12), .CK(clk), .Q(count[1]) );
  DFFQX1 \count_reg[0]  ( .D(N11), .CK(clk), .Q(count[0]) );
  DFFX1 \count_reg[2]  ( .D(N13), .CK(clk), .QN(n68) );
  DFFTRX1 start_reg ( .D(START), .RN(rst_n), .CK(clk), .Q(start), .QN(n69) );
  DFFQX1 \state_reg[1]  ( .D(N10), .CK(clk), .Q(state[1]) );
  DFFQX1 \state_reg[0]  ( .D(N9), .CK(clk), .Q(state[0]) );
  DFFQX1 \c_reg[1]  ( .D(N15), .CK(clk), .Q(c[1]) );
  DFFQX1 \c_reg[2]  ( .D(N16), .CK(clk), .Q(c[2]) );
  DFFQX1 \c_reg[3]  ( .D(N17), .CK(clk), .Q(c[3]) );
  DFFQX1 \c_reg[4]  ( .D(N18), .CK(clk), .Q(c[4]) );
  DFFQX1 \c_reg[5]  ( .D(N19), .CK(clk), .Q(c[5]) );
  DFFQX1 \c_reg[6]  ( .D(N20), .CK(clk), .Q(c[6]) );
  DFFQX1 \triggerCount_reg[7]  ( .D(n9), .CK(clk), .Q(triggerCount[7]) );
  DFFQX1 \c_reg[0]  ( .D(N14), .CK(clk), .Q(c[0]) );
  DFFQX1 \triggerCount_reg[0]  ( .D(n39), .CK(clk), .Q(triggerCount[0]) );
  DFFQX1 \triggerCount_reg[1]  ( .D(n40), .CK(clk), .Q(triggerCount[1]) );
  DFFQX1 \triggerCount_reg[2]  ( .D(n41), .CK(clk), .Q(triggerCount[2]) );
  DFFQX1 \triggerCount_reg[5]  ( .D(n44), .CK(clk), .Q(triggerCount[5]) );
  DFFQX1 \triggerCount_reg[6]  ( .D(n45), .CK(clk), .Q(triggerCount[6]) );
  DFFQX1 \triggerCount_reg[4]  ( .D(n43), .CK(clk), .Q(triggerCount[4]) );
  DFFQX1 \triggerCount_reg[3]  ( .D(n42), .CK(clk), .Q(triggerCount[3]) );
  DFFTRX1 \a_reg[7]  ( .D(A[7]), .RN(rst_n), .CK(clk), .Q(a[7]) );
  DFFTRX1 \b_reg[7]  ( .D(B[7]), .RN(rst_n), .CK(clk), .Q(b[7]) );
  DFFTRX1 DONE_reg ( .D(n60), .RN(n7), .CK(clk), .Q(DONE) );
  DFFTRX1 \a_reg[6]  ( .D(A[6]), .RN(rst_n), .CK(clk), .Q(a[6]) );
  DFFTRX1 \b_reg[6]  ( .D(B[6]), .RN(rst_n), .CK(clk), .Q(b[6]) );
  DFFTRX1 \a_reg[5]  ( .D(A[5]), .RN(rst_n), .CK(clk), .Q(a[5]) );
  DFFTRX1 \a_reg[4]  ( .D(A[4]), .RN(rst_n), .CK(clk), .Q(a[4]) );
  DFFTRX1 \b_reg[5]  ( .D(B[5]), .RN(rst_n), .CK(clk), .Q(b[5]) );
  DFFTRX1 \b_reg[4]  ( .D(B[4]), .RN(rst_n), .CK(clk), .Q(b[4]) );
  DFFTRX1 \a_reg[3]  ( .D(A[3]), .RN(rst_n), .CK(clk), .Q(a[3]) );
  DFFTRX1 \a_reg[2]  ( .D(A[2]), .RN(rst_n), .CK(clk), .Q(a[2]) );
  DFFTRX1 \a_reg[1]  ( .D(A[1]), .RN(rst_n), .CK(clk), .Q(a[1]) );
  DFFTRX1 \b_reg[3]  ( .D(B[3]), .RN(rst_n), .CK(clk), .Q(b[3]) );
  DFFTRX1 \b_reg[2]  ( .D(B[2]), .RN(rst_n), .CK(clk), .Q(b[2]) );
  DFFTRX1 \b_reg[1]  ( .D(B[1]), .RN(rst_n), .CK(clk), .Q(b[1]) );
  DFFTRX1 \a_reg[0]  ( .D(A[0]), .RN(rst_n), .CK(clk), .Q(a[0]) );
  DFFTRX1 \b_reg[0]  ( .D(B[0]), .RN(rst_n), .CK(clk), .Q(b[0]) );
  DFFTRX1 \Bout_reg[7]  ( .D(B[7]), .RN(rst_n), .CK(clk), .Q(Bout[7]) );
  DFFTRX1 \Bout_reg[6]  ( .D(B[6]), .RN(rst_n), .CK(clk), .Q(Bout[6]) );
  DFFTRX1 \Bout_reg[5]  ( .D(B[5]), .RN(rst_n), .CK(clk), .Q(Bout[5]) );
  DFFTRX1 \Bout_reg[4]  ( .D(B[4]), .RN(rst_n), .CK(clk), .Q(Bout[4]) );
  DFFTRX1 \Bout_reg[3]  ( .D(B[3]), .RN(rst_n), .CK(clk), .Q(Bout[3]) );
  DFFTRX1 \Bout_reg[2]  ( .D(B[2]), .RN(rst_n), .CK(clk), .Q(Bout[2]) );
  DFFTRX1 \Bout_reg[1]  ( .D(B[1]), .RN(rst_n), .CK(clk), .Q(Bout[1]) );
  DFFTRX1 \Bout_reg[0]  ( .D(B[0]), .RN(rst_n), .CK(clk), .Q(Bout[0]) );
  DFFTRX1 \Aout_reg[7]  ( .D(A[7]), .RN(rst_n), .CK(clk), .Q(Aout[7]) );
  DFFTRX1 \Aout_reg[6]  ( .D(A[6]), .RN(rst_n), .CK(clk), .Q(Aout[6]) );
  DFFTRX1 \Aout_reg[5]  ( .D(A[5]), .RN(rst_n), .CK(clk), .Q(Aout[5]) );
  DFFTRX1 \Aout_reg[4]  ( .D(A[4]), .RN(rst_n), .CK(clk), .Q(Aout[4]) );
  DFFTRX1 \Aout_reg[3]  ( .D(A[3]), .RN(rst_n), .CK(clk), .Q(Aout[3]) );
  DFFTRX1 \Aout_reg[2]  ( .D(A[2]), .RN(rst_n), .CK(clk), .Q(Aout[2]) );
  DFFTRX1 \Aout_reg[1]  ( .D(A[1]), .RN(rst_n), .CK(clk), .Q(Aout[1]) );
  DFFTRX1 \Aout_reg[0]  ( .D(A[0]), .RN(rst_n), .CK(clk), .Q(Aout[0]) );
  AOI221XL U3 ( .A0(n63), .A1(n62), .B0(n6), .B1(state[1]), .C0(n2), .Y(n64)
         );
  CLKINVX1 U4 ( .A(n58), .Y(n4) );
  CLKINVX1 U5 ( .A(n65), .Y(n7) );
  AO22X1 U6 ( .A0(N71), .A1(n4), .B0(N79), .B1(n3), .Y(N20) );
  AO22X1 U8 ( .A0(N70), .A1(n4), .B0(N78), .B1(n3), .Y(N19) );
  AO22X1 U9 ( .A0(N69), .A1(n4), .B0(N77), .B1(n3), .Y(N18) );
  AO22X1 U10 ( .A0(N66), .A1(n4), .B0(N74), .B1(n3), .Y(N15) );
  AO22X1 U11 ( .A0(N68), .A1(n4), .B0(N76), .B1(n3), .Y(N17) );
  AO22X1 U12 ( .A0(N67), .A1(n4), .B0(N75), .B1(n3), .Y(N16) );
  AO22X1 U13 ( .A0(N65), .A1(n4), .B0(N73), .B1(n3), .Y(N14) );
  NAND2X1 U14 ( .A(rst_n), .B(n62), .Y(n65) );
  NAND2X1 U15 ( .A(n60), .B(n7), .Y(n58) );
  CLKINVX1 U16 ( .A(n57), .Y(n3) );
  CLKINVX1 U17 ( .A(n62), .Y(n6) );
  NOR2X1 U18 ( .A(n65), .B(n63), .Y(N9) );
  AO22X1 U19 ( .A0(N72), .A1(n4), .B0(N80), .B1(n3), .Y(N21) );
  NOR2BX1 U20 ( .AN(state[1]), .B(state[0]), .Y(n62) );
  OAI21XL U21 ( .A0(n60), .A1(n65), .B0(n59), .Y(n61) );
  OAI211X1 U22 ( .A0(state[0]), .A1(start), .B0(n6), .C0(rst_n), .Y(n59) );
  NAND4BX1 U23 ( .AN(triggerCount[0]), .B(triggerCount[7]), .C(n55), .D(n54), 
        .Y(n63) );
  NOR2X1 U24 ( .A(triggerCount[2]), .B(triggerCount[1]), .Y(n55) );
  NOR4X1 U25 ( .A(triggerCount[6]), .B(triggerCount[5]), .C(triggerCount[4]), 
        .D(triggerCount[3]), .Y(n54) );
  NOR2BX1 U26 ( .AN(n63), .B(n68), .Y(n60) );
  NOR3X1 U27 ( .A(n65), .B(n64), .C(n68), .Y(n66) );
  NAND3X1 U28 ( .A(n63), .B(n68), .C(n7), .Y(n57) );
  AO21X1 U29 ( .A0(n68), .A1(n7), .B0(n64), .Y(n67) );
  OAI21XL U30 ( .A0(count[0]), .A1(n57), .B0(n58), .Y(N11) );
  AO22X1 U31 ( .A0(n61), .A1(triggerCount[7]), .B0(N99), .B1(n4), .Y(n9) );
  AO22X1 U32 ( .A0(n61), .A1(triggerCount[0]), .B0(N92), .B1(n4), .Y(n39) );
  AO22X1 U33 ( .A0(Cout[1]), .A1(n67), .B0(c[1]), .B1(n66), .Y(n47) );
  AO22X1 U34 ( .A0(Cout[2]), .A1(n67), .B0(c[2]), .B1(n66), .Y(n48) );
  AO22X1 U35 ( .A0(Cout[3]), .A1(n67), .B0(c[3]), .B1(n66), .Y(n49) );
  AO22X1 U36 ( .A0(Cout[4]), .A1(n67), .B0(c[4]), .B1(n66), .Y(n50) );
  AO22X1 U37 ( .A0(Cout[5]), .A1(n67), .B0(c[5]), .B1(n66), .Y(n51) );
  AO22X1 U38 ( .A0(Cout[6]), .A1(n67), .B0(c[6]), .B1(n66), .Y(n52) );
  AO22X1 U39 ( .A0(Cout[7]), .A1(n67), .B0(c[7]), .B1(n66), .Y(n53) );
  AO22X1 U40 ( .A0(Cout[0]), .A1(n67), .B0(c[0]), .B1(n66), .Y(n46) );
  AO22X1 U41 ( .A0(n61), .A1(triggerCount[6]), .B0(N98), .B1(n4), .Y(n45) );
  AO22X1 U42 ( .A0(n61), .A1(triggerCount[5]), .B0(N97), .B1(n4), .Y(n44) );
  AO22X1 U43 ( .A0(n61), .A1(triggerCount[4]), .B0(N96), .B1(n4), .Y(n43) );
  AO22X1 U44 ( .A0(n61), .A1(triggerCount[3]), .B0(N95), .B1(n4), .Y(n42) );
  AO22X1 U45 ( .A0(n61), .A1(triggerCount[2]), .B0(N94), .B1(n4), .Y(n41) );
  AO22X1 U46 ( .A0(n61), .A1(triggerCount[1]), .B0(N93), .B1(n4), .Y(n40) );
  AND3X2 U47 ( .A(count[1]), .B(n3), .C(count[0]), .Y(N13) );
  NOR2X1 U48 ( .A(n56), .B(n57), .Y(N12) );
  XNOR2X1 U49 ( .A(count[0]), .B(count[1]), .Y(n56) );
  OAI31XL U50 ( .A0(n69), .A1(state[0]), .A2(n2), .B0(n65), .Y(N10) );
  CLKINVX1 U51 ( .A(rst_n), .Y(n2) );
endmodule


module PE_5_DW01_inc_0 ( A, SUM );
  input [7:0] A;
  output [7:0] SUM;

  wire   [7:2] carry;

  ADDHXL U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHXL U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  ADDHXL U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHXL U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHXL U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHXL U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  CLKINVX1 U1 ( .A(A[0]), .Y(SUM[0]) );
  XOR2X1 U2 ( .A(carry[7]), .B(A[7]), .Y(SUM[7]) );
endmodule


module PE_5_DW01_add_0 ( A, B, CI, SUM, CO );
  input [7:0] A;
  input [7:0] B;
  output [7:0] SUM;
  input CI;
  output CO;
  wire   n1, n2;
  wire   [7:1] carry;

  ADDFXL U1_1 ( .A(A[1]), .B(B[1]), .CI(carry[1]), .CO(carry[2]), .S(SUM[1])
         );
  ADDFXL U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  ADDFXL U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFXL U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  ADDFXL U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  ADDFXL U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  XOR3X1 U1_7 ( .A(A[7]), .B(B[7]), .C(carry[7]), .Y(SUM[7]) );
  XNOR2X1 U1 ( .A(B[0]), .B(n1), .Y(SUM[0]) );
  NOR2X1 U2 ( .A(n1), .B(n2), .Y(carry[1]) );
  CLKINVX1 U3 ( .A(B[0]), .Y(n2) );
  CLKINVX1 U4 ( .A(A[0]), .Y(n1) );
endmodule


module PE_5_DW_mult_uns_0 ( a, b, product );
  input [7:0] a;
  input [7:0] b;
  output [15:0] product;
  wire   n2, n3, n4, n5, n6, n7, n18, n19, n20, n21, n22, n23, n24, n25, n26,
         n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40,
         n41, n42, n43, n46, n48, n49, n51, n52, n53, n55, n56, n57, n58, n60,
         n61, n62, n63, n64, n66, n67, n68, n69, n70, n71, n73, n74, n75, n76,
         n77, n78, n123, n124, n125, n126, n127, n128, n129, n130, n131, n132,
         n133, n134, n135, n136, n137, n138, n139, n140, n141, n142, n143,
         n144, n145, n146, n147, n148, n149, n150, n151, n152, n153, n154;

  ADDFXL U3 ( .A(n20), .B(n27), .CI(n3), .CO(n2), .S(product[6]) );
  ADDFXL U4 ( .A(n28), .B(n34), .CI(n4), .CO(n3), .S(product[5]) );
  ADDFXL U5 ( .A(n35), .B(n38), .CI(n5), .CO(n4), .S(product[4]) );
  ADDFXL U6 ( .A(n39), .B(n41), .CI(n6), .CO(n5), .S(product[3]) );
  ADDFXL U7 ( .A(n7), .B(n64), .CI(n43), .CO(n6), .S(product[2]) );
  ADDHXL U8 ( .A(n71), .B(n78), .CO(n7), .S(product[1]) );
  CMPR42X1 U19 ( .A(n60), .B(n55), .C(n26), .D(n29), .ICI(n23), .S(n20), .ICO(
        n18), .CO(n19) );
  CMPR42X1 U20 ( .A(n73), .B(n51), .C(n66), .D(n31), .ICI(n25), .S(n23), .ICO(
        n21), .CO(n22) );
  ADDHXL U21 ( .A(n48), .B(n46), .CO(n24), .S(n25) );
  CMPR42X1 U22 ( .A(n67), .B(n61), .C(n33), .D(n32), .ICI(n30), .S(n28), .ICO(
        n26), .CO(n27) );
  ADDFXL U23 ( .A(n56), .B(n74), .CI(n36), .CO(n29), .S(n30) );
  ADDHXL U24 ( .A(n52), .B(n49), .CO(n31), .S(n32) );
  CMPR42X1 U25 ( .A(n75), .B(n62), .C(n68), .D(n40), .ICI(n37), .S(n35), .ICO(
        n33), .CO(n34) );
  ADDHXL U26 ( .A(n57), .B(n53), .CO(n36), .S(n37) );
  ADDFXL U27 ( .A(n69), .B(n76), .CI(n42), .CO(n38), .S(n39) );
  ADDHXL U28 ( .A(n63), .B(n58), .CO(n40), .S(n41) );
  ADDHXL U29 ( .A(n77), .B(n70), .CO(n42), .S(n43) );
  CLKINVX1 U84 ( .A(a[0]), .Y(n134) );
  CLKINVX1 U85 ( .A(b[0]), .Y(n128) );
  CLKINVX1 U86 ( .A(b[1]), .Y(n127) );
  CLKINVX1 U87 ( .A(a[1]), .Y(n133) );
  CLKINVX1 U88 ( .A(b[2]), .Y(n126) );
  CLKINVX1 U89 ( .A(a[2]), .Y(n132) );
  CLKINVX1 U90 ( .A(a[3]), .Y(n131) );
  CLKINVX1 U91 ( .A(b[3]), .Y(n125) );
  CLKINVX1 U92 ( .A(b[4]), .Y(n124) );
  CLKINVX1 U93 ( .A(a[4]), .Y(n130) );
  CLKINVX1 U94 ( .A(a[5]), .Y(n129) );
  CLKINVX1 U95 ( .A(b[5]), .Y(n123) );
  XOR2X1 U96 ( .A(n135), .B(n136), .Y(product[7]) );
  XOR2X1 U97 ( .A(n137), .B(n138), .Y(n136) );
  XOR2X1 U98 ( .A(n18), .B(n139), .Y(n138) );
  NOR2X1 U99 ( .A(n131), .B(n124), .Y(n139) );
  XOR2X1 U100 ( .A(n140), .B(n141), .Y(n137) );
  XOR2X1 U101 ( .A(n142), .B(n143), .Y(n141) );
  XOR2X1 U102 ( .A(n144), .B(n145), .Y(n143) );
  NAND2X1 U103 ( .A(b[5]), .B(a[2]), .Y(n145) );
  NAND2X1 U104 ( .A(b[6]), .B(a[1]), .Y(n144) );
  XOR2X1 U105 ( .A(n146), .B(n147), .Y(n142) );
  NAND2X1 U106 ( .A(b[3]), .B(a[4]), .Y(n147) );
  NAND2X1 U107 ( .A(b[1]), .B(a[6]), .Y(n146) );
  XOR2X1 U108 ( .A(n148), .B(n149), .Y(n140) );
  XOR2X1 U109 ( .A(n150), .B(n151), .Y(n149) );
  NAND2X1 U110 ( .A(b[0]), .B(a[7]), .Y(n151) );
  NAND2X1 U111 ( .A(b[2]), .B(a[5]), .Y(n150) );
  XNOR2X1 U112 ( .A(n24), .B(n152), .Y(n148) );
  NAND2X1 U113 ( .A(b[7]), .B(a[0]), .Y(n152) );
  XOR2X1 U114 ( .A(n153), .B(n154), .Y(n135) );
  XNOR2X1 U115 ( .A(n2), .B(n19), .Y(n154) );
  XNOR2X1 U116 ( .A(n22), .B(n21), .Y(n153) );
  NOR2X1 U117 ( .A(n134), .B(n128), .Y(product[0]) );
  NOR2X1 U118 ( .A(n134), .B(n127), .Y(n78) );
  NOR2X1 U119 ( .A(n134), .B(n126), .Y(n77) );
  NOR2X1 U120 ( .A(n134), .B(n125), .Y(n76) );
  NOR2X1 U121 ( .A(n134), .B(n124), .Y(n75) );
  NOR2X1 U122 ( .A(n134), .B(n123), .Y(n74) );
  AND2X1 U123 ( .A(b[6]), .B(a[0]), .Y(n73) );
  NOR2X1 U124 ( .A(n128), .B(n133), .Y(n71) );
  NOR2X1 U125 ( .A(n127), .B(n133), .Y(n70) );
  NOR2X1 U126 ( .A(n126), .B(n133), .Y(n69) );
  NOR2X1 U127 ( .A(n125), .B(n133), .Y(n68) );
  NOR2X1 U128 ( .A(n133), .B(n124), .Y(n67) );
  NOR2X1 U129 ( .A(n133), .B(n123), .Y(n66) );
  NOR2X1 U130 ( .A(n128), .B(n132), .Y(n64) );
  NOR2X1 U131 ( .A(n127), .B(n132), .Y(n63) );
  NOR2X1 U132 ( .A(n126), .B(n132), .Y(n62) );
  NOR2X1 U133 ( .A(n125), .B(n132), .Y(n61) );
  NOR2X1 U134 ( .A(n132), .B(n124), .Y(n60) );
  NOR2X1 U135 ( .A(n128), .B(n131), .Y(n58) );
  NOR2X1 U136 ( .A(n127), .B(n131), .Y(n57) );
  NOR2X1 U137 ( .A(n126), .B(n131), .Y(n56) );
  NOR2X1 U138 ( .A(n125), .B(n131), .Y(n55) );
  NOR2X1 U139 ( .A(n128), .B(n130), .Y(n53) );
  NOR2X1 U140 ( .A(n127), .B(n130), .Y(n52) );
  NOR2X1 U141 ( .A(n126), .B(n130), .Y(n51) );
  NOR2X1 U142 ( .A(n129), .B(n128), .Y(n49) );
  NOR2X1 U143 ( .A(n129), .B(n127), .Y(n48) );
  AND2X1 U144 ( .A(a[6]), .B(b[0]), .Y(n46) );
endmodule


module PE_5 ( clk, rst_n, START, A, B, Aout, Bout, Cout, DONE );
  input [7:0] A;
  input [7:0] B;
  output [7:0] Aout;
  output [7:0] Bout;
  output [7:0] Cout;
  input clk, rst_n, START;
  output DONE;
  wire   start, N9, N10, N11, N12, N13, N14, N15, N16, N17, N18, N19, N20, N21,
         N65, N66, N67, N68, N69, N70, N71, N72, N73, N74, N75, N76, N77, N78,
         N79, N80, N92, N93, N94, N95, N96, N97, N98, N99, n2, n3, n4, n6, n7,
         n9, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51,
         n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65,
         n66, n67, n68, n69;
  wire   [1:0] state;
  wire   [2:0] count;
  wire   [7:0] c;
  wire   [7:0] triggerCount;
  wire   [7:0] a;
  wire   [7:0] b;
  wire   SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, 
        SYNOPSYS_UNCONNECTED__4, SYNOPSYS_UNCONNECTED__5, 
        SYNOPSYS_UNCONNECTED__6, SYNOPSYS_UNCONNECTED__7;

  PE_5_DW01_inc_0 add_98 ( .A(triggerCount), .SUM({N99, N98, N97, N96, N95, 
        N94, N93, N92}) );
  PE_5_DW01_add_0 add_88 ( .A(c), .B({N72, N71, N70, N69, N68, N67, N66, N65}), 
        .CI(1'b0), .SUM({N80, N79, N78, N77, N76, N75, N74, N73}) );
  PE_5_DW_mult_uns_0 r319 ( .a(a), .b(b), .product({SYNOPSYS_UNCONNECTED__0, 
        SYNOPSYS_UNCONNECTED__1, SYNOPSYS_UNCONNECTED__2, 
        SYNOPSYS_UNCONNECTED__3, SYNOPSYS_UNCONNECTED__4, 
        SYNOPSYS_UNCONNECTED__5, SYNOPSYS_UNCONNECTED__6, 
        SYNOPSYS_UNCONNECTED__7, N72, N71, N70, N69, N68, N67, N66, N65}) );
  DFFQX1 \Cout_reg[7]  ( .D(n53), .CK(clk), .Q(Cout[7]) );
  DFFQX1 \Cout_reg[6]  ( .D(n52), .CK(clk), .Q(Cout[6]) );
  DFFQX1 \Cout_reg[5]  ( .D(n51), .CK(clk), .Q(Cout[5]) );
  DFFQX1 \Cout_reg[4]  ( .D(n50), .CK(clk), .Q(Cout[4]) );
  DFFQX1 \Cout_reg[3]  ( .D(n49), .CK(clk), .Q(Cout[3]) );
  DFFQX1 \Cout_reg[2]  ( .D(n48), .CK(clk), .Q(Cout[2]) );
  DFFQX1 \Cout_reg[1]  ( .D(n47), .CK(clk), .Q(Cout[1]) );
  DFFQX1 \Cout_reg[0]  ( .D(n46), .CK(clk), .Q(Cout[0]) );
  DFFQX1 \c_reg[7]  ( .D(N21), .CK(clk), .Q(c[7]) );
  DFFQX1 \count_reg[1]  ( .D(N12), .CK(clk), .Q(count[1]) );
  DFFQX1 \count_reg[0]  ( .D(N11), .CK(clk), .Q(count[0]) );
  DFFX1 \count_reg[2]  ( .D(N13), .CK(clk), .QN(n68) );
  DFFTRX1 start_reg ( .D(START), .RN(rst_n), .CK(clk), .Q(start), .QN(n69) );
  DFFQX1 \state_reg[1]  ( .D(N10), .CK(clk), .Q(state[1]) );
  DFFQX1 \state_reg[0]  ( .D(N9), .CK(clk), .Q(state[0]) );
  DFFQX1 \c_reg[1]  ( .D(N15), .CK(clk), .Q(c[1]) );
  DFFQX1 \c_reg[2]  ( .D(N16), .CK(clk), .Q(c[2]) );
  DFFQX1 \c_reg[3]  ( .D(N17), .CK(clk), .Q(c[3]) );
  DFFQX1 \c_reg[4]  ( .D(N18), .CK(clk), .Q(c[4]) );
  DFFQX1 \c_reg[5]  ( .D(N19), .CK(clk), .Q(c[5]) );
  DFFQX1 \c_reg[6]  ( .D(N20), .CK(clk), .Q(c[6]) );
  DFFQX1 \triggerCount_reg[7]  ( .D(n9), .CK(clk), .Q(triggerCount[7]) );
  DFFQX1 \c_reg[0]  ( .D(N14), .CK(clk), .Q(c[0]) );
  DFFQX1 \triggerCount_reg[0]  ( .D(n39), .CK(clk), .Q(triggerCount[0]) );
  DFFQX1 \triggerCount_reg[1]  ( .D(n40), .CK(clk), .Q(triggerCount[1]) );
  DFFQX1 \triggerCount_reg[2]  ( .D(n41), .CK(clk), .Q(triggerCount[2]) );
  DFFQX1 \triggerCount_reg[5]  ( .D(n44), .CK(clk), .Q(triggerCount[5]) );
  DFFQX1 \triggerCount_reg[6]  ( .D(n45), .CK(clk), .Q(triggerCount[6]) );
  DFFQX1 \triggerCount_reg[4]  ( .D(n43), .CK(clk), .Q(triggerCount[4]) );
  DFFQX1 \triggerCount_reg[3]  ( .D(n42), .CK(clk), .Q(triggerCount[3]) );
  DFFTRX1 \a_reg[7]  ( .D(A[7]), .RN(rst_n), .CK(clk), .Q(a[7]) );
  DFFTRX1 \b_reg[7]  ( .D(B[7]), .RN(rst_n), .CK(clk), .Q(b[7]) );
  DFFTRX1 \a_reg[6]  ( .D(A[6]), .RN(rst_n), .CK(clk), .Q(a[6]) );
  DFFTRX1 \b_reg[6]  ( .D(B[6]), .RN(rst_n), .CK(clk), .Q(b[6]) );
  DFFTRX1 \a_reg[5]  ( .D(A[5]), .RN(rst_n), .CK(clk), .Q(a[5]) );
  DFFTRX1 \a_reg[4]  ( .D(A[4]), .RN(rst_n), .CK(clk), .Q(a[4]) );
  DFFTRX1 \b_reg[5]  ( .D(B[5]), .RN(rst_n), .CK(clk), .Q(b[5]) );
  DFFTRX1 \b_reg[4]  ( .D(B[4]), .RN(rst_n), .CK(clk), .Q(b[4]) );
  DFFTRX1 \a_reg[3]  ( .D(A[3]), .RN(rst_n), .CK(clk), .Q(a[3]) );
  DFFTRX1 \a_reg[2]  ( .D(A[2]), .RN(rst_n), .CK(clk), .Q(a[2]) );
  DFFTRX1 \a_reg[1]  ( .D(A[1]), .RN(rst_n), .CK(clk), .Q(a[1]) );
  DFFTRX1 \b_reg[3]  ( .D(B[3]), .RN(rst_n), .CK(clk), .Q(b[3]) );
  DFFTRX1 \b_reg[2]  ( .D(B[2]), .RN(rst_n), .CK(clk), .Q(b[2]) );
  DFFTRX1 \b_reg[1]  ( .D(B[1]), .RN(rst_n), .CK(clk), .Q(b[1]) );
  DFFTRX1 \a_reg[0]  ( .D(A[0]), .RN(rst_n), .CK(clk), .Q(a[0]) );
  DFFTRX1 \b_reg[0]  ( .D(B[0]), .RN(rst_n), .CK(clk), .Q(b[0]) );
  DFFTRX1 DONE_reg ( .D(n60), .RN(n7), .CK(clk), .Q(DONE) );
  DFFTRX1 \Bout_reg[7]  ( .D(B[7]), .RN(rst_n), .CK(clk), .Q(Bout[7]) );
  DFFTRX1 \Bout_reg[6]  ( .D(B[6]), .RN(rst_n), .CK(clk), .Q(Bout[6]) );
  DFFTRX1 \Bout_reg[5]  ( .D(B[5]), .RN(rst_n), .CK(clk), .Q(Bout[5]) );
  DFFTRX1 \Bout_reg[4]  ( .D(B[4]), .RN(rst_n), .CK(clk), .Q(Bout[4]) );
  DFFTRX1 \Bout_reg[3]  ( .D(B[3]), .RN(rst_n), .CK(clk), .Q(Bout[3]) );
  DFFTRX1 \Bout_reg[2]  ( .D(B[2]), .RN(rst_n), .CK(clk), .Q(Bout[2]) );
  DFFTRX1 \Bout_reg[1]  ( .D(B[1]), .RN(rst_n), .CK(clk), .Q(Bout[1]) );
  DFFTRX1 \Bout_reg[0]  ( .D(B[0]), .RN(rst_n), .CK(clk), .Q(Bout[0]) );
  DFFTRX1 \Aout_reg[7]  ( .D(A[7]), .RN(rst_n), .CK(clk), .Q(Aout[7]) );
  DFFTRX1 \Aout_reg[6]  ( .D(A[6]), .RN(rst_n), .CK(clk), .Q(Aout[6]) );
  DFFTRX1 \Aout_reg[5]  ( .D(A[5]), .RN(rst_n), .CK(clk), .Q(Aout[5]) );
  DFFTRX1 \Aout_reg[4]  ( .D(A[4]), .RN(rst_n), .CK(clk), .Q(Aout[4]) );
  DFFTRX1 \Aout_reg[3]  ( .D(A[3]), .RN(rst_n), .CK(clk), .Q(Aout[3]) );
  DFFTRX1 \Aout_reg[2]  ( .D(A[2]), .RN(rst_n), .CK(clk), .Q(Aout[2]) );
  DFFTRX1 \Aout_reg[1]  ( .D(A[1]), .RN(rst_n), .CK(clk), .Q(Aout[1]) );
  DFFTRX1 \Aout_reg[0]  ( .D(A[0]), .RN(rst_n), .CK(clk), .Q(Aout[0]) );
  AOI221XL U3 ( .A0(n63), .A1(n62), .B0(n6), .B1(state[1]), .C0(n2), .Y(n64)
         );
  CLKINVX1 U4 ( .A(n58), .Y(n4) );
  CLKINVX1 U5 ( .A(n65), .Y(n7) );
  AO22X1 U6 ( .A0(N71), .A1(n4), .B0(N79), .B1(n3), .Y(N20) );
  AO22X1 U8 ( .A0(N70), .A1(n4), .B0(N78), .B1(n3), .Y(N19) );
  AO22X1 U9 ( .A0(N69), .A1(n4), .B0(N77), .B1(n3), .Y(N18) );
  AO22X1 U10 ( .A0(N66), .A1(n4), .B0(N74), .B1(n3), .Y(N15) );
  AO22X1 U11 ( .A0(N68), .A1(n4), .B0(N76), .B1(n3), .Y(N17) );
  AO22X1 U12 ( .A0(N67), .A1(n4), .B0(N75), .B1(n3), .Y(N16) );
  AO22X1 U13 ( .A0(N65), .A1(n4), .B0(N73), .B1(n3), .Y(N14) );
  NAND2X1 U14 ( .A(rst_n), .B(n62), .Y(n65) );
  NAND2X1 U15 ( .A(n60), .B(n7), .Y(n58) );
  CLKINVX1 U16 ( .A(n57), .Y(n3) );
  CLKINVX1 U17 ( .A(n62), .Y(n6) );
  NOR2X1 U18 ( .A(n65), .B(n63), .Y(N9) );
  AO22X1 U19 ( .A0(N72), .A1(n4), .B0(N80), .B1(n3), .Y(N21) );
  NOR2BX1 U20 ( .AN(state[1]), .B(state[0]), .Y(n62) );
  OAI21XL U21 ( .A0(n60), .A1(n65), .B0(n59), .Y(n61) );
  OAI211X1 U22 ( .A0(state[0]), .A1(start), .B0(n6), .C0(rst_n), .Y(n59) );
  NAND4BX1 U23 ( .AN(triggerCount[0]), .B(triggerCount[7]), .C(n55), .D(n54), 
        .Y(n63) );
  NOR2X1 U24 ( .A(triggerCount[2]), .B(triggerCount[1]), .Y(n55) );
  NOR4X1 U25 ( .A(triggerCount[6]), .B(triggerCount[5]), .C(triggerCount[4]), 
        .D(triggerCount[3]), .Y(n54) );
  NOR2BX1 U26 ( .AN(n63), .B(n68), .Y(n60) );
  NOR3X1 U27 ( .A(n65), .B(n64), .C(n68), .Y(n66) );
  NAND3X1 U28 ( .A(n63), .B(n68), .C(n7), .Y(n57) );
  AO21X1 U29 ( .A0(n68), .A1(n7), .B0(n64), .Y(n67) );
  OAI21XL U30 ( .A0(count[0]), .A1(n57), .B0(n58), .Y(N11) );
  AO22X1 U31 ( .A0(n61), .A1(triggerCount[7]), .B0(N99), .B1(n4), .Y(n9) );
  AO22X1 U32 ( .A0(n61), .A1(triggerCount[0]), .B0(N92), .B1(n4), .Y(n39) );
  AO22X1 U33 ( .A0(Cout[1]), .A1(n67), .B0(c[1]), .B1(n66), .Y(n47) );
  AO22X1 U34 ( .A0(Cout[2]), .A1(n67), .B0(c[2]), .B1(n66), .Y(n48) );
  AO22X1 U35 ( .A0(Cout[3]), .A1(n67), .B0(c[3]), .B1(n66), .Y(n49) );
  AO22X1 U36 ( .A0(Cout[4]), .A1(n67), .B0(c[4]), .B1(n66), .Y(n50) );
  AO22X1 U37 ( .A0(Cout[5]), .A1(n67), .B0(c[5]), .B1(n66), .Y(n51) );
  AO22X1 U38 ( .A0(Cout[6]), .A1(n67), .B0(c[6]), .B1(n66), .Y(n52) );
  AO22X1 U39 ( .A0(Cout[7]), .A1(n67), .B0(c[7]), .B1(n66), .Y(n53) );
  AO22X1 U40 ( .A0(Cout[0]), .A1(n67), .B0(c[0]), .B1(n66), .Y(n46) );
  AO22X1 U41 ( .A0(n61), .A1(triggerCount[6]), .B0(N98), .B1(n4), .Y(n45) );
  AO22X1 U42 ( .A0(n61), .A1(triggerCount[5]), .B0(N97), .B1(n4), .Y(n44) );
  AO22X1 U43 ( .A0(n61), .A1(triggerCount[4]), .B0(N96), .B1(n4), .Y(n43) );
  AO22X1 U44 ( .A0(n61), .A1(triggerCount[3]), .B0(N95), .B1(n4), .Y(n42) );
  AO22X1 U45 ( .A0(n61), .A1(triggerCount[2]), .B0(N94), .B1(n4), .Y(n41) );
  AO22X1 U46 ( .A0(n61), .A1(triggerCount[1]), .B0(N93), .B1(n4), .Y(n40) );
  AND3X2 U47 ( .A(count[1]), .B(n3), .C(count[0]), .Y(N13) );
  NOR2X1 U48 ( .A(n56), .B(n57), .Y(N12) );
  XNOR2X1 U49 ( .A(count[0]), .B(count[1]), .Y(n56) );
  OAI31XL U50 ( .A0(n69), .A1(state[0]), .A2(n2), .B0(n65), .Y(N10) );
  CLKINVX1 U51 ( .A(rst_n), .Y(n2) );
endmodule


module PE_4_DW01_inc_0 ( A, SUM );
  input [7:0] A;
  output [7:0] SUM;

  wire   [7:2] carry;

  ADDHXL U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHXL U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  ADDHXL U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHXL U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHXL U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHXL U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  CLKINVX1 U1 ( .A(A[0]), .Y(SUM[0]) );
  XOR2X1 U2 ( .A(carry[7]), .B(A[7]), .Y(SUM[7]) );
endmodule


module PE_4_DW01_add_0 ( A, B, CI, SUM, CO );
  input [7:0] A;
  input [7:0] B;
  output [7:0] SUM;
  input CI;
  output CO;
  wire   n1, n2;
  wire   [7:1] carry;

  ADDFXL U1_1 ( .A(A[1]), .B(B[1]), .CI(carry[1]), .CO(carry[2]), .S(SUM[1])
         );
  ADDFXL U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  ADDFXL U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFXL U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  ADDFXL U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  ADDFXL U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  XOR3X1 U1_7 ( .A(A[7]), .B(B[7]), .C(carry[7]), .Y(SUM[7]) );
  XNOR2X1 U1 ( .A(B[0]), .B(n1), .Y(SUM[0]) );
  NOR2X1 U2 ( .A(n1), .B(n2), .Y(carry[1]) );
  CLKINVX1 U3 ( .A(B[0]), .Y(n2) );
  CLKINVX1 U4 ( .A(A[0]), .Y(n1) );
endmodule


module PE_4_DW_mult_uns_0 ( a, b, product );
  input [7:0] a;
  input [7:0] b;
  output [15:0] product;
  wire   n2, n3, n4, n5, n6, n7, n18, n19, n20, n21, n22, n23, n24, n25, n26,
         n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40,
         n41, n42, n43, n46, n48, n49, n51, n52, n53, n55, n56, n57, n58, n60,
         n61, n62, n63, n64, n66, n67, n68, n69, n70, n71, n73, n74, n75, n76,
         n77, n78, n123, n124, n125, n126, n127, n128, n129, n130, n131, n132,
         n133, n134, n135, n136, n137, n138, n139, n140, n141, n142, n143,
         n144, n145, n146, n147, n148, n149, n150, n151, n152, n153, n154;

  ADDFXL U3 ( .A(n20), .B(n27), .CI(n3), .CO(n2), .S(product[6]) );
  ADDFXL U4 ( .A(n28), .B(n34), .CI(n4), .CO(n3), .S(product[5]) );
  ADDFXL U5 ( .A(n35), .B(n38), .CI(n5), .CO(n4), .S(product[4]) );
  ADDFXL U6 ( .A(n39), .B(n41), .CI(n6), .CO(n5), .S(product[3]) );
  ADDFXL U7 ( .A(n7), .B(n64), .CI(n43), .CO(n6), .S(product[2]) );
  ADDHXL U8 ( .A(n71), .B(n78), .CO(n7), .S(product[1]) );
  CMPR42X1 U19 ( .A(n60), .B(n55), .C(n26), .D(n29), .ICI(n23), .S(n20), .ICO(
        n18), .CO(n19) );
  CMPR42X1 U20 ( .A(n73), .B(n51), .C(n66), .D(n31), .ICI(n25), .S(n23), .ICO(
        n21), .CO(n22) );
  ADDHXL U21 ( .A(n48), .B(n46), .CO(n24), .S(n25) );
  CMPR42X1 U22 ( .A(n67), .B(n61), .C(n33), .D(n32), .ICI(n30), .S(n28), .ICO(
        n26), .CO(n27) );
  ADDFXL U23 ( .A(n56), .B(n74), .CI(n36), .CO(n29), .S(n30) );
  ADDHXL U24 ( .A(n52), .B(n49), .CO(n31), .S(n32) );
  CMPR42X1 U25 ( .A(n75), .B(n62), .C(n68), .D(n40), .ICI(n37), .S(n35), .ICO(
        n33), .CO(n34) );
  ADDHXL U26 ( .A(n57), .B(n53), .CO(n36), .S(n37) );
  ADDFXL U27 ( .A(n69), .B(n76), .CI(n42), .CO(n38), .S(n39) );
  ADDHXL U28 ( .A(n63), .B(n58), .CO(n40), .S(n41) );
  ADDHXL U29 ( .A(n77), .B(n70), .CO(n42), .S(n43) );
  CLKINVX1 U84 ( .A(a[0]), .Y(n134) );
  CLKINVX1 U85 ( .A(b[0]), .Y(n128) );
  CLKINVX1 U86 ( .A(b[1]), .Y(n127) );
  CLKINVX1 U87 ( .A(a[1]), .Y(n133) );
  CLKINVX1 U88 ( .A(b[2]), .Y(n126) );
  CLKINVX1 U89 ( .A(a[2]), .Y(n132) );
  CLKINVX1 U90 ( .A(a[3]), .Y(n131) );
  CLKINVX1 U91 ( .A(b[3]), .Y(n125) );
  CLKINVX1 U92 ( .A(b[4]), .Y(n124) );
  CLKINVX1 U93 ( .A(a[4]), .Y(n130) );
  CLKINVX1 U94 ( .A(a[5]), .Y(n129) );
  CLKINVX1 U95 ( .A(b[5]), .Y(n123) );
  XOR2X1 U96 ( .A(n135), .B(n136), .Y(product[7]) );
  XOR2X1 U97 ( .A(n137), .B(n138), .Y(n136) );
  XOR2X1 U98 ( .A(n18), .B(n139), .Y(n138) );
  NOR2X1 U99 ( .A(n131), .B(n124), .Y(n139) );
  XOR2X1 U100 ( .A(n140), .B(n141), .Y(n137) );
  XOR2X1 U101 ( .A(n142), .B(n143), .Y(n141) );
  XOR2X1 U102 ( .A(n144), .B(n145), .Y(n143) );
  NAND2X1 U103 ( .A(b[5]), .B(a[2]), .Y(n145) );
  NAND2X1 U104 ( .A(b[6]), .B(a[1]), .Y(n144) );
  XOR2X1 U105 ( .A(n146), .B(n147), .Y(n142) );
  NAND2X1 U106 ( .A(b[3]), .B(a[4]), .Y(n147) );
  NAND2X1 U107 ( .A(b[1]), .B(a[6]), .Y(n146) );
  XOR2X1 U108 ( .A(n148), .B(n149), .Y(n140) );
  XOR2X1 U109 ( .A(n150), .B(n151), .Y(n149) );
  NAND2X1 U110 ( .A(b[0]), .B(a[7]), .Y(n151) );
  NAND2X1 U111 ( .A(b[2]), .B(a[5]), .Y(n150) );
  XNOR2X1 U112 ( .A(n24), .B(n152), .Y(n148) );
  NAND2X1 U113 ( .A(b[7]), .B(a[0]), .Y(n152) );
  XOR2X1 U114 ( .A(n153), .B(n154), .Y(n135) );
  XNOR2X1 U115 ( .A(n2), .B(n19), .Y(n154) );
  XNOR2X1 U116 ( .A(n22), .B(n21), .Y(n153) );
  NOR2X1 U117 ( .A(n134), .B(n128), .Y(product[0]) );
  NOR2X1 U118 ( .A(n134), .B(n127), .Y(n78) );
  NOR2X1 U119 ( .A(n134), .B(n126), .Y(n77) );
  NOR2X1 U120 ( .A(n134), .B(n125), .Y(n76) );
  NOR2X1 U121 ( .A(n134), .B(n124), .Y(n75) );
  NOR2X1 U122 ( .A(n134), .B(n123), .Y(n74) );
  AND2X1 U123 ( .A(b[6]), .B(a[0]), .Y(n73) );
  NOR2X1 U124 ( .A(n128), .B(n133), .Y(n71) );
  NOR2X1 U125 ( .A(n127), .B(n133), .Y(n70) );
  NOR2X1 U126 ( .A(n126), .B(n133), .Y(n69) );
  NOR2X1 U127 ( .A(n125), .B(n133), .Y(n68) );
  NOR2X1 U128 ( .A(n133), .B(n124), .Y(n67) );
  NOR2X1 U129 ( .A(n133), .B(n123), .Y(n66) );
  NOR2X1 U130 ( .A(n128), .B(n132), .Y(n64) );
  NOR2X1 U131 ( .A(n127), .B(n132), .Y(n63) );
  NOR2X1 U132 ( .A(n126), .B(n132), .Y(n62) );
  NOR2X1 U133 ( .A(n125), .B(n132), .Y(n61) );
  NOR2X1 U134 ( .A(n132), .B(n124), .Y(n60) );
  NOR2X1 U135 ( .A(n128), .B(n131), .Y(n58) );
  NOR2X1 U136 ( .A(n127), .B(n131), .Y(n57) );
  NOR2X1 U137 ( .A(n126), .B(n131), .Y(n56) );
  NOR2X1 U138 ( .A(n125), .B(n131), .Y(n55) );
  NOR2X1 U139 ( .A(n128), .B(n130), .Y(n53) );
  NOR2X1 U140 ( .A(n127), .B(n130), .Y(n52) );
  NOR2X1 U141 ( .A(n126), .B(n130), .Y(n51) );
  NOR2X1 U142 ( .A(n129), .B(n128), .Y(n49) );
  NOR2X1 U143 ( .A(n129), .B(n127), .Y(n48) );
  AND2X1 U144 ( .A(a[6]), .B(b[0]), .Y(n46) );
endmodule


module PE_4 ( clk, rst_n, START, A, B, Aout, Bout, Cout, DONE );
  input [7:0] A;
  input [7:0] B;
  output [7:0] Aout;
  output [7:0] Bout;
  output [7:0] Cout;
  input clk, rst_n, START;
  output DONE;
  wire   start, N9, N10, N11, N12, N13, N14, N15, N16, N17, N18, N19, N20, N21,
         N65, N66, N67, N68, N69, N70, N71, N72, N73, N74, N75, N76, N77, N78,
         N79, N80, N92, N93, N94, N95, N96, N97, N98, N99, n2, n3, n4, n6, n7,
         n9, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51,
         n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65,
         n66, n67, n68, n69;
  wire   [1:0] state;
  wire   [2:0] count;
  wire   [7:0] c;
  wire   [7:0] triggerCount;
  wire   [7:0] a;
  wire   [7:0] b;
  wire   SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, 
        SYNOPSYS_UNCONNECTED__4, SYNOPSYS_UNCONNECTED__5, 
        SYNOPSYS_UNCONNECTED__6, SYNOPSYS_UNCONNECTED__7;

  PE_4_DW01_inc_0 add_98 ( .A(triggerCount), .SUM({N99, N98, N97, N96, N95, 
        N94, N93, N92}) );
  PE_4_DW01_add_0 add_88 ( .A(c), .B({N72, N71, N70, N69, N68, N67, N66, N65}), 
        .CI(1'b0), .SUM({N80, N79, N78, N77, N76, N75, N74, N73}) );
  PE_4_DW_mult_uns_0 r319 ( .a(a), .b(b), .product({SYNOPSYS_UNCONNECTED__0, 
        SYNOPSYS_UNCONNECTED__1, SYNOPSYS_UNCONNECTED__2, 
        SYNOPSYS_UNCONNECTED__3, SYNOPSYS_UNCONNECTED__4, 
        SYNOPSYS_UNCONNECTED__5, SYNOPSYS_UNCONNECTED__6, 
        SYNOPSYS_UNCONNECTED__7, N72, N71, N70, N69, N68, N67, N66, N65}) );
  DFFQX1 \Cout_reg[7]  ( .D(n53), .CK(clk), .Q(Cout[7]) );
  DFFQX1 \Cout_reg[6]  ( .D(n52), .CK(clk), .Q(Cout[6]) );
  DFFQX1 \Cout_reg[5]  ( .D(n51), .CK(clk), .Q(Cout[5]) );
  DFFQX1 \Cout_reg[4]  ( .D(n50), .CK(clk), .Q(Cout[4]) );
  DFFQX1 \Cout_reg[3]  ( .D(n49), .CK(clk), .Q(Cout[3]) );
  DFFQX1 \Cout_reg[2]  ( .D(n48), .CK(clk), .Q(Cout[2]) );
  DFFQX1 \Cout_reg[1]  ( .D(n47), .CK(clk), .Q(Cout[1]) );
  DFFQX1 \Cout_reg[0]  ( .D(n46), .CK(clk), .Q(Cout[0]) );
  DFFQX1 \c_reg[7]  ( .D(N21), .CK(clk), .Q(c[7]) );
  DFFQX1 \count_reg[1]  ( .D(N12), .CK(clk), .Q(count[1]) );
  DFFQX1 \count_reg[0]  ( .D(N11), .CK(clk), .Q(count[0]) );
  DFFX1 \count_reg[2]  ( .D(N13), .CK(clk), .QN(n68) );
  DFFTRX1 start_reg ( .D(START), .RN(rst_n), .CK(clk), .Q(start), .QN(n69) );
  DFFQX1 \state_reg[1]  ( .D(N10), .CK(clk), .Q(state[1]) );
  DFFQX1 \state_reg[0]  ( .D(N9), .CK(clk), .Q(state[0]) );
  DFFQX1 \c_reg[1]  ( .D(N15), .CK(clk), .Q(c[1]) );
  DFFQX1 \c_reg[2]  ( .D(N16), .CK(clk), .Q(c[2]) );
  DFFQX1 \c_reg[3]  ( .D(N17), .CK(clk), .Q(c[3]) );
  DFFQX1 \c_reg[4]  ( .D(N18), .CK(clk), .Q(c[4]) );
  DFFQX1 \c_reg[5]  ( .D(N19), .CK(clk), .Q(c[5]) );
  DFFQX1 \c_reg[6]  ( .D(N20), .CK(clk), .Q(c[6]) );
  DFFQX1 \triggerCount_reg[7]  ( .D(n9), .CK(clk), .Q(triggerCount[7]) );
  DFFQX1 \c_reg[0]  ( .D(N14), .CK(clk), .Q(c[0]) );
  DFFQX1 \triggerCount_reg[0]  ( .D(n39), .CK(clk), .Q(triggerCount[0]) );
  DFFQX1 \triggerCount_reg[1]  ( .D(n40), .CK(clk), .Q(triggerCount[1]) );
  DFFQX1 \triggerCount_reg[2]  ( .D(n41), .CK(clk), .Q(triggerCount[2]) );
  DFFQX1 \triggerCount_reg[5]  ( .D(n44), .CK(clk), .Q(triggerCount[5]) );
  DFFQX1 \triggerCount_reg[6]  ( .D(n45), .CK(clk), .Q(triggerCount[6]) );
  DFFQX1 \triggerCount_reg[4]  ( .D(n43), .CK(clk), .Q(triggerCount[4]) );
  DFFQX1 \triggerCount_reg[3]  ( .D(n42), .CK(clk), .Q(triggerCount[3]) );
  DFFTRX1 \a_reg[7]  ( .D(A[7]), .RN(rst_n), .CK(clk), .Q(a[7]) );
  DFFTRX1 \b_reg[7]  ( .D(B[7]), .RN(rst_n), .CK(clk), .Q(b[7]) );
  DFFTRX1 DONE_reg ( .D(n60), .RN(n7), .CK(clk), .Q(DONE) );
  DFFTRX1 \a_reg[6]  ( .D(A[6]), .RN(rst_n), .CK(clk), .Q(a[6]) );
  DFFTRX1 \b_reg[6]  ( .D(B[6]), .RN(rst_n), .CK(clk), .Q(b[6]) );
  DFFTRX1 \a_reg[5]  ( .D(A[5]), .RN(rst_n), .CK(clk), .Q(a[5]) );
  DFFTRX1 \a_reg[4]  ( .D(A[4]), .RN(rst_n), .CK(clk), .Q(a[4]) );
  DFFTRX1 \b_reg[5]  ( .D(B[5]), .RN(rst_n), .CK(clk), .Q(b[5]) );
  DFFTRX1 \b_reg[4]  ( .D(B[4]), .RN(rst_n), .CK(clk), .Q(b[4]) );
  DFFTRX1 \a_reg[3]  ( .D(A[3]), .RN(rst_n), .CK(clk), .Q(a[3]) );
  DFFTRX1 \a_reg[2]  ( .D(A[2]), .RN(rst_n), .CK(clk), .Q(a[2]) );
  DFFTRX1 \a_reg[1]  ( .D(A[1]), .RN(rst_n), .CK(clk), .Q(a[1]) );
  DFFTRX1 \b_reg[3]  ( .D(B[3]), .RN(rst_n), .CK(clk), .Q(b[3]) );
  DFFTRX1 \b_reg[2]  ( .D(B[2]), .RN(rst_n), .CK(clk), .Q(b[2]) );
  DFFTRX1 \b_reg[1]  ( .D(B[1]), .RN(rst_n), .CK(clk), .Q(b[1]) );
  DFFTRX1 \a_reg[0]  ( .D(A[0]), .RN(rst_n), .CK(clk), .Q(a[0]) );
  DFFTRX1 \b_reg[0]  ( .D(B[0]), .RN(rst_n), .CK(clk), .Q(b[0]) );
  DFFTRX1 \Aout_reg[7]  ( .D(A[7]), .RN(rst_n), .CK(clk), .Q(Aout[7]) );
  DFFTRX1 \Aout_reg[6]  ( .D(A[6]), .RN(rst_n), .CK(clk), .Q(Aout[6]) );
  DFFTRX1 \Aout_reg[5]  ( .D(A[5]), .RN(rst_n), .CK(clk), .Q(Aout[5]) );
  DFFTRX1 \Aout_reg[4]  ( .D(A[4]), .RN(rst_n), .CK(clk), .Q(Aout[4]) );
  DFFTRX1 \Aout_reg[3]  ( .D(A[3]), .RN(rst_n), .CK(clk), .Q(Aout[3]) );
  DFFTRX1 \Aout_reg[2]  ( .D(A[2]), .RN(rst_n), .CK(clk), .Q(Aout[2]) );
  DFFTRX1 \Aout_reg[1]  ( .D(A[1]), .RN(rst_n), .CK(clk), .Q(Aout[1]) );
  DFFTRX1 \Aout_reg[0]  ( .D(A[0]), .RN(rst_n), .CK(clk), .Q(Aout[0]) );
  DFFTRX1 \Bout_reg[7]  ( .D(B[7]), .RN(rst_n), .CK(clk), .Q(Bout[7]) );
  DFFTRX1 \Bout_reg[6]  ( .D(B[6]), .RN(rst_n), .CK(clk), .Q(Bout[6]) );
  DFFTRX1 \Bout_reg[5]  ( .D(B[5]), .RN(rst_n), .CK(clk), .Q(Bout[5]) );
  DFFTRX1 \Bout_reg[4]  ( .D(B[4]), .RN(rst_n), .CK(clk), .Q(Bout[4]) );
  DFFTRX1 \Bout_reg[3]  ( .D(B[3]), .RN(rst_n), .CK(clk), .Q(Bout[3]) );
  DFFTRX1 \Bout_reg[2]  ( .D(B[2]), .RN(rst_n), .CK(clk), .Q(Bout[2]) );
  DFFTRX1 \Bout_reg[1]  ( .D(B[1]), .RN(rst_n), .CK(clk), .Q(Bout[1]) );
  DFFTRX1 \Bout_reg[0]  ( .D(B[0]), .RN(rst_n), .CK(clk), .Q(Bout[0]) );
  AOI221XL U3 ( .A0(n63), .A1(n62), .B0(n6), .B1(state[1]), .C0(n2), .Y(n64)
         );
  CLKINVX1 U4 ( .A(n58), .Y(n4) );
  CLKINVX1 U5 ( .A(n65), .Y(n7) );
  AO22X1 U6 ( .A0(N71), .A1(n4), .B0(N79), .B1(n3), .Y(N20) );
  AO22X1 U8 ( .A0(N70), .A1(n4), .B0(N78), .B1(n3), .Y(N19) );
  AO22X1 U9 ( .A0(N69), .A1(n4), .B0(N77), .B1(n3), .Y(N18) );
  AO22X1 U10 ( .A0(N66), .A1(n4), .B0(N74), .B1(n3), .Y(N15) );
  AO22X1 U11 ( .A0(N68), .A1(n4), .B0(N76), .B1(n3), .Y(N17) );
  AO22X1 U12 ( .A0(N67), .A1(n4), .B0(N75), .B1(n3), .Y(N16) );
  AO22X1 U13 ( .A0(N65), .A1(n4), .B0(N73), .B1(n3), .Y(N14) );
  NAND2X1 U14 ( .A(rst_n), .B(n62), .Y(n65) );
  NAND2X1 U15 ( .A(n60), .B(n7), .Y(n58) );
  CLKINVX1 U16 ( .A(n57), .Y(n3) );
  CLKINVX1 U17 ( .A(n62), .Y(n6) );
  NOR2X1 U18 ( .A(n65), .B(n63), .Y(N9) );
  AO22X1 U19 ( .A0(N72), .A1(n4), .B0(N80), .B1(n3), .Y(N21) );
  NOR2BX1 U20 ( .AN(state[1]), .B(state[0]), .Y(n62) );
  OAI21XL U21 ( .A0(n60), .A1(n65), .B0(n59), .Y(n61) );
  OAI211X1 U22 ( .A0(state[0]), .A1(start), .B0(n6), .C0(rst_n), .Y(n59) );
  NAND4BX1 U23 ( .AN(triggerCount[0]), .B(triggerCount[7]), .C(n55), .D(n54), 
        .Y(n63) );
  NOR2X1 U24 ( .A(triggerCount[2]), .B(triggerCount[1]), .Y(n55) );
  NOR4X1 U25 ( .A(triggerCount[6]), .B(triggerCount[5]), .C(triggerCount[4]), 
        .D(triggerCount[3]), .Y(n54) );
  NOR2BX1 U26 ( .AN(n63), .B(n68), .Y(n60) );
  NOR3X1 U27 ( .A(n65), .B(n64), .C(n68), .Y(n66) );
  NAND3X1 U28 ( .A(n63), .B(n68), .C(n7), .Y(n57) );
  AO21X1 U29 ( .A0(n68), .A1(n7), .B0(n64), .Y(n67) );
  OAI21XL U30 ( .A0(count[0]), .A1(n57), .B0(n58), .Y(N11) );
  AO22X1 U31 ( .A0(n61), .A1(triggerCount[7]), .B0(N99), .B1(n4), .Y(n9) );
  AO22X1 U32 ( .A0(n61), .A1(triggerCount[0]), .B0(N92), .B1(n4), .Y(n39) );
  AO22X1 U33 ( .A0(Cout[1]), .A1(n67), .B0(c[1]), .B1(n66), .Y(n47) );
  AO22X1 U34 ( .A0(Cout[2]), .A1(n67), .B0(c[2]), .B1(n66), .Y(n48) );
  AO22X1 U35 ( .A0(Cout[3]), .A1(n67), .B0(c[3]), .B1(n66), .Y(n49) );
  AO22X1 U36 ( .A0(Cout[4]), .A1(n67), .B0(c[4]), .B1(n66), .Y(n50) );
  AO22X1 U37 ( .A0(Cout[5]), .A1(n67), .B0(c[5]), .B1(n66), .Y(n51) );
  AO22X1 U38 ( .A0(Cout[6]), .A1(n67), .B0(c[6]), .B1(n66), .Y(n52) );
  AO22X1 U39 ( .A0(Cout[7]), .A1(n67), .B0(c[7]), .B1(n66), .Y(n53) );
  AO22X1 U40 ( .A0(Cout[0]), .A1(n67), .B0(c[0]), .B1(n66), .Y(n46) );
  AO22X1 U41 ( .A0(n61), .A1(triggerCount[6]), .B0(N98), .B1(n4), .Y(n45) );
  AO22X1 U42 ( .A0(n61), .A1(triggerCount[5]), .B0(N97), .B1(n4), .Y(n44) );
  AO22X1 U43 ( .A0(n61), .A1(triggerCount[4]), .B0(N96), .B1(n4), .Y(n43) );
  AO22X1 U44 ( .A0(n61), .A1(triggerCount[3]), .B0(N95), .B1(n4), .Y(n42) );
  AO22X1 U45 ( .A0(n61), .A1(triggerCount[2]), .B0(N94), .B1(n4), .Y(n41) );
  AO22X1 U46 ( .A0(n61), .A1(triggerCount[1]), .B0(N93), .B1(n4), .Y(n40) );
  AND3X2 U47 ( .A(count[1]), .B(n3), .C(count[0]), .Y(N13) );
  NOR2X1 U48 ( .A(n56), .B(n57), .Y(N12) );
  XNOR2X1 U49 ( .A(count[0]), .B(count[1]), .Y(n56) );
  OAI31XL U50 ( .A0(n69), .A1(state[0]), .A2(n2), .B0(n65), .Y(N10) );
  CLKINVX1 U51 ( .A(rst_n), .Y(n2) );
endmodule


module PE_3_DW01_inc_0 ( A, SUM );
  input [7:0] A;
  output [7:0] SUM;

  wire   [7:2] carry;

  ADDHXL U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHXL U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  ADDHXL U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHXL U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHXL U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHXL U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  CLKINVX1 U1 ( .A(A[0]), .Y(SUM[0]) );
  XOR2X1 U2 ( .A(carry[7]), .B(A[7]), .Y(SUM[7]) );
endmodule


module PE_3_DW01_add_0 ( A, B, CI, SUM, CO );
  input [7:0] A;
  input [7:0] B;
  output [7:0] SUM;
  input CI;
  output CO;
  wire   n1, n2;
  wire   [7:1] carry;

  ADDFXL U1_1 ( .A(A[1]), .B(B[1]), .CI(carry[1]), .CO(carry[2]), .S(SUM[1])
         );
  ADDFXL U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  ADDFXL U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFXL U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  ADDFXL U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  ADDFXL U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  XOR3X1 U1_7 ( .A(A[7]), .B(B[7]), .C(carry[7]), .Y(SUM[7]) );
  XNOR2X1 U1 ( .A(B[0]), .B(n1), .Y(SUM[0]) );
  NOR2X1 U2 ( .A(n1), .B(n2), .Y(carry[1]) );
  CLKINVX1 U3 ( .A(B[0]), .Y(n2) );
  CLKINVX1 U4 ( .A(A[0]), .Y(n1) );
endmodule


module PE_3_DW_mult_uns_0 ( a, b, product );
  input [7:0] a;
  input [7:0] b;
  output [15:0] product;
  wire   n2, n3, n4, n5, n6, n7, n18, n19, n20, n21, n22, n23, n24, n25, n26,
         n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40,
         n41, n42, n43, n46, n48, n49, n51, n52, n53, n55, n56, n57, n58, n60,
         n61, n62, n63, n64, n66, n67, n68, n69, n70, n71, n73, n74, n75, n76,
         n77, n78, n123, n124, n125, n126, n127, n128, n129, n130, n131, n132,
         n133, n134, n135, n136, n137, n138, n139, n140, n141, n142, n143,
         n144, n145, n146, n147, n148, n149, n150, n151, n152, n153, n154;

  ADDFXL U3 ( .A(n20), .B(n27), .CI(n3), .CO(n2), .S(product[6]) );
  ADDFXL U4 ( .A(n28), .B(n34), .CI(n4), .CO(n3), .S(product[5]) );
  ADDFXL U5 ( .A(n35), .B(n38), .CI(n5), .CO(n4), .S(product[4]) );
  ADDFXL U6 ( .A(n39), .B(n41), .CI(n6), .CO(n5), .S(product[3]) );
  ADDFXL U7 ( .A(n7), .B(n64), .CI(n43), .CO(n6), .S(product[2]) );
  ADDHXL U8 ( .A(n71), .B(n78), .CO(n7), .S(product[1]) );
  CMPR42X1 U19 ( .A(n60), .B(n55), .C(n26), .D(n29), .ICI(n23), .S(n20), .ICO(
        n18), .CO(n19) );
  CMPR42X1 U20 ( .A(n73), .B(n51), .C(n66), .D(n31), .ICI(n25), .S(n23), .ICO(
        n21), .CO(n22) );
  ADDHXL U21 ( .A(n48), .B(n46), .CO(n24), .S(n25) );
  CMPR42X1 U22 ( .A(n67), .B(n61), .C(n33), .D(n32), .ICI(n30), .S(n28), .ICO(
        n26), .CO(n27) );
  ADDFXL U23 ( .A(n56), .B(n74), .CI(n36), .CO(n29), .S(n30) );
  ADDHXL U24 ( .A(n52), .B(n49), .CO(n31), .S(n32) );
  CMPR42X1 U25 ( .A(n75), .B(n62), .C(n68), .D(n40), .ICI(n37), .S(n35), .ICO(
        n33), .CO(n34) );
  ADDHXL U26 ( .A(n57), .B(n53), .CO(n36), .S(n37) );
  ADDFXL U27 ( .A(n69), .B(n76), .CI(n42), .CO(n38), .S(n39) );
  ADDHXL U28 ( .A(n63), .B(n58), .CO(n40), .S(n41) );
  ADDHXL U29 ( .A(n77), .B(n70), .CO(n42), .S(n43) );
  CLKINVX1 U84 ( .A(a[0]), .Y(n134) );
  CLKINVX1 U85 ( .A(b[0]), .Y(n128) );
  CLKINVX1 U86 ( .A(b[1]), .Y(n127) );
  CLKINVX1 U87 ( .A(a[1]), .Y(n133) );
  CLKINVX1 U88 ( .A(b[2]), .Y(n126) );
  CLKINVX1 U89 ( .A(a[2]), .Y(n132) );
  CLKINVX1 U90 ( .A(a[3]), .Y(n131) );
  CLKINVX1 U91 ( .A(b[3]), .Y(n125) );
  CLKINVX1 U92 ( .A(b[4]), .Y(n124) );
  CLKINVX1 U93 ( .A(a[4]), .Y(n130) );
  CLKINVX1 U94 ( .A(a[5]), .Y(n129) );
  CLKINVX1 U95 ( .A(b[5]), .Y(n123) );
  XOR2X1 U96 ( .A(n135), .B(n136), .Y(product[7]) );
  XOR2X1 U97 ( .A(n137), .B(n138), .Y(n136) );
  XOR2X1 U98 ( .A(n18), .B(n139), .Y(n138) );
  NOR2X1 U99 ( .A(n131), .B(n124), .Y(n139) );
  XOR2X1 U100 ( .A(n140), .B(n141), .Y(n137) );
  XOR2X1 U101 ( .A(n142), .B(n143), .Y(n141) );
  XOR2X1 U102 ( .A(n144), .B(n145), .Y(n143) );
  NAND2X1 U103 ( .A(b[5]), .B(a[2]), .Y(n145) );
  NAND2X1 U104 ( .A(b[6]), .B(a[1]), .Y(n144) );
  XOR2X1 U105 ( .A(n146), .B(n147), .Y(n142) );
  NAND2X1 U106 ( .A(b[3]), .B(a[4]), .Y(n147) );
  NAND2X1 U107 ( .A(b[1]), .B(a[6]), .Y(n146) );
  XOR2X1 U108 ( .A(n148), .B(n149), .Y(n140) );
  XOR2X1 U109 ( .A(n150), .B(n151), .Y(n149) );
  NAND2X1 U110 ( .A(b[0]), .B(a[7]), .Y(n151) );
  NAND2X1 U111 ( .A(b[2]), .B(a[5]), .Y(n150) );
  XNOR2X1 U112 ( .A(n24), .B(n152), .Y(n148) );
  NAND2X1 U113 ( .A(b[7]), .B(a[0]), .Y(n152) );
  XOR2X1 U114 ( .A(n153), .B(n154), .Y(n135) );
  XNOR2X1 U115 ( .A(n2), .B(n19), .Y(n154) );
  XNOR2X1 U116 ( .A(n22), .B(n21), .Y(n153) );
  NOR2X1 U117 ( .A(n134), .B(n128), .Y(product[0]) );
  NOR2X1 U118 ( .A(n134), .B(n127), .Y(n78) );
  NOR2X1 U119 ( .A(n134), .B(n126), .Y(n77) );
  NOR2X1 U120 ( .A(n134), .B(n125), .Y(n76) );
  NOR2X1 U121 ( .A(n134), .B(n124), .Y(n75) );
  NOR2X1 U122 ( .A(n134), .B(n123), .Y(n74) );
  AND2X1 U123 ( .A(b[6]), .B(a[0]), .Y(n73) );
  NOR2X1 U124 ( .A(n128), .B(n133), .Y(n71) );
  NOR2X1 U125 ( .A(n127), .B(n133), .Y(n70) );
  NOR2X1 U126 ( .A(n126), .B(n133), .Y(n69) );
  NOR2X1 U127 ( .A(n125), .B(n133), .Y(n68) );
  NOR2X1 U128 ( .A(n133), .B(n124), .Y(n67) );
  NOR2X1 U129 ( .A(n133), .B(n123), .Y(n66) );
  NOR2X1 U130 ( .A(n128), .B(n132), .Y(n64) );
  NOR2X1 U131 ( .A(n127), .B(n132), .Y(n63) );
  NOR2X1 U132 ( .A(n126), .B(n132), .Y(n62) );
  NOR2X1 U133 ( .A(n125), .B(n132), .Y(n61) );
  NOR2X1 U134 ( .A(n132), .B(n124), .Y(n60) );
  NOR2X1 U135 ( .A(n128), .B(n131), .Y(n58) );
  NOR2X1 U136 ( .A(n127), .B(n131), .Y(n57) );
  NOR2X1 U137 ( .A(n126), .B(n131), .Y(n56) );
  NOR2X1 U138 ( .A(n125), .B(n131), .Y(n55) );
  NOR2X1 U139 ( .A(n128), .B(n130), .Y(n53) );
  NOR2X1 U140 ( .A(n127), .B(n130), .Y(n52) );
  NOR2X1 U141 ( .A(n126), .B(n130), .Y(n51) );
  NOR2X1 U142 ( .A(n129), .B(n128), .Y(n49) );
  NOR2X1 U143 ( .A(n129), .B(n127), .Y(n48) );
  AND2X1 U144 ( .A(a[6]), .B(b[0]), .Y(n46) );
endmodule


module PE_3 ( clk, rst_n, START, A, B, Aout, Bout, Cout, DONE );
  input [7:0] A;
  input [7:0] B;
  output [7:0] Aout;
  output [7:0] Bout;
  output [7:0] Cout;
  input clk, rst_n, START;
  output DONE;
  wire   start, N9, N10, N11, N12, N13, N14, N15, N16, N17, N18, N19, N20, N21,
         N65, N66, N67, N68, N69, N70, N71, N72, N73, N74, N75, N76, N77, N78,
         N79, N80, N92, N93, N94, N95, N96, N97, N98, N99, n2, n3, n4, n6, n7,
         n9, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51,
         n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65,
         n66, n67, n68, n69;
  wire   [1:0] state;
  wire   [2:0] count;
  wire   [7:0] c;
  wire   [7:0] triggerCount;
  wire   [7:0] a;
  wire   [7:0] b;
  wire   SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, 
        SYNOPSYS_UNCONNECTED__4, SYNOPSYS_UNCONNECTED__5, 
        SYNOPSYS_UNCONNECTED__6, SYNOPSYS_UNCONNECTED__7;

  PE_3_DW01_inc_0 add_98 ( .A(triggerCount), .SUM({N99, N98, N97, N96, N95, 
        N94, N93, N92}) );
  PE_3_DW01_add_0 add_88 ( .A(c), .B({N72, N71, N70, N69, N68, N67, N66, N65}), 
        .CI(1'b0), .SUM({N80, N79, N78, N77, N76, N75, N74, N73}) );
  PE_3_DW_mult_uns_0 r319 ( .a(a), .b(b), .product({SYNOPSYS_UNCONNECTED__0, 
        SYNOPSYS_UNCONNECTED__1, SYNOPSYS_UNCONNECTED__2, 
        SYNOPSYS_UNCONNECTED__3, SYNOPSYS_UNCONNECTED__4, 
        SYNOPSYS_UNCONNECTED__5, SYNOPSYS_UNCONNECTED__6, 
        SYNOPSYS_UNCONNECTED__7, N72, N71, N70, N69, N68, N67, N66, N65}) );
  DFFQX1 \Cout_reg[7]  ( .D(n53), .CK(clk), .Q(Cout[7]) );
  DFFQX1 \Cout_reg[6]  ( .D(n52), .CK(clk), .Q(Cout[6]) );
  DFFQX1 \Cout_reg[5]  ( .D(n51), .CK(clk), .Q(Cout[5]) );
  DFFQX1 \Cout_reg[4]  ( .D(n50), .CK(clk), .Q(Cout[4]) );
  DFFQX1 \Cout_reg[3]  ( .D(n49), .CK(clk), .Q(Cout[3]) );
  DFFQX1 \Cout_reg[2]  ( .D(n48), .CK(clk), .Q(Cout[2]) );
  DFFQX1 \Cout_reg[1]  ( .D(n47), .CK(clk), .Q(Cout[1]) );
  DFFQX1 \Cout_reg[0]  ( .D(n46), .CK(clk), .Q(Cout[0]) );
  DFFQX1 \c_reg[7]  ( .D(N21), .CK(clk), .Q(c[7]) );
  DFFQX1 \count_reg[1]  ( .D(N12), .CK(clk), .Q(count[1]) );
  DFFQX1 \count_reg[0]  ( .D(N11), .CK(clk), .Q(count[0]) );
  DFFX1 \count_reg[2]  ( .D(N13), .CK(clk), .QN(n68) );
  DFFTRX1 start_reg ( .D(START), .RN(rst_n), .CK(clk), .Q(start), .QN(n69) );
  DFFQX1 \state_reg[1]  ( .D(N10), .CK(clk), .Q(state[1]) );
  DFFQX1 \state_reg[0]  ( .D(N9), .CK(clk), .Q(state[0]) );
  DFFQX1 \c_reg[1]  ( .D(N15), .CK(clk), .Q(c[1]) );
  DFFQX1 \c_reg[2]  ( .D(N16), .CK(clk), .Q(c[2]) );
  DFFQX1 \c_reg[3]  ( .D(N17), .CK(clk), .Q(c[3]) );
  DFFQX1 \c_reg[4]  ( .D(N18), .CK(clk), .Q(c[4]) );
  DFFQX1 \c_reg[5]  ( .D(N19), .CK(clk), .Q(c[5]) );
  DFFQX1 \c_reg[6]  ( .D(N20), .CK(clk), .Q(c[6]) );
  DFFQX1 \triggerCount_reg[7]  ( .D(n9), .CK(clk), .Q(triggerCount[7]) );
  DFFQX1 \c_reg[0]  ( .D(N14), .CK(clk), .Q(c[0]) );
  DFFQX1 \triggerCount_reg[0]  ( .D(n39), .CK(clk), .Q(triggerCount[0]) );
  DFFQX1 \triggerCount_reg[1]  ( .D(n40), .CK(clk), .Q(triggerCount[1]) );
  DFFQX1 \triggerCount_reg[2]  ( .D(n41), .CK(clk), .Q(triggerCount[2]) );
  DFFQX1 \triggerCount_reg[5]  ( .D(n44), .CK(clk), .Q(triggerCount[5]) );
  DFFQX1 \triggerCount_reg[6]  ( .D(n45), .CK(clk), .Q(triggerCount[6]) );
  DFFQX1 \triggerCount_reg[4]  ( .D(n43), .CK(clk), .Q(triggerCount[4]) );
  DFFQX1 \triggerCount_reg[3]  ( .D(n42), .CK(clk), .Q(triggerCount[3]) );
  DFFTRX1 \a_reg[7]  ( .D(A[7]), .RN(rst_n), .CK(clk), .Q(a[7]) );
  DFFTRX1 \b_reg[7]  ( .D(B[7]), .RN(rst_n), .CK(clk), .Q(b[7]) );
  DFFTRX1 DONE_reg ( .D(n60), .RN(n7), .CK(clk), .Q(DONE) );
  DFFTRX1 \a_reg[6]  ( .D(A[6]), .RN(rst_n), .CK(clk), .Q(a[6]) );
  DFFTRX1 \b_reg[6]  ( .D(B[6]), .RN(rst_n), .CK(clk), .Q(b[6]) );
  DFFTRX1 \a_reg[5]  ( .D(A[5]), .RN(rst_n), .CK(clk), .Q(a[5]) );
  DFFTRX1 \a_reg[4]  ( .D(A[4]), .RN(rst_n), .CK(clk), .Q(a[4]) );
  DFFTRX1 \b_reg[5]  ( .D(B[5]), .RN(rst_n), .CK(clk), .Q(b[5]) );
  DFFTRX1 \b_reg[4]  ( .D(B[4]), .RN(rst_n), .CK(clk), .Q(b[4]) );
  DFFTRX1 \a_reg[3]  ( .D(A[3]), .RN(rst_n), .CK(clk), .Q(a[3]) );
  DFFTRX1 \a_reg[2]  ( .D(A[2]), .RN(rst_n), .CK(clk), .Q(a[2]) );
  DFFTRX1 \a_reg[1]  ( .D(A[1]), .RN(rst_n), .CK(clk), .Q(a[1]) );
  DFFTRX1 \b_reg[3]  ( .D(B[3]), .RN(rst_n), .CK(clk), .Q(b[3]) );
  DFFTRX1 \b_reg[2]  ( .D(B[2]), .RN(rst_n), .CK(clk), .Q(b[2]) );
  DFFTRX1 \b_reg[1]  ( .D(B[1]), .RN(rst_n), .CK(clk), .Q(b[1]) );
  DFFTRX1 \a_reg[0]  ( .D(A[0]), .RN(rst_n), .CK(clk), .Q(a[0]) );
  DFFTRX1 \b_reg[0]  ( .D(B[0]), .RN(rst_n), .CK(clk), .Q(b[0]) );
  DFFTRX1 \Aout_reg[7]  ( .D(A[7]), .RN(rst_n), .CK(clk), .Q(Aout[7]) );
  DFFTRX1 \Aout_reg[6]  ( .D(A[6]), .RN(rst_n), .CK(clk), .Q(Aout[6]) );
  DFFTRX1 \Aout_reg[5]  ( .D(A[5]), .RN(rst_n), .CK(clk), .Q(Aout[5]) );
  DFFTRX1 \Aout_reg[4]  ( .D(A[4]), .RN(rst_n), .CK(clk), .Q(Aout[4]) );
  DFFTRX1 \Aout_reg[3]  ( .D(A[3]), .RN(rst_n), .CK(clk), .Q(Aout[3]) );
  DFFTRX1 \Aout_reg[2]  ( .D(A[2]), .RN(rst_n), .CK(clk), .Q(Aout[2]) );
  DFFTRX1 \Aout_reg[1]  ( .D(A[1]), .RN(rst_n), .CK(clk), .Q(Aout[1]) );
  DFFTRX1 \Aout_reg[0]  ( .D(A[0]), .RN(rst_n), .CK(clk), .Q(Aout[0]) );
  DFFTRX1 \Bout_reg[7]  ( .D(B[7]), .RN(rst_n), .CK(clk), .Q(Bout[7]) );
  DFFTRX1 \Bout_reg[6]  ( .D(B[6]), .RN(rst_n), .CK(clk), .Q(Bout[6]) );
  DFFTRX1 \Bout_reg[5]  ( .D(B[5]), .RN(rst_n), .CK(clk), .Q(Bout[5]) );
  DFFTRX1 \Bout_reg[4]  ( .D(B[4]), .RN(rst_n), .CK(clk), .Q(Bout[4]) );
  DFFTRX1 \Bout_reg[3]  ( .D(B[3]), .RN(rst_n), .CK(clk), .Q(Bout[3]) );
  DFFTRX1 \Bout_reg[2]  ( .D(B[2]), .RN(rst_n), .CK(clk), .Q(Bout[2]) );
  DFFTRX1 \Bout_reg[1]  ( .D(B[1]), .RN(rst_n), .CK(clk), .Q(Bout[1]) );
  DFFTRX1 \Bout_reg[0]  ( .D(B[0]), .RN(rst_n), .CK(clk), .Q(Bout[0]) );
  AOI221XL U3 ( .A0(n63), .A1(n62), .B0(n6), .B1(state[1]), .C0(n2), .Y(n64)
         );
  CLKINVX1 U4 ( .A(n58), .Y(n4) );
  CLKINVX1 U5 ( .A(n65), .Y(n7) );
  AO22X1 U6 ( .A0(N71), .A1(n4), .B0(N79), .B1(n3), .Y(N20) );
  AO22X1 U8 ( .A0(N70), .A1(n4), .B0(N78), .B1(n3), .Y(N19) );
  AO22X1 U9 ( .A0(N69), .A1(n4), .B0(N77), .B1(n3), .Y(N18) );
  AO22X1 U10 ( .A0(N66), .A1(n4), .B0(N74), .B1(n3), .Y(N15) );
  AO22X1 U11 ( .A0(N68), .A1(n4), .B0(N76), .B1(n3), .Y(N17) );
  AO22X1 U12 ( .A0(N67), .A1(n4), .B0(N75), .B1(n3), .Y(N16) );
  AO22X1 U13 ( .A0(N65), .A1(n4), .B0(N73), .B1(n3), .Y(N14) );
  NAND2X1 U14 ( .A(rst_n), .B(n62), .Y(n65) );
  NAND2X1 U15 ( .A(n60), .B(n7), .Y(n58) );
  CLKINVX1 U16 ( .A(n57), .Y(n3) );
  CLKINVX1 U17 ( .A(n62), .Y(n6) );
  NOR2X1 U18 ( .A(n65), .B(n63), .Y(N9) );
  AO22X1 U19 ( .A0(N72), .A1(n4), .B0(N80), .B1(n3), .Y(N21) );
  NOR2BX1 U20 ( .AN(state[1]), .B(state[0]), .Y(n62) );
  OAI21XL U21 ( .A0(n60), .A1(n65), .B0(n59), .Y(n61) );
  OAI211X1 U22 ( .A0(state[0]), .A1(start), .B0(n6), .C0(rst_n), .Y(n59) );
  NAND4BX1 U23 ( .AN(triggerCount[0]), .B(triggerCount[7]), .C(n55), .D(n54), 
        .Y(n63) );
  NOR2X1 U24 ( .A(triggerCount[2]), .B(triggerCount[1]), .Y(n55) );
  NOR4X1 U25 ( .A(triggerCount[6]), .B(triggerCount[5]), .C(triggerCount[4]), 
        .D(triggerCount[3]), .Y(n54) );
  NOR2BX1 U26 ( .AN(n63), .B(n68), .Y(n60) );
  NOR3X1 U27 ( .A(n65), .B(n64), .C(n68), .Y(n66) );
  NAND3X1 U28 ( .A(n63), .B(n68), .C(n7), .Y(n57) );
  AO21X1 U29 ( .A0(n68), .A1(n7), .B0(n64), .Y(n67) );
  OAI21XL U30 ( .A0(count[0]), .A1(n57), .B0(n58), .Y(N11) );
  AO22X1 U31 ( .A0(n61), .A1(triggerCount[7]), .B0(N99), .B1(n4), .Y(n9) );
  AO22X1 U32 ( .A0(n61), .A1(triggerCount[0]), .B0(N92), .B1(n4), .Y(n39) );
  AO22X1 U33 ( .A0(Cout[1]), .A1(n67), .B0(c[1]), .B1(n66), .Y(n47) );
  AO22X1 U34 ( .A0(Cout[2]), .A1(n67), .B0(c[2]), .B1(n66), .Y(n48) );
  AO22X1 U35 ( .A0(Cout[3]), .A1(n67), .B0(c[3]), .B1(n66), .Y(n49) );
  AO22X1 U36 ( .A0(Cout[4]), .A1(n67), .B0(c[4]), .B1(n66), .Y(n50) );
  AO22X1 U37 ( .A0(Cout[5]), .A1(n67), .B0(c[5]), .B1(n66), .Y(n51) );
  AO22X1 U38 ( .A0(Cout[6]), .A1(n67), .B0(c[6]), .B1(n66), .Y(n52) );
  AO22X1 U39 ( .A0(Cout[7]), .A1(n67), .B0(c[7]), .B1(n66), .Y(n53) );
  AO22X1 U40 ( .A0(Cout[0]), .A1(n67), .B0(c[0]), .B1(n66), .Y(n46) );
  AO22X1 U41 ( .A0(n61), .A1(triggerCount[6]), .B0(N98), .B1(n4), .Y(n45) );
  AO22X1 U42 ( .A0(n61), .A1(triggerCount[5]), .B0(N97), .B1(n4), .Y(n44) );
  AO22X1 U43 ( .A0(n61), .A1(triggerCount[4]), .B0(N96), .B1(n4), .Y(n43) );
  AO22X1 U44 ( .A0(n61), .A1(triggerCount[3]), .B0(N95), .B1(n4), .Y(n42) );
  AO22X1 U45 ( .A0(n61), .A1(triggerCount[2]), .B0(N94), .B1(n4), .Y(n41) );
  AO22X1 U46 ( .A0(n61), .A1(triggerCount[1]), .B0(N93), .B1(n4), .Y(n40) );
  AND3X2 U47 ( .A(count[1]), .B(n3), .C(count[0]), .Y(N13) );
  NOR2X1 U48 ( .A(n56), .B(n57), .Y(N12) );
  XNOR2X1 U49 ( .A(count[0]), .B(count[1]), .Y(n56) );
  OAI31XL U50 ( .A0(n69), .A1(state[0]), .A2(n2), .B0(n65), .Y(N10) );
  CLKINVX1 U51 ( .A(rst_n), .Y(n2) );
endmodule


module PE_2_DW01_inc_0 ( A, SUM );
  input [7:0] A;
  output [7:0] SUM;

  wire   [7:2] carry;

  ADDHXL U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHXL U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  ADDHXL U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHXL U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHXL U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHXL U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  CLKINVX1 U1 ( .A(A[0]), .Y(SUM[0]) );
  XOR2X1 U2 ( .A(carry[7]), .B(A[7]), .Y(SUM[7]) );
endmodule


module PE_2_DW01_add_0 ( A, B, CI, SUM, CO );
  input [7:0] A;
  input [7:0] B;
  output [7:0] SUM;
  input CI;
  output CO;
  wire   n1, n2;
  wire   [7:1] carry;

  ADDFXL U1_1 ( .A(A[1]), .B(B[1]), .CI(carry[1]), .CO(carry[2]), .S(SUM[1])
         );
  ADDFXL U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  ADDFXL U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFXL U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  ADDFXL U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  ADDFXL U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  XOR3X1 U1_7 ( .A(A[7]), .B(B[7]), .C(carry[7]), .Y(SUM[7]) );
  XNOR2X1 U1 ( .A(B[0]), .B(n1), .Y(SUM[0]) );
  NOR2X1 U2 ( .A(n1), .B(n2), .Y(carry[1]) );
  CLKINVX1 U3 ( .A(B[0]), .Y(n2) );
  CLKINVX1 U4 ( .A(A[0]), .Y(n1) );
endmodule


module PE_2_DW_mult_uns_0 ( a, b, product );
  input [7:0] a;
  input [7:0] b;
  output [15:0] product;
  wire   n2, n3, n4, n5, n6, n7, n18, n19, n20, n21, n22, n23, n24, n25, n26,
         n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40,
         n41, n42, n43, n46, n48, n49, n51, n52, n53, n55, n56, n57, n58, n60,
         n61, n62, n63, n64, n66, n67, n68, n69, n70, n71, n73, n74, n75, n76,
         n77, n78, n123, n124, n125, n126, n127, n128, n129, n130, n131, n132,
         n133, n134, n135, n136, n137, n138, n139, n140, n141, n142, n143,
         n144, n145, n146, n147, n148, n149, n150, n151, n152, n153, n154;

  ADDFXL U3 ( .A(n20), .B(n27), .CI(n3), .CO(n2), .S(product[6]) );
  ADDFXL U4 ( .A(n28), .B(n34), .CI(n4), .CO(n3), .S(product[5]) );
  ADDFXL U5 ( .A(n35), .B(n38), .CI(n5), .CO(n4), .S(product[4]) );
  ADDFXL U6 ( .A(n39), .B(n41), .CI(n6), .CO(n5), .S(product[3]) );
  ADDFXL U7 ( .A(n7), .B(n64), .CI(n43), .CO(n6), .S(product[2]) );
  ADDHXL U8 ( .A(n71), .B(n78), .CO(n7), .S(product[1]) );
  CMPR42X1 U19 ( .A(n60), .B(n55), .C(n26), .D(n29), .ICI(n23), .S(n20), .ICO(
        n18), .CO(n19) );
  CMPR42X1 U20 ( .A(n73), .B(n51), .C(n66), .D(n31), .ICI(n25), .S(n23), .ICO(
        n21), .CO(n22) );
  ADDHXL U21 ( .A(n48), .B(n46), .CO(n24), .S(n25) );
  CMPR42X1 U22 ( .A(n67), .B(n61), .C(n33), .D(n32), .ICI(n30), .S(n28), .ICO(
        n26), .CO(n27) );
  ADDFXL U23 ( .A(n56), .B(n74), .CI(n36), .CO(n29), .S(n30) );
  ADDHXL U24 ( .A(n52), .B(n49), .CO(n31), .S(n32) );
  CMPR42X1 U25 ( .A(n75), .B(n62), .C(n68), .D(n40), .ICI(n37), .S(n35), .ICO(
        n33), .CO(n34) );
  ADDHXL U26 ( .A(n57), .B(n53), .CO(n36), .S(n37) );
  ADDFXL U27 ( .A(n69), .B(n76), .CI(n42), .CO(n38), .S(n39) );
  ADDHXL U28 ( .A(n63), .B(n58), .CO(n40), .S(n41) );
  ADDHXL U29 ( .A(n77), .B(n70), .CO(n42), .S(n43) );
  CLKINVX1 U84 ( .A(a[0]), .Y(n134) );
  CLKINVX1 U85 ( .A(b[0]), .Y(n128) );
  CLKINVX1 U86 ( .A(b[1]), .Y(n127) );
  CLKINVX1 U87 ( .A(a[1]), .Y(n133) );
  CLKINVX1 U88 ( .A(b[2]), .Y(n126) );
  CLKINVX1 U89 ( .A(a[2]), .Y(n132) );
  CLKINVX1 U90 ( .A(a[3]), .Y(n131) );
  CLKINVX1 U91 ( .A(b[3]), .Y(n125) );
  CLKINVX1 U92 ( .A(b[4]), .Y(n124) );
  CLKINVX1 U93 ( .A(a[4]), .Y(n130) );
  CLKINVX1 U94 ( .A(a[5]), .Y(n129) );
  CLKINVX1 U95 ( .A(b[5]), .Y(n123) );
  XOR2X1 U96 ( .A(n135), .B(n136), .Y(product[7]) );
  XOR2X1 U97 ( .A(n137), .B(n138), .Y(n136) );
  XOR2X1 U98 ( .A(n18), .B(n139), .Y(n138) );
  NOR2X1 U99 ( .A(n131), .B(n124), .Y(n139) );
  XOR2X1 U100 ( .A(n140), .B(n141), .Y(n137) );
  XOR2X1 U101 ( .A(n142), .B(n143), .Y(n141) );
  XOR2X1 U102 ( .A(n144), .B(n145), .Y(n143) );
  NAND2X1 U103 ( .A(b[5]), .B(a[2]), .Y(n145) );
  NAND2X1 U104 ( .A(b[6]), .B(a[1]), .Y(n144) );
  XOR2X1 U105 ( .A(n146), .B(n147), .Y(n142) );
  NAND2X1 U106 ( .A(b[3]), .B(a[4]), .Y(n147) );
  NAND2X1 U107 ( .A(b[1]), .B(a[6]), .Y(n146) );
  XOR2X1 U108 ( .A(n148), .B(n149), .Y(n140) );
  XOR2X1 U109 ( .A(n150), .B(n151), .Y(n149) );
  NAND2X1 U110 ( .A(b[0]), .B(a[7]), .Y(n151) );
  NAND2X1 U111 ( .A(b[2]), .B(a[5]), .Y(n150) );
  XNOR2X1 U112 ( .A(n24), .B(n152), .Y(n148) );
  NAND2X1 U113 ( .A(b[7]), .B(a[0]), .Y(n152) );
  XOR2X1 U114 ( .A(n153), .B(n154), .Y(n135) );
  XNOR2X1 U115 ( .A(n2), .B(n19), .Y(n154) );
  XNOR2X1 U116 ( .A(n22), .B(n21), .Y(n153) );
  NOR2X1 U117 ( .A(n134), .B(n128), .Y(product[0]) );
  NOR2X1 U118 ( .A(n134), .B(n127), .Y(n78) );
  NOR2X1 U119 ( .A(n134), .B(n126), .Y(n77) );
  NOR2X1 U120 ( .A(n134), .B(n125), .Y(n76) );
  NOR2X1 U121 ( .A(n134), .B(n124), .Y(n75) );
  NOR2X1 U122 ( .A(n134), .B(n123), .Y(n74) );
  AND2X1 U123 ( .A(b[6]), .B(a[0]), .Y(n73) );
  NOR2X1 U124 ( .A(n128), .B(n133), .Y(n71) );
  NOR2X1 U125 ( .A(n127), .B(n133), .Y(n70) );
  NOR2X1 U126 ( .A(n126), .B(n133), .Y(n69) );
  NOR2X1 U127 ( .A(n125), .B(n133), .Y(n68) );
  NOR2X1 U128 ( .A(n133), .B(n124), .Y(n67) );
  NOR2X1 U129 ( .A(n133), .B(n123), .Y(n66) );
  NOR2X1 U130 ( .A(n128), .B(n132), .Y(n64) );
  NOR2X1 U131 ( .A(n127), .B(n132), .Y(n63) );
  NOR2X1 U132 ( .A(n126), .B(n132), .Y(n62) );
  NOR2X1 U133 ( .A(n125), .B(n132), .Y(n61) );
  NOR2X1 U134 ( .A(n132), .B(n124), .Y(n60) );
  NOR2X1 U135 ( .A(n128), .B(n131), .Y(n58) );
  NOR2X1 U136 ( .A(n127), .B(n131), .Y(n57) );
  NOR2X1 U137 ( .A(n126), .B(n131), .Y(n56) );
  NOR2X1 U138 ( .A(n125), .B(n131), .Y(n55) );
  NOR2X1 U139 ( .A(n128), .B(n130), .Y(n53) );
  NOR2X1 U140 ( .A(n127), .B(n130), .Y(n52) );
  NOR2X1 U141 ( .A(n126), .B(n130), .Y(n51) );
  NOR2X1 U142 ( .A(n129), .B(n128), .Y(n49) );
  NOR2X1 U143 ( .A(n129), .B(n127), .Y(n48) );
  AND2X1 U144 ( .A(a[6]), .B(b[0]), .Y(n46) );
endmodule


module PE_2 ( clk, rst_n, START, A, B, Aout, Bout, Cout, DONE );
  input [7:0] A;
  input [7:0] B;
  output [7:0] Aout;
  output [7:0] Bout;
  output [7:0] Cout;
  input clk, rst_n, START;
  output DONE;
  wire   start, N9, N10, N11, N12, N13, N14, N15, N16, N17, N18, N19, N20, N21,
         N65, N66, N67, N68, N69, N70, N71, N72, N73, N74, N75, N76, N77, N78,
         N79, N80, N92, N93, N94, N95, N96, N97, N98, N99, n2, n3, n4, n6, n7,
         n9, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51,
         n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65,
         n66, n67, n68, n69;
  wire   [1:0] state;
  wire   [2:0] count;
  wire   [7:0] c;
  wire   [7:0] triggerCount;
  wire   [7:0] a;
  wire   [7:0] b;
  wire   SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, 
        SYNOPSYS_UNCONNECTED__4, SYNOPSYS_UNCONNECTED__5, 
        SYNOPSYS_UNCONNECTED__6, SYNOPSYS_UNCONNECTED__7;

  PE_2_DW01_inc_0 add_98 ( .A(triggerCount), .SUM({N99, N98, N97, N96, N95, 
        N94, N93, N92}) );
  PE_2_DW01_add_0 add_88 ( .A(c), .B({N72, N71, N70, N69, N68, N67, N66, N65}), 
        .CI(1'b0), .SUM({N80, N79, N78, N77, N76, N75, N74, N73}) );
  PE_2_DW_mult_uns_0 r319 ( .a(a), .b(b), .product({SYNOPSYS_UNCONNECTED__0, 
        SYNOPSYS_UNCONNECTED__1, SYNOPSYS_UNCONNECTED__2, 
        SYNOPSYS_UNCONNECTED__3, SYNOPSYS_UNCONNECTED__4, 
        SYNOPSYS_UNCONNECTED__5, SYNOPSYS_UNCONNECTED__6, 
        SYNOPSYS_UNCONNECTED__7, N72, N71, N70, N69, N68, N67, N66, N65}) );
  DFFQX1 \Cout_reg[7]  ( .D(n53), .CK(clk), .Q(Cout[7]) );
  DFFQX1 \Cout_reg[6]  ( .D(n52), .CK(clk), .Q(Cout[6]) );
  DFFQX1 \Cout_reg[5]  ( .D(n51), .CK(clk), .Q(Cout[5]) );
  DFFQX1 \Cout_reg[4]  ( .D(n50), .CK(clk), .Q(Cout[4]) );
  DFFQX1 \Cout_reg[3]  ( .D(n49), .CK(clk), .Q(Cout[3]) );
  DFFQX1 \Cout_reg[2]  ( .D(n48), .CK(clk), .Q(Cout[2]) );
  DFFQX1 \Cout_reg[1]  ( .D(n47), .CK(clk), .Q(Cout[1]) );
  DFFQX1 \Cout_reg[0]  ( .D(n46), .CK(clk), .Q(Cout[0]) );
  DFFQX1 \c_reg[7]  ( .D(N21), .CK(clk), .Q(c[7]) );
  DFFQX1 \count_reg[1]  ( .D(N12), .CK(clk), .Q(count[1]) );
  DFFQX1 \count_reg[0]  ( .D(N11), .CK(clk), .Q(count[0]) );
  DFFX1 \count_reg[2]  ( .D(N13), .CK(clk), .QN(n68) );
  DFFTRX1 start_reg ( .D(START), .RN(rst_n), .CK(clk), .Q(start), .QN(n69) );
  DFFQX1 \state_reg[1]  ( .D(N10), .CK(clk), .Q(state[1]) );
  DFFQX1 \state_reg[0]  ( .D(N9), .CK(clk), .Q(state[0]) );
  DFFQX1 \c_reg[1]  ( .D(N15), .CK(clk), .Q(c[1]) );
  DFFQX1 \c_reg[2]  ( .D(N16), .CK(clk), .Q(c[2]) );
  DFFQX1 \c_reg[3]  ( .D(N17), .CK(clk), .Q(c[3]) );
  DFFQX1 \c_reg[4]  ( .D(N18), .CK(clk), .Q(c[4]) );
  DFFQX1 \c_reg[5]  ( .D(N19), .CK(clk), .Q(c[5]) );
  DFFQX1 \c_reg[6]  ( .D(N20), .CK(clk), .Q(c[6]) );
  DFFQX1 \triggerCount_reg[7]  ( .D(n9), .CK(clk), .Q(triggerCount[7]) );
  DFFQX1 \c_reg[0]  ( .D(N14), .CK(clk), .Q(c[0]) );
  DFFQX1 \triggerCount_reg[0]  ( .D(n39), .CK(clk), .Q(triggerCount[0]) );
  DFFQX1 \triggerCount_reg[1]  ( .D(n40), .CK(clk), .Q(triggerCount[1]) );
  DFFQX1 \triggerCount_reg[2]  ( .D(n41), .CK(clk), .Q(triggerCount[2]) );
  DFFQX1 \triggerCount_reg[5]  ( .D(n44), .CK(clk), .Q(triggerCount[5]) );
  DFFQX1 \triggerCount_reg[6]  ( .D(n45), .CK(clk), .Q(triggerCount[6]) );
  DFFQX1 \triggerCount_reg[4]  ( .D(n43), .CK(clk), .Q(triggerCount[4]) );
  DFFQX1 \triggerCount_reg[3]  ( .D(n42), .CK(clk), .Q(triggerCount[3]) );
  DFFTRX1 \a_reg[7]  ( .D(A[7]), .RN(rst_n), .CK(clk), .Q(a[7]) );
  DFFTRX1 \b_reg[7]  ( .D(B[7]), .RN(rst_n), .CK(clk), .Q(b[7]) );
  DFFTRX1 \a_reg[6]  ( .D(A[6]), .RN(rst_n), .CK(clk), .Q(a[6]) );
  DFFTRX1 \b_reg[6]  ( .D(B[6]), .RN(rst_n), .CK(clk), .Q(b[6]) );
  DFFTRX1 \a_reg[5]  ( .D(A[5]), .RN(rst_n), .CK(clk), .Q(a[5]) );
  DFFTRX1 \a_reg[4]  ( .D(A[4]), .RN(rst_n), .CK(clk), .Q(a[4]) );
  DFFTRX1 \b_reg[5]  ( .D(B[5]), .RN(rst_n), .CK(clk), .Q(b[5]) );
  DFFTRX1 \b_reg[4]  ( .D(B[4]), .RN(rst_n), .CK(clk), .Q(b[4]) );
  DFFTRX1 \a_reg[3]  ( .D(A[3]), .RN(rst_n), .CK(clk), .Q(a[3]) );
  DFFTRX1 \a_reg[2]  ( .D(A[2]), .RN(rst_n), .CK(clk), .Q(a[2]) );
  DFFTRX1 \a_reg[1]  ( .D(A[1]), .RN(rst_n), .CK(clk), .Q(a[1]) );
  DFFTRX1 \b_reg[3]  ( .D(B[3]), .RN(rst_n), .CK(clk), .Q(b[3]) );
  DFFTRX1 \b_reg[2]  ( .D(B[2]), .RN(rst_n), .CK(clk), .Q(b[2]) );
  DFFTRX1 \b_reg[1]  ( .D(B[1]), .RN(rst_n), .CK(clk), .Q(b[1]) );
  DFFTRX1 \a_reg[0]  ( .D(A[0]), .RN(rst_n), .CK(clk), .Q(a[0]) );
  DFFTRX1 \b_reg[0]  ( .D(B[0]), .RN(rst_n), .CK(clk), .Q(b[0]) );
  DFFTRX1 DONE_reg ( .D(n60), .RN(n7), .CK(clk), .Q(DONE) );
  DFFTRX1 \Aout_reg[7]  ( .D(A[7]), .RN(rst_n), .CK(clk), .Q(Aout[7]) );
  DFFTRX1 \Aout_reg[6]  ( .D(A[6]), .RN(rst_n), .CK(clk), .Q(Aout[6]) );
  DFFTRX1 \Aout_reg[5]  ( .D(A[5]), .RN(rst_n), .CK(clk), .Q(Aout[5]) );
  DFFTRX1 \Aout_reg[4]  ( .D(A[4]), .RN(rst_n), .CK(clk), .Q(Aout[4]) );
  DFFTRX1 \Aout_reg[3]  ( .D(A[3]), .RN(rst_n), .CK(clk), .Q(Aout[3]) );
  DFFTRX1 \Aout_reg[2]  ( .D(A[2]), .RN(rst_n), .CK(clk), .Q(Aout[2]) );
  DFFTRX1 \Aout_reg[1]  ( .D(A[1]), .RN(rst_n), .CK(clk), .Q(Aout[1]) );
  DFFTRX1 \Aout_reg[0]  ( .D(A[0]), .RN(rst_n), .CK(clk), .Q(Aout[0]) );
  DFFTRX1 \Bout_reg[7]  ( .D(B[7]), .RN(rst_n), .CK(clk), .Q(Bout[7]) );
  DFFTRX1 \Bout_reg[6]  ( .D(B[6]), .RN(rst_n), .CK(clk), .Q(Bout[6]) );
  DFFTRX1 \Bout_reg[5]  ( .D(B[5]), .RN(rst_n), .CK(clk), .Q(Bout[5]) );
  DFFTRX1 \Bout_reg[4]  ( .D(B[4]), .RN(rst_n), .CK(clk), .Q(Bout[4]) );
  DFFTRX1 \Bout_reg[3]  ( .D(B[3]), .RN(rst_n), .CK(clk), .Q(Bout[3]) );
  DFFTRX1 \Bout_reg[2]  ( .D(B[2]), .RN(rst_n), .CK(clk), .Q(Bout[2]) );
  DFFTRX1 \Bout_reg[1]  ( .D(B[1]), .RN(rst_n), .CK(clk), .Q(Bout[1]) );
  DFFTRX1 \Bout_reg[0]  ( .D(B[0]), .RN(rst_n), .CK(clk), .Q(Bout[0]) );
  AOI221XL U3 ( .A0(n63), .A1(n62), .B0(n6), .B1(state[1]), .C0(n2), .Y(n64)
         );
  CLKINVX1 U4 ( .A(n58), .Y(n4) );
  CLKINVX1 U5 ( .A(n65), .Y(n7) );
  AO22X1 U6 ( .A0(N71), .A1(n4), .B0(N79), .B1(n3), .Y(N20) );
  AO22X1 U8 ( .A0(N70), .A1(n4), .B0(N78), .B1(n3), .Y(N19) );
  AO22X1 U9 ( .A0(N69), .A1(n4), .B0(N77), .B1(n3), .Y(N18) );
  AO22X1 U10 ( .A0(N66), .A1(n4), .B0(N74), .B1(n3), .Y(N15) );
  AO22X1 U11 ( .A0(N68), .A1(n4), .B0(N76), .B1(n3), .Y(N17) );
  AO22X1 U12 ( .A0(N67), .A1(n4), .B0(N75), .B1(n3), .Y(N16) );
  AO22X1 U13 ( .A0(N65), .A1(n4), .B0(N73), .B1(n3), .Y(N14) );
  NAND2X1 U14 ( .A(rst_n), .B(n62), .Y(n65) );
  NAND2X1 U15 ( .A(n60), .B(n7), .Y(n58) );
  CLKINVX1 U16 ( .A(n57), .Y(n3) );
  CLKINVX1 U17 ( .A(n62), .Y(n6) );
  NOR2X1 U18 ( .A(n65), .B(n63), .Y(N9) );
  AO22X1 U19 ( .A0(N72), .A1(n4), .B0(N80), .B1(n3), .Y(N21) );
  NOR2BX1 U20 ( .AN(state[1]), .B(state[0]), .Y(n62) );
  OAI21XL U21 ( .A0(n60), .A1(n65), .B0(n59), .Y(n61) );
  OAI211X1 U22 ( .A0(state[0]), .A1(start), .B0(n6), .C0(rst_n), .Y(n59) );
  NAND4BX1 U23 ( .AN(triggerCount[0]), .B(triggerCount[7]), .C(n55), .D(n54), 
        .Y(n63) );
  NOR2X1 U24 ( .A(triggerCount[2]), .B(triggerCount[1]), .Y(n55) );
  NOR4X1 U25 ( .A(triggerCount[6]), .B(triggerCount[5]), .C(triggerCount[4]), 
        .D(triggerCount[3]), .Y(n54) );
  NOR2BX1 U26 ( .AN(n63), .B(n68), .Y(n60) );
  NOR3X1 U27 ( .A(n65), .B(n64), .C(n68), .Y(n66) );
  NAND3X1 U28 ( .A(n63), .B(n68), .C(n7), .Y(n57) );
  AO21X1 U29 ( .A0(n68), .A1(n7), .B0(n64), .Y(n67) );
  OAI21XL U30 ( .A0(count[0]), .A1(n57), .B0(n58), .Y(N11) );
  AO22X1 U31 ( .A0(n61), .A1(triggerCount[7]), .B0(N99), .B1(n4), .Y(n9) );
  AO22X1 U32 ( .A0(n61), .A1(triggerCount[0]), .B0(N92), .B1(n4), .Y(n39) );
  AO22X1 U33 ( .A0(Cout[1]), .A1(n67), .B0(c[1]), .B1(n66), .Y(n47) );
  AO22X1 U34 ( .A0(Cout[2]), .A1(n67), .B0(c[2]), .B1(n66), .Y(n48) );
  AO22X1 U35 ( .A0(Cout[3]), .A1(n67), .B0(c[3]), .B1(n66), .Y(n49) );
  AO22X1 U36 ( .A0(Cout[4]), .A1(n67), .B0(c[4]), .B1(n66), .Y(n50) );
  AO22X1 U37 ( .A0(Cout[5]), .A1(n67), .B0(c[5]), .B1(n66), .Y(n51) );
  AO22X1 U38 ( .A0(Cout[6]), .A1(n67), .B0(c[6]), .B1(n66), .Y(n52) );
  AO22X1 U39 ( .A0(Cout[7]), .A1(n67), .B0(c[7]), .B1(n66), .Y(n53) );
  AO22X1 U40 ( .A0(Cout[0]), .A1(n67), .B0(c[0]), .B1(n66), .Y(n46) );
  AO22X1 U41 ( .A0(n61), .A1(triggerCount[6]), .B0(N98), .B1(n4), .Y(n45) );
  AO22X1 U42 ( .A0(n61), .A1(triggerCount[5]), .B0(N97), .B1(n4), .Y(n44) );
  AO22X1 U43 ( .A0(n61), .A1(triggerCount[4]), .B0(N96), .B1(n4), .Y(n43) );
  AO22X1 U44 ( .A0(n61), .A1(triggerCount[3]), .B0(N95), .B1(n4), .Y(n42) );
  AO22X1 U45 ( .A0(n61), .A1(triggerCount[2]), .B0(N94), .B1(n4), .Y(n41) );
  AO22X1 U46 ( .A0(n61), .A1(triggerCount[1]), .B0(N93), .B1(n4), .Y(n40) );
  AND3X2 U47 ( .A(count[1]), .B(n3), .C(count[0]), .Y(N13) );
  NOR2X1 U48 ( .A(n56), .B(n57), .Y(N12) );
  XNOR2X1 U49 ( .A(count[0]), .B(count[1]), .Y(n56) );
  OAI31XL U50 ( .A0(n69), .A1(state[0]), .A2(n2), .B0(n65), .Y(N10) );
  CLKINVX1 U51 ( .A(rst_n), .Y(n2) );
endmodule


module PE_1_DW01_inc_0 ( A, SUM );
  input [7:0] A;
  output [7:0] SUM;

  wire   [7:2] carry;

  ADDHXL U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHXL U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  ADDHXL U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHXL U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHXL U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHXL U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  CLKINVX1 U1 ( .A(A[0]), .Y(SUM[0]) );
  XOR2X1 U2 ( .A(carry[7]), .B(A[7]), .Y(SUM[7]) );
endmodule


module PE_1_DW01_add_0 ( A, B, CI, SUM, CO );
  input [7:0] A;
  input [7:0] B;
  output [7:0] SUM;
  input CI;
  output CO;
  wire   n1, n2;
  wire   [7:1] carry;

  ADDFXL U1_1 ( .A(A[1]), .B(B[1]), .CI(carry[1]), .CO(carry[2]), .S(SUM[1])
         );
  ADDFXL U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  ADDFXL U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFXL U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  ADDFXL U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  ADDFXL U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  XOR3X1 U1_7 ( .A(A[7]), .B(B[7]), .C(carry[7]), .Y(SUM[7]) );
  XNOR2X1 U1 ( .A(B[0]), .B(n1), .Y(SUM[0]) );
  NOR2X1 U2 ( .A(n1), .B(n2), .Y(carry[1]) );
  CLKINVX1 U3 ( .A(B[0]), .Y(n2) );
  CLKINVX1 U4 ( .A(A[0]), .Y(n1) );
endmodule


module PE_1_DW_mult_uns_0 ( a, b, product );
  input [7:0] a;
  input [7:0] b;
  output [15:0] product;
  wire   n2, n3, n4, n5, n6, n7, n18, n19, n20, n21, n22, n23, n24, n25, n26,
         n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40,
         n41, n42, n43, n46, n48, n49, n51, n52, n53, n55, n56, n57, n58, n60,
         n61, n62, n63, n64, n66, n67, n68, n69, n70, n71, n73, n74, n75, n76,
         n77, n78, n123, n124, n125, n126, n127, n128, n129, n130, n131, n132,
         n133, n134, n135, n136, n137, n138, n139, n140, n141, n142, n143,
         n144, n145, n146, n147, n148, n149, n150, n151, n152, n153, n154;

  ADDFXL U3 ( .A(n20), .B(n27), .CI(n3), .CO(n2), .S(product[6]) );
  ADDFXL U4 ( .A(n28), .B(n34), .CI(n4), .CO(n3), .S(product[5]) );
  ADDFXL U5 ( .A(n35), .B(n38), .CI(n5), .CO(n4), .S(product[4]) );
  ADDFXL U6 ( .A(n39), .B(n41), .CI(n6), .CO(n5), .S(product[3]) );
  ADDFXL U7 ( .A(n7), .B(n64), .CI(n43), .CO(n6), .S(product[2]) );
  ADDHXL U8 ( .A(n71), .B(n78), .CO(n7), .S(product[1]) );
  CMPR42X1 U19 ( .A(n60), .B(n55), .C(n26), .D(n29), .ICI(n23), .S(n20), .ICO(
        n18), .CO(n19) );
  CMPR42X1 U20 ( .A(n73), .B(n51), .C(n66), .D(n31), .ICI(n25), .S(n23), .ICO(
        n21), .CO(n22) );
  ADDHXL U21 ( .A(n48), .B(n46), .CO(n24), .S(n25) );
  CMPR42X1 U22 ( .A(n67), .B(n61), .C(n33), .D(n32), .ICI(n30), .S(n28), .ICO(
        n26), .CO(n27) );
  ADDFXL U23 ( .A(n56), .B(n74), .CI(n36), .CO(n29), .S(n30) );
  ADDHXL U24 ( .A(n52), .B(n49), .CO(n31), .S(n32) );
  CMPR42X1 U25 ( .A(n75), .B(n62), .C(n68), .D(n40), .ICI(n37), .S(n35), .ICO(
        n33), .CO(n34) );
  ADDHXL U26 ( .A(n57), .B(n53), .CO(n36), .S(n37) );
  ADDFXL U27 ( .A(n69), .B(n76), .CI(n42), .CO(n38), .S(n39) );
  ADDHXL U28 ( .A(n63), .B(n58), .CO(n40), .S(n41) );
  ADDHXL U29 ( .A(n77), .B(n70), .CO(n42), .S(n43) );
  CLKINVX1 U84 ( .A(a[0]), .Y(n134) );
  CLKINVX1 U85 ( .A(b[0]), .Y(n128) );
  CLKINVX1 U86 ( .A(b[1]), .Y(n127) );
  CLKINVX1 U87 ( .A(a[1]), .Y(n133) );
  CLKINVX1 U88 ( .A(b[2]), .Y(n126) );
  CLKINVX1 U89 ( .A(a[2]), .Y(n132) );
  CLKINVX1 U90 ( .A(a[3]), .Y(n131) );
  CLKINVX1 U91 ( .A(b[3]), .Y(n125) );
  CLKINVX1 U92 ( .A(b[4]), .Y(n124) );
  CLKINVX1 U93 ( .A(a[4]), .Y(n130) );
  CLKINVX1 U94 ( .A(a[5]), .Y(n129) );
  CLKINVX1 U95 ( .A(b[5]), .Y(n123) );
  XOR2X1 U96 ( .A(n135), .B(n136), .Y(product[7]) );
  XOR2X1 U97 ( .A(n137), .B(n138), .Y(n136) );
  XOR2X1 U98 ( .A(n18), .B(n139), .Y(n138) );
  NOR2X1 U99 ( .A(n131), .B(n124), .Y(n139) );
  XOR2X1 U100 ( .A(n140), .B(n141), .Y(n137) );
  XOR2X1 U101 ( .A(n142), .B(n143), .Y(n141) );
  XOR2X1 U102 ( .A(n144), .B(n145), .Y(n143) );
  NAND2X1 U103 ( .A(b[5]), .B(a[2]), .Y(n145) );
  NAND2X1 U104 ( .A(b[6]), .B(a[1]), .Y(n144) );
  XOR2X1 U105 ( .A(n146), .B(n147), .Y(n142) );
  NAND2X1 U106 ( .A(b[3]), .B(a[4]), .Y(n147) );
  NAND2X1 U107 ( .A(b[1]), .B(a[6]), .Y(n146) );
  XOR2X1 U108 ( .A(n148), .B(n149), .Y(n140) );
  XOR2X1 U109 ( .A(n150), .B(n151), .Y(n149) );
  NAND2X1 U110 ( .A(b[0]), .B(a[7]), .Y(n151) );
  NAND2X1 U111 ( .A(b[2]), .B(a[5]), .Y(n150) );
  XNOR2X1 U112 ( .A(n24), .B(n152), .Y(n148) );
  NAND2X1 U113 ( .A(b[7]), .B(a[0]), .Y(n152) );
  XOR2X1 U114 ( .A(n153), .B(n154), .Y(n135) );
  XNOR2X1 U115 ( .A(n2), .B(n19), .Y(n154) );
  XNOR2X1 U116 ( .A(n22), .B(n21), .Y(n153) );
  NOR2X1 U117 ( .A(n134), .B(n128), .Y(product[0]) );
  NOR2X1 U118 ( .A(n134), .B(n127), .Y(n78) );
  NOR2X1 U119 ( .A(n134), .B(n126), .Y(n77) );
  NOR2X1 U120 ( .A(n134), .B(n125), .Y(n76) );
  NOR2X1 U121 ( .A(n134), .B(n124), .Y(n75) );
  NOR2X1 U122 ( .A(n134), .B(n123), .Y(n74) );
  AND2X1 U123 ( .A(b[6]), .B(a[0]), .Y(n73) );
  NOR2X1 U124 ( .A(n128), .B(n133), .Y(n71) );
  NOR2X1 U125 ( .A(n127), .B(n133), .Y(n70) );
  NOR2X1 U126 ( .A(n126), .B(n133), .Y(n69) );
  NOR2X1 U127 ( .A(n125), .B(n133), .Y(n68) );
  NOR2X1 U128 ( .A(n133), .B(n124), .Y(n67) );
  NOR2X1 U129 ( .A(n133), .B(n123), .Y(n66) );
  NOR2X1 U130 ( .A(n128), .B(n132), .Y(n64) );
  NOR2X1 U131 ( .A(n127), .B(n132), .Y(n63) );
  NOR2X1 U132 ( .A(n126), .B(n132), .Y(n62) );
  NOR2X1 U133 ( .A(n125), .B(n132), .Y(n61) );
  NOR2X1 U134 ( .A(n132), .B(n124), .Y(n60) );
  NOR2X1 U135 ( .A(n128), .B(n131), .Y(n58) );
  NOR2X1 U136 ( .A(n127), .B(n131), .Y(n57) );
  NOR2X1 U137 ( .A(n126), .B(n131), .Y(n56) );
  NOR2X1 U138 ( .A(n125), .B(n131), .Y(n55) );
  NOR2X1 U139 ( .A(n128), .B(n130), .Y(n53) );
  NOR2X1 U140 ( .A(n127), .B(n130), .Y(n52) );
  NOR2X1 U141 ( .A(n126), .B(n130), .Y(n51) );
  NOR2X1 U142 ( .A(n129), .B(n128), .Y(n49) );
  NOR2X1 U143 ( .A(n129), .B(n127), .Y(n48) );
  AND2X1 U144 ( .A(a[6]), .B(b[0]), .Y(n46) );
endmodule


module PE_1 ( clk, rst_n, START, A, B, Aout, Bout, Cout, DONE );
  input [7:0] A;
  input [7:0] B;
  output [7:0] Aout;
  output [7:0] Bout;
  output [7:0] Cout;
  input clk, rst_n, START;
  output DONE;
  wire   start, N9, N10, N11, N12, N13, N14, N15, N16, N17, N18, N19, N20, N21,
         N65, N66, N67, N68, N69, N70, N71, N72, N73, N74, N75, N76, N77, N78,
         N79, N80, N92, N93, N94, N95, N96, N97, N98, N99, n2, n3, n4, n6, n7,
         n9, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51,
         n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65,
         n66, n67, n68, n69;
  wire   [1:0] state;
  wire   [2:0] count;
  wire   [7:0] c;
  wire   [7:0] triggerCount;
  wire   [7:0] a;
  wire   [7:0] b;
  wire   SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, 
        SYNOPSYS_UNCONNECTED__4, SYNOPSYS_UNCONNECTED__5, 
        SYNOPSYS_UNCONNECTED__6, SYNOPSYS_UNCONNECTED__7;

  PE_1_DW01_inc_0 add_98 ( .A(triggerCount), .SUM({N99, N98, N97, N96, N95, 
        N94, N93, N92}) );
  PE_1_DW01_add_0 add_88 ( .A(c), .B({N72, N71, N70, N69, N68, N67, N66, N65}), 
        .CI(1'b0), .SUM({N80, N79, N78, N77, N76, N75, N74, N73}) );
  PE_1_DW_mult_uns_0 r319 ( .a(a), .b(b), .product({SYNOPSYS_UNCONNECTED__0, 
        SYNOPSYS_UNCONNECTED__1, SYNOPSYS_UNCONNECTED__2, 
        SYNOPSYS_UNCONNECTED__3, SYNOPSYS_UNCONNECTED__4, 
        SYNOPSYS_UNCONNECTED__5, SYNOPSYS_UNCONNECTED__6, 
        SYNOPSYS_UNCONNECTED__7, N72, N71, N70, N69, N68, N67, N66, N65}) );
  DFFQX1 \Cout_reg[7]  ( .D(n53), .CK(clk), .Q(Cout[7]) );
  DFFQX1 \Cout_reg[6]  ( .D(n52), .CK(clk), .Q(Cout[6]) );
  DFFQX1 \Cout_reg[5]  ( .D(n51), .CK(clk), .Q(Cout[5]) );
  DFFQX1 \Cout_reg[4]  ( .D(n50), .CK(clk), .Q(Cout[4]) );
  DFFQX1 \Cout_reg[3]  ( .D(n49), .CK(clk), .Q(Cout[3]) );
  DFFQX1 \Cout_reg[2]  ( .D(n48), .CK(clk), .Q(Cout[2]) );
  DFFQX1 \Cout_reg[1]  ( .D(n47), .CK(clk), .Q(Cout[1]) );
  DFFQX1 \Cout_reg[0]  ( .D(n46), .CK(clk), .Q(Cout[0]) );
  DFFQX1 \c_reg[7]  ( .D(N21), .CK(clk), .Q(c[7]) );
  DFFQX1 \count_reg[1]  ( .D(N12), .CK(clk), .Q(count[1]) );
  DFFQX1 \count_reg[0]  ( .D(N11), .CK(clk), .Q(count[0]) );
  DFFX1 \count_reg[2]  ( .D(N13), .CK(clk), .QN(n68) );
  DFFTRX1 start_reg ( .D(START), .RN(rst_n), .CK(clk), .Q(start), .QN(n69) );
  DFFQX1 \state_reg[1]  ( .D(N10), .CK(clk), .Q(state[1]) );
  DFFQX1 \state_reg[0]  ( .D(N9), .CK(clk), .Q(state[0]) );
  DFFQX1 \c_reg[1]  ( .D(N15), .CK(clk), .Q(c[1]) );
  DFFQX1 \c_reg[2]  ( .D(N16), .CK(clk), .Q(c[2]) );
  DFFQX1 \c_reg[3]  ( .D(N17), .CK(clk), .Q(c[3]) );
  DFFQX1 \c_reg[4]  ( .D(N18), .CK(clk), .Q(c[4]) );
  DFFQX1 \c_reg[5]  ( .D(N19), .CK(clk), .Q(c[5]) );
  DFFQX1 \c_reg[6]  ( .D(N20), .CK(clk), .Q(c[6]) );
  DFFQX1 \triggerCount_reg[7]  ( .D(n9), .CK(clk), .Q(triggerCount[7]) );
  DFFQX1 \c_reg[0]  ( .D(N14), .CK(clk), .Q(c[0]) );
  DFFQX1 \triggerCount_reg[0]  ( .D(n39), .CK(clk), .Q(triggerCount[0]) );
  DFFQX1 \triggerCount_reg[1]  ( .D(n40), .CK(clk), .Q(triggerCount[1]) );
  DFFQX1 \triggerCount_reg[2]  ( .D(n41), .CK(clk), .Q(triggerCount[2]) );
  DFFQX1 \triggerCount_reg[5]  ( .D(n44), .CK(clk), .Q(triggerCount[5]) );
  DFFQX1 \triggerCount_reg[6]  ( .D(n45), .CK(clk), .Q(triggerCount[6]) );
  DFFQX1 \triggerCount_reg[4]  ( .D(n43), .CK(clk), .Q(triggerCount[4]) );
  DFFQX1 \triggerCount_reg[3]  ( .D(n42), .CK(clk), .Q(triggerCount[3]) );
  DFFTRX1 \a_reg[7]  ( .D(A[7]), .RN(rst_n), .CK(clk), .Q(a[7]) );
  DFFTRX1 \b_reg[7]  ( .D(B[7]), .RN(rst_n), .CK(clk), .Q(b[7]) );
  DFFTRX1 DONE_reg ( .D(n60), .RN(n7), .CK(clk), .Q(DONE) );
  DFFTRX1 \a_reg[6]  ( .D(A[6]), .RN(rst_n), .CK(clk), .Q(a[6]) );
  DFFTRX1 \b_reg[6]  ( .D(B[6]), .RN(rst_n), .CK(clk), .Q(b[6]) );
  DFFTRX1 \a_reg[5]  ( .D(A[5]), .RN(rst_n), .CK(clk), .Q(a[5]) );
  DFFTRX1 \a_reg[4]  ( .D(A[4]), .RN(rst_n), .CK(clk), .Q(a[4]) );
  DFFTRX1 \b_reg[5]  ( .D(B[5]), .RN(rst_n), .CK(clk), .Q(b[5]) );
  DFFTRX1 \b_reg[4]  ( .D(B[4]), .RN(rst_n), .CK(clk), .Q(b[4]) );
  DFFTRX1 \a_reg[3]  ( .D(A[3]), .RN(rst_n), .CK(clk), .Q(a[3]) );
  DFFTRX1 \a_reg[2]  ( .D(A[2]), .RN(rst_n), .CK(clk), .Q(a[2]) );
  DFFTRX1 \a_reg[1]  ( .D(A[1]), .RN(rst_n), .CK(clk), .Q(a[1]) );
  DFFTRX1 \b_reg[3]  ( .D(B[3]), .RN(rst_n), .CK(clk), .Q(b[3]) );
  DFFTRX1 \b_reg[2]  ( .D(B[2]), .RN(rst_n), .CK(clk), .Q(b[2]) );
  DFFTRX1 \b_reg[1]  ( .D(B[1]), .RN(rst_n), .CK(clk), .Q(b[1]) );
  DFFTRX1 \a_reg[0]  ( .D(A[0]), .RN(rst_n), .CK(clk), .Q(a[0]) );
  DFFTRX1 \b_reg[0]  ( .D(B[0]), .RN(rst_n), .CK(clk), .Q(b[0]) );
  DFFTRX1 \Bout_reg[7]  ( .D(B[7]), .RN(rst_n), .CK(clk), .Q(Bout[7]) );
  DFFTRX1 \Bout_reg[6]  ( .D(B[6]), .RN(rst_n), .CK(clk), .Q(Bout[6]) );
  DFFTRX1 \Bout_reg[5]  ( .D(B[5]), .RN(rst_n), .CK(clk), .Q(Bout[5]) );
  DFFTRX1 \Bout_reg[4]  ( .D(B[4]), .RN(rst_n), .CK(clk), .Q(Bout[4]) );
  DFFTRX1 \Bout_reg[3]  ( .D(B[3]), .RN(rst_n), .CK(clk), .Q(Bout[3]) );
  DFFTRX1 \Bout_reg[2]  ( .D(B[2]), .RN(rst_n), .CK(clk), .Q(Bout[2]) );
  DFFTRX1 \Bout_reg[1]  ( .D(B[1]), .RN(rst_n), .CK(clk), .Q(Bout[1]) );
  DFFTRX1 \Bout_reg[0]  ( .D(B[0]), .RN(rst_n), .CK(clk), .Q(Bout[0]) );
  DFFTRX1 \Aout_reg[7]  ( .D(A[7]), .RN(rst_n), .CK(clk), .Q(Aout[7]) );
  DFFTRX1 \Aout_reg[6]  ( .D(A[6]), .RN(rst_n), .CK(clk), .Q(Aout[6]) );
  DFFTRX1 \Aout_reg[5]  ( .D(A[5]), .RN(rst_n), .CK(clk), .Q(Aout[5]) );
  DFFTRX1 \Aout_reg[4]  ( .D(A[4]), .RN(rst_n), .CK(clk), .Q(Aout[4]) );
  DFFTRX1 \Aout_reg[3]  ( .D(A[3]), .RN(rst_n), .CK(clk), .Q(Aout[3]) );
  DFFTRX1 \Aout_reg[2]  ( .D(A[2]), .RN(rst_n), .CK(clk), .Q(Aout[2]) );
  DFFTRX1 \Aout_reg[1]  ( .D(A[1]), .RN(rst_n), .CK(clk), .Q(Aout[1]) );
  DFFTRX1 \Aout_reg[0]  ( .D(A[0]), .RN(rst_n), .CK(clk), .Q(Aout[0]) );
  AOI221XL U3 ( .A0(n63), .A1(n62), .B0(n6), .B1(state[1]), .C0(n2), .Y(n64)
         );
  CLKINVX1 U4 ( .A(n58), .Y(n4) );
  CLKINVX1 U5 ( .A(n65), .Y(n7) );
  AO22X1 U6 ( .A0(N71), .A1(n4), .B0(N79), .B1(n3), .Y(N20) );
  AO22X1 U8 ( .A0(N70), .A1(n4), .B0(N78), .B1(n3), .Y(N19) );
  AO22X1 U9 ( .A0(N69), .A1(n4), .B0(N77), .B1(n3), .Y(N18) );
  AO22X1 U10 ( .A0(N66), .A1(n4), .B0(N74), .B1(n3), .Y(N15) );
  AO22X1 U11 ( .A0(N68), .A1(n4), .B0(N76), .B1(n3), .Y(N17) );
  AO22X1 U12 ( .A0(N67), .A1(n4), .B0(N75), .B1(n3), .Y(N16) );
  AO22X1 U13 ( .A0(N65), .A1(n4), .B0(N73), .B1(n3), .Y(N14) );
  NAND2X1 U14 ( .A(rst_n), .B(n62), .Y(n65) );
  NAND2X1 U15 ( .A(n60), .B(n7), .Y(n58) );
  CLKINVX1 U16 ( .A(n57), .Y(n3) );
  CLKINVX1 U17 ( .A(n62), .Y(n6) );
  NOR2X1 U18 ( .A(n65), .B(n63), .Y(N9) );
  AO22X1 U19 ( .A0(N72), .A1(n4), .B0(N80), .B1(n3), .Y(N21) );
  NOR2BX1 U20 ( .AN(state[1]), .B(state[0]), .Y(n62) );
  OAI21XL U21 ( .A0(n60), .A1(n65), .B0(n59), .Y(n61) );
  OAI211X1 U22 ( .A0(state[0]), .A1(start), .B0(n6), .C0(rst_n), .Y(n59) );
  NAND4BX1 U23 ( .AN(triggerCount[0]), .B(triggerCount[7]), .C(n55), .D(n54), 
        .Y(n63) );
  NOR2X1 U24 ( .A(triggerCount[2]), .B(triggerCount[1]), .Y(n55) );
  NOR4X1 U25 ( .A(triggerCount[6]), .B(triggerCount[5]), .C(triggerCount[4]), 
        .D(triggerCount[3]), .Y(n54) );
  NOR2BX1 U26 ( .AN(n63), .B(n68), .Y(n60) );
  NOR3X1 U27 ( .A(n65), .B(n64), .C(n68), .Y(n66) );
  NAND3X1 U28 ( .A(n63), .B(n68), .C(n7), .Y(n57) );
  AO21X1 U29 ( .A0(n68), .A1(n7), .B0(n64), .Y(n67) );
  OAI21XL U30 ( .A0(count[0]), .A1(n57), .B0(n58), .Y(N11) );
  AO22X1 U31 ( .A0(n61), .A1(triggerCount[7]), .B0(N99), .B1(n4), .Y(n9) );
  AO22X1 U32 ( .A0(n61), .A1(triggerCount[0]), .B0(N92), .B1(n4), .Y(n39) );
  AO22X1 U33 ( .A0(Cout[1]), .A1(n67), .B0(c[1]), .B1(n66), .Y(n47) );
  AO22X1 U34 ( .A0(Cout[2]), .A1(n67), .B0(c[2]), .B1(n66), .Y(n48) );
  AO22X1 U35 ( .A0(Cout[3]), .A1(n67), .B0(c[3]), .B1(n66), .Y(n49) );
  AO22X1 U36 ( .A0(Cout[4]), .A1(n67), .B0(c[4]), .B1(n66), .Y(n50) );
  AO22X1 U37 ( .A0(Cout[5]), .A1(n67), .B0(c[5]), .B1(n66), .Y(n51) );
  AO22X1 U38 ( .A0(Cout[6]), .A1(n67), .B0(c[6]), .B1(n66), .Y(n52) );
  AO22X1 U39 ( .A0(Cout[7]), .A1(n67), .B0(c[7]), .B1(n66), .Y(n53) );
  AO22X1 U40 ( .A0(Cout[0]), .A1(n67), .B0(c[0]), .B1(n66), .Y(n46) );
  AO22X1 U41 ( .A0(n61), .A1(triggerCount[6]), .B0(N98), .B1(n4), .Y(n45) );
  AO22X1 U42 ( .A0(n61), .A1(triggerCount[5]), .B0(N97), .B1(n4), .Y(n44) );
  AO22X1 U43 ( .A0(n61), .A1(triggerCount[4]), .B0(N96), .B1(n4), .Y(n43) );
  AO22X1 U44 ( .A0(n61), .A1(triggerCount[3]), .B0(N95), .B1(n4), .Y(n42) );
  AO22X1 U45 ( .A0(n61), .A1(triggerCount[2]), .B0(N94), .B1(n4), .Y(n41) );
  AO22X1 U46 ( .A0(n61), .A1(triggerCount[1]), .B0(N93), .B1(n4), .Y(n40) );
  AND3X2 U47 ( .A(count[1]), .B(n3), .C(count[0]), .Y(N13) );
  NOR2X1 U48 ( .A(n56), .B(n57), .Y(N12) );
  XNOR2X1 U49 ( .A(count[0]), .B(count[1]), .Y(n56) );
  OAI31XL U50 ( .A0(n69), .A1(state[0]), .A2(n2), .B0(n65), .Y(N10) );
  CLKINVX1 U51 ( .A(rst_n), .Y(n2) );
endmodule


module TOP_PE_DW01_inc_0 ( A, SUM );
  input [10:0] A;
  output [10:0] SUM;

  wire   [10:2] carry;

  ADDHXL U1_1_9 ( .A(A[9]), .B(carry[9]), .CO(carry[10]), .S(SUM[9]) );
  ADDHXL U1_1_8 ( .A(A[8]), .B(carry[8]), .CO(carry[9]), .S(SUM[8]) );
  ADDHXL U1_1_7 ( .A(A[7]), .B(carry[7]), .CO(carry[8]), .S(SUM[7]) );
  ADDHXL U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHXL U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHXL U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHXL U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHXL U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHXL U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  CLKINVX1 U1 ( .A(A[0]), .Y(SUM[0]) );
  XOR2X1 U2 ( .A(carry[10]), .B(A[10]), .Y(SUM[10]) );
endmodule


module TOP_PE_DW01_inc_1 ( A, SUM );
  input [10:0] A;
  output [10:0] SUM;

  wire   [10:2] carry;

  ADDHXL U1_1_9 ( .A(A[9]), .B(carry[9]), .CO(carry[10]), .S(SUM[9]) );
  ADDHXL U1_1_8 ( .A(A[8]), .B(carry[8]), .CO(carry[9]), .S(SUM[8]) );
  ADDHXL U1_1_7 ( .A(A[7]), .B(carry[7]), .CO(carry[8]), .S(SUM[7]) );
  ADDHXL U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHXL U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHXL U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHXL U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHXL U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHXL U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  CLKINVX1 U1 ( .A(A[0]), .Y(SUM[0]) );
  XOR2X1 U2 ( .A(carry[10]), .B(A[10]), .Y(SUM[10]) );
endmodule


module TOP_PE_DW01_inc_2 ( A, SUM );
  input [10:0] A;
  output [10:0] SUM;

  wire   [10:2] carry;

  ADDHXL U1_1_9 ( .A(A[9]), .B(carry[9]), .CO(carry[10]), .S(SUM[9]) );
  ADDHXL U1_1_8 ( .A(A[8]), .B(carry[8]), .CO(carry[9]), .S(SUM[8]) );
  ADDHXL U1_1_7 ( .A(A[7]), .B(carry[7]), .CO(carry[8]), .S(SUM[7]) );
  ADDHXL U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHXL U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHXL U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHXL U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHXL U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHXL U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  CLKINVX1 U1 ( .A(A[0]), .Y(SUM[0]) );
  XOR2X1 U2 ( .A(carry[10]), .B(A[10]), .Y(SUM[10]) );
endmodule


module TOP_PE_DW01_inc_3 ( A, SUM );
  input [10:0] A;
  output [10:0] SUM;

  wire   [10:2] carry;

  ADDHXL U1_1_9 ( .A(A[9]), .B(carry[9]), .CO(carry[10]), .S(SUM[9]) );
  ADDHXL U1_1_8 ( .A(A[8]), .B(carry[8]), .CO(carry[9]), .S(SUM[8]) );
  ADDHXL U1_1_7 ( .A(A[7]), .B(carry[7]), .CO(carry[8]), .S(SUM[7]) );
  ADDHXL U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHXL U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHXL U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHXL U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHXL U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHXL U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  CLKINVX1 U1 ( .A(A[0]), .Y(SUM[0]) );
  XOR2X1 U2 ( .A(carry[10]), .B(A[10]), .Y(SUM[10]) );
endmodule


module TOP_PE_DW01_inc_4 ( A, SUM );
  input [10:0] A;
  output [10:0] SUM;

  wire   [10:2] carry;

  ADDHXL U1_1_9 ( .A(A[9]), .B(carry[9]), .CO(carry[10]), .S(SUM[9]) );
  ADDHXL U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  ADDHXL U1_1_8 ( .A(A[8]), .B(carry[8]), .CO(carry[9]), .S(SUM[8]) );
  ADDHXL U1_1_7 ( .A(A[7]), .B(carry[7]), .CO(carry[8]), .S(SUM[7]) );
  ADDHXL U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHXL U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHXL U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHXL U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHXL U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  CLKINVX1 U1 ( .A(A[0]), .Y(SUM[0]) );
  XOR2X1 U2 ( .A(carry[10]), .B(A[10]), .Y(SUM[10]) );
endmodule


module TOP_PE_DW01_inc_5 ( A, SUM );
  input [10:0] A;
  output [10:0] SUM;

  wire   [10:2] carry;

  ADDHXL U1_1_9 ( .A(A[9]), .B(carry[9]), .CO(carry[10]), .S(SUM[9]) );
  ADDHXL U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  ADDHXL U1_1_8 ( .A(A[8]), .B(carry[8]), .CO(carry[9]), .S(SUM[8]) );
  ADDHXL U1_1_7 ( .A(A[7]), .B(carry[7]), .CO(carry[8]), .S(SUM[7]) );
  ADDHXL U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHXL U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHXL U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHXL U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHXL U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  CLKINVX1 U1 ( .A(A[0]), .Y(SUM[0]) );
  XOR2X1 U2 ( .A(carry[10]), .B(A[10]), .Y(SUM[10]) );
endmodule


module TOP_PE_DW01_inc_6 ( A, SUM );
  input [10:0] A;
  output [10:0] SUM;

  wire   [10:2] carry;

  ADDHXL U1_1_9 ( .A(A[9]), .B(carry[9]), .CO(carry[10]), .S(SUM[9]) );
  ADDHXL U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  ADDHXL U1_1_8 ( .A(A[8]), .B(carry[8]), .CO(carry[9]), .S(SUM[8]) );
  ADDHXL U1_1_7 ( .A(A[7]), .B(carry[7]), .CO(carry[8]), .S(SUM[7]) );
  ADDHXL U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHXL U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHXL U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHXL U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHXL U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  CLKINVX1 U1 ( .A(A[0]), .Y(SUM[0]) );
  XOR2X1 U2 ( .A(carry[10]), .B(A[10]), .Y(SUM[10]) );
endmodule


module TOP_PE_DW01_inc_7 ( A, SUM );
  input [10:0] A;
  output [10:0] SUM;

  wire   [10:2] carry;

  ADDHXL U1_1_9 ( .A(A[9]), .B(carry[9]), .CO(carry[10]), .S(SUM[9]) );
  ADDHXL U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  ADDHXL U1_1_8 ( .A(A[8]), .B(carry[8]), .CO(carry[9]), .S(SUM[8]) );
  ADDHXL U1_1_7 ( .A(A[7]), .B(carry[7]), .CO(carry[8]), .S(SUM[7]) );
  ADDHXL U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHXL U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHXL U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHXL U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHXL U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  CLKINVX1 U1 ( .A(A[0]), .Y(SUM[0]) );
  XOR2X1 U2 ( .A(carry[10]), .B(A[10]), .Y(SUM[10]) );
endmodule


module TOP_PE ( clk, rst_n, START, AIN, BIN, addrA, addrB, addrC, wenC, COUT, 
        FINISH );
  input [31:0] AIN;
  input [31:0] BIN;
  output [43:0] addrA;
  output [43:0] addrB;
  output [43:0] addrC;
  output [3:0] wenC;
  output [31:0] COUT;
  input clk, rst_n, START;
  output FINISH;
  wire   \Cout[4][4][7] , \Cout[4][4][6] , \Cout[4][4][5] , \Cout[4][4][4] ,
         \Cout[4][4][3] , \Cout[4][4][2] , \Cout[4][4][1] , \Cout[4][4][0] ,
         \Cout[4][3][7] , \Cout[4][3][6] , \Cout[4][3][5] , \Cout[4][3][4] ,
         \Cout[4][3][3] , \Cout[4][3][2] , \Cout[4][3][1] , \Cout[4][3][0] ,
         \Cout[4][2][7] , \Cout[4][2][6] , \Cout[4][2][5] , \Cout[4][2][4] ,
         \Cout[4][2][3] , \Cout[4][2][2] , \Cout[4][2][1] , \Cout[4][2][0] ,
         \Cout[4][1][7] , \Cout[4][1][6] , \Cout[4][1][5] , \Cout[4][1][4] ,
         \Cout[4][1][3] , \Cout[4][1][2] , \Cout[4][1][1] , \Cout[4][1][0] ,
         \Cout[3][4][7] , \Cout[3][4][6] , \Cout[3][4][5] , \Cout[3][4][4] ,
         \Cout[3][4][3] , \Cout[3][4][2] , \Cout[3][4][1] , \Cout[3][4][0] ,
         \Cout[3][3][7] , \Cout[3][3][6] , \Cout[3][3][5] , \Cout[3][3][4] ,
         \Cout[3][3][3] , \Cout[3][3][2] , \Cout[3][3][1] , \Cout[3][3][0] ,
         \Cout[3][2][7] , \Cout[3][2][6] , \Cout[3][2][5] , \Cout[3][2][4] ,
         \Cout[3][2][3] , \Cout[3][2][2] , \Cout[3][2][1] , \Cout[3][2][0] ,
         \Cout[3][1][7] , \Cout[3][1][6] , \Cout[3][1][5] , \Cout[3][1][4] ,
         \Cout[3][1][3] , \Cout[3][1][2] , \Cout[3][1][1] , \Cout[3][1][0] ,
         \Cout[2][4][7] , \Cout[2][4][6] , \Cout[2][4][5] , \Cout[2][4][4] ,
         \Cout[2][4][3] , \Cout[2][4][2] , \Cout[2][4][1] , \Cout[2][4][0] ,
         \Cout[2][3][7] , \Cout[2][3][6] , \Cout[2][3][5] , \Cout[2][3][4] ,
         \Cout[2][3][3] , \Cout[2][3][2] , \Cout[2][3][1] , \Cout[2][3][0] ,
         \Cout[2][2][7] , \Cout[2][2][6] , \Cout[2][2][5] , \Cout[2][2][4] ,
         \Cout[2][2][3] , \Cout[2][2][2] , \Cout[2][2][1] , \Cout[2][2][0] ,
         \Cout[2][1][7] , \Cout[2][1][6] , \Cout[2][1][5] , \Cout[2][1][4] ,
         \Cout[2][1][3] , \Cout[2][1][2] , \Cout[2][1][1] , \Cout[2][1][0] ,
         \Cout[1][4][7] , \Cout[1][4][6] , \Cout[1][4][5] , \Cout[1][4][4] ,
         \Cout[1][4][3] , \Cout[1][4][2] , \Cout[1][4][1] , \Cout[1][4][0] ,
         \Cout[1][3][7] , \Cout[1][3][6] , \Cout[1][3][5] , \Cout[1][3][4] ,
         \Cout[1][3][3] , \Cout[1][3][2] , \Cout[1][3][1] , \Cout[1][3][0] ,
         \Cout[1][2][7] , \Cout[1][2][6] , \Cout[1][2][5] , \Cout[1][2][4] ,
         \Cout[1][2][3] , \Cout[1][2][2] , \Cout[1][2][1] , \Cout[1][2][0] ,
         \Cout[1][1][7] , \Cout[1][1][6] , \Cout[1][1][5] , \Cout[1][1][4] ,
         \Cout[1][1][3] , \Cout[1][1][2] , \Cout[1][1][1] , \Cout[1][1][0] ,
         \Bout[4][3][7] , \Bout[4][3][6] , \Bout[4][3][5] , \Bout[4][3][4] ,
         \Bout[4][3][3] , \Bout[4][3][2] , \Bout[4][3][1] , \Bout[4][3][0] ,
         \Bout[4][2][7] , \Bout[4][2][6] , \Bout[4][2][5] , \Bout[4][2][4] ,
         \Bout[4][2][3] , \Bout[4][2][2] , \Bout[4][2][1] , \Bout[4][2][0] ,
         \Bout[4][1][7] , \Bout[4][1][6] , \Bout[4][1][5] , \Bout[4][1][4] ,
         \Bout[4][1][3] , \Bout[4][1][2] , \Bout[4][1][1] , \Bout[4][1][0] ,
         \Bout[3][3][7] , \Bout[3][3][6] , \Bout[3][3][5] , \Bout[3][3][4] ,
         \Bout[3][3][3] , \Bout[3][3][2] , \Bout[3][3][1] , \Bout[3][3][0] ,
         \Bout[3][2][7] , \Bout[3][2][6] , \Bout[3][2][5] , \Bout[3][2][4] ,
         \Bout[3][2][3] , \Bout[3][2][2] , \Bout[3][2][1] , \Bout[3][2][0] ,
         \Bout[3][1][7] , \Bout[3][1][6] , \Bout[3][1][5] , \Bout[3][1][4] ,
         \Bout[3][1][3] , \Bout[3][1][2] , \Bout[3][1][1] , \Bout[3][1][0] ,
         \Bout[2][3][7] , \Bout[2][3][6] , \Bout[2][3][5] , \Bout[2][3][4] ,
         \Bout[2][3][3] , \Bout[2][3][2] , \Bout[2][3][1] , \Bout[2][3][0] ,
         \Bout[2][2][7] , \Bout[2][2][6] , \Bout[2][2][5] , \Bout[2][2][4] ,
         \Bout[2][2][3] , \Bout[2][2][2] , \Bout[2][2][1] , \Bout[2][2][0] ,
         \Bout[2][1][7] , \Bout[2][1][6] , \Bout[2][1][5] , \Bout[2][1][4] ,
         \Bout[2][1][3] , \Bout[2][1][2] , \Bout[2][1][1] , \Bout[2][1][0] ,
         \Bout[1][3][7] , \Bout[1][3][6] , \Bout[1][3][5] , \Bout[1][3][4] ,
         \Bout[1][3][3] , \Bout[1][3][2] , \Bout[1][3][1] , \Bout[1][3][0] ,
         \Bout[1][2][7] , \Bout[1][2][6] , \Bout[1][2][5] , \Bout[1][2][4] ,
         \Bout[1][2][3] , \Bout[1][2][2] , \Bout[1][2][1] , \Bout[1][2][0] ,
         \Bout[1][1][7] , \Bout[1][1][6] , \Bout[1][1][5] , \Bout[1][1][4] ,
         \Bout[1][1][3] , \Bout[1][1][2] , \Bout[1][1][1] , \Bout[1][1][0] ,
         \Aout[3][4][7] , \Aout[3][4][6] , \Aout[3][4][5] , \Aout[3][4][4] ,
         \Aout[3][4][3] , \Aout[3][4][2] , \Aout[3][4][1] , \Aout[3][4][0] ,
         \Aout[3][3][7] , \Aout[3][3][6] , \Aout[3][3][5] , \Aout[3][3][4] ,
         \Aout[3][3][3] , \Aout[3][3][2] , \Aout[3][3][1] , \Aout[3][3][0] ,
         \Aout[3][2][7] , \Aout[3][2][6] , \Aout[3][2][5] , \Aout[3][2][4] ,
         \Aout[3][2][3] , \Aout[3][2][2] , \Aout[3][2][1] , \Aout[3][2][0] ,
         \Aout[3][1][7] , \Aout[3][1][6] , \Aout[3][1][5] , \Aout[3][1][4] ,
         \Aout[3][1][3] , \Aout[3][1][2] , \Aout[3][1][1] , \Aout[3][1][0] ,
         \Aout[2][4][7] , \Aout[2][4][6] , \Aout[2][4][5] , \Aout[2][4][4] ,
         \Aout[2][4][3] , \Aout[2][4][2] , \Aout[2][4][1] , \Aout[2][4][0] ,
         \Aout[2][3][7] , \Aout[2][3][6] , \Aout[2][3][5] , \Aout[2][3][4] ,
         \Aout[2][3][3] , \Aout[2][3][2] , \Aout[2][3][1] , \Aout[2][3][0] ,
         \Aout[2][2][7] , \Aout[2][2][6] , \Aout[2][2][5] , \Aout[2][2][4] ,
         \Aout[2][2][3] , \Aout[2][2][2] , \Aout[2][2][1] , \Aout[2][2][0] ,
         \Aout[2][1][7] , \Aout[2][1][6] , \Aout[2][1][5] , \Aout[2][1][4] ,
         \Aout[2][1][3] , \Aout[2][1][2] , \Aout[2][1][1] , \Aout[2][1][0] ,
         \Aout[1][4][7] , \Aout[1][4][6] , \Aout[1][4][5] , \Aout[1][4][4] ,
         \Aout[1][4][3] , \Aout[1][4][2] , \Aout[1][4][1] , \Aout[1][4][0] ,
         \Aout[1][3][7] , \Aout[1][3][6] , \Aout[1][3][5] , \Aout[1][3][4] ,
         \Aout[1][3][3] , \Aout[1][3][2] , \Aout[1][3][1] , \Aout[1][3][0] ,
         \Aout[1][2][7] , \Aout[1][2][6] , \Aout[1][2][5] , \Aout[1][2][4] ,
         \Aout[1][2][3] , \Aout[1][2][2] , \Aout[1][2][1] , \Aout[1][2][0] ,
         \Aout[1][1][7] , \Aout[1][1][6] , \Aout[1][1][5] , \Aout[1][1][4] ,
         \Aout[1][1][3] , \Aout[1][1][2] , \Aout[1][1][1] , \Aout[1][1][0] ,
         \Trigger[4][4] , \Trigger[4][3] , \Trigger[4][2] , \Trigger[4][1] ,
         \Trigger[3][4] , \Trigger[3][3] , \Trigger[3][2] , \Trigger[3][1] ,
         \Trigger[2][4] , \Trigger[2][3] , \Trigger[2][2] , \Trigger[2][1] ,
         \Trigger[1][4] , \Trigger[1][3] , \Trigger[1][2] , \Trigger[1][1] ,
         start, \ADDRACount[4][1] , \ADDRACount[4][0] , \ADDRACount[3][1] ,
         \ADDRACount[3][0] , \ADDRACount[2][1] , \ADDRACount[2][0] ,
         \ADDRACount[1][1] , \ADDRACount[1][0] , N78, N79, N80, N81, N82, N83,
         N84, N85, N86, N100, N112, N122, N123, N131, N132, N133, N134, N135,
         N136, N137, N138, N139, N140, N141, N142, N143, N144, N145, N146,
         N147, N148, N149, N150, N151, N152, N153, N154, N155, N156, N157,
         N158, N159, N160, N161, N162, N163, N164, N165, N166, N167, N168,
         N169, N170, N171, N172, N173, N174, N175, N176, N177, N178, N179,
         N180, N181, N182, N183, N184, N185, N186, N187, N188, N189, N190,
         N191, N192, N193, N194, N195, N196, N197, N198, N199, N200, N201,
         N202, N203, N204, N205, N206, N207, N208, N209, N210, N211, N212,
         N213, N214, N215, N216, N217, N218, N219, N220, N221, N222, N223,
         N224, N225, N226, N227, N228, N229, N230, N231, N232, N233, N234,
         N235, N236, N237, N238, N239, N240, N241, N242, N243, N244, N245,
         N246, N247, N248, N249, N250, N251, N252, N253, N254, N255, N256,
         N257, N258, N259, N260, N261, N262, N263, N264, N265, N266, N267,
         N268, N269, N270, N271, N272, N273, N274, N275, N276, N277, N278,
         N279, N280, N281, N282, N283, N284, N285, N286, N287, N288, N289,
         N290, N291, N292, N293, N294, N295, N296, N297, N298, N299, N300,
         N301, N302, N303, N304, N305, N306, N307, N308, N309, N310, N311,
         N312, N313, N314, N315, N316, N317, N318, N319, N320, N321, N322,
         N323, N324, N325, N326, N327, N328, N329, N330, N331, N332, N333,
         N334, N335, N336, N337, N338, N339, N340, N341, N342, N343, N344,
         N345, N346, N347, N348, N349, N350, N351, N352, N353, N354, N355,
         N356, N357, N358, N669, N670, N671, N672, N673, N674, N675, N676,
         N677, N678, N679, N681, N682, N683, N684, N685, N686, N687, N688,
         N689, N690, N691, N693, N694, N695, N696, N697, N698, N699, N700,
         N701, N702, N703, N705, N706, N707, N708, N709, N710, N711, N712,
         N713, N714, N715, N716, N717, N718, N719, N720, N721, N722, N723,
         N724, N725, N726, N727, N728, N729, N730, N731, N732, N733, N734,
         N735, N736, N737, N738, N739, N740, N741, N742, N743, N744, N745,
         N746, N747, N748, N749, N750, N751, N752, N753, N754, N755, N756,
         N757, N758, N759, N760, N761, N762, N763, N797, N798, N799, N800,
         N801, N802, N803, N804, N805, N806, N807, N811, N812, N813, N814,
         N815, N816, N817, N818, N819, N820, N839, N840, N841, N842, N843,
         N844, N845, N846, N847, N848, N849, N853, N854, N855, N856, N857,
         N858, N859, N860, N861, N862, N881, N882, N883, N884, N885, N886,
         N887, N888, N889, N890, N891, N895, N896, N897, N898, N899, N900,
         N901, N902, N903, N904, N923, N924, N925, N926, N927, N928, N929,
         N930, N931, N932, N933, N937, N938, N939, N940, N941, N942, N943,
         N944, N945, N946, N987, N988, N990, N991, N992, N993, N994, N995,
         N996, N997, N1029, N1030, N1032, N1033, N1034, N1035, N1036, N1037,
         N1038, N1039, N1071, N1072, N1074, N1075, N1076, N1077, N1078, N1079,
         N1080, N1081, N1113, N1114, N1116, N1117, N1118, N1119, N1120, N1121,
         N1122, N1123, N1475, N1480, N1485, N1490, N1495, N1500, N1505, N1514,
         N1517, N1522, N1527, N1532, N1537, N1542, N1547, n162, n164, n165,
         n166, n167, n168, n169, n170, n171, n172, n173, n174, n175, n176,
         n177, n178, n179, n180, n181, n182, n183, n184, n185, n186, n187,
         n188, n189, n190, n191, n192, n193, n194, n195, n196, n197, n198,
         n199, n200, n201, n202, n203, n204, n205, n206, n207, n208, n209,
         n210, n211, n212, n213, n214, n215, n216, n217, n218, n219, n220,
         n221, n222, n223, n224, n225, n226, n227, n228, n229, n230, n231,
         n232, n233, n234, n235, n236, n237, n238, n239, n240, n241, n242,
         n243, n244, n245, n246, n247, n248, n249, n250, n251, n252, n253,
         n254, n255, n256, n257, n258, n259, n260, n261, n262, n263, n264,
         n265, n266, n267, n268, n269, n270, n271, n272, n273, n274, n275,
         n276, n277, n278, n279, n280, n281, n282, n283, n284, n285, n286,
         n287, n288, n289, n290, n291, n292, n293, n294, n295, n296, n297,
         n298, n299, n300, n301, n302, n303, n304, n305, n306, n307, n308,
         n309, n310, n311, n312, n313, n314, n315, n316, n317, n318, n319,
         n320, n321, n322, n323, n324, n325, n326, n327, n328, n329, n330,
         n331, n332, n333, n334, n335, n336, n337, n338, n339, n340, n341,
         n342, n343, n344, n345, n346, n347, n348, n349, n350, n351, n352,
         n353, n354, n355, n356, n357, n358, n359, n360, n361, n362, n363,
         n364, n365, n366, n367, n368, n369, n370, n371, n372, n373, n374,
         n375, n376, n377, n378, n379, n380, n381, n382, n383, n384, n385,
         n386, n387, n388, n389, n390, n391, n392, n393, n394, n395, n396,
         n397, n398, n399, n400, n401, n402, n403, n404, n405, n406, n407,
         n408, n409, n410, n411, n412, n413, n414, n415, n416, n417, n418,
         n419, n420, n421, n422, n423, n424, n425, \add_446/carry[2] ,
         \add_446/carry[3] , \add_446/carry[4] , \add_446/carry[5] ,
         \add_446/carry[6] , \add_446/carry[7] , \add_446/carry[8] ,
         \add_446/carry[9] , \add_446/carry[10] , \add_436/carry[2] ,
         \add_436/carry[3] , \add_436/carry[4] , \add_436/carry[5] ,
         \add_436/carry[6] , \add_436/carry[7] , \add_436/carry[8] ,
         \add_436/carry[9] , \add_436/carry[10] , \add_426/carry[2] ,
         \add_426/carry[3] , \add_426/carry[4] , \add_426/carry[5] ,
         \add_426/carry[6] , \add_426/carry[7] , \add_426/carry[8] ,
         \add_426/carry[9] , \add_426/carry[10] , \add_417/carry[2] ,
         \add_417/carry[3] , \add_417/carry[4] , \add_417/carry[5] ,
         \add_417/carry[6] , \add_417/carry[7] , \add_417/carry[8] ,
         \add_417/carry[9] , \add_417/carry[10] , n426, n427, n428, n429, n430,
         n431, n432, n433, n434, n435, n436, n437, n438, n439, n440, n441,
         n442, n443, n444, n445, n446, n447, n448, n449, n450, n451, n452,
         n453, n454, n455, n456, n457, n458, n459, n460, n461, n462, n463,
         n464, n465, n466, n467, n468, n469, n470, n471, n472, n473, n474,
         n475, n476, n477, n478, n479, n480, n481, n482, n483, n484, n485,
         n486, n487, n488, n489, n490, n491, n492, n493, n494, n495, n496,
         n497, n498, n499, n500, n501, n502, n503, n504, n505, n506, n507,
         n508, n509, n510, n511, n512, n513, n514, n515, n516, n517, n518,
         n519, n520, n521, n522, n523, n524, n525, n526, n527, n528, n529,
         n530, n531, n532, n533, n534, n535, n536, n537, n538, n539, n540,
         n541, n542, n543, n544, n545, n546, n547, n548, n549, n550, n551,
         n552, n553, n554, n555, n556, n557, n558, n559, n560, n561, n562,
         n563, n564, n565, n566, n567, n568, n569, n570, n571, n572, n573,
         n574, n575, n576, n577, n578, n579, n580, n581, n582, n583, n584,
         n585, n586, n587, n588, n589, n590, n591, n592, n593, n594, n595,
         n596, n597, n598, n599, n600, n601, n602, n603, n604, n605, n606,
         n607, n608, n609;
  wire   [31:0] Ain;
  wire   [31:0] Bin;
  wire   [15:0] DONE;
  wire   [2:0] state;
  wire   [15:0] done;
  wire   [3:0] triggerCount;
  wire   [10:1] \r552/carry ;
  wire   [10:1] \r549/carry ;
  wire   [10:1] \r546/carry ;
  wire   [10:1] \r543/carry ;
  assign addrB[0] = N987;
  assign addrB[1] = N988;
  assign addrB[11] = N1029;
  assign addrB[12] = N1030;
  assign addrB[22] = N1071;
  assign addrB[23] = N1072;
  assign addrB[33] = N1113;
  assign addrB[34] = N1114;

  PE_0 pe11 ( .clk(clk), .rst_n(rst_n), .START(\Trigger[1][1] ), .A(Ain[7:0]), 
        .B(Bin[7:0]), .Aout({\Aout[1][1][7] , \Aout[1][1][6] , \Aout[1][1][5] , 
        \Aout[1][1][4] , \Aout[1][1][3] , \Aout[1][1][2] , \Aout[1][1][1] , 
        \Aout[1][1][0] }), .Bout({\Bout[1][1][7] , \Bout[1][1][6] , 
        \Bout[1][1][5] , \Bout[1][1][4] , \Bout[1][1][3] , \Bout[1][1][2] , 
        \Bout[1][1][1] , \Bout[1][1][0] }), .Cout({\Cout[1][1][7] , 
        \Cout[1][1][6] , \Cout[1][1][5] , \Cout[1][1][4] , \Cout[1][1][3] , 
        \Cout[1][1][2] , \Cout[1][1][1] , \Cout[1][1][0] }), .DONE(DONE[15])
         );
  PE_15 pe12 ( .clk(clk), .rst_n(rst_n), .START(\Trigger[1][2] ), .A(Ain[15:8]), .B({\Bout[1][1][7] , \Bout[1][1][6] , \Bout[1][1][5] , \Bout[1][1][4] , 
        \Bout[1][1][3] , \Bout[1][1][2] , \Bout[1][1][1] , \Bout[1][1][0] }), 
        .Aout({\Aout[1][2][7] , \Aout[1][2][6] , \Aout[1][2][5] , 
        \Aout[1][2][4] , \Aout[1][2][3] , \Aout[1][2][2] , \Aout[1][2][1] , 
        \Aout[1][2][0] }), .Bout({\Bout[1][2][7] , \Bout[1][2][6] , 
        \Bout[1][2][5] , \Bout[1][2][4] , \Bout[1][2][3] , \Bout[1][2][2] , 
        \Bout[1][2][1] , \Bout[1][2][0] }), .Cout({\Cout[1][2][7] , 
        \Cout[1][2][6] , \Cout[1][2][5] , \Cout[1][2][4] , \Cout[1][2][3] , 
        \Cout[1][2][2] , \Cout[1][2][1] , \Cout[1][2][0] }), .DONE(DONE[14])
         );
  PE_14 pe13 ( .clk(clk), .rst_n(rst_n), .START(\Trigger[1][3] ), .A(
        Ain[23:16]), .B({\Bout[1][2][7] , \Bout[1][2][6] , \Bout[1][2][5] , 
        \Bout[1][2][4] , \Bout[1][2][3] , \Bout[1][2][2] , \Bout[1][2][1] , 
        \Bout[1][2][0] }), .Aout({\Aout[1][3][7] , \Aout[1][3][6] , 
        \Aout[1][3][5] , \Aout[1][3][4] , \Aout[1][3][3] , \Aout[1][3][2] , 
        \Aout[1][3][1] , \Aout[1][3][0] }), .Bout({\Bout[1][3][7] , 
        \Bout[1][3][6] , \Bout[1][3][5] , \Bout[1][3][4] , \Bout[1][3][3] , 
        \Bout[1][3][2] , \Bout[1][3][1] , \Bout[1][3][0] }), .Cout({
        \Cout[1][3][7] , \Cout[1][3][6] , \Cout[1][3][5] , \Cout[1][3][4] , 
        \Cout[1][3][3] , \Cout[1][3][2] , \Cout[1][3][1] , \Cout[1][3][0] }), 
        .DONE(DONE[13]) );
  PE_13 pe14 ( .clk(clk), .rst_n(rst_n), .START(\Trigger[1][4] ), .A(
        Ain[31:24]), .B({\Bout[1][3][7] , \Bout[1][3][6] , \Bout[1][3][5] , 
        \Bout[1][3][4] , \Bout[1][3][3] , \Bout[1][3][2] , \Bout[1][3][1] , 
        \Bout[1][3][0] }), .Aout({\Aout[1][4][7] , \Aout[1][4][6] , 
        \Aout[1][4][5] , \Aout[1][4][4] , \Aout[1][4][3] , \Aout[1][4][2] , 
        \Aout[1][4][1] , \Aout[1][4][0] }), .Cout({\Cout[1][4][7] , 
        \Cout[1][4][6] , \Cout[1][4][5] , \Cout[1][4][4] , \Cout[1][4][3] , 
        \Cout[1][4][2] , \Cout[1][4][1] , \Cout[1][4][0] }), .DONE(DONE[12])
         );
  PE_12 pe21 ( .clk(clk), .rst_n(rst_n), .START(\Trigger[2][1] ), .A({
        \Aout[1][1][7] , \Aout[1][1][6] , \Aout[1][1][5] , \Aout[1][1][4] , 
        \Aout[1][1][3] , \Aout[1][1][2] , \Aout[1][1][1] , \Aout[1][1][0] }), 
        .B(Bin[15:8]), .Aout({\Aout[2][1][7] , \Aout[2][1][6] , 
        \Aout[2][1][5] , \Aout[2][1][4] , \Aout[2][1][3] , \Aout[2][1][2] , 
        \Aout[2][1][1] , \Aout[2][1][0] }), .Bout({\Bout[2][1][7] , 
        \Bout[2][1][6] , \Bout[2][1][5] , \Bout[2][1][4] , \Bout[2][1][3] , 
        \Bout[2][1][2] , \Bout[2][1][1] , \Bout[2][1][0] }), .Cout({
        \Cout[2][1][7] , \Cout[2][1][6] , \Cout[2][1][5] , \Cout[2][1][4] , 
        \Cout[2][1][3] , \Cout[2][1][2] , \Cout[2][1][1] , \Cout[2][1][0] }), 
        .DONE(DONE[11]) );
  PE_11 pe22 ( .clk(clk), .rst_n(rst_n), .START(\Trigger[2][2] ), .A({
        \Aout[1][2][7] , \Aout[1][2][6] , \Aout[1][2][5] , \Aout[1][2][4] , 
        \Aout[1][2][3] , \Aout[1][2][2] , \Aout[1][2][1] , \Aout[1][2][0] }), 
        .B({\Bout[2][1][7] , \Bout[2][1][6] , \Bout[2][1][5] , \Bout[2][1][4] , 
        \Bout[2][1][3] , \Bout[2][1][2] , \Bout[2][1][1] , \Bout[2][1][0] }), 
        .Aout({\Aout[2][2][7] , \Aout[2][2][6] , \Aout[2][2][5] , 
        \Aout[2][2][4] , \Aout[2][2][3] , \Aout[2][2][2] , \Aout[2][2][1] , 
        \Aout[2][2][0] }), .Bout({\Bout[2][2][7] , \Bout[2][2][6] , 
        \Bout[2][2][5] , \Bout[2][2][4] , \Bout[2][2][3] , \Bout[2][2][2] , 
        \Bout[2][2][1] , \Bout[2][2][0] }), .Cout({\Cout[2][2][7] , 
        \Cout[2][2][6] , \Cout[2][2][5] , \Cout[2][2][4] , \Cout[2][2][3] , 
        \Cout[2][2][2] , \Cout[2][2][1] , \Cout[2][2][0] }), .DONE(DONE[10])
         );
  PE_10 pe23 ( .clk(clk), .rst_n(rst_n), .START(\Trigger[2][3] ), .A({
        \Aout[1][3][7] , \Aout[1][3][6] , \Aout[1][3][5] , \Aout[1][3][4] , 
        \Aout[1][3][3] , \Aout[1][3][2] , \Aout[1][3][1] , \Aout[1][3][0] }), 
        .B({\Bout[2][2][7] , \Bout[2][2][6] , \Bout[2][2][5] , \Bout[2][2][4] , 
        \Bout[2][2][3] , \Bout[2][2][2] , \Bout[2][2][1] , \Bout[2][2][0] }), 
        .Aout({\Aout[2][3][7] , \Aout[2][3][6] , \Aout[2][3][5] , 
        \Aout[2][3][4] , \Aout[2][3][3] , \Aout[2][3][2] , \Aout[2][3][1] , 
        \Aout[2][3][0] }), .Bout({\Bout[2][3][7] , \Bout[2][3][6] , 
        \Bout[2][3][5] , \Bout[2][3][4] , \Bout[2][3][3] , \Bout[2][3][2] , 
        \Bout[2][3][1] , \Bout[2][3][0] }), .Cout({\Cout[2][3][7] , 
        \Cout[2][3][6] , \Cout[2][3][5] , \Cout[2][3][4] , \Cout[2][3][3] , 
        \Cout[2][3][2] , \Cout[2][3][1] , \Cout[2][3][0] }), .DONE(DONE[9]) );
  PE_9 pe24 ( .clk(clk), .rst_n(rst_n), .START(\Trigger[2][4] ), .A({
        \Aout[1][4][7] , \Aout[1][4][6] , \Aout[1][4][5] , \Aout[1][4][4] , 
        \Aout[1][4][3] , \Aout[1][4][2] , \Aout[1][4][1] , \Aout[1][4][0] }), 
        .B({\Bout[2][3][7] , \Bout[2][3][6] , \Bout[2][3][5] , \Bout[2][3][4] , 
        \Bout[2][3][3] , \Bout[2][3][2] , \Bout[2][3][1] , \Bout[2][3][0] }), 
        .Aout({\Aout[2][4][7] , \Aout[2][4][6] , \Aout[2][4][5] , 
        \Aout[2][4][4] , \Aout[2][4][3] , \Aout[2][4][2] , \Aout[2][4][1] , 
        \Aout[2][4][0] }), .Cout({\Cout[2][4][7] , \Cout[2][4][6] , 
        \Cout[2][4][5] , \Cout[2][4][4] , \Cout[2][4][3] , \Cout[2][4][2] , 
        \Cout[2][4][1] , \Cout[2][4][0] }), .DONE(DONE[8]) );
  PE_8 pe31 ( .clk(clk), .rst_n(rst_n), .START(\Trigger[3][1] ), .A({
        \Aout[2][1][7] , \Aout[2][1][6] , \Aout[2][1][5] , \Aout[2][1][4] , 
        \Aout[2][1][3] , \Aout[2][1][2] , \Aout[2][1][1] , \Aout[2][1][0] }), 
        .B(Bin[23:16]), .Aout({\Aout[3][1][7] , \Aout[3][1][6] , 
        \Aout[3][1][5] , \Aout[3][1][4] , \Aout[3][1][3] , \Aout[3][1][2] , 
        \Aout[3][1][1] , \Aout[3][1][0] }), .Bout({\Bout[3][1][7] , 
        \Bout[3][1][6] , \Bout[3][1][5] , \Bout[3][1][4] , \Bout[3][1][3] , 
        \Bout[3][1][2] , \Bout[3][1][1] , \Bout[3][1][0] }), .Cout({
        \Cout[3][1][7] , \Cout[3][1][6] , \Cout[3][1][5] , \Cout[3][1][4] , 
        \Cout[3][1][3] , \Cout[3][1][2] , \Cout[3][1][1] , \Cout[3][1][0] }), 
        .DONE(DONE[7]) );
  PE_7 pe32 ( .clk(clk), .rst_n(rst_n), .START(\Trigger[3][2] ), .A({
        \Aout[2][2][7] , \Aout[2][2][6] , \Aout[2][2][5] , \Aout[2][2][4] , 
        \Aout[2][2][3] , \Aout[2][2][2] , \Aout[2][2][1] , \Aout[2][2][0] }), 
        .B({\Bout[3][1][7] , \Bout[3][1][6] , \Bout[3][1][5] , \Bout[3][1][4] , 
        \Bout[3][1][3] , \Bout[3][1][2] , \Bout[3][1][1] , \Bout[3][1][0] }), 
        .Aout({\Aout[3][2][7] , \Aout[3][2][6] , \Aout[3][2][5] , 
        \Aout[3][2][4] , \Aout[3][2][3] , \Aout[3][2][2] , \Aout[3][2][1] , 
        \Aout[3][2][0] }), .Bout({\Bout[3][2][7] , \Bout[3][2][6] , 
        \Bout[3][2][5] , \Bout[3][2][4] , \Bout[3][2][3] , \Bout[3][2][2] , 
        \Bout[3][2][1] , \Bout[3][2][0] }), .Cout({\Cout[3][2][7] , 
        \Cout[3][2][6] , \Cout[3][2][5] , \Cout[3][2][4] , \Cout[3][2][3] , 
        \Cout[3][2][2] , \Cout[3][2][1] , \Cout[3][2][0] }), .DONE(DONE[6]) );
  PE_6 pe33 ( .clk(clk), .rst_n(rst_n), .START(\Trigger[3][3] ), .A({
        \Aout[2][3][7] , \Aout[2][3][6] , \Aout[2][3][5] , \Aout[2][3][4] , 
        \Aout[2][3][3] , \Aout[2][3][2] , \Aout[2][3][1] , \Aout[2][3][0] }), 
        .B({\Bout[3][2][7] , \Bout[3][2][6] , \Bout[3][2][5] , \Bout[3][2][4] , 
        \Bout[3][2][3] , \Bout[3][2][2] , \Bout[3][2][1] , \Bout[3][2][0] }), 
        .Aout({\Aout[3][3][7] , \Aout[3][3][6] , \Aout[3][3][5] , 
        \Aout[3][3][4] , \Aout[3][3][3] , \Aout[3][3][2] , \Aout[3][3][1] , 
        \Aout[3][3][0] }), .Bout({\Bout[3][3][7] , \Bout[3][3][6] , 
        \Bout[3][3][5] , \Bout[3][3][4] , \Bout[3][3][3] , \Bout[3][3][2] , 
        \Bout[3][3][1] , \Bout[3][3][0] }), .Cout({\Cout[3][3][7] , 
        \Cout[3][3][6] , \Cout[3][3][5] , \Cout[3][3][4] , \Cout[3][3][3] , 
        \Cout[3][3][2] , \Cout[3][3][1] , \Cout[3][3][0] }), .DONE(DONE[5]) );
  PE_5 pe34 ( .clk(clk), .rst_n(rst_n), .START(\Trigger[3][4] ), .A({
        \Aout[2][4][7] , \Aout[2][4][6] , \Aout[2][4][5] , \Aout[2][4][4] , 
        \Aout[2][4][3] , \Aout[2][4][2] , \Aout[2][4][1] , \Aout[2][4][0] }), 
        .B({\Bout[3][3][7] , \Bout[3][3][6] , \Bout[3][3][5] , \Bout[3][3][4] , 
        \Bout[3][3][3] , \Bout[3][3][2] , \Bout[3][3][1] , \Bout[3][3][0] }), 
        .Aout({\Aout[3][4][7] , \Aout[3][4][6] , \Aout[3][4][5] , 
        \Aout[3][4][4] , \Aout[3][4][3] , \Aout[3][4][2] , \Aout[3][4][1] , 
        \Aout[3][4][0] }), .Cout({\Cout[3][4][7] , \Cout[3][4][6] , 
        \Cout[3][4][5] , \Cout[3][4][4] , \Cout[3][4][3] , \Cout[3][4][2] , 
        \Cout[3][4][1] , \Cout[3][4][0] }), .DONE(DONE[4]) );
  PE_4 pe41 ( .clk(clk), .rst_n(rst_n), .START(\Trigger[4][1] ), .A({
        \Aout[3][1][7] , \Aout[3][1][6] , \Aout[3][1][5] , \Aout[3][1][4] , 
        \Aout[3][1][3] , \Aout[3][1][2] , \Aout[3][1][1] , \Aout[3][1][0] }), 
        .B(Bin[31:24]), .Bout({\Bout[4][1][7] , \Bout[4][1][6] , 
        \Bout[4][1][5] , \Bout[4][1][4] , \Bout[4][1][3] , \Bout[4][1][2] , 
        \Bout[4][1][1] , \Bout[4][1][0] }), .Cout({\Cout[4][1][7] , 
        \Cout[4][1][6] , \Cout[4][1][5] , \Cout[4][1][4] , \Cout[4][1][3] , 
        \Cout[4][1][2] , \Cout[4][1][1] , \Cout[4][1][0] }), .DONE(DONE[3]) );
  PE_3 pe42 ( .clk(clk), .rst_n(rst_n), .START(\Trigger[4][2] ), .A({
        \Aout[3][2][7] , \Aout[3][2][6] , \Aout[3][2][5] , \Aout[3][2][4] , 
        \Aout[3][2][3] , \Aout[3][2][2] , \Aout[3][2][1] , \Aout[3][2][0] }), 
        .B({\Bout[4][1][7] , \Bout[4][1][6] , \Bout[4][1][5] , \Bout[4][1][4] , 
        \Bout[4][1][3] , \Bout[4][1][2] , \Bout[4][1][1] , \Bout[4][1][0] }), 
        .Bout({\Bout[4][2][7] , \Bout[4][2][6] , \Bout[4][2][5] , 
        \Bout[4][2][4] , \Bout[4][2][3] , \Bout[4][2][2] , \Bout[4][2][1] , 
        \Bout[4][2][0] }), .Cout({\Cout[4][2][7] , \Cout[4][2][6] , 
        \Cout[4][2][5] , \Cout[4][2][4] , \Cout[4][2][3] , \Cout[4][2][2] , 
        \Cout[4][2][1] , \Cout[4][2][0] }), .DONE(DONE[2]) );
  PE_2 pe43 ( .clk(clk), .rst_n(rst_n), .START(\Trigger[4][3] ), .A({
        \Aout[3][3][7] , \Aout[3][3][6] , \Aout[3][3][5] , \Aout[3][3][4] , 
        \Aout[3][3][3] , \Aout[3][3][2] , \Aout[3][3][1] , \Aout[3][3][0] }), 
        .B({\Bout[4][2][7] , \Bout[4][2][6] , \Bout[4][2][5] , \Bout[4][2][4] , 
        \Bout[4][2][3] , \Bout[4][2][2] , \Bout[4][2][1] , \Bout[4][2][0] }), 
        .Bout({\Bout[4][3][7] , \Bout[4][3][6] , \Bout[4][3][5] , 
        \Bout[4][3][4] , \Bout[4][3][3] , \Bout[4][3][2] , \Bout[4][3][1] , 
        \Bout[4][3][0] }), .Cout({\Cout[4][3][7] , \Cout[4][3][6] , 
        \Cout[4][3][5] , \Cout[4][3][4] , \Cout[4][3][3] , \Cout[4][3][2] , 
        \Cout[4][3][1] , \Cout[4][3][0] }), .DONE(DONE[1]) );
  PE_1 pe44 ( .clk(clk), .rst_n(rst_n), .START(\Trigger[4][4] ), .A({
        \Aout[3][4][7] , \Aout[3][4][6] , \Aout[3][4][5] , \Aout[3][4][4] , 
        \Aout[3][4][3] , \Aout[3][4][2] , \Aout[3][4][1] , \Aout[3][4][0] }), 
        .B({\Bout[4][3][7] , \Bout[4][3][6] , \Bout[4][3][5] , \Bout[4][3][4] , 
        \Bout[4][3][3] , \Bout[4][3][2] , \Bout[4][3][1] , \Bout[4][3][0] }), 
        .Cout({\Cout[4][4][7] , \Cout[4][4][6] , \Cout[4][4][5] , 
        \Cout[4][4][4] , \Cout[4][4][3] , \Cout[4][4][2] , \Cout[4][4][1] , 
        \Cout[4][4][0] }), .DONE(DONE[0]) );
  TOP_PE_DW01_inc_0 r539 ( .A(addrA[43:33]), .SUM({N933, N932, N931, N930, 
        N929, N928, N927, N926, N925, N924, N923}) );
  TOP_PE_DW01_inc_1 r535 ( .A(addrA[32:22]), .SUM({N891, N890, N889, N888, 
        N887, N886, N885, N884, N883, N882, N881}) );
  TOP_PE_DW01_inc_2 r531 ( .A(addrA[21:11]), .SUM({N849, N848, N847, N846, 
        N845, N844, N843, N842, N841, N840, N839}) );
  TOP_PE_DW01_inc_3 r527 ( .A(addrA[10:0]), .SUM({N807, N806, N805, N804, N803, 
        N802, N801, N800, N799, N798, N797}) );
  TOP_PE_DW01_inc_4 r525 ( .A(addrC[43:33]), .SUM({N715, N714, N713, N712, 
        N711, N710, N709, N708, N707, N706, N705}) );
  TOP_PE_DW01_inc_5 r524 ( .A(addrC[32:22]), .SUM({N703, N702, N701, N700, 
        N699, N698, N697, N696, N695, N694, N693}) );
  TOP_PE_DW01_inc_6 r523 ( .A(addrC[21:11]), .SUM({N691, N690, N689, N688, 
        N687, N686, N685, N684, N683, N682, N681}) );
  TOP_PE_DW01_inc_7 r522 ( .A(addrC[10:0]), .SUM({N679, N678, N677, N676, N675, 
        N674, N673, N672, N671, N670, N669}) );
  TLATX1 \next_addrC_reg[33]  ( .G(N752), .D(N753), .QN(n462) );
  TLATX1 \next_addrC_reg[34]  ( .G(N752), .D(N754), .QN(n487) );
  TLATX1 \next_addrC_reg[35]  ( .G(N752), .D(N755), .QN(n461) );
  TLATX1 \next_addrC_reg[36]  ( .G(N752), .D(N756), .QN(n460) );
  TLATX1 \next_addrC_reg[37]  ( .G(N752), .D(N757), .QN(n459) );
  TLATX1 \next_addrC_reg[38]  ( .G(N752), .D(N758), .QN(n458) );
  TLATX1 \next_addrC_reg[39]  ( .G(N752), .D(N759), .QN(n486) );
  TLATX1 \next_addrC_reg[40]  ( .G(N752), .D(N760), .QN(n457) );
  TLATX1 \next_addrC_reg[41]  ( .G(N752), .D(N761), .QN(n456) );
  TLATX1 \next_addrC_reg[42]  ( .G(N752), .D(N762), .QN(n455) );
  TLATX1 \next_addrC_reg[43]  ( .G(N752), .D(N763), .QN(n454) );
  TLATX1 \next_addrC_reg[22]  ( .G(N740), .D(N741), .QN(n485) );
  TLATX1 \next_addrC_reg[23]  ( .G(N740), .D(N742), .QN(n484) );
  TLATX1 \next_addrC_reg[24]  ( .G(N740), .D(N743), .QN(n483) );
  TLATX1 \next_addrC_reg[25]  ( .G(N740), .D(N744), .QN(n482) );
  TLATX1 \next_addrC_reg[26]  ( .G(N740), .D(N745), .QN(n481) );
  TLATX1 \next_addrC_reg[27]  ( .G(N740), .D(N746), .QN(n480) );
  TLATX1 \next_addrC_reg[28]  ( .G(N740), .D(N747), .QN(n479) );
  TLATX1 \next_addrC_reg[29]  ( .G(N740), .D(N748), .QN(n478) );
  TLATX1 \next_addrC_reg[30]  ( .G(N740), .D(N749), .QN(n453) );
  TLATX1 \next_addrC_reg[31]  ( .G(N740), .D(N750), .QN(n477) );
  TLATX1 \next_addrC_reg[32]  ( .G(N740), .D(N751), .QN(n452) );
  TLATX1 \next_addrC_reg[11]  ( .G(N728), .D(N729), .QN(n476) );
  TLATX1 \next_addrC_reg[12]  ( .G(N728), .D(N730), .QN(n475) );
  TLATX1 \next_addrC_reg[13]  ( .G(N728), .D(N731), .QN(n474) );
  TLATX1 \next_addrC_reg[14]  ( .G(N728), .D(N732), .QN(n473) );
  TLATX1 \next_addrC_reg[15]  ( .G(N728), .D(N733), .QN(n472) );
  TLATX1 \next_addrC_reg[16]  ( .G(N728), .D(N734), .QN(n471) );
  TLATX1 \next_addrC_reg[17]  ( .G(N728), .D(N735), .QN(n470) );
  TLATX1 \next_addrC_reg[18]  ( .G(N728), .D(N736), .QN(n469) );
  TLATX1 \next_addrC_reg[19]  ( .G(N728), .D(N737), .QN(n468) );
  TLATX1 \next_addrC_reg[20]  ( .G(N728), .D(N738), .QN(n467) );
  TLATX1 \next_addrC_reg[21]  ( .G(N728), .D(N739), .QN(n466) );
  TLATX1 \next_addrC_reg[0]  ( .G(N716), .D(N717), .QN(n495) );
  TLATX1 \next_addrC_reg[1]  ( .G(N716), .D(N718), .QN(n494) );
  TLATX1 \next_addrC_reg[2]  ( .G(N716), .D(N719), .QN(n493) );
  TLATX1 \next_addrC_reg[3]  ( .G(N716), .D(N720), .QN(n492) );
  TLATX1 \next_addrC_reg[4]  ( .G(N716), .D(N721), .QN(n491) );
  TLATX1 \next_addrC_reg[5]  ( .G(N716), .D(N722), .QN(n490) );
  TLATX1 \next_addrC_reg[6]  ( .G(N716), .D(N723), .QN(n489) );
  TLATX1 \next_addrC_reg[7]  ( .G(N716), .D(N724), .QN(n465) );
  TLATX1 \next_addrC_reg[8]  ( .G(N716), .D(N725), .QN(n464) );
  TLATX1 \next_addrC_reg[9]  ( .G(N716), .D(N726), .QN(n488) );
  TLATX1 \next_addrC_reg[10]  ( .G(N716), .D(N727), .QN(n463) );
  DFFQX1 \addrC_reg[43]  ( .D(N218), .CK(clk), .Q(addrC[43]) );
  DFFQX1 \addrC_reg[32]  ( .D(N207), .CK(clk), .Q(addrC[32]) );
  DFFQX1 \addrC_reg[21]  ( .D(N196), .CK(clk), .Q(addrC[21]) );
  DFFQX1 \addrC_reg[10]  ( .D(N185), .CK(clk), .Q(addrC[10]) );
  DFFQX1 \addrC_reg[34]  ( .D(N209), .CK(clk), .Q(addrC[34]) );
  DFFQX1 \addrC_reg[35]  ( .D(N210), .CK(clk), .Q(addrC[35]) );
  DFFQX1 \addrC_reg[36]  ( .D(N211), .CK(clk), .Q(addrC[36]) );
  DFFQX1 \addrC_reg[37]  ( .D(N212), .CK(clk), .Q(addrC[37]) );
  DFFQX1 \addrC_reg[38]  ( .D(N213), .CK(clk), .Q(addrC[38]) );
  DFFQX1 \addrC_reg[39]  ( .D(N214), .CK(clk), .Q(addrC[39]) );
  DFFQX1 \addrC_reg[40]  ( .D(N215), .CK(clk), .Q(addrC[40]) );
  DFFQX1 \addrC_reg[41]  ( .D(N216), .CK(clk), .Q(addrC[41]) );
  DFFQX1 \addrC_reg[42]  ( .D(N217), .CK(clk), .Q(addrC[42]) );
  DFFQX1 \addrC_reg[23]  ( .D(N198), .CK(clk), .Q(addrC[23]) );
  DFFQX1 \addrC_reg[24]  ( .D(N199), .CK(clk), .Q(addrC[24]) );
  DFFQX1 \addrC_reg[25]  ( .D(N200), .CK(clk), .Q(addrC[25]) );
  DFFQX1 \addrC_reg[26]  ( .D(N201), .CK(clk), .Q(addrC[26]) );
  DFFQX1 \addrC_reg[27]  ( .D(N202), .CK(clk), .Q(addrC[27]) );
  DFFQX1 \addrC_reg[28]  ( .D(N203), .CK(clk), .Q(addrC[28]) );
  DFFQX1 \addrC_reg[29]  ( .D(N204), .CK(clk), .Q(addrC[29]) );
  DFFQX1 \addrC_reg[30]  ( .D(N205), .CK(clk), .Q(addrC[30]) );
  DFFQX1 \addrC_reg[31]  ( .D(N206), .CK(clk), .Q(addrC[31]) );
  DFFQX1 \addrC_reg[12]  ( .D(N187), .CK(clk), .Q(addrC[12]) );
  DFFQX1 \addrC_reg[13]  ( .D(N188), .CK(clk), .Q(addrC[13]) );
  DFFQX1 \addrC_reg[14]  ( .D(N189), .CK(clk), .Q(addrC[14]) );
  DFFQX1 \addrC_reg[15]  ( .D(N190), .CK(clk), .Q(addrC[15]) );
  DFFQX1 \addrC_reg[16]  ( .D(N191), .CK(clk), .Q(addrC[16]) );
  DFFQX1 \addrC_reg[17]  ( .D(N192), .CK(clk), .Q(addrC[17]) );
  DFFQX1 \addrC_reg[18]  ( .D(N193), .CK(clk), .Q(addrC[18]) );
  DFFQX1 \addrC_reg[19]  ( .D(N194), .CK(clk), .Q(addrC[19]) );
  DFFQX1 \addrC_reg[20]  ( .D(N195), .CK(clk), .Q(addrC[20]) );
  DFFQX1 \addrC_reg[1]  ( .D(N176), .CK(clk), .Q(addrC[1]) );
  DFFQX1 \addrC_reg[2]  ( .D(N177), .CK(clk), .Q(addrC[2]) );
  DFFQX1 \addrC_reg[3]  ( .D(N178), .CK(clk), .Q(addrC[3]) );
  DFFQX1 \addrC_reg[4]  ( .D(N179), .CK(clk), .Q(addrC[4]) );
  DFFQX1 \addrC_reg[5]  ( .D(N180), .CK(clk), .Q(addrC[5]) );
  DFFQX1 \addrC_reg[6]  ( .D(N181), .CK(clk), .Q(addrC[6]) );
  DFFQX1 \addrC_reg[7]  ( .D(N182), .CK(clk), .Q(addrC[7]) );
  DFFQX1 \addrC_reg[8]  ( .D(N183), .CK(clk), .Q(addrC[8]) );
  DFFQX1 \addrC_reg[9]  ( .D(N184), .CK(clk), .Q(addrC[9]) );
  DFFQX1 \addrC_reg[33]  ( .D(N208), .CK(clk), .Q(addrC[33]) );
  DFFQX1 \addrC_reg[22]  ( .D(N197), .CK(clk), .Q(addrC[22]) );
  DFFQX1 \addrC_reg[11]  ( .D(N186), .CK(clk), .Q(addrC[11]) );
  DFFQX1 \addrC_reg[0]  ( .D(N175), .CK(clk), .Q(addrC[0]) );
  DFFQX1 \done_reg[0]  ( .D(N283), .CK(clk), .Q(done[0]) );
  EDFFX1 \trigger_reg[2][2]  ( .D(N340), .E(N1495), .CK(clk), .Q(
        \Trigger[2][2] ) );
  EDFFX1 \trigger_reg[3][2]  ( .D(N344), .E(N1490), .CK(clk), .Q(
        \Trigger[3][2] ) );
  EDFFX1 \trigger_reg[2][3]  ( .D(N341), .E(N1490), .CK(clk), .Q(
        \Trigger[2][3] ) );
  EDFFX1 \trigger_reg[2][4]  ( .D(N342), .E(N1485), .CK(clk), .Q(
        \Trigger[2][4] ) );
  EDFFX1 \trigger_reg[4][2]  ( .D(N348), .E(N1485), .CK(clk), .Q(
        \Trigger[4][2] ) );
  EDFFX1 \trigger_reg[3][3]  ( .D(N345), .E(N1485), .CK(clk), .Q(
        \Trigger[3][3] ) );
  EDFFX1 \trigger_reg[3][4]  ( .D(N346), .E(N1480), .CK(clk), .Q(
        \Trigger[3][4] ) );
  EDFFX1 \trigger_reg[4][3]  ( .D(N349), .E(N1480), .CK(clk), .Q(
        \Trigger[4][3] ) );
  EDFFX1 \trigger_reg[4][4]  ( .D(N350), .E(N1475), .CK(clk), .Q(
        \Trigger[4][4] ) );
  EDFFX1 \addrB_reg[43]  ( .D(N174), .E(N1522), .CK(clk), .Q(addrB[43]) );
  EDFFX1 \addrB_reg[32]  ( .D(N163), .E(N1527), .CK(clk), .Q(addrB[32]) );
  EDFFX1 \addrB_reg[21]  ( .D(N152), .E(N1532), .CK(clk), .Q(addrB[21]) );
  EDFFX1 \addrB_reg[10]  ( .D(N141), .E(N1517), .CK(clk), .Q(addrB[10]) );
  DFFQX1 \done_reg[12]  ( .D(N295), .CK(clk), .Q(done[12]) );
  EDFFX1 \addrB_reg[22]  ( .D(N153), .E(N1527), .CK(clk), .Q(N1071) );
  EDFFX1 \addrB_reg[12]  ( .D(N143), .E(N1532), .CK(clk), .Q(N1030) );
  EDFFX1 \addrB_reg[0]  ( .D(N131), .E(N1517), .CK(clk), .Q(N987) );
  EDFFX1 \addrB_reg[1]  ( .D(N132), .E(N1517), .CK(clk), .Q(N988) );
  EDFFX1 \ain_reg[15]  ( .D(N234), .E(N1514), .CK(clk), .Q(Ain[15]) );
  EDFFX1 \ain_reg[14]  ( .D(N233), .E(n496), .CK(clk), .Q(Ain[14]) );
  EDFFX1 \ain_reg[13]  ( .D(N232), .E(N1514), .CK(clk), .Q(Ain[13]) );
  EDFFX1 \ain_reg[12]  ( .D(N231), .E(n496), .CK(clk), .Q(Ain[12]) );
  EDFFX1 \ain_reg[11]  ( .D(N230), .E(N1514), .CK(clk), .Q(Ain[11]) );
  EDFFX1 \ain_reg[10]  ( .D(N229), .E(n496), .CK(clk), .Q(Ain[10]) );
  EDFFX1 \ain_reg[9]  ( .D(N228), .E(N1514), .CK(clk), .Q(Ain[9]) );
  EDFFX1 \ain_reg[8]  ( .D(N227), .E(n496), .CK(clk), .Q(Ain[8]) );
  EDFFX1 \ain_reg[7]  ( .D(N226), .E(N1514), .CK(clk), .Q(Ain[7]) );
  EDFFX1 \ain_reg[6]  ( .D(N225), .E(n496), .CK(clk), .Q(Ain[6]) );
  EDFFX1 \ain_reg[5]  ( .D(N224), .E(N1514), .CK(clk), .Q(Ain[5]) );
  EDFFX1 \ain_reg[4]  ( .D(N223), .E(n496), .CK(clk), .Q(Ain[4]) );
  EDFFX1 \ain_reg[3]  ( .D(N222), .E(N1514), .CK(clk), .Q(Ain[3]) );
  EDFFX1 \ain_reg[2]  ( .D(N221), .E(n496), .CK(clk), .Q(Ain[2]) );
  EDFFX1 \ain_reg[1]  ( .D(N220), .E(N1514), .CK(clk), .Q(Ain[1]) );
  EDFFX1 \ain_reg[0]  ( .D(N219), .E(n496), .CK(clk), .Q(Ain[0]) );
  DFFQX1 \done_reg[15]  ( .D(N298), .CK(clk), .Q(done[15]) );
  DFFQX1 \done_reg[8]  ( .D(N291), .CK(clk), .Q(done[8]) );
  DFFQX1 \done_reg[4]  ( .D(N287), .CK(clk), .Q(done[4]) );
  DFFQX1 \done_reg[1]  ( .D(N284), .CK(clk), .Q(done[1]) );
  DFFQX1 \done_reg[9]  ( .D(N292), .CK(clk), .Q(done[9]) );
  DFFQX1 \done_reg[5]  ( .D(N288), .CK(clk), .Q(done[5]) );
  DFFQX1 \done_reg[7]  ( .D(N290), .CK(clk), .Q(done[7]) );
  DFFQX1 \done_reg[3]  ( .D(N286), .CK(clk), .Q(done[3]) );
  DFFQX1 \done_reg[14]  ( .D(N297), .CK(clk), .Q(done[14]) );
  DFFQX1 \done_reg[13]  ( .D(N296), .CK(clk), .Q(done[13]) );
  EDFFX1 \bin_reg[7]  ( .D(N258), .E(N1514), .CK(clk), .Q(Bin[7]) );
  EDFFX1 \bin_reg[6]  ( .D(N257), .E(n496), .CK(clk), .Q(Bin[6]) );
  EDFFX1 \bin_reg[5]  ( .D(N256), .E(N1514), .CK(clk), .Q(Bin[5]) );
  EDFFX1 \bin_reg[4]  ( .D(N255), .E(n496), .CK(clk), .Q(Bin[4]) );
  EDFFX1 \bin_reg[3]  ( .D(N254), .E(N1514), .CK(clk), .Q(Bin[3]) );
  EDFFX1 \bin_reg[2]  ( .D(N253), .E(n496), .CK(clk), .Q(Bin[2]) );
  EDFFX1 \bin_reg[1]  ( .D(N252), .E(N1514), .CK(clk), .Q(Bin[1]) );
  EDFFX1 \bin_reg[0]  ( .D(N251), .E(n496), .CK(clk), .Q(Bin[0]) );
  EDFFX1 \ain_reg[31]  ( .D(N250), .E(N1514), .CK(clk), .Q(Ain[31]) );
  EDFFX1 \ain_reg[30]  ( .D(N249), .E(n496), .CK(clk), .Q(Ain[30]) );
  EDFFX1 \ain_reg[29]  ( .D(N248), .E(N1514), .CK(clk), .Q(Ain[29]) );
  EDFFX1 \ain_reg[28]  ( .D(N247), .E(n496), .CK(clk), .Q(Ain[28]) );
  EDFFX1 \ain_reg[27]  ( .D(N246), .E(N1514), .CK(clk), .Q(Ain[27]) );
  EDFFX1 \ain_reg[26]  ( .D(N245), .E(n496), .CK(clk), .Q(Ain[26]) );
  EDFFX1 \ain_reg[25]  ( .D(N244), .E(N1514), .CK(clk), .Q(Ain[25]) );
  EDFFX1 \ain_reg[24]  ( .D(N243), .E(n496), .CK(clk), .Q(Ain[24]) );
  EDFFX1 \ain_reg[23]  ( .D(N242), .E(N1514), .CK(clk), .Q(Ain[23]) );
  EDFFX1 \ain_reg[22]  ( .D(N241), .E(n496), .CK(clk), .Q(Ain[22]) );
  EDFFX1 \ain_reg[21]  ( .D(N240), .E(N1514), .CK(clk), .Q(Ain[21]) );
  EDFFX1 \ain_reg[20]  ( .D(N239), .E(n496), .CK(clk), .Q(Ain[20]) );
  EDFFX1 \ain_reg[19]  ( .D(N238), .E(N1514), .CK(clk), .Q(Ain[19]) );
  EDFFX1 \ain_reg[18]  ( .D(N237), .E(n496), .CK(clk), .Q(Ain[18]) );
  EDFFX1 \ain_reg[17]  ( .D(N236), .E(N1514), .CK(clk), .Q(Ain[17]) );
  EDFFX1 \ain_reg[16]  ( .D(N235), .E(n496), .CK(clk), .Q(Ain[16]) );
  EDFFX1 \bin_reg[15]  ( .D(N266), .E(N1514), .CK(clk), .Q(Bin[15]) );
  EDFFX1 \bin_reg[14]  ( .D(N265), .E(n496), .CK(clk), .Q(Bin[14]) );
  EDFFX1 \bin_reg[13]  ( .D(N264), .E(N1514), .CK(clk), .Q(Bin[13]) );
  EDFFX1 \bin_reg[12]  ( .D(N263), .E(n496), .CK(clk), .Q(Bin[12]) );
  EDFFX1 \bin_reg[11]  ( .D(N262), .E(N1514), .CK(clk), .Q(Bin[11]) );
  EDFFX1 \bin_reg[10]  ( .D(N261), .E(n496), .CK(clk), .Q(Bin[10]) );
  EDFFX1 \bin_reg[9]  ( .D(N260), .E(N1514), .CK(clk), .Q(Bin[9]) );
  EDFFX1 \bin_reg[8]  ( .D(N259), .E(n496), .CK(clk), .Q(Bin[8]) );
  EDFFX1 \addrB_reg[33]  ( .D(N164), .E(N1522), .CK(clk), .Q(N1113) );
  EDFFX1 \addrB_reg[34]  ( .D(N165), .E(N1522), .CK(clk), .Q(N1114) );
  EDFFX1 \addrB_reg[23]  ( .D(N154), .E(N1527), .CK(clk), .Q(N1072) );
  EDFFX1 \addrB_reg[11]  ( .D(N142), .E(N1532), .CK(clk), .Q(N1029) );
  EDFFX1 \addrA_reg[10]  ( .D(n527), .E(N1517), .CK(clk), .Q(addrA[10]) );
  EDFFX1 \addrA_reg[43]  ( .D(n555), .E(N1537), .CK(clk), .Q(addrA[43]) );
  EDFFX1 \addrA_reg[32]  ( .D(n546), .E(N1542), .CK(clk), .Q(addrA[32]) );
  EDFFX1 \addrA_reg[21]  ( .D(n537), .E(N1547), .CK(clk), .Q(addrA[21]) );
  DFFQX1 \done_reg[11]  ( .D(N294), .CK(clk), .Q(done[11]) );
  DFFQX1 \done_reg[10]  ( .D(N293), .CK(clk), .Q(done[10]) );
  EDFFX1 \addrB_reg[38]  ( .D(N169), .E(N1522), .CK(clk), .Q(addrB[38]) );
  EDFFX1 \addrB_reg[39]  ( .D(N170), .E(N1522), .CK(clk), .Q(addrB[39]) );
  EDFFX1 \addrB_reg[40]  ( .D(N171), .E(N1522), .CK(clk), .Q(addrB[40]) );
  EDFFX1 \addrB_reg[41]  ( .D(N172), .E(N1522), .CK(clk), .Q(addrB[41]) );
  EDFFX1 \addrB_reg[42]  ( .D(N173), .E(N1522), .CK(clk), .Q(addrB[42]) );
  EDFFX1 \addrB_reg[27]  ( .D(N158), .E(N1527), .CK(clk), .Q(addrB[27]) );
  EDFFX1 \addrB_reg[28]  ( .D(N159), .E(N1527), .CK(clk), .Q(addrB[28]) );
  EDFFX1 \addrB_reg[29]  ( .D(N160), .E(N1527), .CK(clk), .Q(addrB[29]) );
  EDFFX1 \addrB_reg[30]  ( .D(N161), .E(N1527), .CK(clk), .Q(addrB[30]) );
  EDFFX1 \addrB_reg[31]  ( .D(N162), .E(N1527), .CK(clk), .Q(addrB[31]) );
  EDFFX1 \addrB_reg[16]  ( .D(N147), .E(N1532), .CK(clk), .Q(addrB[16]) );
  EDFFX1 \addrB_reg[17]  ( .D(N148), .E(N1532), .CK(clk), .Q(addrB[17]) );
  EDFFX1 \addrB_reg[18]  ( .D(N149), .E(N1532), .CK(clk), .Q(addrB[18]) );
  EDFFX1 \addrB_reg[19]  ( .D(N150), .E(N1532), .CK(clk), .Q(addrB[19]) );
  EDFFX1 \addrB_reg[20]  ( .D(N151), .E(N1532), .CK(clk), .Q(addrB[20]) );
  EDFFX1 \addrB_reg[5]  ( .D(N136), .E(N1517), .CK(clk), .Q(addrB[5]) );
  EDFFX1 \addrB_reg[6]  ( .D(N137), .E(N1517), .CK(clk), .Q(addrB[6]) );
  EDFFX1 \addrB_reg[7]  ( .D(N138), .E(N1517), .CK(clk), .Q(addrB[7]) );
  EDFFX1 \addrB_reg[8]  ( .D(N139), .E(N1517), .CK(clk), .Q(addrB[8]) );
  EDFFX1 \addrB_reg[9]  ( .D(N140), .E(N1517), .CK(clk), .Q(addrB[9]) );
  EDFFX1 \bin_reg[31]  ( .D(N282), .E(N1514), .CK(clk), .Q(Bin[31]) );
  EDFFX1 \bin_reg[30]  ( .D(N281), .E(n496), .CK(clk), .Q(Bin[30]) );
  EDFFX1 \bin_reg[29]  ( .D(N280), .E(N1514), .CK(clk), .Q(Bin[29]) );
  EDFFX1 \bin_reg[28]  ( .D(N279), .E(n496), .CK(clk), .Q(Bin[28]) );
  EDFFX1 \bin_reg[27]  ( .D(N278), .E(N1514), .CK(clk), .Q(Bin[27]) );
  EDFFX1 \bin_reg[26]  ( .D(N277), .E(n496), .CK(clk), .Q(Bin[26]) );
  EDFFX1 \bin_reg[25]  ( .D(N276), .E(N1514), .CK(clk), .Q(Bin[25]) );
  EDFFX1 \bin_reg[24]  ( .D(N275), .E(n496), .CK(clk), .Q(Bin[24]) );
  EDFFX1 \bin_reg[23]  ( .D(N274), .E(N1514), .CK(clk), .Q(Bin[23]) );
  EDFFX1 \bin_reg[22]  ( .D(N273), .E(n496), .CK(clk), .Q(Bin[22]) );
  EDFFX1 \bin_reg[21]  ( .D(N272), .E(N1514), .CK(clk), .Q(Bin[21]) );
  EDFFX1 \bin_reg[20]  ( .D(N271), .E(n496), .CK(clk), .Q(Bin[20]) );
  EDFFX1 \bin_reg[19]  ( .D(N270), .E(N1514), .CK(clk), .Q(Bin[19]) );
  EDFFX1 \bin_reg[18]  ( .D(N269), .E(n496), .CK(clk), .Q(Bin[18]) );
  EDFFX1 \bin_reg[17]  ( .D(N268), .E(N1514), .CK(clk), .Q(Bin[17]) );
  EDFFX1 \bin_reg[16]  ( .D(N267), .E(n496), .CK(clk), .Q(Bin[16]) );
  DFFQX1 \done_reg[2]  ( .D(N285), .CK(clk), .Q(done[2]) );
  DFFQX1 \done_reg[6]  ( .D(N289), .CK(clk), .Q(done[6]) );
  DFFQX1 start_reg ( .D(N78), .CK(clk), .Q(start) );
  EDFFX1 \trigger_reg[1][1]  ( .D(N335), .E(N1505), .CK(clk), .Q(
        \Trigger[1][1] ) );
  EDFFX1 \ADDRACount_reg[1][1]  ( .D(N352), .E(N1517), .CK(clk), .Q(
        \ADDRACount[1][1] ), .QN(n433) );
  EDFFX1 \ADDRACount_reg[2][1]  ( .D(N354), .E(N1547), .CK(clk), .Q(
        \ADDRACount[2][1] ), .QN(n430) );
  EDFFX1 \trigger_reg[1][2]  ( .D(N336), .E(N1500), .CK(clk), .Q(
        \Trigger[1][2] ), .QN(n444) );
  EDFFX1 \trigger_reg[2][1]  ( .D(N339), .E(N1500), .CK(clk), .Q(
        \Trigger[2][1] ), .QN(n447) );
  EDFFX1 \trigger_reg[1][3]  ( .D(N337), .E(N1495), .CK(clk), .Q(
        \Trigger[1][3] ), .QN(n443) );
  EDFFX1 \trigger_reg[3][1]  ( .D(N343), .E(N1495), .CK(clk), .Q(
        \Trigger[3][1] ), .QN(n446) );
  EDFFX1 \trigger_reg[1][4]  ( .D(N338), .E(N1490), .CK(clk), .Q(
        \Trigger[1][4] ), .QN(n442) );
  EDFFX1 \trigger_reg[4][1]  ( .D(N347), .E(N1490), .CK(clk), .Q(
        \Trigger[4][1] ), .QN(n445) );
  EDFFX1 \addrA_reg[7]  ( .D(n530), .E(N1517), .CK(clk), .Q(addrA[7]) );
  EDFFX1 \addrA_reg[8]  ( .D(n529), .E(N1517), .CK(clk), .Q(addrA[8]) );
  EDFFX1 \addrA_reg[9]  ( .D(n528), .E(N1517), .CK(clk), .Q(addrA[9]) );
  EDFFX1 \addrA_reg[40]  ( .D(n558), .E(N1537), .CK(clk), .Q(addrA[40]) );
  EDFFX1 \addrA_reg[41]  ( .D(n557), .E(N1537), .CK(clk), .Q(addrA[41]) );
  EDFFX1 \addrA_reg[42]  ( .D(n556), .E(N1537), .CK(clk), .Q(addrA[42]) );
  EDFFX1 \addrA_reg[29]  ( .D(n549), .E(N1542), .CK(clk), .Q(addrA[29]) );
  EDFFX1 \addrA_reg[30]  ( .D(n548), .E(N1542), .CK(clk), .Q(addrA[30]) );
  EDFFX1 \addrA_reg[31]  ( .D(n547), .E(N1542), .CK(clk), .Q(addrA[31]) );
  EDFFX1 \addrA_reg[18]  ( .D(n540), .E(N1547), .CK(clk), .Q(addrA[18]) );
  EDFFX1 \addrA_reg[19]  ( .D(n539), .E(N1547), .CK(clk), .Q(addrA[19]) );
  EDFFX1 \addrA_reg[20]  ( .D(n538), .E(N1547), .CK(clk), .Q(addrA[20]) );
  EDFFX1 \ADDRACount_reg[1][0]  ( .D(N351), .E(N1517), .CK(clk), .Q(
        \ADDRACount[1][0] ), .QN(n429) );
  EDFFX1 \ADDRACount_reg[2][0]  ( .D(N353), .E(N1547), .CK(clk), .Q(
        \ADDRACount[2][0] ), .QN(n435) );
  EDFFX1 \ADDRACount_reg[3][1]  ( .D(N356), .E(N1542), .CK(clk), .Q(
        \ADDRACount[3][1] ), .QN(n441) );
  EDFFX1 \ADDRACount_reg[4][1]  ( .D(N358), .E(N1537), .CK(clk), .Q(
        \ADDRACount[4][1] ), .QN(n440) );
  EDFFX1 \ADDRACount_reg[3][0]  ( .D(N355), .E(N1542), .CK(clk), .Q(
        \ADDRACount[3][0] ), .QN(n432) );
  EDFFX1 \ADDRACount_reg[4][0]  ( .D(N357), .E(N1537), .CK(clk), .Q(
        \ADDRACount[4][0] ), .QN(n431) );
  EDFFX1 \addrB_reg[36]  ( .D(N167), .E(N1522), .CK(clk), .Q(addrB[36]) );
  EDFFX1 \addrB_reg[37]  ( .D(N168), .E(N1522), .CK(clk), .Q(addrB[37]) );
  EDFFX1 \addrB_reg[25]  ( .D(N156), .E(N1527), .CK(clk), .Q(addrB[25]) );
  EDFFX1 \addrB_reg[26]  ( .D(N157), .E(N1527), .CK(clk), .Q(addrB[26]) );
  EDFFX1 \addrB_reg[14]  ( .D(N145), .E(N1532), .CK(clk), .Q(addrB[14]) );
  EDFFX1 \addrB_reg[15]  ( .D(N146), .E(N1532), .CK(clk), .Q(addrB[15]) );
  EDFFX1 \addrB_reg[3]  ( .D(N134), .E(N1517), .CK(clk), .Q(addrB[3]) );
  EDFFX1 \addrB_reg[4]  ( .D(N135), .E(N1517), .CK(clk), .Q(addrB[4]) );
  DFFQX1 \state_reg[1]  ( .D(N85), .CK(clk), .Q(state[1]) );
  EDFFX1 \addrA_reg[2]  ( .D(n535), .E(N1517), .CK(clk), .Q(addrA[2]) );
  EDFFX1 \addrA_reg[3]  ( .D(n534), .E(N1517), .CK(clk), .Q(addrA[3]) );
  EDFFX1 \addrA_reg[24]  ( .D(n553), .E(N1542), .CK(clk), .Q(addrA[24]) );
  EDFFX1 \addrA_reg[14]  ( .D(n544), .E(N1547), .CK(clk), .Q(addrA[14]) );
  EDFFX1 \addrA_reg[4]  ( .D(n533), .E(N1517), .CK(clk), .Q(addrA[4]) );
  EDFFX1 \addrA_reg[5]  ( .D(n532), .E(N1517), .CK(clk), .Q(addrA[5]) );
  EDFFX1 \addrA_reg[6]  ( .D(n531), .E(N1517), .CK(clk), .Q(addrA[6]) );
  EDFFX1 \addrA_reg[37]  ( .D(n561), .E(N1537), .CK(clk), .Q(addrA[37]) );
  EDFFX1 \addrA_reg[38]  ( .D(n560), .E(N1537), .CK(clk), .Q(addrA[38]) );
  EDFFX1 \addrA_reg[39]  ( .D(n559), .E(N1537), .CK(clk), .Q(addrA[39]) );
  EDFFX1 \addrA_reg[26]  ( .D(n552), .E(N1542), .CK(clk), .Q(addrA[26]) );
  EDFFX1 \addrA_reg[27]  ( .D(n551), .E(N1542), .CK(clk), .Q(addrA[27]) );
  EDFFX1 \addrA_reg[28]  ( .D(n550), .E(N1542), .CK(clk), .Q(addrA[28]) );
  EDFFX1 \addrA_reg[15]  ( .D(n543), .E(N1547), .CK(clk), .Q(addrA[15]) );
  EDFFX1 \addrA_reg[16]  ( .D(n542), .E(N1547), .CK(clk), .Q(addrA[16]) );
  EDFFX1 \addrA_reg[17]  ( .D(n541), .E(N1547), .CK(clk), .Q(addrA[17]) );
  EDFFX1 \addrB_reg[35]  ( .D(N166), .E(N1522), .CK(clk), .Q(addrB[35]), .QN(
        n451) );
  EDFFX1 \addrB_reg[24]  ( .D(N155), .E(N1527), .CK(clk), .Q(addrB[24]), .QN(
        n450) );
  EDFFX1 \addrB_reg[13]  ( .D(N144), .E(N1532), .CK(clk), .Q(addrB[13]), .QN(
        n449) );
  EDFFX1 \addrB_reg[2]  ( .D(N133), .E(N1517), .CK(clk), .Q(addrB[2]), .QN(
        n448) );
  DFFQX1 \state_reg[0]  ( .D(N84), .CK(clk), .Q(state[0]) );
  DFFQX1 \state_reg[2]  ( .D(N86), .CK(clk), .Q(state[2]) );
  EDFFX1 \addrA_reg[35]  ( .D(N122), .E(N1537), .CK(clk), .Q(addrA[35]) );
  EDFFX1 \addrA_reg[36]  ( .D(N123), .E(N1537), .CK(clk), .Q(addrA[36]) );
  EDFFX1 \addrA_reg[25]  ( .D(N112), .E(N1542), .CK(clk), .Q(addrA[25]) );
  EDFFX1 \addrA_reg[13]  ( .D(N100), .E(N1547), .CK(clk), .Q(addrA[13]) );
  EDFFX1 \triggerCount_reg[2]  ( .D(N301), .E(N1517), .CK(clk), .Q(
        triggerCount[2]), .QN(n427) );
  EDFFX1 \triggerCount_reg[0]  ( .D(N299), .E(N1517), .CK(clk), .Q(
        triggerCount[0]), .QN(n426) );
  EDFFX1 \triggerCount_reg[3]  ( .D(N302), .E(N1517), .CK(clk), .Q(
        triggerCount[3]) );
  EDFFX1 \triggerCount_reg[1]  ( .D(N300), .E(N1517), .CK(clk), .Q(
        triggerCount[1]), .QN(n428) );
  EDFFX1 \addrA_reg[1]  ( .D(n536), .E(N1517), .CK(clk), .Q(addrA[1]) );
  EDFFX1 \addrA_reg[34]  ( .D(n562), .E(N1537), .CK(clk), .Q(addrA[34]) );
  EDFFX1 \addrA_reg[23]  ( .D(n554), .E(N1542), .CK(clk), .Q(addrA[23]) );
  EDFFX1 \addrA_reg[12]  ( .D(n545), .E(N1547), .CK(clk), .Q(addrA[12]) );
  EDFFX1 \addrA_reg[0]  ( .D(n572), .E(N1517), .CK(clk), .Q(addrA[0]), .QN(
        n439) );
  EDFFX1 \addrA_reg[33]  ( .D(n574), .E(N1537), .CK(clk), .Q(addrA[33]), .QN(
        n438) );
  EDFFX1 \addrA_reg[22]  ( .D(n576), .E(N1542), .CK(clk), .Q(addrA[22]), .QN(
        n437) );
  EDFFX1 \addrA_reg[11]  ( .D(n578), .E(N1547), .CK(clk), .Q(addrA[11]), .QN(
        n436) );
  DFFQX1 \COUT_reg[23]  ( .D(N326), .CK(clk), .Q(COUT[23]) );
  DFFQX1 \COUT_reg[22]  ( .D(N325), .CK(clk), .Q(COUT[22]) );
  DFFQX1 \COUT_reg[21]  ( .D(N324), .CK(clk), .Q(COUT[21]) );
  DFFQX1 \COUT_reg[20]  ( .D(N323), .CK(clk), .Q(COUT[20]) );
  DFFQX1 \COUT_reg[19]  ( .D(N322), .CK(clk), .Q(COUT[19]) );
  DFFQX1 \COUT_reg[18]  ( .D(N321), .CK(clk), .Q(COUT[18]) );
  DFFQX1 \COUT_reg[17]  ( .D(N320), .CK(clk), .Q(COUT[17]) );
  DFFQX1 \COUT_reg[16]  ( .D(N319), .CK(clk), .Q(COUT[16]) );
  DFFQX1 \COUT_reg[15]  ( .D(N318), .CK(clk), .Q(COUT[15]) );
  DFFQX1 \COUT_reg[14]  ( .D(N317), .CK(clk), .Q(COUT[14]) );
  DFFQX1 \COUT_reg[13]  ( .D(N316), .CK(clk), .Q(COUT[13]) );
  DFFQX1 \COUT_reg[12]  ( .D(N315), .CK(clk), .Q(COUT[12]) );
  DFFQX1 \COUT_reg[11]  ( .D(N314), .CK(clk), .Q(COUT[11]) );
  DFFQX1 \COUT_reg[10]  ( .D(N313), .CK(clk), .Q(COUT[10]) );
  DFFQX1 \COUT_reg[9]  ( .D(N312), .CK(clk), .Q(COUT[9]) );
  DFFQX1 \COUT_reg[8]  ( .D(N311), .CK(clk), .Q(COUT[8]) );
  DFFQX1 \COUT_reg[7]  ( .D(N310), .CK(clk), .Q(COUT[7]) );
  DFFQX1 \COUT_reg[6]  ( .D(N309), .CK(clk), .Q(COUT[6]) );
  DFFQX1 \COUT_reg[5]  ( .D(N308), .CK(clk), .Q(COUT[5]) );
  DFFQX1 \COUT_reg[4]  ( .D(N307), .CK(clk), .Q(COUT[4]) );
  DFFQX1 \COUT_reg[3]  ( .D(N306), .CK(clk), .Q(COUT[3]) );
  DFFQX1 \COUT_reg[2]  ( .D(N305), .CK(clk), .Q(COUT[2]) );
  DFFQX1 \COUT_reg[1]  ( .D(N304), .CK(clk), .Q(COUT[1]) );
  DFFQX1 \COUT_reg[0]  ( .D(N303), .CK(clk), .Q(COUT[0]) );
  DFFQX1 \COUT_reg[24]  ( .D(N327), .CK(clk), .Q(COUT[24]) );
  DFFQX1 \COUT_reg[25]  ( .D(N328), .CK(clk), .Q(COUT[25]) );
  DFFQX1 \COUT_reg[26]  ( .D(N329), .CK(clk), .Q(COUT[26]) );
  DFFQX1 \COUT_reg[27]  ( .D(N330), .CK(clk), .Q(COUT[27]) );
  DFFQX1 \COUT_reg[28]  ( .D(N331), .CK(clk), .Q(COUT[28]) );
  DFFQX1 \COUT_reg[29]  ( .D(N332), .CK(clk), .Q(COUT[29]) );
  DFFQX1 \COUT_reg[30]  ( .D(N333), .CK(clk), .Q(COUT[30]) );
  DFFQX1 \COUT_reg[31]  ( .D(N334), .CK(clk), .Q(COUT[31]) );
  DFFQX1 \wenC_reg[2]  ( .D(N82), .CK(clk), .Q(wenC[2]) );
  DFFQX1 \wenC_reg[3]  ( .D(N83), .CK(clk), .Q(wenC[3]) );
  DFFQX1 \wenC_reg[1]  ( .D(N81), .CK(clk), .Q(wenC[1]) );
  DFFQX1 \wenC_reg[0]  ( .D(N80), .CK(clk), .Q(wenC[0]) );
  DFFQX1 FINISH_reg ( .D(N79), .CK(clk), .Q(FINISH) );
  INVX1 U684 ( .A(n434), .Y(n519) );
  NOR2X1 U685 ( .A(n522), .B(n514), .Y(n434) );
  CLKINVX1 U686 ( .A(n513), .Y(n516) );
  OAI21XL U687 ( .A0(n521), .A1(n366), .B0(n381), .Y(N1490) );
  OAI21XL U688 ( .A0(n521), .A1(n367), .B0(n381), .Y(N1495) );
  CLKINVX1 U689 ( .A(N1517), .Y(n521) );
  CLKINVX1 U690 ( .A(N1517), .Y(n520) );
  NOR2X1 U691 ( .A(n599), .B(n525), .Y(N84) );
  NOR3X1 U692 ( .A(n609), .B(state[2]), .C(n600), .Y(n310) );
  OA21XL U693 ( .A0(n195), .A1(n201), .B0(rst_n), .Y(n277) );
  OA21XL U694 ( .A0(n514), .A1(n379), .B0(rst_n), .Y(n381) );
  CLKINVX1 U695 ( .A(rst_n), .Y(n525) );
  CLKINVX1 U696 ( .A(rst_n), .Y(n524) );
  CLKINVX1 U697 ( .A(rst_n), .Y(n523) );
  CLKINVX1 U698 ( .A(rst_n), .Y(n522) );
  NOR2X1 U699 ( .A(n512), .B(n602), .Y(n164) );
  CLKINVX1 U700 ( .A(n519), .Y(n518) );
  CLKINVX1 U701 ( .A(n165), .Y(n577) );
  CLKINVX1 U702 ( .A(n211), .Y(n575) );
  CLKINVX1 U703 ( .A(n209), .Y(n573) );
  NOR2BX1 U704 ( .AN(n356), .B(n516), .Y(n311) );
  AOI2BB1X1 U705 ( .A0N(n603), .A1N(n356), .B0(n516), .Y(n321) );
  NOR2X1 U706 ( .A(n512), .B(n423), .Y(n165) );
  NOR2X1 U707 ( .A(n512), .B(n605), .Y(n211) );
  NOR2X1 U708 ( .A(n512), .B(n606), .Y(n209) );
  NAND2X1 U709 ( .A(n516), .B(n601), .Y(n375) );
  NOR2X1 U710 ( .A(n192), .B(n566), .Y(n189) );
  CLKINVX1 U711 ( .A(n305), .Y(n604) );
  CLKINVX1 U712 ( .A(n197), .Y(n564) );
  CLKBUFX3 U713 ( .A(n312), .Y(n503) );
  CLKINVX1 U714 ( .A(n179), .Y(n579) );
  NOR2X1 U715 ( .A(N84), .B(n497), .Y(n374) );
  NOR2X1 U716 ( .A(N84), .B(n511), .Y(n373) );
  CLKINVX1 U717 ( .A(N84), .Y(n571) );
  CLKBUFX3 U718 ( .A(n312), .Y(n502) );
  CLKBUFX3 U719 ( .A(n221), .Y(n509) );
  CLKBUFX3 U720 ( .A(n222), .Y(n507) );
  CLKBUFX3 U721 ( .A(n222), .Y(n506) );
  CLKBUFX3 U722 ( .A(n221), .Y(n510) );
  CLKINVX1 U723 ( .A(n423), .Y(n602) );
  CLKINVX1 U724 ( .A(n513), .Y(n517) );
  CLKINVX1 U725 ( .A(N1490), .Y(n582) );
  CLKBUFX3 U726 ( .A(n222), .Y(n508) );
  CLKINVX1 U727 ( .A(N1495), .Y(n581) );
  CLKINVX1 U728 ( .A(N1500), .Y(n580) );
  CLKINVX1 U729 ( .A(n511), .Y(n512) );
  CLKINVX1 U730 ( .A(n372), .Y(n603) );
  NOR4X1 U731 ( .A(n516), .B(n201), .C(n563), .D(n565), .Y(n207) );
  NAND3X1 U732 ( .A(n200), .B(n197), .C(n207), .Y(N716) );
  NAND2X1 U733 ( .A(n205), .B(n200), .Y(N728) );
  NOR2BX1 U734 ( .AN(n206), .B(n191), .Y(n200) );
  NAND4X1 U735 ( .A(n301), .B(n370), .C(n369), .D(n371), .Y(n305) );
  AND4X1 U736 ( .A(n372), .B(n215), .C(n366), .D(n367), .Y(n371) );
  NAND3X1 U737 ( .A(n568), .B(n567), .C(n292), .Y(n197) );
  NAND2BX1 U738 ( .AN(n193), .B(n194), .Y(n192) );
  OR2X1 U739 ( .A(n321), .B(n310), .Y(n358) );
  OR2X1 U740 ( .A(n311), .B(n310), .Y(n348) );
  NAND2X1 U741 ( .A(n383), .B(n304), .Y(n301) );
  NOR2X1 U742 ( .A(n428), .B(n426), .Y(n304) );
  NAND4X1 U743 ( .A(n196), .B(n197), .C(n198), .D(n199), .Y(n193) );
  NOR2BX1 U744 ( .AN(n200), .B(n201), .Y(n199) );
  NOR2X1 U745 ( .A(n570), .B(n194), .Y(n201) );
  NOR2X1 U746 ( .A(n375), .B(n310), .Y(n312) );
  NAND2X1 U747 ( .A(n384), .B(n383), .Y(n367) );
  NAND4X1 U748 ( .A(n366), .B(n305), .C(n367), .D(n368), .Y(n356) );
  AND3X2 U749 ( .A(n369), .B(n370), .C(n301), .Y(n368) );
  NAND2X1 U750 ( .A(n382), .B(n304), .Y(n372) );
  NAND2X1 U751 ( .A(n511), .B(n180), .Y(n179) );
  CLKBUFX3 U752 ( .A(n203), .Y(n513) );
  AND3X2 U753 ( .A(n296), .B(n294), .C(n295), .Y(n238) );
  AND3X2 U754 ( .A(n296), .B(n570), .C(n237), .Y(n298) );
  NOR3X1 U755 ( .A(n193), .B(n195), .C(n522), .Y(N80) );
  CLKBUFX3 U756 ( .A(n214), .Y(n511) );
  NOR2X1 U757 ( .A(n522), .B(n516), .Y(n214) );
  CLKINVX1 U758 ( .A(n396), .Y(n606) );
  AND3X2 U759 ( .A(n238), .B(n569), .C(n570), .Y(n257) );
  CLKINVX1 U760 ( .A(n196), .Y(n565) );
  AND3X2 U761 ( .A(n299), .B(n569), .C(n298), .Y(n191) );
  NOR2X1 U762 ( .A(n522), .B(n192), .Y(N81) );
  NOR2X1 U763 ( .A(n188), .B(n524), .Y(N83) );
  AOI211X1 U764 ( .A0(n189), .A1(n190), .B0(n564), .C0(n191), .Y(n188) );
  AOI21X1 U765 ( .A0(n190), .A1(n198), .B0(n522), .Y(n219) );
  OAI21X1 U766 ( .A0(n516), .A1(n444), .B0(n580), .Y(N1547) );
  OAI21X1 U767 ( .A0(n516), .A1(n442), .B0(n582), .Y(N1537) );
  OAI21X1 U768 ( .A0(n516), .A1(n443), .B0(n581), .Y(N1542) );
  OAI21XL U769 ( .A0(n447), .A1(n379), .B0(n580), .Y(N1532) );
  OAI21XL U770 ( .A0(n446), .A1(n379), .B0(n581), .Y(N1527) );
  OAI21XL U771 ( .A0(n445), .A1(n379), .B0(n582), .Y(N1522) );
  NOR3X1 U772 ( .A(n435), .B(n603), .C(n430), .Y(n423) );
  OAI21XL U773 ( .A0(n521), .A1(n372), .B0(n381), .Y(N1500) );
  NOR2X1 U774 ( .A(n206), .B(n522), .Y(n222) );
  NAND3X1 U775 ( .A(n599), .B(n601), .C(n202), .Y(n379) );
  NOR2X1 U776 ( .A(n194), .B(n522), .Y(n221) );
  OAI21XL U777 ( .A0(n521), .A1(n370), .B0(n381), .Y(N1485) );
  OAI21XL U778 ( .A0(n521), .A1(n301), .B0(n381), .Y(N1480) );
  NOR2X1 U779 ( .A(n396), .B(n512), .Y(n387) );
  NOR2X1 U780 ( .A(n411), .B(n512), .Y(n402) );
  CLKBUFX3 U781 ( .A(n203), .Y(n514) );
  OAI21XL U782 ( .A0(n521), .A1(n215), .B0(n381), .Y(N1505) );
  OAI21XL U783 ( .A0(n520), .A1(n369), .B0(n381), .Y(N1475) );
  NOR2X1 U784 ( .A(n180), .B(n512), .Y(n168) );
  CLKINVX1 U785 ( .A(n310), .Y(n599) );
  OAI21XL U786 ( .A0(n525), .A1(n445), .B0(n512), .Y(N347) );
  OAI21XL U787 ( .A0(n525), .A1(n442), .B0(n512), .Y(N338) );
  OAI21XL U788 ( .A0(n525), .A1(n446), .B0(n512), .Y(N343) );
  OAI21XL U789 ( .A0(n525), .A1(n443), .B0(n512), .Y(N337) );
  OAI21XL U790 ( .A0(n525), .A1(n447), .B0(n512), .Y(N339) );
  OAI21XL U791 ( .A0(n525), .A1(n444), .B0(n512), .Y(N336) );
  CLKBUFX3 U792 ( .A(n203), .Y(n515) );
  CLKBUFX3 U793 ( .A(n241), .Y(n504) );
  CLKBUFX3 U794 ( .A(n330), .Y(n500) );
  CLKBUFX3 U795 ( .A(n241), .Y(n505) );
  CLKINVX1 U796 ( .A(n198), .Y(n563) );
  CLKINVX1 U797 ( .A(n411), .Y(n605) );
  CLKBUFX3 U798 ( .A(n339), .Y(n497) );
  NOR2BX1 U799 ( .AN(n375), .B(n525), .Y(n339) );
  CLKINVX1 U800 ( .A(n183), .Y(n601) );
  CLKINVX1 U801 ( .A(n204), .Y(n566) );
  CLKBUFX3 U802 ( .A(n330), .Y(n501) );
  NOR2X1 U803 ( .A(n512), .B(n181), .Y(N86) );
  NOR2X1 U804 ( .A(n522), .B(n202), .Y(N79) );
  NOR2X1 U805 ( .A(n522), .B(n567), .Y(N287) );
  NOR2X1 U806 ( .A(n522), .B(n570), .Y(N298) );
  NOR2X1 U807 ( .A(n522), .B(n569), .Y(N283) );
  NOR2X1 U808 ( .A(n522), .B(n568), .Y(N284) );
  NAND3X1 U809 ( .A(n204), .B(n190), .C(n205), .Y(N752) );
  NAND3X1 U810 ( .A(n206), .B(n204), .C(n205), .Y(N740) );
  AND2X2 U811 ( .A(n207), .B(n194), .Y(n205) );
  CLKINVX1 U812 ( .A(n169), .Y(n528) );
  AOI222XL U813 ( .A0(addrA[9]), .A1(n518), .B0(N819), .B1(n168), .C0(N806), 
        .C1(n579), .Y(n169) );
  CLKINVX1 U814 ( .A(n167), .Y(n527) );
  AOI222XL U815 ( .A0(addrA[10]), .A1(n518), .B0(N820), .B1(n168), .C0(N807), 
        .C1(n579), .Y(n167) );
  CLKINVX1 U816 ( .A(n416), .Y(n538) );
  AOI222XL U817 ( .A0(addrA[20]), .A1(n434), .B0(N861), .B1(n164), .C0(N848), 
        .C1(n165), .Y(n416) );
  CLKINVX1 U818 ( .A(n403), .Y(n547) );
  AOI222XL U819 ( .A0(addrA[31]), .A1(n434), .B0(N903), .B1(n402), .C0(N890), 
        .C1(n211), .Y(n403) );
  CLKINVX1 U820 ( .A(n388), .Y(n556) );
  AOI222XL U821 ( .A0(addrA[42]), .A1(n434), .B0(N945), .B1(n387), .C0(N932), 
        .C1(n209), .Y(n388) );
  CLKINVX1 U822 ( .A(n415), .Y(n537) );
  AOI222XL U823 ( .A0(addrA[21]), .A1(n434), .B0(N862), .B1(n164), .C0(N849), 
        .C1(n165), .Y(n415) );
  CLKINVX1 U824 ( .A(n401), .Y(n546) );
  AOI222XL U825 ( .A0(addrA[32]), .A1(n434), .B0(N904), .B1(n402), .C0(N891), 
        .C1(n211), .Y(n401) );
  CLKINVX1 U826 ( .A(n386), .Y(n555) );
  AOI222XL U827 ( .A0(addrA[43]), .A1(n434), .B0(N946), .B1(n387), .C0(N933), 
        .C1(n209), .Y(n386) );
  NOR4X1 U828 ( .A(DONE[11]), .B(DONE[14]), .C(DONE[1]), .D(DONE[4]), .Y(n237)
         );
  NOR4X1 U829 ( .A(DONE[12]), .B(DONE[3]), .C(DONE[6]), .D(DONE[9]), .Y(n295)
         );
  AO22X1 U830 ( .A0(N996), .A1(n511), .B0(addrB[9]), .B1(n518), .Y(N140) );
  AO22X1 U831 ( .A0(N1038), .A1(n214), .B0(addrB[20]), .B1(n434), .Y(N151) );
  AO22X1 U832 ( .A0(N1080), .A1(n511), .B0(addrB[31]), .B1(n518), .Y(N162) );
  AO22X1 U833 ( .A0(N1122), .A1(n511), .B0(addrB[42]), .B1(n518), .Y(N173) );
  NOR3X1 U834 ( .A(state[0]), .B(state[2]), .C(n609), .Y(n203) );
  NOR2X1 U835 ( .A(n355), .B(n524), .Y(N243) );
  AOI22X1 U836 ( .A0(Ain[24]), .A1(n502), .B0(n348), .B1(AIN[24]), .Y(n355) );
  NOR2X1 U837 ( .A(n354), .B(n524), .Y(N244) );
  AOI22X1 U838 ( .A0(Ain[25]), .A1(n502), .B0(n348), .B1(AIN[25]), .Y(n354) );
  NOR2X1 U839 ( .A(n353), .B(n524), .Y(N245) );
  AOI22X1 U840 ( .A0(Ain[26]), .A1(n502), .B0(n348), .B1(AIN[26]), .Y(n353) );
  NOR2X1 U841 ( .A(n352), .B(n524), .Y(N246) );
  AOI22X1 U842 ( .A0(Ain[27]), .A1(n502), .B0(n348), .B1(AIN[27]), .Y(n352) );
  NOR2X1 U843 ( .A(n351), .B(n524), .Y(N247) );
  AOI22X1 U844 ( .A0(Ain[28]), .A1(n502), .B0(n348), .B1(AIN[28]), .Y(n351) );
  NOR2X1 U845 ( .A(n350), .B(n524), .Y(N248) );
  AOI22X1 U846 ( .A0(Ain[29]), .A1(n503), .B0(n348), .B1(AIN[29]), .Y(n350) );
  NOR2X1 U847 ( .A(n349), .B(n524), .Y(N249) );
  AOI22X1 U848 ( .A0(Ain[30]), .A1(n503), .B0(n348), .B1(AIN[30]), .Y(n349) );
  NOR2X1 U849 ( .A(n347), .B(n524), .Y(N250) );
  AOI22X1 U850 ( .A0(Ain[31]), .A1(n503), .B0(n348), .B1(AIN[31]), .Y(n347) );
  NAND3X1 U851 ( .A(\ADDRACount[4][0] ), .B(n366), .C(\ADDRACount[4][1] ), .Y(
        n396) );
  NOR2X1 U852 ( .A(n427), .B(triggerCount[3]), .Y(n383) );
  NAND2X1 U853 ( .A(n273), .B(n274), .Y(N311) );
  AOI22X1 U854 ( .A0(\Cout[2][2][0] ), .A1(n505), .B0(\Cout[3][2][0] ), .B1(
        n507), .Y(n273) );
  AOI22X1 U855 ( .A0(\Cout[1][2][0] ), .A1(n498), .B0(\Cout[4][2][0] ), .B1(
        n510), .Y(n274) );
  NAND2X1 U856 ( .A(n271), .B(n272), .Y(N312) );
  AOI22X1 U857 ( .A0(\Cout[2][2][1] ), .A1(n505), .B0(\Cout[3][2][1] ), .B1(
        n507), .Y(n271) );
  AOI22X1 U858 ( .A0(\Cout[1][2][1] ), .A1(n498), .B0(\Cout[4][2][1] ), .B1(
        n510), .Y(n272) );
  NAND2X1 U859 ( .A(n269), .B(n270), .Y(N313) );
  AOI22X1 U860 ( .A0(\Cout[2][2][2] ), .A1(n505), .B0(\Cout[3][2][2] ), .B1(
        n507), .Y(n269) );
  AOI22X1 U861 ( .A0(\Cout[1][2][2] ), .A1(n498), .B0(\Cout[4][2][2] ), .B1(
        n510), .Y(n270) );
  NAND2X1 U862 ( .A(n267), .B(n268), .Y(N314) );
  AOI22X1 U863 ( .A0(\Cout[2][2][3] ), .A1(n504), .B0(\Cout[3][2][3] ), .B1(
        n507), .Y(n267) );
  AOI22X1 U864 ( .A0(\Cout[1][2][3] ), .A1(n498), .B0(\Cout[4][2][3] ), .B1(
        n510), .Y(n268) );
  NAND2X1 U865 ( .A(n265), .B(n266), .Y(N315) );
  AOI22X1 U866 ( .A0(\Cout[2][2][4] ), .A1(n504), .B0(\Cout[3][2][4] ), .B1(
        n507), .Y(n265) );
  AOI22X1 U867 ( .A0(\Cout[1][2][4] ), .A1(n498), .B0(\Cout[4][2][4] ), .B1(
        n510), .Y(n266) );
  NAND2X1 U868 ( .A(n263), .B(n264), .Y(N316) );
  AOI22X1 U869 ( .A0(\Cout[2][2][5] ), .A1(n504), .B0(\Cout[3][2][5] ), .B1(
        n507), .Y(n263) );
  AOI22X1 U870 ( .A0(\Cout[1][2][5] ), .A1(n498), .B0(\Cout[4][2][5] ), .B1(
        n510), .Y(n264) );
  NAND2X1 U871 ( .A(n261), .B(n262), .Y(N317) );
  AOI22X1 U872 ( .A0(\Cout[2][2][6] ), .A1(n504), .B0(\Cout[3][2][6] ), .B1(
        n507), .Y(n261) );
  AOI22X1 U873 ( .A0(\Cout[1][2][6] ), .A1(n498), .B0(\Cout[4][2][6] ), .B1(
        n510), .Y(n262) );
  NAND2X1 U874 ( .A(n258), .B(n259), .Y(N318) );
  AOI22X1 U875 ( .A0(\Cout[2][2][7] ), .A1(n504), .B0(\Cout[3][2][7] ), .B1(
        n507), .Y(n258) );
  AOI22X1 U876 ( .A0(\Cout[1][2][7] ), .A1(n498), .B0(\Cout[4][2][7] ), .B1(
        n510), .Y(n259) );
  NAND2X1 U877 ( .A(n254), .B(n255), .Y(N319) );
  AOI22X1 U878 ( .A0(\Cout[1][3][0] ), .A1(n504), .B0(\Cout[2][3][0] ), .B1(
        n507), .Y(n254) );
  AOI22X1 U879 ( .A0(\Cout[4][3][0] ), .A1(n499), .B0(\Cout[3][3][0] ), .B1(
        n510), .Y(n255) );
  NAND2X1 U880 ( .A(n252), .B(n253), .Y(N320) );
  AOI22X1 U881 ( .A0(\Cout[1][3][1] ), .A1(n504), .B0(\Cout[2][3][1] ), .B1(
        n507), .Y(n252) );
  AOI22X1 U882 ( .A0(\Cout[4][3][1] ), .A1(n499), .B0(\Cout[3][3][1] ), .B1(
        n510), .Y(n253) );
  NAND2X1 U883 ( .A(n250), .B(n251), .Y(N321) );
  AOI22X1 U884 ( .A0(\Cout[1][3][2] ), .A1(n504), .B0(\Cout[2][3][2] ), .B1(
        n507), .Y(n250) );
  AOI22X1 U885 ( .A0(\Cout[4][3][2] ), .A1(n499), .B0(\Cout[3][3][2] ), .B1(
        n510), .Y(n251) );
  NAND2X1 U886 ( .A(n248), .B(n249), .Y(N322) );
  AOI22X1 U887 ( .A0(\Cout[1][3][3] ), .A1(n504), .B0(\Cout[2][3][3] ), .B1(
        n507), .Y(n248) );
  AOI22X1 U888 ( .A0(\Cout[4][3][3] ), .A1(n499), .B0(\Cout[3][3][3] ), .B1(
        n509), .Y(n249) );
  NAND2X1 U889 ( .A(n246), .B(n247), .Y(N323) );
  AOI22X1 U890 ( .A0(\Cout[1][3][4] ), .A1(n504), .B0(\Cout[2][3][4] ), .B1(
        n506), .Y(n246) );
  AOI22X1 U891 ( .A0(\Cout[4][3][4] ), .A1(n499), .B0(\Cout[3][3][4] ), .B1(
        n509), .Y(n247) );
  NAND2X1 U892 ( .A(n244), .B(n245), .Y(N324) );
  AOI22X1 U893 ( .A0(\Cout[1][3][5] ), .A1(n504), .B0(\Cout[2][3][5] ), .B1(
        n506), .Y(n244) );
  AOI22X1 U894 ( .A0(\Cout[4][3][5] ), .A1(n499), .B0(\Cout[3][3][5] ), .B1(
        n509), .Y(n245) );
  NAND2X1 U895 ( .A(n242), .B(n243), .Y(N325) );
  AOI22X1 U896 ( .A0(\Cout[1][3][6] ), .A1(n504), .B0(\Cout[2][3][6] ), .B1(
        n506), .Y(n242) );
  AOI22X1 U897 ( .A0(\Cout[4][3][6] ), .A1(n499), .B0(\Cout[3][3][6] ), .B1(
        n509), .Y(n243) );
  NAND2X1 U898 ( .A(n239), .B(n240), .Y(N326) );
  AOI22X1 U899 ( .A0(\Cout[1][3][7] ), .A1(n504), .B0(\Cout[2][3][7] ), .B1(
        n506), .Y(n239) );
  AOI22X1 U900 ( .A0(\Cout[4][3][7] ), .A1(n499), .B0(\Cout[3][3][7] ), .B1(
        n509), .Y(n240) );
  CLKINVX1 U901 ( .A(n170), .Y(n529) );
  AOI222XL U902 ( .A0(addrA[8]), .A1(n518), .B0(N818), .B1(n168), .C0(N805), 
        .C1(n579), .Y(n170) );
  CLKINVX1 U903 ( .A(n171), .Y(n530) );
  AOI222XL U904 ( .A0(addrA[7]), .A1(n518), .B0(N817), .B1(n168), .C0(N804), 
        .C1(n579), .Y(n171) );
  CLKINVX1 U905 ( .A(n173), .Y(n532) );
  AOI222XL U906 ( .A0(addrA[5]), .A1(n434), .B0(N815), .B1(n168), .C0(N802), 
        .C1(n579), .Y(n173) );
  NAND4X1 U907 ( .A(DONE[5]), .B(DONE[2]), .C(DONE[8]), .D(n293), .Y(n194) );
  AND4X1 U908 ( .A(n569), .B(n294), .C(n295), .D(n237), .Y(n293) );
  NAND3X1 U909 ( .A(triggerCount[0]), .B(n428), .C(n383), .Y(n366) );
  NAND3X1 U910 ( .A(n298), .B(n299), .C(DONE[0]), .Y(n198) );
  NAND3X1 U911 ( .A(DONE[1]), .B(n292), .C(DONE[4]), .Y(n196) );
  NAND4X1 U912 ( .A(DONE[6]), .B(DONE[3]), .C(DONE[9]), .D(n297), .Y(n206) );
  AND4X1 U913 ( .A(n569), .B(n294), .C(n298), .D(DONE[12]), .Y(n297) );
  NAND3X1 U914 ( .A(triggerCount[1]), .B(n426), .C(n383), .Y(n370) );
  NOR3X1 U915 ( .A(DONE[13]), .B(DONE[7]), .C(DONE[10]), .Y(n294) );
  NAND3X1 U916 ( .A(triggerCount[1]), .B(n426), .C(n382), .Y(n215) );
  NAND3X1 U917 ( .A(n384), .B(n427), .C(triggerCount[3]), .Y(n369) );
  NOR2X1 U918 ( .A(triggerCount[1]), .B(triggerCount[0]), .Y(n384) );
  NOR3X1 U919 ( .A(DONE[5]), .B(DONE[8]), .C(DONE[2]), .Y(n296) );
  NOR2X1 U920 ( .A(triggerCount[3]), .B(triggerCount[2]), .Y(n382) );
  CLKINVX1 U921 ( .A(DONE[15]), .Y(n570) );
  CLKBUFX3 U922 ( .A(n260), .Y(n498) );
  OA21XL U923 ( .A0(n564), .A1(n565), .B0(rst_n), .Y(n260) );
  CLKBUFX3 U924 ( .A(n220), .Y(n499) );
  OA21XL U925 ( .A0(n566), .A1(n565), .B0(rst_n), .Y(n220) );
  CLKINVX1 U926 ( .A(DONE[0]), .Y(n569) );
  AO22X1 U927 ( .A0(N997), .A1(n214), .B0(addrB[10]), .B1(n434), .Y(N141) );
  AO22X1 U928 ( .A0(N1039), .A1(n214), .B0(addrB[21]), .B1(n434), .Y(N152) );
  AO22X1 U929 ( .A0(N1081), .A1(n511), .B0(addrB[32]), .B1(n518), .Y(N163) );
  AO22X1 U930 ( .A0(N1123), .A1(n511), .B0(addrB[43]), .B1(n518), .Y(N174) );
  AND3X2 U931 ( .A(DONE[11]), .B(n257), .C(DONE[14]), .Y(n292) );
  AND4X1 U932 ( .A(DONE[7]), .B(DONE[13]), .C(DONE[10]), .D(n295), .Y(n299) );
  CLKINVX1 U933 ( .A(state[1]), .Y(n609) );
  NOR2X1 U934 ( .A(n365), .B(n525), .Y(N235) );
  AOI22X1 U935 ( .A0(Ain[16]), .A1(n502), .B0(n358), .B1(AIN[16]), .Y(n365) );
  NOR2X1 U936 ( .A(n364), .B(n525), .Y(N236) );
  AOI22X1 U937 ( .A0(Ain[17]), .A1(n502), .B0(n358), .B1(AIN[17]), .Y(n364) );
  NOR2X1 U938 ( .A(n363), .B(n525), .Y(N237) );
  AOI22X1 U939 ( .A0(Ain[18]), .A1(n502), .B0(n358), .B1(AIN[18]), .Y(n363) );
  NOR2X1 U940 ( .A(n362), .B(n524), .Y(N238) );
  AOI22X1 U941 ( .A0(Ain[19]), .A1(n502), .B0(n358), .B1(AIN[19]), .Y(n362) );
  NOR2X1 U942 ( .A(n361), .B(n524), .Y(N239) );
  AOI22X1 U943 ( .A0(Ain[20]), .A1(n502), .B0(n358), .B1(AIN[20]), .Y(n361) );
  NOR2X1 U944 ( .A(n360), .B(n524), .Y(N240) );
  AOI22X1 U945 ( .A0(Ain[21]), .A1(n502), .B0(n358), .B1(AIN[21]), .Y(n360) );
  NOR2X1 U946 ( .A(n359), .B(n524), .Y(N241) );
  AOI22X1 U947 ( .A0(Ain[22]), .A1(n502), .B0(n358), .B1(AIN[22]), .Y(n359) );
  NOR2X1 U948 ( .A(n357), .B(n524), .Y(N242) );
  AOI22X1 U949 ( .A0(Ain[23]), .A1(n502), .B0(n358), .B1(AIN[23]), .Y(n357) );
  NAND2X1 U950 ( .A(n217), .B(n218), .Y(N334) );
  AOI22X1 U951 ( .A0(\Cout[2][4][7] ), .A1(n509), .B0(\Cout[1][4][7] ), .B1(
        n506), .Y(n217) );
  AOI22X1 U952 ( .A0(\Cout[4][4][7] ), .A1(n219), .B0(\Cout[3][4][7] ), .B1(
        n499), .Y(n218) );
  NAND2X1 U953 ( .A(n223), .B(n224), .Y(N333) );
  AOI22X1 U954 ( .A0(\Cout[2][4][6] ), .A1(n509), .B0(\Cout[1][4][6] ), .B1(
        n506), .Y(n223) );
  AOI22X1 U955 ( .A0(\Cout[4][4][6] ), .A1(n219), .B0(\Cout[3][4][6] ), .B1(
        n499), .Y(n224) );
  NAND2X1 U956 ( .A(n225), .B(n226), .Y(N332) );
  AOI22X1 U957 ( .A0(\Cout[2][4][5] ), .A1(n509), .B0(\Cout[1][4][5] ), .B1(
        n506), .Y(n225) );
  AOI22X1 U958 ( .A0(\Cout[4][4][5] ), .A1(n219), .B0(\Cout[3][4][5] ), .B1(
        n499), .Y(n226) );
  NAND2X1 U959 ( .A(n227), .B(n228), .Y(N331) );
  AOI22X1 U960 ( .A0(\Cout[2][4][4] ), .A1(n509), .B0(\Cout[1][4][4] ), .B1(
        n506), .Y(n227) );
  AOI22X1 U961 ( .A0(\Cout[4][4][4] ), .A1(n219), .B0(\Cout[3][4][4] ), .B1(
        n499), .Y(n228) );
  NAND2X1 U962 ( .A(n229), .B(n230), .Y(N330) );
  AOI22X1 U963 ( .A0(\Cout[2][4][3] ), .A1(n509), .B0(\Cout[1][4][3] ), .B1(
        n506), .Y(n229) );
  AOI22X1 U964 ( .A0(\Cout[4][4][3] ), .A1(n219), .B0(\Cout[3][4][3] ), .B1(
        n499), .Y(n230) );
  NAND2X1 U965 ( .A(n231), .B(n232), .Y(N329) );
  AOI22X1 U966 ( .A0(\Cout[2][4][2] ), .A1(n509), .B0(\Cout[1][4][2] ), .B1(
        n506), .Y(n231) );
  AOI22X1 U967 ( .A0(\Cout[4][4][2] ), .A1(n219), .B0(\Cout[3][4][2] ), .B1(
        n499), .Y(n232) );
  NAND2X1 U968 ( .A(n233), .B(n234), .Y(N328) );
  AOI22X1 U969 ( .A0(\Cout[2][4][1] ), .A1(n509), .B0(\Cout[1][4][1] ), .B1(
        n506), .Y(n233) );
  AOI22X1 U970 ( .A0(\Cout[4][4][1] ), .A1(n219), .B0(\Cout[3][4][1] ), .B1(
        n499), .Y(n234) );
  NAND2X1 U971 ( .A(n235), .B(n236), .Y(N327) );
  AOI22X1 U972 ( .A0(\Cout[2][4][0] ), .A1(n509), .B0(\Cout[1][4][0] ), .B1(
        n506), .Y(n235) );
  AOI22X1 U973 ( .A0(\Cout[4][4][0] ), .A1(n219), .B0(\Cout[3][4][0] ), .B1(
        n499), .Y(n236) );
  NAND2X1 U974 ( .A(n290), .B(n291), .Y(N303) );
  AOI22X1 U975 ( .A0(\Cout[3][1][0] ), .A1(n505), .B0(\Cout[4][1][0] ), .B1(
        n508), .Y(n290) );
  AOI22X1 U976 ( .A0(\Cout[1][1][0] ), .A1(n277), .B0(\Cout[2][1][0] ), .B1(
        n498), .Y(n291) );
  NAND2X1 U977 ( .A(n288), .B(n289), .Y(N304) );
  AOI22X1 U978 ( .A0(\Cout[3][1][1] ), .A1(n505), .B0(\Cout[4][1][1] ), .B1(
        n508), .Y(n288) );
  AOI22X1 U979 ( .A0(\Cout[1][1][1] ), .A1(n277), .B0(\Cout[2][1][1] ), .B1(
        n498), .Y(n289) );
  NAND2X1 U980 ( .A(n286), .B(n287), .Y(N305) );
  AOI22X1 U981 ( .A0(\Cout[3][1][2] ), .A1(n505), .B0(\Cout[4][1][2] ), .B1(
        n508), .Y(n286) );
  AOI22X1 U982 ( .A0(\Cout[1][1][2] ), .A1(n277), .B0(\Cout[2][1][2] ), .B1(
        n498), .Y(n287) );
  NAND2X1 U983 ( .A(n284), .B(n285), .Y(N306) );
  AOI22X1 U984 ( .A0(\Cout[3][1][3] ), .A1(n505), .B0(\Cout[4][1][3] ), .B1(
        n508), .Y(n284) );
  AOI22X1 U985 ( .A0(\Cout[1][1][3] ), .A1(n277), .B0(\Cout[2][1][3] ), .B1(
        n498), .Y(n285) );
  NAND2X1 U986 ( .A(n282), .B(n283), .Y(N307) );
  AOI22X1 U987 ( .A0(\Cout[3][1][4] ), .A1(n505), .B0(\Cout[4][1][4] ), .B1(
        n508), .Y(n282) );
  AOI22X1 U988 ( .A0(\Cout[1][1][4] ), .A1(n277), .B0(\Cout[2][1][4] ), .B1(
        n498), .Y(n283) );
  NAND2X1 U989 ( .A(n280), .B(n281), .Y(N308) );
  AOI22X1 U990 ( .A0(\Cout[3][1][5] ), .A1(n505), .B0(\Cout[4][1][5] ), .B1(
        n508), .Y(n280) );
  AOI22X1 U991 ( .A0(\Cout[1][1][5] ), .A1(n277), .B0(\Cout[2][1][5] ), .B1(
        n498), .Y(n281) );
  NAND2X1 U992 ( .A(n278), .B(n279), .Y(N309) );
  AOI22X1 U993 ( .A0(\Cout[3][1][6] ), .A1(n505), .B0(\Cout[4][1][6] ), .B1(
        n508), .Y(n278) );
  AOI22X1 U994 ( .A0(\Cout[1][1][6] ), .A1(n277), .B0(\Cout[2][1][6] ), .B1(
        n498), .Y(n279) );
  NAND2X1 U995 ( .A(n275), .B(n276), .Y(N310) );
  AOI22X1 U996 ( .A0(\Cout[3][1][7] ), .A1(n505), .B0(\Cout[4][1][7] ), .B1(
        n508), .Y(n275) );
  AOI22X1 U997 ( .A0(\Cout[1][1][7] ), .A1(n277), .B0(\Cout[2][1][7] ), .B1(
        n498), .Y(n276) );
  NOR2X1 U998 ( .A(n328), .B(n523), .Y(N267) );
  AOI222XL U999 ( .A0(AIN[16]), .A1(n310), .B0(BIN[16]), .B1(n321), .C0(
        Bin[16]), .C1(n503), .Y(n328) );
  NOR2X1 U1000 ( .A(n327), .B(n523), .Y(N268) );
  AOI222XL U1001 ( .A0(AIN[17]), .A1(n310), .B0(BIN[17]), .B1(n321), .C0(
        Bin[17]), .C1(n503), .Y(n327) );
  NOR2X1 U1002 ( .A(n326), .B(n523), .Y(N269) );
  AOI222XL U1003 ( .A0(AIN[18]), .A1(n310), .B0(BIN[18]), .B1(n321), .C0(
        Bin[18]), .C1(n503), .Y(n326) );
  NOR2X1 U1004 ( .A(n325), .B(n523), .Y(N270) );
  AOI222XL U1005 ( .A0(AIN[19]), .A1(n310), .B0(BIN[19]), .B1(n321), .C0(
        Bin[19]), .C1(n503), .Y(n325) );
  NOR2X1 U1006 ( .A(n324), .B(n523), .Y(N271) );
  AOI222XL U1007 ( .A0(AIN[20]), .A1(n310), .B0(BIN[20]), .B1(n321), .C0(
        Bin[20]), .C1(n503), .Y(n324) );
  NOR2X1 U1008 ( .A(n323), .B(n523), .Y(N272) );
  AOI222XL U1009 ( .A0(AIN[21]), .A1(n310), .B0(BIN[21]), .B1(n321), .C0(
        Bin[21]), .C1(n503), .Y(n323) );
  NOR2X1 U1010 ( .A(n322), .B(n523), .Y(N273) );
  AOI222XL U1011 ( .A0(AIN[22]), .A1(n310), .B0(BIN[22]), .B1(n321), .C0(
        Bin[22]), .C1(n503), .Y(n322) );
  NOR2X1 U1012 ( .A(n320), .B(n523), .Y(N274) );
  AOI222XL U1013 ( .A0(AIN[23]), .A1(n310), .B0(BIN[23]), .B1(n321), .C0(
        Bin[23]), .C1(n503), .Y(n320) );
  NOR2X1 U1014 ( .A(n319), .B(n523), .Y(N275) );
  AOI222XL U1015 ( .A0(AIN[24]), .A1(n310), .B0(BIN[24]), .B1(n311), .C0(
        Bin[24]), .C1(n503), .Y(n319) );
  NOR2X1 U1016 ( .A(n318), .B(n523), .Y(N276) );
  AOI222XL U1017 ( .A0(AIN[25]), .A1(n310), .B0(BIN[25]), .B1(n311), .C0(
        Bin[25]), .C1(n503), .Y(n318) );
  NOR2X1 U1018 ( .A(n317), .B(n523), .Y(N277) );
  AOI222XL U1019 ( .A0(AIN[26]), .A1(n310), .B0(BIN[26]), .B1(n311), .C0(
        Bin[26]), .C1(n503), .Y(n317) );
  NOR2X1 U1020 ( .A(n316), .B(n523), .Y(N278) );
  AOI222XL U1021 ( .A0(AIN[27]), .A1(n310), .B0(BIN[27]), .B1(n311), .C0(
        Bin[27]), .C1(n503), .Y(n316) );
  NOR2X1 U1022 ( .A(n315), .B(n523), .Y(N279) );
  AOI222XL U1023 ( .A0(AIN[28]), .A1(n310), .B0(BIN[28]), .B1(n311), .C0(
        Bin[28]), .C1(n503), .Y(n315) );
  NOR2X1 U1024 ( .A(n314), .B(n523), .Y(N280) );
  AOI222XL U1025 ( .A0(AIN[29]), .A1(n310), .B0(BIN[29]), .B1(n311), .C0(
        Bin[29]), .C1(n503), .Y(n314) );
  NOR2X1 U1026 ( .A(n313), .B(n522), .Y(N281) );
  AOI222XL U1027 ( .A0(AIN[30]), .A1(n310), .B0(BIN[30]), .B1(n311), .C0(
        Bin[30]), .C1(n503), .Y(n313) );
  NOR2X1 U1028 ( .A(n309), .B(n522), .Y(N282) );
  AOI222XL U1029 ( .A0(AIN[31]), .A1(n310), .B0(BIN[31]), .B1(n311), .C0(
        Bin[31]), .C1(n503), .Y(n309) );
  OA21XL U1030 ( .A0(n189), .A1(n564), .B0(rst_n), .Y(N82) );
  OAI221XL U1031 ( .A0(n306), .A1(n517), .B0(n515), .B1(n428), .C0(rst_n), .Y(
        N300) );
  XNOR2X1 U1032 ( .A(triggerCount[1]), .B(n307), .Y(n306) );
  NOR2X1 U1033 ( .A(n604), .B(n426), .Y(n307) );
  CLKINVX1 U1034 ( .A(n166), .Y(n578) );
  AOI222XL U1035 ( .A0(addrA[11]), .A1(n518), .B0(n436), .B1(n164), .C0(N839), 
        .C1(n165), .Y(n166) );
  CLKINVX1 U1036 ( .A(n414), .Y(n576) );
  AOI222XL U1037 ( .A0(addrA[22]), .A1(n434), .B0(n437), .B1(n402), .C0(N881), 
        .C1(n211), .Y(n414) );
  CLKINVX1 U1038 ( .A(n400), .Y(n574) );
  AOI222XL U1039 ( .A0(addrA[33]), .A1(n434), .B0(n438), .B1(n387), .C0(N923), 
        .C1(n209), .Y(n400) );
  CLKINVX1 U1040 ( .A(n172), .Y(n531) );
  AOI222XL U1041 ( .A0(addrA[6]), .A1(n518), .B0(N816), .B1(n168), .C0(N803), 
        .C1(n579), .Y(n172) );
  CLKINVX1 U1042 ( .A(n174), .Y(n533) );
  AOI222XL U1043 ( .A0(addrA[4]), .A1(n518), .B0(N814), .B1(n168), .C0(N801), 
        .C1(n579), .Y(n174) );
  CLKINVX1 U1044 ( .A(n175), .Y(n534) );
  AOI222XL U1045 ( .A0(addrA[3]), .A1(n518), .B0(N813), .B1(n168), .C0(N800), 
        .C1(n579), .Y(n175) );
  CLKINVX1 U1046 ( .A(n176), .Y(n535) );
  AOI222XL U1047 ( .A0(addrA[2]), .A1(n518), .B0(N812), .B1(n168), .C0(N799), 
        .C1(n579), .Y(n176) );
  CLKINVX1 U1048 ( .A(n177), .Y(n536) );
  AOI222XL U1049 ( .A0(addrA[1]), .A1(n518), .B0(N811), .B1(n168), .C0(N798), 
        .C1(n579), .Y(n177) );
  CLKINVX1 U1050 ( .A(n178), .Y(n572) );
  AOI222XL U1051 ( .A0(addrA[0]), .A1(n518), .B0(n439), .B1(n168), .C0(N797), 
        .C1(n579), .Y(n178) );
  CLKINVX1 U1052 ( .A(n417), .Y(n539) );
  AOI222XL U1053 ( .A0(addrA[19]), .A1(n434), .B0(N860), .B1(n164), .C0(N847), 
        .C1(n165), .Y(n417) );
  CLKINVX1 U1054 ( .A(n418), .Y(n540) );
  AOI222XL U1055 ( .A0(addrA[18]), .A1(n434), .B0(N859), .B1(n164), .C0(N846), 
        .C1(n165), .Y(n418) );
  CLKINVX1 U1056 ( .A(n419), .Y(n541) );
  AOI222XL U1057 ( .A0(addrA[17]), .A1(n434), .B0(N858), .B1(n164), .C0(N845), 
        .C1(n165), .Y(n419) );
  CLKINVX1 U1058 ( .A(n420), .Y(n542) );
  AOI222XL U1059 ( .A0(addrA[16]), .A1(n434), .B0(N857), .B1(n164), .C0(N844), 
        .C1(n165), .Y(n420) );
  CLKINVX1 U1060 ( .A(n421), .Y(n543) );
  AOI222XL U1061 ( .A0(addrA[15]), .A1(n434), .B0(N856), .B1(n164), .C0(N843), 
        .C1(n165), .Y(n421) );
  CLKINVX1 U1062 ( .A(n162), .Y(n545) );
  AOI222XL U1063 ( .A0(addrA[12]), .A1(n434), .B0(N853), .B1(n164), .C0(N840), 
        .C1(n165), .Y(n162) );
  CLKINVX1 U1064 ( .A(n422), .Y(n544) );
  AOI222XL U1065 ( .A0(addrA[14]), .A1(n518), .B0(N855), .B1(n164), .C0(N842), 
        .C1(n165), .Y(n422) );
  CLKINVX1 U1066 ( .A(n404), .Y(n548) );
  AOI222XL U1067 ( .A0(addrA[30]), .A1(n434), .B0(N902), .B1(n402), .C0(N889), 
        .C1(n211), .Y(n404) );
  CLKINVX1 U1068 ( .A(n405), .Y(n549) );
  AOI222XL U1069 ( .A0(addrA[29]), .A1(n434), .B0(N901), .B1(n402), .C0(N888), 
        .C1(n211), .Y(n405) );
  CLKINVX1 U1070 ( .A(n406), .Y(n550) );
  AOI222XL U1071 ( .A0(addrA[28]), .A1(n434), .B0(N900), .B1(n402), .C0(N887), 
        .C1(n211), .Y(n406) );
  CLKINVX1 U1072 ( .A(n407), .Y(n551) );
  AOI222XL U1073 ( .A0(addrA[27]), .A1(n434), .B0(N899), .B1(n402), .C0(N886), 
        .C1(n211), .Y(n407) );
  CLKINVX1 U1074 ( .A(n408), .Y(n552) );
  AOI222XL U1075 ( .A0(addrA[26]), .A1(n434), .B0(N898), .B1(n402), .C0(N885), 
        .C1(n211), .Y(n408) );
  CLKINVX1 U1076 ( .A(n412), .Y(n553) );
  AOI222XL U1077 ( .A0(addrA[24]), .A1(n434), .B0(N896), .B1(n402), .C0(N883), 
        .C1(n211), .Y(n412) );
  CLKINVX1 U1078 ( .A(n413), .Y(n554) );
  AOI222XL U1079 ( .A0(addrA[23]), .A1(n518), .B0(N895), .B1(n402), .C0(N882), 
        .C1(n211), .Y(n413) );
  CLKINVX1 U1080 ( .A(n389), .Y(n557) );
  AOI222XL U1081 ( .A0(addrA[41]), .A1(n518), .B0(N944), .B1(n387), .C0(N931), 
        .C1(n209), .Y(n389) );
  CLKINVX1 U1082 ( .A(n390), .Y(n558) );
  AOI222XL U1083 ( .A0(addrA[40]), .A1(n518), .B0(N943), .B1(n387), .C0(N930), 
        .C1(n209), .Y(n390) );
  CLKINVX1 U1084 ( .A(n391), .Y(n559) );
  AOI222XL U1085 ( .A0(addrA[39]), .A1(n518), .B0(N942), .B1(n387), .C0(N929), 
        .C1(n209), .Y(n391) );
  CLKINVX1 U1086 ( .A(n392), .Y(n560) );
  AOI222XL U1087 ( .A0(addrA[38]), .A1(n518), .B0(N941), .B1(n387), .C0(N928), 
        .C1(n209), .Y(n392) );
  CLKINVX1 U1088 ( .A(n393), .Y(n561) );
  AOI222XL U1089 ( .A0(addrA[37]), .A1(n518), .B0(N940), .B1(n387), .C0(N927), 
        .C1(n209), .Y(n393) );
  CLKINVX1 U1090 ( .A(n399), .Y(n562) );
  AOI222XL U1091 ( .A0(addrA[34]), .A1(n518), .B0(N937), .B1(n387), .C0(N924), 
        .C1(n209), .Y(n399) );
  NOR4BX1 U1092 ( .AN(done[0]), .B(done[12]), .C(done[11]), .D(done[10]), .Y(
        n184) );
  OAI21XL U1093 ( .A0(start), .A1(n601), .B0(n202), .Y(n380) );
  NAND2X1 U1094 ( .A(rst_n), .B(n380), .Y(n496) );
  NAND2X1 U1095 ( .A(rst_n), .B(n380), .Y(N1514) );
  NOR3X1 U1096 ( .A(state[1]), .B(state[2]), .C(state[0]), .Y(n183) );
  NAND4X1 U1097 ( .A(DONE[4]), .B(DONE[1]), .C(n256), .D(n257), .Y(n204) );
  NOR2X1 U1098 ( .A(DONE[14]), .B(DONE[11]), .Y(n256) );
  NAND3X1 U1099 ( .A(\ADDRACount[3][0] ), .B(n367), .C(\ADDRACount[3][1] ), 
        .Y(n411) );
  NAND4X1 U1100 ( .A(n184), .B(n185), .C(n186), .D(n187), .Y(n181) );
  NOR4X1 U1101 ( .A(done[1]), .B(done[15]), .C(done[14]), .D(done[13]), .Y(
        n185) );
  NOR4X1 U1102 ( .A(done[5]), .B(done[4]), .C(done[3]), .D(done[2]), .Y(n186)
         );
  NOR4X1 U1103 ( .A(done[9]), .B(done[8]), .C(done[7]), .D(done[6]), .Y(n187)
         );
  NAND2X1 U1104 ( .A(rst_n), .B(n379), .Y(N1517) );
  OAI22XL U1105 ( .A0(n519), .A1(n431), .B0(\ADDRACount[4][0] ), .B1(n573), 
        .Y(N357) );
  OAI22XL U1106 ( .A0(n519), .A1(n432), .B0(\ADDRACount[3][0] ), .B1(n575), 
        .Y(N355) );
  OAI22XL U1107 ( .A0(n435), .A1(n519), .B0(\ADDRACount[2][0] ), .B1(n577), 
        .Y(N353) );
  OAI22XL U1108 ( .A0(n519), .A1(n429), .B0(\ADDRACount[1][0] ), .B1(n179), 
        .Y(N351) );
  OAI22XL U1109 ( .A0(n302), .A1(n512), .B0(n519), .B1(n427), .Y(N301) );
  XNOR2X1 U1110 ( .A(triggerCount[2]), .B(n303), .Y(n302) );
  AND2X2 U1111 ( .A(n304), .B(n305), .Y(n303) );
  NAND3X1 U1112 ( .A(n600), .B(n609), .C(state[2]), .Y(n202) );
  NAND4X1 U1113 ( .A(DONE[0]), .B(n237), .C(n238), .D(n570), .Y(n190) );
  OA21XL U1114 ( .A0(n191), .A1(n563), .B0(rst_n), .Y(n241) );
  OAI2BB1X1 U1115 ( .A0N(n518), .A1N(triggerCount[3]), .B0(n300), .Y(N302) );
  OAI21XL U1116 ( .A0(triggerCount[3]), .A1(n607), .B0(n511), .Y(n300) );
  CLKINVX1 U1117 ( .A(n301), .Y(n607) );
  NAND2X1 U1118 ( .A(n215), .B(n216), .Y(n180) );
  OAI21XL U1119 ( .A0(n429), .A1(n433), .B0(\Trigger[1][1] ), .Y(n216) );
  OAI2BB2XL U1120 ( .B0(n374), .B1(n598), .A0N(Ain[0]), .A1N(n501), .Y(N219)
         );
  OAI2BB2XL U1121 ( .B0(n374), .B1(n597), .A0N(Ain[1]), .A1N(n501), .Y(N220)
         );
  OAI2BB2XL U1122 ( .B0(n374), .B1(n596), .A0N(Ain[2]), .A1N(n501), .Y(N221)
         );
  OAI2BB2XL U1123 ( .B0(n374), .B1(n595), .A0N(Ain[3]), .A1N(n501), .Y(N222)
         );
  OAI2BB2XL U1124 ( .B0(n374), .B1(n594), .A0N(Ain[4]), .A1N(n501), .Y(N223)
         );
  OAI2BB2XL U1125 ( .B0(n374), .B1(n593), .A0N(Ain[5]), .A1N(n501), .Y(N224)
         );
  OAI2BB2XL U1126 ( .B0(n374), .B1(n592), .A0N(Ain[6]), .A1N(n501), .Y(N225)
         );
  OAI2BB2XL U1127 ( .B0(n374), .B1(n591), .A0N(Ain[7]), .A1N(n501), .Y(N226)
         );
  OAI2BB2XL U1128 ( .B0(n373), .B1(n590), .A0N(Ain[8]), .A1N(n501), .Y(N227)
         );
  OAI2BB2XL U1129 ( .B0(n373), .B1(n589), .A0N(Ain[9]), .A1N(n501), .Y(N228)
         );
  OAI2BB2XL U1130 ( .B0(n373), .B1(n588), .A0N(Ain[10]), .A1N(n501), .Y(N229)
         );
  OAI2BB2XL U1131 ( .B0(n373), .B1(n587), .A0N(Ain[11]), .A1N(n501), .Y(N230)
         );
  OAI2BB2XL U1132 ( .B0(n373), .B1(n586), .A0N(Ain[12]), .A1N(n501), .Y(N231)
         );
  OAI2BB2XL U1133 ( .B0(n373), .B1(n585), .A0N(Ain[13]), .A1N(n501), .Y(N232)
         );
  OAI2BB2XL U1134 ( .B0(n373), .B1(n584), .A0N(Ain[14]), .A1N(n501), .Y(N233)
         );
  OAI2BB2XL U1135 ( .B0(n373), .B1(n583), .A0N(Ain[15]), .A1N(n501), .Y(N234)
         );
  OAI21XL U1136 ( .A0(n571), .A1(n598), .B0(n346), .Y(N251) );
  AOI22X1 U1137 ( .A0(BIN[0]), .A1(n497), .B0(Bin[0]), .B1(n501), .Y(n346) );
  OAI21XL U1138 ( .A0(n571), .A1(n597), .B0(n345), .Y(N252) );
  AOI22X1 U1139 ( .A0(BIN[1]), .A1(n497), .B0(Bin[1]), .B1(n501), .Y(n345) );
  OAI21XL U1140 ( .A0(n571), .A1(n596), .B0(n344), .Y(N253) );
  AOI22X1 U1141 ( .A0(BIN[2]), .A1(n497), .B0(Bin[2]), .B1(n501), .Y(n344) );
  OAI21XL U1142 ( .A0(n571), .A1(n595), .B0(n343), .Y(N254) );
  AOI22X1 U1143 ( .A0(BIN[3]), .A1(n497), .B0(Bin[3]), .B1(n500), .Y(n343) );
  OAI21XL U1144 ( .A0(n571), .A1(n594), .B0(n342), .Y(N255) );
  AOI22X1 U1145 ( .A0(BIN[4]), .A1(n497), .B0(Bin[4]), .B1(n500), .Y(n342) );
  OAI21XL U1146 ( .A0(n571), .A1(n593), .B0(n341), .Y(N256) );
  AOI22X1 U1147 ( .A0(BIN[5]), .A1(n497), .B0(Bin[5]), .B1(n500), .Y(n341) );
  OAI21XL U1148 ( .A0(n571), .A1(n592), .B0(n340), .Y(N257) );
  AOI22X1 U1149 ( .A0(BIN[6]), .A1(n497), .B0(Bin[6]), .B1(n500), .Y(n340) );
  OAI21XL U1150 ( .A0(n571), .A1(n591), .B0(n338), .Y(N258) );
  AOI22X1 U1151 ( .A0(BIN[7]), .A1(n497), .B0(Bin[7]), .B1(n500), .Y(n338) );
  OAI21XL U1152 ( .A0(n571), .A1(n590), .B0(n337), .Y(N259) );
  AOI22X1 U1153 ( .A0(Bin[8]), .A1(n500), .B0(BIN[8]), .B1(n511), .Y(n337) );
  OAI21XL U1154 ( .A0(n571), .A1(n589), .B0(n336), .Y(N260) );
  AOI22X1 U1155 ( .A0(Bin[9]), .A1(n500), .B0(BIN[9]), .B1(n511), .Y(n336) );
  OAI21XL U1156 ( .A0(n571), .A1(n588), .B0(n335), .Y(N261) );
  AOI22X1 U1157 ( .A0(Bin[10]), .A1(n500), .B0(BIN[10]), .B1(n511), .Y(n335)
         );
  OAI21XL U1158 ( .A0(n571), .A1(n587), .B0(n334), .Y(N262) );
  AOI22X1 U1159 ( .A0(Bin[11]), .A1(n500), .B0(BIN[11]), .B1(n511), .Y(n334)
         );
  OAI21XL U1160 ( .A0(n571), .A1(n586), .B0(n333), .Y(N263) );
  AOI22X1 U1161 ( .A0(Bin[12]), .A1(n500), .B0(BIN[12]), .B1(n511), .Y(n333)
         );
  OAI21XL U1162 ( .A0(n571), .A1(n585), .B0(n332), .Y(N264) );
  AOI22X1 U1163 ( .A0(Bin[13]), .A1(n500), .B0(BIN[13]), .B1(n511), .Y(n332)
         );
  OAI21XL U1164 ( .A0(n571), .A1(n584), .B0(n331), .Y(N265) );
  AOI22X1 U1165 ( .A0(Bin[14]), .A1(n500), .B0(BIN[14]), .B1(n511), .Y(n331)
         );
  OAI21XL U1166 ( .A0(n571), .A1(n583), .B0(n329), .Y(N266) );
  AOI22X1 U1167 ( .A0(Bin[15]), .A1(n500), .B0(BIN[15]), .B1(n511), .Y(n329)
         );
  AND2X2 U1168 ( .A(n503), .B(rst_n), .Y(n330) );
  AND4X1 U1169 ( .A(DONE[15]), .B(n237), .C(n238), .D(n569), .Y(n195) );
  CLKINVX1 U1170 ( .A(DONE[4]), .Y(n567) );
  CLKINVX1 U1171 ( .A(DONE[1]), .Y(n568) );
  CLKINVX1 U1172 ( .A(state[0]), .Y(n600) );
  OAI32X1 U1173 ( .A0(n179), .A1(\ADDRACount[1][1] ), .A2(n429), .B0(n213), 
        .B1(n433), .Y(N352) );
  AOI2BB1X1 U1174 ( .A0N(\ADDRACount[1][0] ), .A1N(n179), .B0(n434), .Y(n213)
         );
  NAND2X1 U1175 ( .A(n385), .B(rst_n), .Y(N142) );
  AOI22X1 U1176 ( .A0(N1029), .A1(n514), .B0(N1029), .B1(n516), .Y(n385) );
  NAND2X1 U1177 ( .A(n378), .B(rst_n), .Y(N154) );
  AOI22X1 U1178 ( .A0(N1072), .A1(n514), .B0(N1072), .B1(n516), .Y(n378) );
  NAND2X1 U1179 ( .A(n376), .B(rst_n), .Y(N165) );
  AOI22X1 U1180 ( .A0(N1114), .A1(n514), .B0(N1114), .B1(n516), .Y(n376) );
  NAND2X1 U1181 ( .A(n377), .B(rst_n), .Y(N164) );
  AOI22X1 U1182 ( .A0(N1113), .A1(n513), .B0(N1113), .B1(n516), .Y(n377) );
  AO22X1 U1183 ( .A0(N995), .A1(n214), .B0(addrB[8]), .B1(n434), .Y(N139) );
  AO22X1 U1184 ( .A0(N994), .A1(n511), .B0(addrB[7]), .B1(n518), .Y(N138) );
  AO22X1 U1185 ( .A0(N993), .A1(n214), .B0(addrB[6]), .B1(n434), .Y(N137) );
  AO22X1 U1186 ( .A0(N992), .A1(n214), .B0(addrB[5]), .B1(n434), .Y(N136) );
  AO22X1 U1187 ( .A0(N991), .A1(n214), .B0(addrB[4]), .B1(n434), .Y(N135) );
  AO22X1 U1188 ( .A0(N990), .A1(n511), .B0(addrB[3]), .B1(n518), .Y(N134) );
  AO22X1 U1189 ( .A0(N988), .A1(n511), .B0(N988), .B1(n518), .Y(N132) );
  AO22X1 U1190 ( .A0(N987), .A1(n511), .B0(N987), .B1(n518), .Y(N131) );
  AO22X1 U1191 ( .A0(N1037), .A1(n511), .B0(addrB[19]), .B1(n518), .Y(N150) );
  AO22X1 U1192 ( .A0(N1036), .A1(n511), .B0(addrB[18]), .B1(n518), .Y(N149) );
  AO22X1 U1193 ( .A0(N1035), .A1(n511), .B0(addrB[17]), .B1(n518), .Y(N148) );
  AO22X1 U1194 ( .A0(N1034), .A1(n214), .B0(addrB[16]), .B1(n518), .Y(N147) );
  AO22X1 U1195 ( .A0(N1033), .A1(n214), .B0(addrB[15]), .B1(n518), .Y(N146) );
  AO22X1 U1196 ( .A0(N1032), .A1(n214), .B0(addrB[14]), .B1(n518), .Y(N145) );
  AO22X1 U1197 ( .A0(N1030), .A1(n214), .B0(N1030), .B1(n518), .Y(N143) );
  AO22X1 U1198 ( .A0(N1079), .A1(n511), .B0(addrB[30]), .B1(n518), .Y(N161) );
  AO22X1 U1199 ( .A0(N1078), .A1(n511), .B0(addrB[29]), .B1(n518), .Y(N160) );
  AO22X1 U1200 ( .A0(N1077), .A1(n511), .B0(addrB[28]), .B1(n518), .Y(N159) );
  AO22X1 U1201 ( .A0(N1076), .A1(n511), .B0(addrB[27]), .B1(n518), .Y(N158) );
  AO22X1 U1202 ( .A0(N1075), .A1(n511), .B0(addrB[26]), .B1(n518), .Y(N157) );
  AO22X1 U1203 ( .A0(N1074), .A1(n511), .B0(addrB[25]), .B1(n518), .Y(N156) );
  AO22X1 U1204 ( .A0(N1071), .A1(n511), .B0(N1071), .B1(n518), .Y(N153) );
  AO22X1 U1205 ( .A0(N1121), .A1(n511), .B0(addrB[41]), .B1(n518), .Y(N172) );
  AO22X1 U1206 ( .A0(N1120), .A1(n511), .B0(addrB[40]), .B1(n518), .Y(N171) );
  AO22X1 U1207 ( .A0(N1119), .A1(n511), .B0(addrB[39]), .B1(n518), .Y(N170) );
  AO22X1 U1208 ( .A0(N1118), .A1(n511), .B0(addrB[38]), .B1(n518), .Y(N169) );
  AO22X1 U1209 ( .A0(N1117), .A1(n511), .B0(addrB[37]), .B1(n518), .Y(N168) );
  AO22X1 U1210 ( .A0(N1116), .A1(n511), .B0(addrB[36]), .B1(n518), .Y(N167) );
  AO22X1 U1211 ( .A0(n448), .A1(n214), .B0(addrB[2]), .B1(n434), .Y(N133) );
  AO22X1 U1212 ( .A0(n449), .A1(n214), .B0(addrB[13]), .B1(n518), .Y(N144) );
  AO22X1 U1213 ( .A0(n450), .A1(n511), .B0(addrB[24]), .B1(n518), .Y(N155) );
  AO22X1 U1214 ( .A0(n451), .A1(n511), .B0(addrB[35]), .B1(n518), .Y(N166) );
  OAI2BB1X1 U1215 ( .A0N(rst_n), .A1N(\Trigger[1][1] ), .B0(n512), .Y(N335) );
  OAI2BB1X1 U1216 ( .A0N(\Trigger[4][4] ), .A1N(rst_n), .B0(n512), .Y(N350) );
  OAI2BB1X1 U1217 ( .A0N(\Trigger[4][3] ), .A1N(rst_n), .B0(n512), .Y(N349) );
  OAI2BB1X1 U1218 ( .A0N(\Trigger[3][4] ), .A1N(rst_n), .B0(n512), .Y(N346) );
  OAI2BB1X1 U1219 ( .A0N(\Trigger[3][3] ), .A1N(rst_n), .B0(n512), .Y(N345) );
  OAI2BB1X1 U1220 ( .A0N(\Trigger[4][2] ), .A1N(rst_n), .B0(n512), .Y(N348) );
  OAI2BB1X1 U1221 ( .A0N(\Trigger[2][4] ), .A1N(rst_n), .B0(n512), .Y(N342) );
  OAI2BB1X1 U1222 ( .A0N(\Trigger[2][3] ), .A1N(rst_n), .B0(n512), .Y(N341) );
  OAI2BB1X1 U1223 ( .A0N(\Trigger[3][2] ), .A1N(rst_n), .B0(n512), .Y(N344) );
  OAI2BB1X1 U1224 ( .A0N(\Trigger[2][2] ), .A1N(rst_n), .B0(n512), .Y(N340) );
  OAI32X1 U1225 ( .A0(n577), .A1(\ADDRACount[2][1] ), .A2(n435), .B0(n212), 
        .B1(n430), .Y(N354) );
  AOI2BB1X1 U1226 ( .A0N(\ADDRACount[2][0] ), .A1N(n577), .B0(n434), .Y(n212)
         );
  OAI32X1 U1227 ( .A0(n573), .A1(\ADDRACount[4][1] ), .A2(n431), .B0(n208), 
        .B1(n440), .Y(N358) );
  AOI2BB1X1 U1228 ( .A0N(\ADDRACount[4][0] ), .A1N(n573), .B0(n434), .Y(n208)
         );
  OAI32X1 U1229 ( .A0(n575), .A1(\ADDRACount[3][1] ), .A2(n432), .B0(n210), 
        .B1(n441), .Y(N356) );
  AOI2BB1X1 U1230 ( .A0N(\ADDRACount[3][0] ), .A1N(n575), .B0(n434), .Y(n210)
         );
  OAI32X1 U1231 ( .A0(n512), .A1(triggerCount[0]), .A2(n604), .B0(n308), .B1(
        n426), .Y(N299) );
  OA21XL U1232 ( .A0(n305), .A1(n512), .B0(n519), .Y(n308) );
  OAI211X1 U1233 ( .A0(n608), .A1(n512), .B0(n182), .C0(n571), .Y(N85) );
  NAND3X1 U1234 ( .A(n183), .B(rst_n), .C(start), .Y(n182) );
  CLKINVX1 U1235 ( .A(n181), .Y(n608) );
  OAI211X1 U1236 ( .A0(n424), .A1(n517), .B0(n425), .C0(rst_n), .Y(N100) );
  NAND2X1 U1237 ( .A(addrA[13]), .B(n516), .Y(n425) );
  AOI22X1 U1238 ( .A0(N841), .A1(n602), .B0(N854), .B1(n423), .Y(n424) );
  OAI211X1 U1239 ( .A0(n409), .A1(n517), .B0(n410), .C0(rst_n), .Y(N112) );
  NAND2X1 U1240 ( .A(addrA[25]), .B(n516), .Y(n410) );
  AOI22X1 U1241 ( .A0(N884), .A1(n411), .B0(N897), .B1(n605), .Y(n409) );
  OAI211X1 U1242 ( .A0(n394), .A1(n517), .B0(n395), .C0(rst_n), .Y(N123) );
  NAND2X1 U1243 ( .A(addrA[36]), .B(n516), .Y(n395) );
  AOI22X1 U1244 ( .A0(N939), .A1(n606), .B0(N926), .B1(n396), .Y(n394) );
  OAI211X1 U1245 ( .A0(n397), .A1(n517), .B0(n398), .C0(rst_n), .Y(N122) );
  NAND2X1 U1246 ( .A(addrA[35]), .B(n516), .Y(n398) );
  AOI22X1 U1247 ( .A0(N938), .A1(n606), .B0(N925), .B1(n396), .Y(n397) );
  NOR2BX1 U1248 ( .AN(DONE[7]), .B(n526), .Y(N290) );
  NOR2BX1 U1249 ( .AN(DONE[13]), .B(n524), .Y(N296) );
  NOR2BX1 U1250 ( .AN(DONE[10]), .B(n523), .Y(N293) );
  AND2X2 U1251 ( .A(DONE[14]), .B(rst_n), .Y(N297) );
  AND2X2 U1252 ( .A(DONE[11]), .B(rst_n), .Y(N294) );
  AND2X2 U1253 ( .A(DONE[6]), .B(rst_n), .Y(N289) );
  AND2X2 U1254 ( .A(DONE[9]), .B(rst_n), .Y(N292) );
  AND2X2 U1255 ( .A(DONE[3]), .B(rst_n), .Y(N286) );
  AND2X2 U1256 ( .A(DONE[5]), .B(rst_n), .Y(N288) );
  AND2X2 U1257 ( .A(DONE[8]), .B(rst_n), .Y(N291) );
  AND2X2 U1258 ( .A(DONE[2]), .B(rst_n), .Y(N285) );
  AND2X2 U1259 ( .A(DONE[12]), .B(rst_n), .Y(N295) );
  CLKINVX1 U1260 ( .A(rst_n), .Y(n526) );
  AO22X1 U1261 ( .A0(addrC[10]), .A1(n517), .B0(N679), .B1(n514), .Y(N727) );
  AO22X1 U1262 ( .A0(addrC[21]), .A1(n517), .B0(N691), .B1(n515), .Y(N739) );
  AO22X1 U1263 ( .A0(addrC[32]), .A1(n516), .B0(N703), .B1(n515), .Y(N751) );
  AO22X1 U1264 ( .A0(addrC[43]), .A1(n517), .B0(N715), .B1(n515), .Y(N763) );
  AO22X1 U1265 ( .A0(addrC[0]), .A1(n517), .B0(N669), .B1(n514), .Y(N717) );
  AO22X1 U1266 ( .A0(addrC[11]), .A1(n517), .B0(N681), .B1(n514), .Y(N729) );
  AO22X1 U1267 ( .A0(addrC[22]), .A1(n517), .B0(N693), .B1(n515), .Y(N741) );
  AO22X1 U1268 ( .A0(addrC[33]), .A1(n516), .B0(N705), .B1(n515), .Y(N753) );
  AO22X1 U1269 ( .A0(addrC[20]), .A1(n517), .B0(N690), .B1(n515), .Y(N738) );
  AO22X1 U1270 ( .A0(addrC[19]), .A1(n517), .B0(N689), .B1(n515), .Y(N737) );
  AO22X1 U1271 ( .A0(addrC[18]), .A1(n517), .B0(N688), .B1(n515), .Y(N736) );
  AO22X1 U1272 ( .A0(addrC[17]), .A1(n517), .B0(N687), .B1(n515), .Y(N735) );
  AO22X1 U1273 ( .A0(addrC[31]), .A1(n516), .B0(N702), .B1(n515), .Y(N750) );
  AO22X1 U1274 ( .A0(addrC[30]), .A1(n516), .B0(N701), .B1(n515), .Y(N749) );
  AO22X1 U1275 ( .A0(addrC[29]), .A1(n516), .B0(N700), .B1(n515), .Y(N748) );
  AO22X1 U1276 ( .A0(addrC[28]), .A1(n516), .B0(N699), .B1(n515), .Y(N747) );
  AO22X1 U1277 ( .A0(addrC[27]), .A1(n516), .B0(N698), .B1(n515), .Y(N746) );
  AO22X1 U1278 ( .A0(addrC[26]), .A1(n516), .B0(N697), .B1(n515), .Y(N745) );
  AO22X1 U1279 ( .A0(addrC[25]), .A1(n516), .B0(N696), .B1(n515), .Y(N744) );
  AO22X1 U1280 ( .A0(addrC[24]), .A1(n516), .B0(N695), .B1(n515), .Y(N743) );
  AO22X1 U1281 ( .A0(addrC[23]), .A1(n517), .B0(N694), .B1(n515), .Y(N742) );
  AO22X1 U1282 ( .A0(addrC[41]), .A1(n516), .B0(N713), .B1(n515), .Y(N761) );
  AO22X1 U1283 ( .A0(addrC[40]), .A1(n516), .B0(N712), .B1(n515), .Y(N760) );
  AO22X1 U1284 ( .A0(addrC[39]), .A1(n516), .B0(N711), .B1(n515), .Y(N759) );
  AO22X1 U1285 ( .A0(addrC[38]), .A1(n516), .B0(N710), .B1(n515), .Y(N758) );
  AO22X1 U1286 ( .A0(addrC[37]), .A1(n516), .B0(N709), .B1(n515), .Y(N757) );
  AO22X1 U1287 ( .A0(addrC[36]), .A1(n516), .B0(N708), .B1(n515), .Y(N756) );
  AO22X1 U1288 ( .A0(addrC[35]), .A1(n516), .B0(N707), .B1(n515), .Y(N755) );
  AO22X1 U1289 ( .A0(addrC[34]), .A1(n516), .B0(N706), .B1(n515), .Y(N754) );
  AO22X1 U1290 ( .A0(addrC[9]), .A1(n517), .B0(N678), .B1(n514), .Y(N726) );
  AO22X1 U1291 ( .A0(addrC[8]), .A1(n517), .B0(N677), .B1(n514), .Y(N725) );
  AO22X1 U1292 ( .A0(addrC[7]), .A1(n517), .B0(N676), .B1(n514), .Y(N724) );
  AO22X1 U1293 ( .A0(addrC[6]), .A1(n517), .B0(N675), .B1(n514), .Y(N723) );
  AO22X1 U1294 ( .A0(addrC[5]), .A1(n517), .B0(N674), .B1(n514), .Y(N722) );
  AO22X1 U1295 ( .A0(addrC[4]), .A1(n517), .B0(N673), .B1(n514), .Y(N721) );
  AO22X1 U1296 ( .A0(addrC[3]), .A1(n517), .B0(N672), .B1(n514), .Y(N720) );
  AO22X1 U1297 ( .A0(addrC[2]), .A1(n517), .B0(N671), .B1(n514), .Y(N719) );
  AO22X1 U1298 ( .A0(addrC[1]), .A1(n517), .B0(N670), .B1(n514), .Y(N718) );
  AO22X1 U1299 ( .A0(addrC[16]), .A1(n517), .B0(N686), .B1(n514), .Y(N734) );
  AO22X1 U1300 ( .A0(addrC[15]), .A1(n517), .B0(N685), .B1(n514), .Y(N733) );
  AO22X1 U1301 ( .A0(addrC[14]), .A1(n517), .B0(N684), .B1(n514), .Y(N732) );
  AO22X1 U1302 ( .A0(addrC[13]), .A1(n517), .B0(N683), .B1(n514), .Y(N731) );
  AO22X1 U1303 ( .A0(addrC[12]), .A1(n517), .B0(N682), .B1(n514), .Y(N730) );
  AO22X1 U1304 ( .A0(addrC[42]), .A1(n516), .B0(N714), .B1(n514), .Y(N762) );
  NOR2X1 U1305 ( .A(n452), .B(n525), .Y(N207) );
  NOR2X1 U1306 ( .A(n453), .B(n525), .Y(N205) );
  NOR2X1 U1307 ( .A(n454), .B(n525), .Y(N218) );
  NOR2X1 U1308 ( .A(n455), .B(n525), .Y(N217) );
  NOR2X1 U1309 ( .A(n456), .B(n525), .Y(N216) );
  NOR2X1 U1310 ( .A(n457), .B(n525), .Y(N215) );
  NOR2X1 U1311 ( .A(n458), .B(n525), .Y(N213) );
  NOR2X1 U1312 ( .A(n459), .B(n525), .Y(N212) );
  NOR2X1 U1313 ( .A(n460), .B(n525), .Y(N211) );
  NOR2X1 U1314 ( .A(n461), .B(n525), .Y(N210) );
  NOR2X1 U1315 ( .A(n462), .B(n525), .Y(N208) );
  NOR2X1 U1316 ( .A(n463), .B(n526), .Y(N185) );
  NOR2X1 U1317 ( .A(n464), .B(n526), .Y(N183) );
  NOR2X1 U1318 ( .A(n465), .B(n526), .Y(N182) );
  NOR2X1 U1319 ( .A(n466), .B(n526), .Y(N196) );
  NOR2X1 U1320 ( .A(n467), .B(n526), .Y(N195) );
  NOR2X1 U1321 ( .A(n468), .B(n526), .Y(N194) );
  NOR2X1 U1322 ( .A(n469), .B(n526), .Y(N193) );
  NOR2X1 U1323 ( .A(n470), .B(n526), .Y(N192) );
  NOR2X1 U1324 ( .A(n471), .B(n526), .Y(N191) );
  NOR2X1 U1325 ( .A(n472), .B(n526), .Y(N190) );
  NOR2X1 U1326 ( .A(n473), .B(n526), .Y(N189) );
  NOR2X1 U1327 ( .A(n474), .B(n526), .Y(N188) );
  NOR2X1 U1328 ( .A(n475), .B(n526), .Y(N187) );
  NOR2X1 U1329 ( .A(n476), .B(n526), .Y(N186) );
  NOR2X1 U1330 ( .A(n477), .B(n526), .Y(N206) );
  NOR2X1 U1331 ( .A(n478), .B(n526), .Y(N204) );
  NOR2X1 U1332 ( .A(n479), .B(n526), .Y(N203) );
  NOR2X1 U1333 ( .A(n480), .B(n526), .Y(N202) );
  NOR2X1 U1334 ( .A(n481), .B(n526), .Y(N201) );
  NOR2X1 U1335 ( .A(n482), .B(n526), .Y(N200) );
  NOR2X1 U1336 ( .A(n483), .B(n526), .Y(N199) );
  NOR2X1 U1337 ( .A(n484), .B(n526), .Y(N198) );
  NOR2X1 U1338 ( .A(n485), .B(n526), .Y(N197) );
  NOR2X1 U1339 ( .A(n486), .B(n526), .Y(N214) );
  NOR2X1 U1340 ( .A(n487), .B(n526), .Y(N209) );
  NOR2X1 U1341 ( .A(n488), .B(n524), .Y(N184) );
  NOR2X1 U1342 ( .A(n489), .B(n523), .Y(N181) );
  NOR2X1 U1343 ( .A(n490), .B(n522), .Y(N180) );
  NOR2X1 U1344 ( .A(n491), .B(n524), .Y(N179) );
  NOR2X1 U1345 ( .A(n492), .B(n523), .Y(N178) );
  NOR2X1 U1346 ( .A(n493), .B(n522), .Y(N177) );
  NOR2X1 U1347 ( .A(n494), .B(n524), .Y(N176) );
  NOR2X1 U1348 ( .A(n495), .B(n523), .Y(N175) );
  NOR2BX1 U1349 ( .AN(START), .B(n522), .Y(N78) );
  CLKINVX1 U1350 ( .A(AIN[0]), .Y(n598) );
  CLKINVX1 U1351 ( .A(AIN[1]), .Y(n597) );
  CLKINVX1 U1352 ( .A(AIN[2]), .Y(n596) );
  CLKINVX1 U1353 ( .A(AIN[3]), .Y(n595) );
  CLKINVX1 U1354 ( .A(AIN[4]), .Y(n594) );
  CLKINVX1 U1355 ( .A(AIN[5]), .Y(n593) );
  CLKINVX1 U1356 ( .A(AIN[6]), .Y(n592) );
  CLKINVX1 U1357 ( .A(AIN[7]), .Y(n591) );
  CLKINVX1 U1358 ( .A(AIN[8]), .Y(n590) );
  CLKINVX1 U1359 ( .A(AIN[9]), .Y(n589) );
  CLKINVX1 U1360 ( .A(AIN[10]), .Y(n588) );
  CLKINVX1 U1361 ( .A(AIN[11]), .Y(n587) );
  CLKINVX1 U1362 ( .A(AIN[12]), .Y(n586) );
  CLKINVX1 U1363 ( .A(AIN[13]), .Y(n585) );
  CLKINVX1 U1364 ( .A(AIN[14]), .Y(n584) );
  CLKINVX1 U1365 ( .A(AIN[15]), .Y(n583) );
  XOR2X1 U1366 ( .A(addrA[21]), .B(\add_426/carry[10] ), .Y(N862) );
  AND2X1 U1367 ( .A(\add_426/carry[9] ), .B(addrA[20]), .Y(\add_426/carry[10] ) );
  XOR2X1 U1368 ( .A(addrA[20]), .B(\add_426/carry[9] ), .Y(N861) );
  AND2X1 U1369 ( .A(\add_426/carry[8] ), .B(addrA[19]), .Y(\add_426/carry[9] )
         );
  XOR2X1 U1370 ( .A(addrA[19]), .B(\add_426/carry[8] ), .Y(N860) );
  AND2X1 U1371 ( .A(\add_426/carry[7] ), .B(addrA[18]), .Y(\add_426/carry[8] )
         );
  XOR2X1 U1372 ( .A(addrA[18]), .B(\add_426/carry[7] ), .Y(N859) );
  AND2X1 U1373 ( .A(\add_426/carry[6] ), .B(addrA[17]), .Y(\add_426/carry[7] )
         );
  XOR2X1 U1374 ( .A(addrA[17]), .B(\add_426/carry[6] ), .Y(N858) );
  AND2X1 U1375 ( .A(\add_426/carry[5] ), .B(addrA[16]), .Y(\add_426/carry[6] )
         );
  XOR2X1 U1376 ( .A(addrA[16]), .B(\add_426/carry[5] ), .Y(N857) );
  AND2X1 U1377 ( .A(\add_426/carry[4] ), .B(addrA[15]), .Y(\add_426/carry[5] )
         );
  XOR2X1 U1378 ( .A(addrA[15]), .B(\add_426/carry[4] ), .Y(N856) );
  OR2X1 U1379 ( .A(addrA[14]), .B(\add_426/carry[3] ), .Y(\add_426/carry[4] )
         );
  XNOR2X1 U1380 ( .A(\add_426/carry[3] ), .B(addrA[14]), .Y(N855) );
  OR2X1 U1381 ( .A(addrA[13]), .B(\add_426/carry[2] ), .Y(\add_426/carry[3] )
         );
  XNOR2X1 U1382 ( .A(\add_426/carry[2] ), .B(addrA[13]), .Y(N854) );
  AND2X1 U1383 ( .A(addrA[11]), .B(addrA[12]), .Y(\add_426/carry[2] ) );
  XOR2X1 U1384 ( .A(addrA[12]), .B(addrA[11]), .Y(N853) );
  XOR2X1 U1385 ( .A(addrA[32]), .B(\add_436/carry[10] ), .Y(N904) );
  AND2X1 U1386 ( .A(\add_436/carry[9] ), .B(addrA[31]), .Y(\add_436/carry[10] ) );
  XOR2X1 U1387 ( .A(addrA[31]), .B(\add_436/carry[9] ), .Y(N903) );
  AND2X1 U1388 ( .A(\add_436/carry[8] ), .B(addrA[30]), .Y(\add_436/carry[9] )
         );
  XOR2X1 U1389 ( .A(addrA[30]), .B(\add_436/carry[8] ), .Y(N902) );
  AND2X1 U1390 ( .A(\add_436/carry[7] ), .B(addrA[29]), .Y(\add_436/carry[8] )
         );
  XOR2X1 U1391 ( .A(addrA[29]), .B(\add_436/carry[7] ), .Y(N901) );
  AND2X1 U1392 ( .A(\add_436/carry[6] ), .B(addrA[28]), .Y(\add_436/carry[7] )
         );
  XOR2X1 U1393 ( .A(addrA[28]), .B(\add_436/carry[6] ), .Y(N900) );
  AND2X1 U1394 ( .A(\add_436/carry[5] ), .B(addrA[27]), .Y(\add_436/carry[6] )
         );
  XOR2X1 U1395 ( .A(addrA[27]), .B(\add_436/carry[5] ), .Y(N899) );
  AND2X1 U1396 ( .A(\add_436/carry[4] ), .B(addrA[26]), .Y(\add_436/carry[5] )
         );
  XOR2X1 U1397 ( .A(addrA[26]), .B(\add_436/carry[4] ), .Y(N898) );
  OR2X1 U1398 ( .A(addrA[25]), .B(\add_436/carry[3] ), .Y(\add_436/carry[4] )
         );
  XNOR2X1 U1399 ( .A(\add_436/carry[3] ), .B(addrA[25]), .Y(N897) );
  OR2X1 U1400 ( .A(addrA[24]), .B(\add_436/carry[2] ), .Y(\add_436/carry[3] )
         );
  XNOR2X1 U1401 ( .A(\add_436/carry[2] ), .B(addrA[24]), .Y(N896) );
  AND2X1 U1402 ( .A(addrA[22]), .B(addrA[23]), .Y(\add_436/carry[2] ) );
  XOR2X1 U1403 ( .A(addrA[23]), .B(addrA[22]), .Y(N895) );
  XOR2X1 U1404 ( .A(addrA[43]), .B(\add_446/carry[10] ), .Y(N946) );
  AND2X1 U1405 ( .A(\add_446/carry[9] ), .B(addrA[42]), .Y(\add_446/carry[10] ) );
  XOR2X1 U1406 ( .A(addrA[42]), .B(\add_446/carry[9] ), .Y(N945) );
  AND2X1 U1407 ( .A(\add_446/carry[8] ), .B(addrA[41]), .Y(\add_446/carry[9] )
         );
  XOR2X1 U1408 ( .A(addrA[41]), .B(\add_446/carry[8] ), .Y(N944) );
  AND2X1 U1409 ( .A(\add_446/carry[7] ), .B(addrA[40]), .Y(\add_446/carry[8] )
         );
  XOR2X1 U1410 ( .A(addrA[40]), .B(\add_446/carry[7] ), .Y(N943) );
  AND2X1 U1411 ( .A(\add_446/carry[6] ), .B(addrA[39]), .Y(\add_446/carry[7] )
         );
  XOR2X1 U1412 ( .A(addrA[39]), .B(\add_446/carry[6] ), .Y(N942) );
  AND2X1 U1413 ( .A(\add_446/carry[5] ), .B(addrA[38]), .Y(\add_446/carry[6] )
         );
  XOR2X1 U1414 ( .A(addrA[38]), .B(\add_446/carry[5] ), .Y(N941) );
  AND2X1 U1415 ( .A(\add_446/carry[4] ), .B(addrA[37]), .Y(\add_446/carry[5] )
         );
  XOR2X1 U1416 ( .A(addrA[37]), .B(\add_446/carry[4] ), .Y(N940) );
  OR2X1 U1417 ( .A(addrA[36]), .B(\add_446/carry[3] ), .Y(\add_446/carry[4] )
         );
  XNOR2X1 U1418 ( .A(\add_446/carry[3] ), .B(addrA[36]), .Y(N939) );
  OR2X1 U1419 ( .A(addrA[35]), .B(\add_446/carry[2] ), .Y(\add_446/carry[3] )
         );
  XNOR2X1 U1420 ( .A(\add_446/carry[2] ), .B(addrA[35]), .Y(N938) );
  AND2X1 U1421 ( .A(addrA[33]), .B(addrA[34]), .Y(\add_446/carry[2] ) );
  XOR2X1 U1422 ( .A(addrA[34]), .B(addrA[33]), .Y(N937) );
  XOR2X1 U1423 ( .A(addrB[10]), .B(\r543/carry [10]), .Y(N997) );
  AND2X1 U1424 ( .A(\r543/carry [9]), .B(addrB[9]), .Y(\r543/carry [10]) );
  XOR2X1 U1425 ( .A(addrB[9]), .B(\r543/carry [9]), .Y(N996) );
  AND2X1 U1426 ( .A(\r543/carry [8]), .B(addrB[8]), .Y(\r543/carry [9]) );
  XOR2X1 U1427 ( .A(addrB[8]), .B(\r543/carry [8]), .Y(N995) );
  AND2X1 U1428 ( .A(\r543/carry [7]), .B(addrB[7]), .Y(\r543/carry [8]) );
  XOR2X1 U1429 ( .A(addrB[7]), .B(\r543/carry [7]), .Y(N994) );
  AND2X1 U1430 ( .A(\r543/carry [6]), .B(addrB[6]), .Y(\r543/carry [7]) );
  XOR2X1 U1431 ( .A(addrB[6]), .B(\r543/carry [6]), .Y(N993) );
  AND2X1 U1432 ( .A(\r543/carry [5]), .B(addrB[5]), .Y(\r543/carry [6]) );
  XOR2X1 U1433 ( .A(addrB[5]), .B(\r543/carry [5]), .Y(N992) );
  AND2X1 U1434 ( .A(\r543/carry [4]), .B(addrB[4]), .Y(\r543/carry [5]) );
  XOR2X1 U1435 ( .A(addrB[4]), .B(\r543/carry [4]), .Y(N991) );
  AND2X1 U1436 ( .A(addrB[2]), .B(addrB[3]), .Y(\r543/carry [4]) );
  XOR2X1 U1437 ( .A(addrB[3]), .B(addrB[2]), .Y(N990) );
  XOR2X1 U1438 ( .A(addrB[21]), .B(\r546/carry [10]), .Y(N1039) );
  AND2X1 U1439 ( .A(\r546/carry [9]), .B(addrB[20]), .Y(\r546/carry [10]) );
  XOR2X1 U1440 ( .A(addrB[20]), .B(\r546/carry [9]), .Y(N1038) );
  AND2X1 U1441 ( .A(\r546/carry [8]), .B(addrB[19]), .Y(\r546/carry [9]) );
  XOR2X1 U1442 ( .A(addrB[19]), .B(\r546/carry [8]), .Y(N1037) );
  AND2X1 U1443 ( .A(\r546/carry [7]), .B(addrB[18]), .Y(\r546/carry [8]) );
  XOR2X1 U1444 ( .A(addrB[18]), .B(\r546/carry [7]), .Y(N1036) );
  AND2X1 U1445 ( .A(\r546/carry [6]), .B(addrB[17]), .Y(\r546/carry [7]) );
  XOR2X1 U1446 ( .A(addrB[17]), .B(\r546/carry [6]), .Y(N1035) );
  AND2X1 U1447 ( .A(\r546/carry [5]), .B(addrB[16]), .Y(\r546/carry [6]) );
  XOR2X1 U1448 ( .A(addrB[16]), .B(\r546/carry [5]), .Y(N1034) );
  AND2X1 U1449 ( .A(\r546/carry [4]), .B(addrB[15]), .Y(\r546/carry [5]) );
  XOR2X1 U1450 ( .A(addrB[15]), .B(\r546/carry [4]), .Y(N1033) );
  AND2X1 U1451 ( .A(addrB[13]), .B(addrB[14]), .Y(\r546/carry [4]) );
  XOR2X1 U1452 ( .A(addrB[14]), .B(addrB[13]), .Y(N1032) );
  XOR2X1 U1453 ( .A(addrB[32]), .B(\r549/carry [10]), .Y(N1081) );
  AND2X1 U1454 ( .A(\r549/carry [9]), .B(addrB[31]), .Y(\r549/carry [10]) );
  XOR2X1 U1455 ( .A(addrB[31]), .B(\r549/carry [9]), .Y(N1080) );
  AND2X1 U1456 ( .A(\r549/carry [8]), .B(addrB[30]), .Y(\r549/carry [9]) );
  XOR2X1 U1457 ( .A(addrB[30]), .B(\r549/carry [8]), .Y(N1079) );
  AND2X1 U1458 ( .A(\r549/carry [7]), .B(addrB[29]), .Y(\r549/carry [8]) );
  XOR2X1 U1459 ( .A(addrB[29]), .B(\r549/carry [7]), .Y(N1078) );
  AND2X1 U1460 ( .A(\r549/carry [6]), .B(addrB[28]), .Y(\r549/carry [7]) );
  XOR2X1 U1461 ( .A(addrB[28]), .B(\r549/carry [6]), .Y(N1077) );
  AND2X1 U1462 ( .A(\r549/carry [5]), .B(addrB[27]), .Y(\r549/carry [6]) );
  XOR2X1 U1463 ( .A(addrB[27]), .B(\r549/carry [5]), .Y(N1076) );
  AND2X1 U1464 ( .A(\r549/carry [4]), .B(addrB[26]), .Y(\r549/carry [5]) );
  XOR2X1 U1465 ( .A(addrB[26]), .B(\r549/carry [4]), .Y(N1075) );
  AND2X1 U1466 ( .A(addrB[24]), .B(addrB[25]), .Y(\r549/carry [4]) );
  XOR2X1 U1467 ( .A(addrB[25]), .B(addrB[24]), .Y(N1074) );
  XOR2X1 U1468 ( .A(addrB[43]), .B(\r552/carry [10]), .Y(N1123) );
  AND2X1 U1469 ( .A(\r552/carry [9]), .B(addrB[42]), .Y(\r552/carry [10]) );
  XOR2X1 U1470 ( .A(addrB[42]), .B(\r552/carry [9]), .Y(N1122) );
  AND2X1 U1471 ( .A(\r552/carry [8]), .B(addrB[41]), .Y(\r552/carry [9]) );
  XOR2X1 U1472 ( .A(addrB[41]), .B(\r552/carry [8]), .Y(N1121) );
  AND2X1 U1473 ( .A(\r552/carry [7]), .B(addrB[40]), .Y(\r552/carry [8]) );
  XOR2X1 U1474 ( .A(addrB[40]), .B(\r552/carry [7]), .Y(N1120) );
  AND2X1 U1475 ( .A(\r552/carry [6]), .B(addrB[39]), .Y(\r552/carry [7]) );
  XOR2X1 U1476 ( .A(addrB[39]), .B(\r552/carry [6]), .Y(N1119) );
  AND2X1 U1477 ( .A(\r552/carry [5]), .B(addrB[38]), .Y(\r552/carry [6]) );
  XOR2X1 U1478 ( .A(addrB[38]), .B(\r552/carry [5]), .Y(N1118) );
  AND2X1 U1479 ( .A(\r552/carry [4]), .B(addrB[37]), .Y(\r552/carry [5]) );
  XOR2X1 U1480 ( .A(addrB[37]), .B(\r552/carry [4]), .Y(N1117) );
  AND2X1 U1481 ( .A(addrB[35]), .B(addrB[36]), .Y(\r552/carry [4]) );
  XOR2X1 U1482 ( .A(addrB[36]), .B(addrB[35]), .Y(N1116) );
  XOR2X1 U1483 ( .A(addrA[10]), .B(\add_417/carry[10] ), .Y(N820) );
  AND2X1 U1484 ( .A(\add_417/carry[9] ), .B(addrA[9]), .Y(\add_417/carry[10] )
         );
  XOR2X1 U1485 ( .A(addrA[9]), .B(\add_417/carry[9] ), .Y(N819) );
  AND2X1 U1486 ( .A(\add_417/carry[8] ), .B(addrA[8]), .Y(\add_417/carry[9] )
         );
  XOR2X1 U1487 ( .A(addrA[8]), .B(\add_417/carry[8] ), .Y(N818) );
  AND2X1 U1488 ( .A(\add_417/carry[7] ), .B(addrA[7]), .Y(\add_417/carry[8] )
         );
  XOR2X1 U1489 ( .A(addrA[7]), .B(\add_417/carry[7] ), .Y(N817) );
  AND2X1 U1490 ( .A(\add_417/carry[6] ), .B(addrA[6]), .Y(\add_417/carry[7] )
         );
  XOR2X1 U1491 ( .A(addrA[6]), .B(\add_417/carry[6] ), .Y(N816) );
  AND2X1 U1492 ( .A(\add_417/carry[5] ), .B(addrA[5]), .Y(\add_417/carry[6] )
         );
  XOR2X1 U1493 ( .A(addrA[5]), .B(\add_417/carry[5] ), .Y(N815) );
  AND2X1 U1494 ( .A(\add_417/carry[4] ), .B(addrA[4]), .Y(\add_417/carry[5] )
         );
  XOR2X1 U1495 ( .A(addrA[4]), .B(\add_417/carry[4] ), .Y(N814) );
  OR2X1 U1496 ( .A(addrA[3]), .B(\add_417/carry[3] ), .Y(\add_417/carry[4] )
         );
  XNOR2X1 U1497 ( .A(\add_417/carry[3] ), .B(addrA[3]), .Y(N813) );
  OR2X1 U1498 ( .A(addrA[2]), .B(\add_417/carry[2] ), .Y(\add_417/carry[3] )
         );
  XNOR2X1 U1499 ( .A(\add_417/carry[2] ), .B(addrA[2]), .Y(N812) );
  AND2X1 U1500 ( .A(addrA[0]), .B(addrA[1]), .Y(\add_417/carry[2] ) );
  XOR2X1 U1501 ( .A(addrA[1]), .B(addrA[0]), .Y(N811) );
endmodule

