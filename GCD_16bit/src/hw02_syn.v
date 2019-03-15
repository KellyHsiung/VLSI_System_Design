/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Thu Mar 14 16:21:29 2019
/////////////////////////////////////////////////////////////


module GCD_DW01_sub_0 ( A, B, CI, DIFF, CO );
  input [15:0] A;
  input [15:0] B;
  output [15:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17;
  wire   [16:0] carry;

  XOR3X1 U2_15 ( .A(A[15]), .B(n3), .C(carry[15]), .Y(DIFF[15]) );
  ADDFXL U2_14 ( .A(A[14]), .B(n2), .CI(carry[14]), .CO(carry[15]), .S(
        DIFF[14]) );
  ADDFXL U2_13 ( .A(A[13]), .B(n4), .CI(carry[13]), .CO(carry[14]), .S(
        DIFF[13]) );
  ADDFXL U2_12 ( .A(A[12]), .B(n14), .CI(carry[12]), .CO(carry[13]), .S(
        DIFF[12]) );
  ADDFXL U2_11 ( .A(A[11]), .B(n15), .CI(carry[11]), .CO(carry[12]), .S(
        DIFF[11]) );
  ADDFXL U2_10 ( .A(A[10]), .B(n16), .CI(carry[10]), .CO(carry[11]), .S(
        DIFF[10]) );
  ADDFXL U2_9 ( .A(A[9]), .B(n5), .CI(carry[9]), .CO(carry[10]), .S(DIFF[9])
         );
  ADDFXL U2_8 ( .A(A[8]), .B(n6), .CI(carry[8]), .CO(carry[9]), .S(DIFF[8]) );
  ADDFXL U2_7 ( .A(A[7]), .B(n7), .CI(carry[7]), .CO(carry[8]), .S(DIFF[7]) );
  ADDFXL U2_6 ( .A(A[6]), .B(n8), .CI(carry[6]), .CO(carry[7]), .S(DIFF[6]) );
  ADDFXL U2_5 ( .A(A[5]), .B(n9), .CI(carry[5]), .CO(carry[6]), .S(DIFF[5]) );
  ADDFXL U2_4 ( .A(A[4]), .B(n10), .CI(carry[4]), .CO(carry[5]), .S(DIFF[4])
         );
  ADDFXL U2_3 ( .A(A[3]), .B(n11), .CI(carry[3]), .CO(carry[4]), .S(DIFF[3])
         );
  ADDFXL U2_2 ( .A(A[2]), .B(n12), .CI(carry[2]), .CO(carry[3]), .S(DIFF[2])
         );
  ADDFXL U2_1 ( .A(A[1]), .B(n13), .CI(carry[1]), .CO(carry[2]), .S(DIFF[1])
         );
  CLKINVX1 U1 ( .A(B[0]), .Y(n17) );
  CLKINVX1 U2 ( .A(B[1]), .Y(n13) );
  NAND2X1 U3 ( .A(B[0]), .B(n1), .Y(carry[1]) );
  CLKINVX1 U4 ( .A(B[2]), .Y(n12) );
  CLKINVX1 U5 ( .A(B[3]), .Y(n11) );
  CLKINVX1 U6 ( .A(B[4]), .Y(n10) );
  CLKINVX1 U7 ( .A(B[5]), .Y(n9) );
  CLKINVX1 U8 ( .A(B[6]), .Y(n8) );
  CLKINVX1 U9 ( .A(B[7]), .Y(n7) );
  CLKINVX1 U10 ( .A(B[8]), .Y(n6) );
  CLKINVX1 U11 ( .A(B[9]), .Y(n5) );
  CLKINVX1 U12 ( .A(B[10]), .Y(n16) );
  CLKINVX1 U13 ( .A(B[11]), .Y(n15) );
  CLKINVX1 U14 ( .A(B[12]), .Y(n14) );
  CLKINVX1 U15 ( .A(B[13]), .Y(n4) );
  CLKINVX1 U16 ( .A(B[14]), .Y(n2) );
  CLKINVX1 U17 ( .A(A[0]), .Y(n1) );
  CLKINVX1 U18 ( .A(B[15]), .Y(n3) );
  XNOR2X1 U19 ( .A(n17), .B(A[0]), .Y(DIFF[0]) );
endmodule


module GCD_DW01_sub_1 ( A, B, CI, DIFF, CO );
  input [15:0] A;
  input [15:0] B;
  output [15:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17;
  wire   [16:0] carry;

  ADDFXL U2_14 ( .A(A[14]), .B(n3), .CI(carry[14]), .CO(carry[15]), .S(
        DIFF[14]) );
  ADDFXL U2_13 ( .A(A[13]), .B(n5), .CI(carry[13]), .CO(carry[14]), .S(
        DIFF[13]) );
  ADDFXL U2_12 ( .A(A[12]), .B(n15), .CI(carry[12]), .CO(carry[13]), .S(
        DIFF[12]) );
  ADDFXL U2_11 ( .A(A[11]), .B(n16), .CI(carry[11]), .CO(carry[12]), .S(
        DIFF[11]) );
  ADDFXL U2_10 ( .A(A[10]), .B(n17), .CI(carry[10]), .CO(carry[11]), .S(
        DIFF[10]) );
  ADDFXL U2_9 ( .A(A[9]), .B(n6), .CI(carry[9]), .CO(carry[10]), .S(DIFF[9])
         );
  ADDFXL U2_8 ( .A(A[8]), .B(n7), .CI(carry[8]), .CO(carry[9]), .S(DIFF[8]) );
  ADDFXL U2_7 ( .A(A[7]), .B(n8), .CI(carry[7]), .CO(carry[8]), .S(DIFF[7]) );
  ADDFXL U2_6 ( .A(A[6]), .B(n9), .CI(carry[6]), .CO(carry[7]), .S(DIFF[6]) );
  ADDFXL U2_5 ( .A(A[5]), .B(n10), .CI(carry[5]), .CO(carry[6]), .S(DIFF[5])
         );
  ADDFXL U2_4 ( .A(A[4]), .B(n11), .CI(carry[4]), .CO(carry[5]), .S(DIFF[4])
         );
  ADDFXL U2_3 ( .A(A[3]), .B(n12), .CI(carry[3]), .CO(carry[4]), .S(DIFF[3])
         );
  ADDFXL U2_2 ( .A(A[2]), .B(n13), .CI(carry[2]), .CO(carry[3]), .S(DIFF[2])
         );
  ADDFXL U2_1 ( .A(A[1]), .B(n14), .CI(carry[1]), .CO(carry[2]), .S(DIFF[1])
         );
  XOR3X1 U2_15 ( .A(A[15]), .B(n4), .C(carry[15]), .Y(DIFF[15]) );
  CLKINVX1 U1 ( .A(B[15]), .Y(n4) );
  CLKINVX1 U2 ( .A(B[0]), .Y(n2) );
  CLKINVX1 U3 ( .A(B[1]), .Y(n14) );
  NAND2X1 U4 ( .A(B[0]), .B(n1), .Y(carry[1]) );
  CLKINVX1 U5 ( .A(B[2]), .Y(n13) );
  CLKINVX1 U6 ( .A(B[3]), .Y(n12) );
  CLKINVX1 U7 ( .A(B[4]), .Y(n11) );
  CLKINVX1 U8 ( .A(B[5]), .Y(n10) );
  CLKINVX1 U9 ( .A(B[6]), .Y(n9) );
  CLKINVX1 U10 ( .A(B[7]), .Y(n8) );
  CLKINVX1 U11 ( .A(B[8]), .Y(n7) );
  CLKINVX1 U12 ( .A(B[9]), .Y(n6) );
  CLKINVX1 U13 ( .A(B[10]), .Y(n17) );
  CLKINVX1 U14 ( .A(B[11]), .Y(n16) );
  CLKINVX1 U15 ( .A(B[12]), .Y(n15) );
  CLKINVX1 U16 ( .A(B[13]), .Y(n5) );
  CLKINVX1 U17 ( .A(B[14]), .Y(n3) );
  CLKINVX1 U18 ( .A(A[0]), .Y(n1) );
  XNOR2X1 U19 ( .A(n2), .B(A[0]), .Y(DIFF[0]) );
endmodule


module GCD_DW01_cmp6_0 ( A, B, TC, LT, GT, EQ, LE, GE, NE );
  input [15:0] A;
  input [15:0] B;
  input TC;
  output LT, GT, EQ, LE, GE, NE;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71;

  CLKINVX1 U1 ( .A(n57), .Y(n2) );
  CLKINVX1 U2 ( .A(n59), .Y(n3) );
  CLKINVX1 U3 ( .A(n67), .Y(n4) );
  CLKINVX1 U4 ( .A(n69), .Y(n5) );
  CLKINVX1 U5 ( .A(A[1]), .Y(n12) );
  CLKINVX1 U6 ( .A(n54), .Y(n1) );
  CLKINVX1 U7 ( .A(B[14]), .Y(n7) );
  CLKINVX1 U8 ( .A(B[2]), .Y(n11) );
  CLKINVX1 U9 ( .A(B[3]), .Y(n10) );
  CLKINVX1 U10 ( .A(B[7]), .Y(n9) );
  CLKINVX1 U11 ( .A(B[10]), .Y(n14) );
  CLKINVX1 U12 ( .A(A[14]), .Y(n6) );
  CLKINVX1 U13 ( .A(B[11]), .Y(n13) );
  CLKINVX1 U14 ( .A(A[15]), .Y(n8) );
  OAI21XL U15 ( .A0(n15), .A1(n16), .B0(n17), .Y(LT) );
  AOI32X1 U16 ( .A0(n18), .A1(n19), .A2(n20), .B0(B[14]), .B1(n6), .Y(n16) );
  OAI211X1 U17 ( .A0(n21), .A1(n22), .B0(n23), .C0(n24), .Y(n18) );
  OAI31XL U18 ( .A0(n25), .A1(n26), .A2(n27), .B0(n28), .Y(n22) );
  AOI211X1 U19 ( .A0(n29), .A1(n30), .B0(n31), .C0(n32), .Y(n27) );
  AOI31X1 U20 ( .A0(n33), .A1(n34), .A2(n35), .B0(n36), .Y(n29) );
  NAND3BX1 U21 ( .AN(n37), .B(n38), .C(n39), .Y(n33) );
  NAND3X1 U22 ( .A(n40), .B(n41), .C(n42), .Y(n38) );
  OAI211X1 U23 ( .A0(n43), .A1(n44), .B0(n45), .C0(n46), .Y(n40) );
  OAI31XL U24 ( .A0(n47), .A1(n48), .A2(n49), .B0(n50), .Y(n44) );
  AOI211X1 U25 ( .A0(A[1]), .A1(n51), .B0(n52), .C0(n53), .Y(n49) );
  AOI2BB1X1 U26 ( .A0N(n51), .A1N(A[1]), .B0(B[1]), .Y(n53) );
  NAND2BX1 U27 ( .AN(A[0]), .B(B[0]), .Y(n51) );
  AO21X1 U28 ( .A0(n17), .A1(n1), .B0(n15), .Y(GT) );
  NOR2X1 U29 ( .A(n8), .B(B[15]), .Y(n15) );
  AOI32X1 U30 ( .A0(n55), .A1(n24), .A2(n20), .B0(A[14]), .B1(n7), .Y(n54) );
  XOR2X1 U31 ( .A(n6), .B(B[14]), .Y(n20) );
  NAND2BX1 U32 ( .AN(A[13]), .B(B[13]), .Y(n24) );
  OAI211X1 U33 ( .A0(n21), .A1(n2), .B0(n19), .C0(n56), .Y(n55) );
  NAND2BX1 U34 ( .AN(B[13]), .B(A[13]), .Y(n19) );
  AOI31X1 U35 ( .A0(n3), .A1(n58), .A2(n28), .B0(n25), .Y(n57) );
  NOR2X1 U36 ( .A(n13), .B(A[11]), .Y(n25) );
  NAND2X1 U37 ( .A(A[11]), .B(n13), .Y(n28) );
  NOR3BXL U38 ( .AN(n30), .B(n31), .C(n60), .Y(n59) );
  AOI211X1 U39 ( .A0(n61), .A1(n35), .B0(n62), .C0(n32), .Y(n60) );
  NOR2BX1 U40 ( .AN(A[9]), .B(B[9]), .Y(n32) );
  NOR2X1 U41 ( .A(n62), .B(n36), .Y(n35) );
  NOR2BX1 U42 ( .AN(B[8]), .B(A[8]), .Y(n36) );
  NOR2BX1 U43 ( .AN(A[8]), .B(B[8]), .Y(n62) );
  AOI31X1 U44 ( .A0(n34), .A1(n63), .A2(n64), .B0(n37), .Y(n61) );
  NOR2X1 U45 ( .A(n9), .B(A[7]), .Y(n37) );
  NAND3X1 U46 ( .A(n65), .B(n46), .C(n42), .Y(n64) );
  AND2X1 U47 ( .A(n63), .B(n39), .Y(n42) );
  NAND2BX1 U48 ( .AN(A[6]), .B(B[6]), .Y(n39) );
  NAND2BX1 U49 ( .AN(A[5]), .B(B[5]), .Y(n46) );
  OAI211X1 U50 ( .A0(n43), .A1(n4), .B0(n41), .C0(n66), .Y(n65) );
  NAND2BX1 U51 ( .AN(B[5]), .B(A[5]), .Y(n41) );
  AOI31X1 U52 ( .A0(n5), .A1(n68), .A2(n50), .B0(n47), .Y(n67) );
  NOR2X1 U53 ( .A(n10), .B(A[3]), .Y(n47) );
  NAND2X1 U54 ( .A(A[3]), .B(n10), .Y(n50) );
  AOI211X1 U55 ( .A0(n70), .A1(n12), .B0(n52), .C0(n71), .Y(n69) );
  OA21XL U56 ( .A0(n70), .A1(n12), .B0(B[1]), .Y(n71) );
  NAND2BX1 U57 ( .AN(n48), .B(n68), .Y(n52) );
  NAND2X1 U58 ( .A(A[2]), .B(n11), .Y(n68) );
  NOR2X1 U59 ( .A(n11), .B(A[2]), .Y(n48) );
  NAND2BX1 U60 ( .AN(B[0]), .B(A[0]), .Y(n70) );
  NAND2X1 U61 ( .A(n66), .B(n45), .Y(n43) );
  NAND2BX1 U62 ( .AN(A[4]), .B(B[4]), .Y(n45) );
  NAND2BX1 U63 ( .AN(B[4]), .B(A[4]), .Y(n66) );
  NAND2BX1 U64 ( .AN(B[6]), .B(A[6]), .Y(n63) );
  NAND2X1 U65 ( .A(A[7]), .B(n9), .Y(n34) );
  NAND2BX1 U66 ( .AN(n26), .B(n58), .Y(n31) );
  NAND2X1 U67 ( .A(A[10]), .B(n14), .Y(n58) );
  NOR2X1 U68 ( .A(n14), .B(A[10]), .Y(n26) );
  NAND2BX1 U69 ( .AN(A[9]), .B(B[9]), .Y(n30) );
  NAND2X1 U70 ( .A(n56), .B(n23), .Y(n21) );
  NAND2BX1 U71 ( .AN(A[12]), .B(B[12]), .Y(n23) );
  NAND2BX1 U72 ( .AN(B[12]), .B(A[12]), .Y(n56) );
  NAND2X1 U73 ( .A(B[15]), .B(n8), .Y(n17) );
endmodule


module GCD ( CLK, RST_N, A, B, START, Y, DONE, ERROR );
  input [7:0] A;
  input [7:0] B;
  output [7:0] Y;
  input CLK, RST_N, START;
  output DONE, ERROR;
  wire   start, N46, N47, N52, N53, N54, N55, N56, N57, N58, N59, N60, N61,
         N62, N63, N64, N65, N66, N67, N85, N86, N87, N88, N89, N90, N91, N92,
         N93, N94, N95, N96, N97, N98, N99, N100, n12, n14, n15, n16, n17, n18,
         n20, n21, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42, n44, n46,
         n48, n50, n52, n54, n56, n58, n59, n61, n62, n63, n64, n65, n66, n67,
         n68, n69, n70, n71, n72, n73, n74, n76, n77, n78, n79, n80, n82, n83,
         n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97,
         n98, n99, n101, n102, n103, n104, n105, n106, n107, n108, n109, n110,
         n111, n112, n113, n114, n115, n116, n117, n118, n119, n120, n121,
         n122, n123, n124, n125, n126, n127, n128, n129, n130, n131, n132,
         n133, n134, n135, n136, n137, n138, n139, n140, n141, n142, n143,
         n144, n145, n146, n147, n148, n149, n150, n151, n152, n153, n154,
         n155, n156, n157, n158, n159, n160, n161, n162, n163, n164, n165,
         n166, n167, n168, n169, n170, n171, n172, n173, n174, n175, n176,
         n177, n178, n179, n180, n181, n182, n183, n184, n185, n186, n187,
         n188, n189, n190, n191, n192, n193, n194, n195, n196, n197, n198,
         n199, n200, n201, n202, n203, n204, n205, n206, n207, n208, n209,
         n210, n211, n212, n213, n214, n215, n216, n217, n218, n219, n220,
         n221, n222, n223, n224, n225, n226, n227, n228, n229, n230, n231,
         n232, n233, n234, n235, n237, n238, n239, n240, n241, n242, n243,
         n244, n245, n246, n247, n248, n249, n250, n251, n252, n253, n254,
         n255, n256, n257, n258, n259, n260, n261, n262, n263, n264, n265;
  wire   [15:0] A_all;
  wire   [15:0] B_all;
  wire   [2:0] next_state;
  wire   [7:0] next_Y;
  wire   [7:0] next_A_hi;
  wire   [7:0] next_B_hi;

  GCD_DW01_sub_0 r318 ( .A(B_all), .B(A_all), .CI(1'b0), .DIFF({N100, N99, N98, 
        N97, N96, N95, N94, N93, N92, N91, N90, N89, N88, N87, N86, N85}) );
  GCD_DW01_sub_1 r317 ( .A(A_all), .B(B_all), .CI(1'b0), .DIFF({N67, N66, N65, 
        N64, N63, N62, N61, N60, N59, N58, N57, N56, N55, N54, N53, N52}) );
  GCD_DW01_cmp6_0 r316 ( .A(A_all), .B(B_all), .TC(1'b0), .LT(N47), .GT(N46)
         );
  DFFRX1 \temp_B_hi_reg[7]  ( .D(next_B_hi[7]), .CK(CLK), .RN(RST_N), .QN(n173) );
  DFFRX1 \temp_B_hi_reg[6]  ( .D(next_B_hi[6]), .CK(CLK), .RN(RST_N), .QN(n171) );
  DFFRX1 \temp_B_hi_reg[5]  ( .D(next_B_hi[5]), .CK(CLK), .RN(RST_N), .QN(n175) );
  DFFRX1 \temp_B_hi_reg[4]  ( .D(next_B_hi[4]), .CK(CLK), .RN(RST_N), .QN(n181) );
  DFFRX1 \temp_B_hi_reg[3]  ( .D(next_B_hi[3]), .CK(CLK), .RN(RST_N), .QN(n183) );
  DFFRX1 \temp_B_hi_reg[2]  ( .D(next_B_hi[2]), .CK(CLK), .RN(RST_N), .QN(n185) );
  DFFRX1 \temp_B_hi_reg[1]  ( .D(next_B_hi[1]), .CK(CLK), .RN(RST_N), .QN(n177) );
  DFFRX1 \temp_B_hi_reg[0]  ( .D(next_B_hi[0]), .CK(CLK), .RN(RST_N), .QN(n179) );
  DFFRX1 \temp_A_hi_reg[7]  ( .D(next_A_hi[7]), .CK(CLK), .RN(RST_N), .QN(n172) );
  DFFRX1 \temp_A_hi_reg[6]  ( .D(next_A_hi[6]), .CK(CLK), .RN(RST_N), .QN(n170) );
  DFFRX1 \temp_A_hi_reg[5]  ( .D(next_A_hi[5]), .CK(CLK), .RN(RST_N), .QN(n174) );
  DFFRX1 \temp_A_hi_reg[4]  ( .D(next_A_hi[4]), .CK(CLK), .RN(RST_N), .QN(n180) );
  DFFRX1 \temp_A_hi_reg[3]  ( .D(next_A_hi[3]), .CK(CLK), .RN(RST_N), .QN(n182) );
  DFFRX1 \temp_A_hi_reg[2]  ( .D(next_A_hi[2]), .CK(CLK), .RN(RST_N), .QN(n184) );
  DFFRX1 \temp_A_hi_reg[1]  ( .D(next_A_hi[1]), .CK(CLK), .RN(RST_N), .QN(n176) );
  DFFRX1 \temp_A_hi_reg[0]  ( .D(next_A_hi[0]), .CK(CLK), .RN(RST_N), .QN(n178) );
  DFFRX1 DONE_reg ( .D(n227), .CK(CLK), .RN(RST_N), .Q(DONE), .QN(n132) );
  DFFRX1 \diff_reg[7]  ( .D(n193), .CK(CLK), .RN(RST_N), .QN(n108) );
  DFFRX1 \diff_reg[6]  ( .D(n192), .CK(CLK), .RN(RST_N), .QN(n107) );
  DFFRX1 \diff_reg[5]  ( .D(n191), .CK(CLK), .RN(RST_N), .QN(n106) );
  DFFRX1 \diff_reg[4]  ( .D(n190), .CK(CLK), .RN(RST_N), .QN(n105) );
  DFFRX1 \diff_reg[3]  ( .D(n189), .CK(CLK), .RN(RST_N), .QN(n104) );
  DFFRX1 \diff_reg[2]  ( .D(n188), .CK(CLK), .RN(RST_N), .QN(n103) );
  DFFRX1 \diff_reg[1]  ( .D(n187), .CK(CLK), .RN(RST_N), .QN(n102) );
  DFFRX1 \diff_reg[0]  ( .D(n186), .CK(CLK), .RN(RST_N), .QN(n101) );
  DFFRX1 \diff_reg[15]  ( .D(n201), .CK(CLK), .RN(RST_N), .QN(n116) );
  DFFRX1 \diff_reg[14]  ( .D(n200), .CK(CLK), .RN(RST_N), .QN(n115) );
  DFFRX1 \diff_reg[13]  ( .D(n199), .CK(CLK), .RN(RST_N), .QN(n114) );
  DFFRX1 \diff_reg[12]  ( .D(n198), .CK(CLK), .RN(RST_N), .QN(n113) );
  DFFRX1 \diff_reg[11]  ( .D(n197), .CK(CLK), .RN(RST_N), .QN(n112) );
  DFFRX1 \diff_reg[10]  ( .D(n196), .CK(CLK), .RN(RST_N), .QN(n111) );
  DFFRX1 \diff_reg[9]  ( .D(n195), .CK(CLK), .RN(RST_N), .QN(n110) );
  DFFRX1 \diff_reg[8]  ( .D(n194), .CK(CLK), .RN(RST_N), .QN(n109) );
  DFFRX1 \B_hi_reg[7]  ( .D(B[7]), .CK(CLK), .RN(RST_N), .QN(n130) );
  DFFRX1 \B_hi_reg[6]  ( .D(B[6]), .CK(CLK), .RN(RST_N), .QN(n128) );
  DFFRX1 \B_hi_reg[5]  ( .D(B[5]), .CK(CLK), .RN(RST_N), .QN(n126) );
  DFFRX1 \B_hi_reg[4]  ( .D(B[4]), .CK(CLK), .RN(RST_N), .QN(n124) );
  DFFRX1 \B_hi_reg[3]  ( .D(B[3]), .CK(CLK), .RN(RST_N), .QN(n122) );
  DFFRX1 \B_hi_reg[2]  ( .D(B[2]), .CK(CLK), .RN(RST_N), .QN(n120) );
  DFFRX1 \B_hi_reg[1]  ( .D(B[1]), .CK(CLK), .RN(RST_N), .QN(n118) );
  DFFRX1 \B_hi_reg[0]  ( .D(B[0]), .CK(CLK), .RN(RST_N), .QN(n168) );
  DFFRX1 \A_hi_reg[7]  ( .D(A[7]), .CK(CLK), .RN(RST_N), .QN(n131) );
  DFFRX1 \A_hi_reg[6]  ( .D(A[6]), .CK(CLK), .RN(RST_N), .QN(n129) );
  DFFRX1 \A_hi_reg[5]  ( .D(A[5]), .CK(CLK), .RN(RST_N), .QN(n127) );
  DFFRX1 \A_hi_reg[4]  ( .D(A[4]), .CK(CLK), .RN(RST_N), .QN(n125) );
  DFFRX1 \A_hi_reg[3]  ( .D(A[3]), .CK(CLK), .RN(RST_N), .QN(n123) );
  DFFRX1 \A_hi_reg[2]  ( .D(A[2]), .CK(CLK), .RN(RST_N), .QN(n121) );
  DFFRX1 \A_hi_reg[1]  ( .D(A[1]), .CK(CLK), .RN(RST_N), .QN(n119) );
  DFFRX1 \A_hi_reg[0]  ( .D(A[0]), .CK(CLK), .RN(RST_N), .QN(n117) );
  DFFRX1 ERROR_reg ( .D(n234), .CK(CLK), .RN(RST_N), .Q(ERROR), .QN(n166) );
  DFFRX1 start_reg ( .D(START), .CK(CLK), .RN(RST_N), .Q(start) );
  DFFRX1 \state_reg[2]  ( .D(n263), .CK(CLK), .RN(RST_N), .Q(n163), .QN(n237)
         );
  DFFRX1 \state_reg[0]  ( .D(next_state[0]), .CK(CLK), .RN(RST_N), .Q(n164), 
        .QN(n241) );
  DFFRX1 \state_reg[1]  ( .D(next_state[1]), .CK(CLK), .RN(RST_N), .Q(n165), 
        .QN(n238) );
  DFFRX1 \A_all_reg[13]  ( .D(n229), .CK(CLK), .RN(RST_N), .Q(A_all[13]), .QN(
        n160) );
  DFFRX1 \B_all_reg[13]  ( .D(n228), .CK(CLK), .RN(RST_N), .Q(B_all[13]), .QN(
        n145) );
  DFFRX1 \A_all_reg[12]  ( .D(n208), .CK(CLK), .RN(RST_N), .Q(A_all[12]), .QN(
        n150) );
  DFFRX1 \B_all_reg[12]  ( .D(n207), .CK(CLK), .RN(RST_N), .Q(B_all[12]), .QN(
        n135) );
  DFFRX1 \B_all_reg[15]  ( .D(n230), .CK(CLK), .RN(RST_N), .Q(B_all[15]), .QN(
        n146) );
  DFFRX1 \A_all_reg[11]  ( .D(n206), .CK(CLK), .RN(RST_N), .Q(A_all[11]), .QN(
        n149) );
  DFFRX1 \A_all_reg[15]  ( .D(n231), .CK(CLK), .RN(RST_N), .Q(A_all[15]), .QN(
        n161) );
  DFFRX1 \B_all_reg[11]  ( .D(n205), .CK(CLK), .RN(RST_N), .Q(B_all[11]), .QN(
        n134) );
  DFFRX1 \A_all_reg[14]  ( .D(n233), .CK(CLK), .RN(RST_N), .Q(A_all[14]), .QN(
        n162) );
  DFFRX1 \B_all_reg[14]  ( .D(n232), .CK(CLK), .RN(RST_N), .Q(B_all[14]), .QN(
        n147) );
  DFFRX1 \A_all_reg[9]  ( .D(n226), .CK(CLK), .RN(RST_N), .Q(A_all[9]), .QN(
        n159) );
  DFFRX1 \A_all_reg[8]  ( .D(n224), .CK(CLK), .RN(RST_N), .Q(A_all[8]), .QN(
        n158) );
  DFFRX1 \B_all_reg[8]  ( .D(n223), .CK(CLK), .RN(RST_N), .Q(B_all[8]), .QN(
        n143) );
  DFFRX1 \A_all_reg[6]  ( .D(n220), .CK(CLK), .RN(RST_N), .Q(A_all[6]), .QN(
        n156) );
  DFFRX1 \B_all_reg[6]  ( .D(n219), .CK(CLK), .RN(RST_N), .Q(B_all[6]), .QN(
        n141) );
  DFFRX1 \A_all_reg[5]  ( .D(n218), .CK(CLK), .RN(RST_N), .Q(A_all[5]), .QN(
        n155) );
  DFFRX1 \B_all_reg[5]  ( .D(n217), .CK(CLK), .RN(RST_N), .Q(B_all[5]), .QN(
        n140) );
  DFFRX1 \A_all_reg[4]  ( .D(n216), .CK(CLK), .RN(RST_N), .Q(A_all[4]), .QN(
        n154) );
  DFFRX1 \B_all_reg[4]  ( .D(n215), .CK(CLK), .RN(RST_N), .Q(B_all[4]), .QN(
        n139) );
  DFFRX1 \A_all_reg[7]  ( .D(n222), .CK(CLK), .RN(RST_N), .Q(A_all[7]), .QN(
        n157) );
  DFFRX1 \A_all_reg[3]  ( .D(n214), .CK(CLK), .RN(RST_N), .Q(A_all[3]), .QN(
        n153) );
  DFFRX1 \A_all_reg[10]  ( .D(n204), .CK(CLK), .RN(RST_N), .Q(A_all[10]), .QN(
        n148) );
  DFFRX1 \B_all_reg[9]  ( .D(n225), .CK(CLK), .RN(RST_N), .Q(B_all[9]), .QN(
        n144) );
  DFFRX1 \B_all_reg[7]  ( .D(n221), .CK(CLK), .RN(RST_N), .Q(B_all[7]), .QN(
        n142) );
  DFFRX1 \B_all_reg[10]  ( .D(n203), .CK(CLK), .RN(RST_N), .Q(B_all[10]), .QN(
        n133) );
  DFFRX1 \B_all_reg[1]  ( .D(n209), .CK(CLK), .RN(RST_N), .Q(B_all[1]), .QN(
        n136) );
  DFFRX1 \A_all_reg[2]  ( .D(n212), .CK(CLK), .RN(RST_N), .Q(A_all[2]), .QN(
        n152) );
  DFFRX1 \B_all_reg[3]  ( .D(n213), .CK(CLK), .RN(RST_N), .Q(B_all[3]), .QN(
        n138) );
  DFFRX1 \B_all_reg[2]  ( .D(n211), .CK(CLK), .RN(RST_N), .Q(B_all[2]), .QN(
        n137) );
  DFFRX1 \B_all_reg[0]  ( .D(n235), .CK(CLK), .RN(RST_N), .Q(B_all[0]), .QN(
        n169) );
  DFFRX1 \A_all_reg[0]  ( .D(n202), .CK(CLK), .RN(RST_N), .Q(A_all[0]), .QN(
        n167) );
  DFFRX1 \A_all_reg[1]  ( .D(n210), .CK(CLK), .RN(RST_N), .Q(A_all[1]), .QN(
        n151) );
  DFFRX1 \Y_reg[7]  ( .D(next_Y[7]), .CK(CLK), .RN(RST_N), .Q(Y[7]) );
  DFFRX1 \Y_reg[6]  ( .D(next_Y[6]), .CK(CLK), .RN(RST_N), .Q(Y[6]) );
  DFFRX1 \Y_reg[5]  ( .D(next_Y[5]), .CK(CLK), .RN(RST_N), .Q(Y[5]) );
  DFFRX1 \Y_reg[4]  ( .D(next_Y[4]), .CK(CLK), .RN(RST_N), .Q(Y[4]) );
  DFFRX1 \Y_reg[3]  ( .D(next_Y[3]), .CK(CLK), .RN(RST_N), .Q(Y[3]) );
  DFFRX1 \Y_reg[2]  ( .D(next_Y[2]), .CK(CLK), .RN(RST_N), .Q(Y[2]) );
  DFFRX1 \Y_reg[1]  ( .D(next_Y[1]), .CK(CLK), .RN(RST_N), .Q(Y[1]) );
  DFFRX1 \Y_reg[0]  ( .D(next_Y[0]), .CK(CLK), .RN(RST_N), .Q(Y[0]) );
  AND2X2 U172 ( .A(n61), .B(N46), .Y(n239) );
  AND3X2 U173 ( .A(n16), .B(n20), .C(n21), .Y(n240) );
  NAND2X1 U174 ( .A(n59), .B(n264), .Y(n28) );
  NAND3X1 U175 ( .A(n265), .B(n264), .C(n262), .Y(n14) );
  AND2X2 U176 ( .A(n79), .B(n14), .Y(n82) );
  CLKBUFX3 U177 ( .A(n77), .Y(n243) );
  CLKBUFX3 U178 ( .A(n77), .Y(n244) );
  NAND4X1 U179 ( .A(n79), .B(N47), .C(n262), .D(n265), .Y(n76) );
  NAND2X1 U180 ( .A(N47), .B(n59), .Y(n24) );
  NOR2BX1 U181 ( .AN(n61), .B(N46), .Y(n59) );
  CLKBUFX3 U182 ( .A(n84), .Y(n242) );
  NOR3BXL U183 ( .AN(n79), .B(n265), .C(n12), .Y(n84) );
  CLKINVX1 U184 ( .A(N46), .Y(n265) );
  AND2X2 U185 ( .A(n79), .B(n80), .Y(n78) );
  OAI21XL U186 ( .A0(N46), .A1(n264), .B0(n262), .Y(n80) );
  NAND3X1 U187 ( .A(n14), .B(n15), .C(n16), .Y(next_state[0]) );
  INVXL U188 ( .A(N47), .Y(n264) );
  CLKINVX1 U189 ( .A(N95), .Y(n250) );
  CLKINVX1 U190 ( .A(N96), .Y(n249) );
  CLKINVX1 U191 ( .A(N97), .Y(n248) );
  CLKINVX1 U192 ( .A(N98), .Y(n247) );
  CLKINVX1 U193 ( .A(N99), .Y(n246) );
  NOR2BX1 U194 ( .AN(n18), .B(n263), .Y(n21) );
  NAND2BX1 U195 ( .AN(n20), .B(n79), .Y(n77) );
  AND3X2 U196 ( .A(n261), .B(n15), .C(n21), .Y(n79) );
  CLKINVX1 U197 ( .A(n17), .Y(n263) );
  CLKINVX1 U198 ( .A(N89), .Y(n256) );
  CLKINVX1 U199 ( .A(N90), .Y(n255) );
  CLKINVX1 U200 ( .A(N91), .Y(n254) );
  CLKINVX1 U201 ( .A(N92), .Y(n253) );
  CLKINVX1 U202 ( .A(N93), .Y(n252) );
  CLKINVX1 U203 ( .A(N94), .Y(n251) );
  CLKINVX1 U204 ( .A(n12), .Y(n262) );
  NAND2X1 U205 ( .A(n12), .B(n261), .Y(next_state[1]) );
  CLKINVX1 U206 ( .A(n65), .Y(n261) );
  CLKINVX1 U207 ( .A(N87), .Y(n258) );
  CLKINVX1 U208 ( .A(N88), .Y(n257) );
  CLKINVX1 U209 ( .A(N86), .Y(n259) );
  OAI221XL U210 ( .A0(n250), .A1(n76), .B0(n148), .B1(n82), .C0(n98), .Y(n204)
         );
  AOI2BB2X1 U211 ( .B0(n242), .B1(N62), .A0N(n243), .A1N(n184), .Y(n98) );
  OAI221XL U212 ( .A0(n249), .A1(n76), .B0(n149), .B1(n82), .C0(n97), .Y(n206)
         );
  AOI2BB2X1 U213 ( .B0(n242), .B1(N63), .A0N(n244), .A1N(n182), .Y(n97) );
  OAI221XL U214 ( .A0(n248), .A1(n76), .B0(n150), .B1(n82), .C0(n96), .Y(n208)
         );
  AOI2BB2X1 U215 ( .B0(n242), .B1(N64), .A0N(n244), .A1N(n180), .Y(n96) );
  OAI221XL U216 ( .A0(n252), .A1(n76), .B0(n158), .B1(n82), .C0(n85), .Y(n224)
         );
  AOI2BB2X1 U217 ( .B0(n242), .B1(N60), .A0N(n243), .A1N(n178), .Y(n85) );
  OAI221XL U218 ( .A0(n251), .A1(n76), .B0(n159), .B1(n82), .C0(n83), .Y(n226)
         );
  AOI2BB2X1 U219 ( .B0(n242), .B1(N61), .A0N(n243), .A1N(n176), .Y(n83) );
  OAI221XL U220 ( .A0(n247), .A1(n76), .B0(n160), .B1(n82), .C0(n95), .Y(n229)
         );
  AOI2BB2X1 U221 ( .B0(n242), .B1(N65), .A0N(n244), .A1N(n174), .Y(n95) );
  OAI221XL U222 ( .A0(n245), .A1(n76), .B0(n161), .B1(n82), .C0(n93), .Y(n231)
         );
  AOI2BB2X1 U223 ( .B0(n242), .B1(N67), .A0N(n243), .A1N(n172), .Y(n93) );
  OAI221XL U224 ( .A0(n246), .A1(n76), .B0(n162), .B1(n82), .C0(n94), .Y(n233)
         );
  AOI2BB2X1 U225 ( .B0(n242), .B1(N66), .A0N(n243), .A1N(n170), .Y(n94) );
  OAI222XL U226 ( .A0(n151), .A1(n76), .B0(n118), .B1(n244), .C0(n136), .C1(
        n78), .Y(n209) );
  OAI222XL U227 ( .A0(n152), .A1(n76), .B0(n120), .B1(n244), .C0(n137), .C1(
        n78), .Y(n211) );
  OAI222XL U228 ( .A0(n153), .A1(n76), .B0(n122), .B1(n244), .C0(n138), .C1(
        n78), .Y(n213) );
  OAI222XL U229 ( .A0(n154), .A1(n76), .B0(n124), .B1(n244), .C0(n139), .C1(
        n78), .Y(n215) );
  OAI222XL U230 ( .A0(n155), .A1(n76), .B0(n126), .B1(n244), .C0(n140), .C1(
        n78), .Y(n217) );
  OAI222XL U231 ( .A0(n156), .A1(n76), .B0(n128), .B1(n244), .C0(n141), .C1(
        n78), .Y(n219) );
  OAI222XL U232 ( .A0(n157), .A1(n76), .B0(n130), .B1(n244), .C0(n142), .C1(
        n78), .Y(n221) );
  OAI222XL U233 ( .A0(n167), .A1(n76), .B0(n168), .B1(n244), .C0(n169), .C1(
        n78), .Y(n235) );
  OAI222XL U234 ( .A0(n148), .A1(n76), .B0(n244), .B1(n185), .C0(n133), .C1(
        n78), .Y(n203) );
  OAI222XL U235 ( .A0(n149), .A1(n76), .B0(n244), .B1(n183), .C0(n134), .C1(
        n78), .Y(n205) );
  OAI222XL U236 ( .A0(n150), .A1(n76), .B0(n244), .B1(n181), .C0(n135), .C1(
        n78), .Y(n207) );
  OAI222XL U237 ( .A0(n158), .A1(n76), .B0(n244), .B1(n179), .C0(n143), .C1(
        n78), .Y(n223) );
  OAI222XL U238 ( .A0(n159), .A1(n76), .B0(n244), .B1(n177), .C0(n144), .C1(
        n78), .Y(n225) );
  OAI222XL U239 ( .A0(n160), .A1(n76), .B0(n244), .B1(n175), .C0(n145), .C1(
        n78), .Y(n228) );
  OAI222XL U240 ( .A0(n161), .A1(n76), .B0(n244), .B1(n173), .C0(n146), .C1(
        n78), .Y(n230) );
  OAI222XL U241 ( .A0(n162), .A1(n76), .B0(n244), .B1(n171), .C0(n147), .C1(
        n78), .Y(n232) );
  OAI221XL U242 ( .A0(n260), .A1(n76), .B0(n167), .B1(n82), .C0(n99), .Y(n202)
         );
  AOI2BB2X1 U243 ( .B0(n242), .B1(N52), .A0N(n117), .A1N(n243), .Y(n99) );
  OAI221XL U244 ( .A0(n259), .A1(n76), .B0(n151), .B1(n82), .C0(n92), .Y(n210)
         );
  AOI2BB2X1 U245 ( .B0(n242), .B1(N53), .A0N(n119), .A1N(n243), .Y(n92) );
  OAI221XL U246 ( .A0(n258), .A1(n76), .B0(n152), .B1(n82), .C0(n91), .Y(n212)
         );
  AOI2BB2X1 U247 ( .B0(n242), .B1(N54), .A0N(n121), .A1N(n243), .Y(n91) );
  OAI221XL U248 ( .A0(n257), .A1(n76), .B0(n153), .B1(n82), .C0(n90), .Y(n214)
         );
  AOI2BB2X1 U249 ( .B0(n242), .B1(N55), .A0N(n123), .A1N(n243), .Y(n90) );
  OAI221XL U250 ( .A0(n256), .A1(n76), .B0(n154), .B1(n82), .C0(n89), .Y(n216)
         );
  AOI2BB2X1 U251 ( .B0(n242), .B1(N56), .A0N(n125), .A1N(n243), .Y(n89) );
  OAI221XL U252 ( .A0(n255), .A1(n76), .B0(n155), .B1(n82), .C0(n88), .Y(n218)
         );
  AOI2BB2X1 U253 ( .B0(n242), .B1(N57), .A0N(n127), .A1N(n243), .Y(n88) );
  OAI221XL U254 ( .A0(n254), .A1(n76), .B0(n156), .B1(n82), .C0(n87), .Y(n220)
         );
  AOI2BB2X1 U255 ( .B0(n242), .B1(N58), .A0N(n129), .A1N(n243), .Y(n87) );
  OAI221XL U256 ( .A0(n253), .A1(n76), .B0(n157), .B1(n82), .C0(n86), .Y(n222)
         );
  AOI2BB2X1 U257 ( .B0(n242), .B1(N59), .A0N(n131), .A1N(n243), .Y(n86) );
  OAI221XL U258 ( .A0(n24), .A1(n260), .B0(n101), .B1(n21), .C0(n58), .Y(n186)
         );
  AOI2BB2X1 U259 ( .B0(n239), .B1(N52), .A0N(n28), .A1N(n167), .Y(n58) );
  OAI221XL U260 ( .A0(n24), .A1(n259), .B0(n102), .B1(n21), .C0(n44), .Y(n187)
         );
  AOI2BB2X1 U261 ( .B0(n239), .B1(N53), .A0N(n28), .A1N(n151), .Y(n44) );
  OAI221XL U262 ( .A0(n24), .A1(n258), .B0(n103), .B1(n21), .C0(n42), .Y(n188)
         );
  AOI2BB2X1 U263 ( .B0(n239), .B1(N54), .A0N(n28), .A1N(n152), .Y(n42) );
  OAI221XL U264 ( .A0(n24), .A1(n257), .B0(n104), .B1(n21), .C0(n40), .Y(n189)
         );
  AOI2BB2X1 U265 ( .B0(n239), .B1(N55), .A0N(n28), .A1N(n153), .Y(n40) );
  OAI221XL U266 ( .A0(n24), .A1(n256), .B0(n105), .B1(n21), .C0(n38), .Y(n190)
         );
  AOI2BB2X1 U267 ( .B0(n239), .B1(N56), .A0N(n28), .A1N(n154), .Y(n38) );
  OAI221XL U268 ( .A0(n24), .A1(n255), .B0(n106), .B1(n21), .C0(n36), .Y(n191)
         );
  AOI2BB2X1 U269 ( .B0(n239), .B1(N57), .A0N(n28), .A1N(n155), .Y(n36) );
  OAI221XL U270 ( .A0(n24), .A1(n254), .B0(n107), .B1(n21), .C0(n34), .Y(n192)
         );
  AOI2BB2X1 U271 ( .B0(n239), .B1(N58), .A0N(n28), .A1N(n156), .Y(n34) );
  OAI221XL U272 ( .A0(n24), .A1(n253), .B0(n108), .B1(n21), .C0(n32), .Y(n193)
         );
  AOI2BB2X1 U273 ( .B0(n239), .B1(N59), .A0N(n28), .A1N(n157), .Y(n32) );
  OAI221XL U274 ( .A0(n24), .A1(n252), .B0(n109), .B1(n21), .C0(n30), .Y(n194)
         );
  AOI2BB2X1 U275 ( .B0(n239), .B1(N60), .A0N(n28), .A1N(n158), .Y(n30) );
  OAI221XL U276 ( .A0(n24), .A1(n251), .B0(n110), .B1(n21), .C0(n26), .Y(n195)
         );
  AOI2BB2X1 U277 ( .B0(n239), .B1(N61), .A0N(n28), .A1N(n159), .Y(n26) );
  OAI221XL U278 ( .A0(n24), .A1(n250), .B0(n111), .B1(n21), .C0(n56), .Y(n196)
         );
  AOI2BB2X1 U279 ( .B0(n239), .B1(N62), .A0N(n28), .A1N(n148), .Y(n56) );
  OAI221XL U280 ( .A0(n24), .A1(n249), .B0(n112), .B1(n21), .C0(n54), .Y(n197)
         );
  AOI2BB2X1 U281 ( .B0(n239), .B1(N63), .A0N(n28), .A1N(n149), .Y(n54) );
  OAI221XL U282 ( .A0(n24), .A1(n248), .B0(n113), .B1(n21), .C0(n52), .Y(n198)
         );
  AOI2BB2X1 U283 ( .B0(n239), .B1(N64), .A0N(n28), .A1N(n150), .Y(n52) );
  OAI221XL U284 ( .A0(n24), .A1(n247), .B0(n114), .B1(n21), .C0(n50), .Y(n199)
         );
  AOI2BB2X1 U285 ( .B0(n239), .B1(N65), .A0N(n28), .A1N(n160), .Y(n50) );
  OAI221XL U286 ( .A0(n24), .A1(n246), .B0(n115), .B1(n21), .C0(n48), .Y(n200)
         );
  AOI2BB2X1 U287 ( .B0(n239), .B1(N66), .A0N(n28), .A1N(n162), .Y(n48) );
  OAI221XL U288 ( .A0(n24), .A1(n245), .B0(n116), .B1(n21), .C0(n46), .Y(n201)
         );
  AOI2BB2X1 U289 ( .B0(n239), .B1(N67), .A0N(n28), .A1N(n161), .Y(n46) );
  CLKINVX1 U290 ( .A(N100), .Y(n245) );
  NAND3X1 U291 ( .A(n164), .B(n237), .C(n165), .Y(n17) );
  NAND3X1 U292 ( .A(n238), .B(n241), .C(n163), .Y(n18) );
  NAND3X1 U293 ( .A(n241), .B(n237), .C(n165), .Y(n12) );
  OAI22XL U294 ( .A0(n109), .A1(n17), .B0(n101), .B1(n18), .Y(next_Y[0]) );
  OAI22XL U295 ( .A0(n110), .A1(n17), .B0(n102), .B1(n18), .Y(next_Y[1]) );
  OAI22XL U296 ( .A0(n111), .A1(n17), .B0(n103), .B1(n18), .Y(next_Y[2]) );
  OAI22XL U297 ( .A0(n112), .A1(n17), .B0(n104), .B1(n18), .Y(next_Y[3]) );
  OAI22XL U298 ( .A0(n113), .A1(n17), .B0(n105), .B1(n18), .Y(next_Y[4]) );
  OAI22XL U299 ( .A0(n114), .A1(n17), .B0(n106), .B1(n18), .Y(next_Y[5]) );
  OAI22XL U300 ( .A0(n115), .A1(n17), .B0(n107), .B1(n18), .Y(next_Y[6]) );
  OAI22XL U301 ( .A0(n116), .A1(n17), .B0(n108), .B1(n18), .Y(next_Y[7]) );
  NAND4X1 U302 ( .A(n133), .B(n134), .C(n135), .D(n136), .Y(n73) );
  NAND4X1 U303 ( .A(n148), .B(n149), .C(n150), .D(n151), .Y(n69) );
  NAND4X1 U304 ( .A(n137), .B(n138), .C(n139), .D(n140), .Y(n72) );
  NAND4X1 U305 ( .A(n145), .B(n146), .C(n147), .D(n169), .Y(n70) );
  NAND4X1 U306 ( .A(n152), .B(n153), .C(n154), .D(n155), .Y(n68) );
  NAND4X1 U307 ( .A(n160), .B(n161), .C(n162), .D(n167), .Y(n66) );
  NAND4X1 U308 ( .A(n141), .B(n142), .C(n143), .D(n144), .Y(n71) );
  NAND4X1 U309 ( .A(n156), .B(n157), .C(n158), .D(n159), .Y(n67) );
  NAND3X1 U310 ( .A(n238), .B(n237), .C(n164), .Y(n20) );
  NOR2X1 U311 ( .A(n20), .B(start), .Y(n65) );
  NOR2BX1 U312 ( .AN(n166), .B(n12), .Y(n61) );
  NAND3X1 U313 ( .A(n238), .B(n237), .C(start), .Y(n16) );
  OAI2BB2XL U314 ( .B0(n132), .B1(n18), .A0N(n74), .A1N(n12), .Y(n227) );
  OAI21XL U315 ( .A0(n241), .A1(n237), .B0(n238), .Y(n74) );
  OR2X1 U316 ( .A(n166), .B(n12), .Y(n15) );
  NOR2X1 U317 ( .A(n117), .B(n240), .Y(next_A_hi[0]) );
  NOR2X1 U318 ( .A(n119), .B(n240), .Y(next_A_hi[1]) );
  NOR2X1 U319 ( .A(n121), .B(n240), .Y(next_A_hi[2]) );
  NOR2X1 U320 ( .A(n123), .B(n240), .Y(next_A_hi[3]) );
  NOR2X1 U321 ( .A(n125), .B(n240), .Y(next_A_hi[4]) );
  NOR2X1 U322 ( .A(n127), .B(n240), .Y(next_A_hi[5]) );
  NOR2X1 U323 ( .A(n129), .B(n240), .Y(next_A_hi[6]) );
  NOR2X1 U324 ( .A(n131), .B(n240), .Y(next_A_hi[7]) );
  NOR2X1 U325 ( .A(n168), .B(n240), .Y(next_B_hi[0]) );
  NOR2X1 U326 ( .A(n118), .B(n240), .Y(next_B_hi[1]) );
  NOR2X1 U327 ( .A(n120), .B(n240), .Y(next_B_hi[2]) );
  NOR2X1 U328 ( .A(n122), .B(n240), .Y(next_B_hi[3]) );
  NOR2X1 U329 ( .A(n124), .B(n240), .Y(next_B_hi[4]) );
  NOR2X1 U330 ( .A(n126), .B(n240), .Y(next_B_hi[5]) );
  NOR2X1 U331 ( .A(n128), .B(n240), .Y(next_B_hi[6]) );
  NOR2X1 U332 ( .A(n130), .B(n240), .Y(next_B_hi[7]) );
  CLKINVX1 U333 ( .A(N85), .Y(n260) );
  OAI211X1 U334 ( .A0(n166), .A1(n21), .B0(n62), .C0(n15), .Y(n234) );
  OAI21XL U335 ( .A0(n63), .A1(n64), .B0(n65), .Y(n62) );
  NOR4X1 U336 ( .A(n70), .B(n71), .C(n72), .D(n73), .Y(n63) );
  NOR4X1 U337 ( .A(n66), .B(n67), .C(n68), .D(n69), .Y(n64) );
endmodule

