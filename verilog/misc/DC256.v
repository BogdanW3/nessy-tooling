// Copyright (C) 2022  Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions 
// and other software and tools, and any partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License 
// Subscription Agreement, the Intel Quartus Prime License Agreement,
// the Intel FPGA IP License Agreement, or other applicable license
// agreement, including, without limitation, that your use is for
// the sole purpose of programming logic devices manufactured by
// Intel and sold by Intel or its authorized distributors.  Please
// refer to the applicable agreement for further details, at
// https://fpgasoftware.intel.com/eula.

// PROGRAM		"Quartus Prime"
// VERSION		"Version 21.1.1 Build 850 06/23/2022 SJ Lite Edition"
// CREATED		"Tue Aug 15 19:24:31 2023"

module DC256(
	E,
	D3,
	D2,
	D1,
	D0,
	D4,
	D5,
	D6,
	D7,
	Q0,
	Q8,
	Q9,
	Q10,
	Q11,
	Q12,
	Q13,
	Q14,
	Q15,
	Q16,
	Q17,
	Q18,
	Q19,
	Q20,
	Q21,
	Q22,
	Q23,
	Q24,
	Q25,
	Q26,
	Q27,
	Q28,
	Q29,
	Q30,
	Q31,
	Q32,
	Q33,
	Q34,
	Q35,
	Q36,
	Q37,
	Q38,
	Q39,
	Q40,
	Q41,
	Q42,
	Q43,
	Q44,
	Q45,
	Q46,
	Q47,
	Q48,
	Q49,
	Q50,
	Q51,
	Q52,
	Q53,
	Q54,
	Q55,
	Q56,
	Q57,
	Q58,
	Q59,
	Q60,
	Q61,
	Q62,
	Q63,
	Q1,
	Q2,
	Q3,
	Q4,
	Q5,
	Q6,
	Q7,
	Q64,
	Q65,
	Q66,
	Q67,
	Q68,
	Q69,
	Q70,
	Q71,
	Q72,
	Q73,
	Q74,
	Q75,
	Q76,
	Q77,
	Q78,
	Q79,
	Q80,
	Q81,
	Q82,
	Q83,
	Q84,
	Q85,
	Q86,
	Q87,
	Q88,
	Q89,
	Q90,
	Q91,
	Q92,
	Q93,
	Q94,
	Q95,
	Q96,
	Q97,
	Q98,
	Q99,
	Q100,
	Q101,
	Q102,
	Q103,
	Q104,
	Q105,
	Q106,
	Q107,
	Q108,
	Q109,
	Q110,
	Q111,
	Q112,
	Q113,
	Q114,
	Q115,
	Q116,
	Q117,
	Q118,
	Q119,
	Q120,
	Q121,
	Q122,
	Q123,
	Q124,
	Q125,
	Q126,
	Q127,
	Q128,
	Q129,
	Q130,
	Q131,
	Q132,
	Q133,
	Q134,
	Q135,
	Q136,
	Q137,
	Q138,
	Q139,
	Q140,
	Q141,
	Q142,
	Q143,
	Q144,
	Q145,
	Q146,
	Q147,
	Q148,
	Q149,
	Q150,
	Q151,
	Q152,
	Q153,
	Q154,
	Q155,
	Q156,
	Q157,
	Q158,
	Q159,
	Q160,
	Q161,
	Q162,
	Q163,
	Q164,
	Q165,
	Q166,
	Q167,
	Q168,
	Q169,
	Q170,
	Q171,
	Q172,
	Q173,
	Q174,
	Q175,
	Q176,
	Q177,
	Q178,
	Q179,
	Q180,
	Q181,
	Q182,
	Q183,
	Q184,
	Q192,
	Q193,
	Q194,
	Q195,
	Q196,
	Q197,
	Q198,
	Q199,
	Q200,
	Q201,
	Q202,
	Q203,
	Q204,
	Q205,
	Q206,
	Q207,
	Q208,
	Q209,
	Q210,
	Q211,
	Q212,
	Q213,
	Q214,
	Q215,
	Q216,
	Q217,
	Q218,
	Q219,
	Q220,
	Q221,
	Q222,
	Q223,
	Q224,
	Q225,
	Q226,
	Q227,
	Q228,
	Q229,
	Q230,
	Q231,
	Q232,
	Q233,
	Q234,
	Q235,
	Q236,
	Q237,
	Q238,
	Q239,
	Q240,
	Q241,
	Q242,
	Q243,
	Q244,
	Q245,
	Q246,
	Q247,
	Q248,
	Q249,
	Q250,
	Q251,
	Q252,
	Q253,
	Q254,
	Q255,
	Q185,
	Q186,
	Q187,
	Q188,
	Q189,
	Q190,
	Q191
);


input wire	E;
input wire	D3;
input wire	D2;
input wire	D1;
input wire	D0;
input wire	D4;
input wire	D5;
input wire	D6;
input wire	D7;
output wire	Q0;
output wire	Q8;
output wire	Q9;
output wire	Q10;
output wire	Q11;
output wire	Q12;
output wire	Q13;
output wire	Q14;
output wire	Q15;
output wire	Q16;
output wire	Q17;
output wire	Q18;
output wire	Q19;
output wire	Q20;
output wire	Q21;
output wire	Q22;
output wire	Q23;
output wire	Q24;
output wire	Q25;
output wire	Q26;
output wire	Q27;
output wire	Q28;
output wire	Q29;
output wire	Q30;
output wire	Q31;
output wire	Q32;
output wire	Q33;
output wire	Q34;
output wire	Q35;
output wire	Q36;
output wire	Q37;
output wire	Q38;
output wire	Q39;
output wire	Q40;
output wire	Q41;
output wire	Q42;
output wire	Q43;
output wire	Q44;
output wire	Q45;
output wire	Q46;
output wire	Q47;
output wire	Q48;
output wire	Q49;
output wire	Q50;
output wire	Q51;
output wire	Q52;
output wire	Q53;
output wire	Q54;
output wire	Q55;
output wire	Q56;
output wire	Q57;
output wire	Q58;
output wire	Q59;
output wire	Q60;
output wire	Q61;
output wire	Q62;
output wire	Q63;
output wire	Q1;
output wire	Q2;
output wire	Q3;
output wire	Q4;
output wire	Q5;
output wire	Q6;
output wire	Q7;
output wire	Q64;
output wire	Q65;
output wire	Q66;
output wire	Q67;
output wire	Q68;
output wire	Q69;
output wire	Q70;
output wire	Q71;
output wire	Q72;
output wire	Q73;
output wire	Q74;
output wire	Q75;
output wire	Q76;
output wire	Q77;
output wire	Q78;
output wire	Q79;
output wire	Q80;
output wire	Q81;
output wire	Q82;
output wire	Q83;
output wire	Q84;
output wire	Q85;
output wire	Q86;
output wire	Q87;
output wire	Q88;
output wire	Q89;
output wire	Q90;
output wire	Q91;
output wire	Q92;
output wire	Q93;
output wire	Q94;
output wire	Q95;
output wire	Q96;
output wire	Q97;
output wire	Q98;
output wire	Q99;
output wire	Q100;
output wire	Q101;
output wire	Q102;
output wire	Q103;
output wire	Q104;
output wire	Q105;
output wire	Q106;
output wire	Q107;
output wire	Q108;
output wire	Q109;
output wire	Q110;
output wire	Q111;
output wire	Q112;
output wire	Q113;
output wire	Q114;
output wire	Q115;
output wire	Q116;
output wire	Q117;
output wire	Q118;
output wire	Q119;
output wire	Q120;
output wire	Q121;
output wire	Q122;
output wire	Q123;
output wire	Q124;
output wire	Q125;
output wire	Q126;
output wire	Q127;
output wire	Q128;
output wire	Q129;
output wire	Q130;
output wire	Q131;
output wire	Q132;
output wire	Q133;
output wire	Q134;
output wire	Q135;
output wire	Q136;
output wire	Q137;
output wire	Q138;
output wire	Q139;
output wire	Q140;
output wire	Q141;
output wire	Q142;
output wire	Q143;
output wire	Q144;
output wire	Q145;
output wire	Q146;
output wire	Q147;
output wire	Q148;
output wire	Q149;
output wire	Q150;
output wire	Q151;
output wire	Q152;
output wire	Q153;
output wire	Q154;
output wire	Q155;
output wire	Q156;
output wire	Q157;
output wire	Q158;
output wire	Q159;
output wire	Q160;
output wire	Q161;
output wire	Q162;
output wire	Q163;
output wire	Q164;
output wire	Q165;
output wire	Q166;
output wire	Q167;
output wire	Q168;
output wire	Q169;
output wire	Q170;
output wire	Q171;
output wire	Q172;
output wire	Q173;
output wire	Q174;
output wire	Q175;
output wire	Q176;
output wire	Q177;
output wire	Q178;
output wire	Q179;
output wire	Q180;
output wire	Q181;
output wire	Q182;
output wire	Q183;
output wire	Q184;
output wire	Q192;
output wire	Q193;
output wire	Q194;
output wire	Q195;
output wire	Q196;
output wire	Q197;
output wire	Q198;
output wire	Q199;
output wire	Q200;
output wire	Q201;
output wire	Q202;
output wire	Q203;
output wire	Q204;
output wire	Q205;
output wire	Q206;
output wire	Q207;
output wire	Q208;
output wire	Q209;
output wire	Q210;
output wire	Q211;
output wire	Q212;
output wire	Q213;
output wire	Q214;
output wire	Q215;
output wire	Q216;
output wire	Q217;
output wire	Q218;
output wire	Q219;
output wire	Q220;
output wire	Q221;
output wire	Q222;
output wire	Q223;
output wire	Q224;
output wire	Q225;
output wire	Q226;
output wire	Q227;
output wire	Q228;
output wire	Q229;
output wire	Q230;
output wire	Q231;
output wire	Q232;
output wire	Q233;
output wire	Q234;
output wire	Q235;
output wire	Q236;
output wire	Q237;
output wire	Q238;
output wire	Q239;
output wire	Q240;
output wire	Q241;
output wire	Q242;
output wire	Q243;
output wire	Q244;
output wire	Q245;
output wire	Q246;
output wire	Q247;
output wire	Q248;
output wire	Q249;
output wire	Q250;
output wire	Q251;
output wire	Q252;
output wire	Q253;
output wire	Q254;
output wire	Q255;
output wire	Q185;
output wire	Q186;
output wire	Q187;
output wire	Q188;
output wire	Q189;
output wire	Q190;
output wire	Q191;

wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;





DC128	b2v_inst(
	.D6(D6),
	.D5(D5),
	.D4(D4),
	.D3(D3),
	.D2(D2),
	.D1(D1),
	.D0(D0),
	.E(SYNTHESIZED_WIRE_0),
	.Q127(Q127),
	.Q126(Q126),
	.Q125(Q125),
	.Q124(Q124),
	.Q123(Q123),
	.Q122(Q122),
	.Q121(Q121),
	.Q120(Q120),
	.Q119(Q119),
	.Q118(Q118),
	.Q117(Q117),
	.Q116(Q116),
	.Q115(Q115),
	.Q114(Q114),
	.Q113(Q113),
	.Q112(Q112),
	.Q111(Q111),
	.Q110(Q110),
	.Q109(Q109),
	.Q108(Q108),
	.Q107(Q107),
	.Q106(Q106),
	.Q105(Q105),
	.Q104(Q104),
	.Q103(Q103),
	.Q102(Q102),
	.Q101(Q101),
	.Q100(Q100),
	.Q99(Q99),
	.Q98(Q98),
	.Q97(Q97),
	.Q96(Q96),
	.Q95(Q95),
	.Q94(Q94),
	.Q93(Q93),
	.Q92(Q92),
	.Q91(Q91),
	.Q90(Q90),
	.Q89(Q89),
	.Q88(Q88),
	.Q87(Q87),
	.Q86(Q86),
	.Q85(Q85),
	.Q84(Q84),
	.Q83(Q83),
	.Q82(Q82),
	.Q81(Q81),
	.Q80(Q80),
	.Q79(Q79),
	.Q78(Q78),
	.Q77(Q77),
	.Q76(Q76),
	.Q75(Q75),
	.Q74(Q74),
	.Q73(Q73),
	.Q72(Q72),
	.Q71(Q71),
	.Q70(Q70),
	.Q69(Q69),
	.Q68(Q68),
	.Q67(Q67),
	.Q66(Q66),
	.Q65(Q65),
	.Q64(Q64),
	.Q63(Q63),
	.Q62(Q62),
	.Q61(Q61),
	.Q60(Q60),
	.Q59(Q59),
	.Q58(Q58),
	.Q57(Q57),
	.Q56(Q56),
	.Q55(Q55),
	.Q54(Q54),
	.Q53(Q53),
	.Q52(Q52),
	.Q51(Q51),
	.Q50(Q50),
	.Q49(Q49),
	.Q48(Q48),
	.Q47(Q47),
	.Q46(Q46),
	.Q45(Q45),
	.Q44(Q44),
	.Q43(Q43),
	.Q42(Q42),
	.Q41(Q41),
	.Q40(Q40),
	.Q39(Q39),
	.Q38(Q38),
	.Q37(Q37),
	.Q36(Q36),
	.Q35(Q35),
	.Q34(Q34),
	.Q33(Q33),
	.Q32(Q32),
	.Q31(Q31),
	.Q30(Q30),
	.Q29(Q29),
	.Q28(Q28),
	.Q27(Q27),
	.Q26(Q26),
	.Q25(Q25),
	.Q24(Q24),
	.Q23(Q23),
	.Q22(Q22),
	.Q21(Q21),
	.Q20(Q20),
	.Q19(Q19),
	.Q18(Q18),
	.Q17(Q17),
	.Q16(Q16),
	.Q15(Q15),
	.Q14(Q14),
	.Q13(Q13),
	.Q12(Q12),
	.Q11(Q11),
	.Q10(Q10),
	.Q9(Q9),
	.Q8(Q8),
	.Q7(Q7),
	.Q6(Q6),
	.Q5(Q5),
	.Q4(Q4),
	.Q3(Q3),
	.Q2(Q2),
	.Q1(Q1),
	.Q0(Q0));


DC128	b2v_inst1(
	.D6(D6),
	.D5(D5),
	.D4(D4),
	.D3(D3),
	.D2(D2),
	.D1(D1),
	.D0(D0),
	.E(SYNTHESIZED_WIRE_1),
	.Q127(Q255),
	.Q126(Q254),
	.Q125(Q253),
	.Q124(Q252),
	.Q123(Q251),
	.Q122(Q250),
	.Q121(Q249),
	.Q120(Q248),
	.Q119(Q247),
	.Q118(Q246),
	.Q117(Q245),
	.Q116(Q244),
	.Q115(Q243),
	.Q114(Q242),
	.Q113(Q241),
	.Q112(Q240),
	.Q111(Q239),
	.Q110(Q238),
	.Q109(Q237),
	.Q108(Q236),
	.Q107(Q235),
	.Q106(Q234),
	.Q105(Q233),
	.Q104(Q232),
	.Q103(Q231),
	.Q102(Q230),
	.Q101(Q229),
	.Q100(Q228),
	.Q99(Q227),
	.Q98(Q226),
	.Q97(Q225),
	.Q96(Q224),
	.Q95(Q223),
	.Q94(Q222),
	.Q93(Q221),
	.Q92(Q220),
	.Q91(Q219),
	.Q90(Q218),
	.Q89(Q217),
	.Q88(Q216),
	.Q87(Q215),
	.Q86(Q214),
	.Q85(Q213),
	.Q84(Q212),
	.Q83(Q211),
	.Q82(Q210),
	.Q81(Q209),
	.Q80(Q208),
	.Q79(Q207),
	.Q78(Q206),
	.Q77(Q205),
	.Q76(Q204),
	.Q75(Q203),
	.Q74(Q202),
	.Q73(Q201),
	.Q72(Q200),
	.Q71(Q199),
	.Q70(Q198),
	.Q69(Q197),
	.Q68(Q196),
	.Q67(Q195),
	.Q66(Q194),
	.Q65(Q193),
	.Q64(Q192),
	.Q63(Q191),
	.Q62(Q190),
	.Q61(Q189),
	.Q60(Q188),
	.Q59(Q187),
	.Q58(Q186),
	.Q57(Q185),
	.Q56(Q184),
	.Q55(Q183),
	.Q54(Q182),
	.Q53(Q181),
	.Q52(Q180),
	.Q51(Q179),
	.Q50(Q178),
	.Q49(Q177),
	.Q48(Q176),
	.Q47(Q175),
	.Q46(Q174),
	.Q45(Q173),
	.Q44(Q172),
	.Q43(Q171),
	.Q42(Q170),
	.Q41(Q169),
	.Q40(Q168),
	.Q39(Q167),
	.Q38(Q166),
	.Q37(Q165),
	.Q36(Q164),
	.Q35(Q163),
	.Q34(Q162),
	.Q33(Q161),
	.Q32(Q160),
	.Q31(Q159),
	.Q30(Q158),
	.Q29(Q157),
	.Q28(Q156),
	.Q27(Q155),
	.Q26(Q154),
	.Q25(Q153),
	.Q24(Q152),
	.Q23(Q151),
	.Q22(Q150),
	.Q21(Q149),
	.Q20(Q148),
	.Q19(Q147),
	.Q18(Q146),
	.Q17(Q145),
	.Q16(Q144),
	.Q15(Q143),
	.Q14(Q142),
	.Q13(Q141),
	.Q12(Q140),
	.Q11(Q139),
	.Q10(Q138),
	.Q9(Q137),
	.Q8(Q136),
	.Q7(Q135),
	.Q6(Q134),
	.Q5(Q133),
	.Q4(Q132),
	.Q3(Q131),
	.Q2(Q130),
	.Q1(Q129),
	.Q0(Q128));

assign	SYNTHESIZED_WIRE_1 = D7 & E;

assign	SYNTHESIZED_WIRE_0 = SYNTHESIZED_WIRE_2 & E;

assign	SYNTHESIZED_WIRE_2 =  ~D7;


endmodule
