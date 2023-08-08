// Copyright (C) 2023  Intel Corporation. All rights reserved.
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
// VERSION		"Version 22.1std.2 Build 922 07/20/2023 SC Lite Edition"
// CREATED		"Tue Aug  8 15:01:55 2023"

module DC128(
	E,
	D3,
	D2,
	D1,
	D0,
	D4,
	D5,
	D6,
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
	Q127
);


input wire	E;
input wire	D3;
input wire	D2;
input wire	D1;
input wire	D0;
input wire	D4;
input wire	D5;
input wire	D6;
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

wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;





DC64	b2v_inst(
	.D5(D5),
	.D4(D4),
	.D3(D3),
	.D2(D2),
	.D1(D1),
	.D0(D0),
	.E(SYNTHESIZED_WIRE_0),
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


DC64	b2v_inst3(
	.D5(D5),
	.D4(D4),
	.D3(D3),
	.D2(D2),
	.D1(D1),
	.D0(D0),
	.E(SYNTHESIZED_WIRE_1),
	.Q63(Q127),
	.Q62(Q126),
	.Q61(Q125),
	.Q60(Q124),
	.Q59(Q123),
	.Q58(Q122),
	.Q57(Q121),
	.Q56(Q120),
	.Q55(Q119),
	.Q54(Q118),
	.Q53(Q117),
	.Q52(Q116),
	.Q51(Q115),
	.Q50(Q114),
	.Q49(Q113),
	.Q48(Q112),
	.Q47(Q111),
	.Q46(Q110),
	.Q45(Q109),
	.Q44(Q108),
	.Q43(Q107),
	.Q42(Q106),
	.Q41(Q105),
	.Q40(Q104),
	.Q39(Q103),
	.Q38(Q102),
	.Q37(Q101),
	.Q36(Q100),
	.Q35(Q99),
	.Q34(Q98),
	.Q33(Q97),
	.Q32(Q96),
	.Q31(Q95),
	.Q30(Q94),
	.Q29(Q93),
	.Q28(Q92),
	.Q27(Q91),
	.Q26(Q90),
	.Q25(Q89),
	.Q24(Q88),
	.Q23(Q87),
	.Q22(Q86),
	.Q21(Q85),
	.Q20(Q84),
	.Q19(Q83),
	.Q18(Q82),
	.Q17(Q81),
	.Q16(Q80),
	.Q15(Q79),
	.Q14(Q78),
	.Q13(Q77),
	.Q12(Q76),
	.Q11(Q75),
	.Q10(Q74),
	.Q9(Q73),
	.Q8(Q72),
	.Q7(Q71),
	.Q6(Q70),
	.Q5(Q69),
	.Q4(Q68),
	.Q3(Q67),
	.Q2(Q66),
	.Q1(Q65),
	.Q0(Q64));

assign	SYNTHESIZED_WIRE_1 = D6 & E;

assign	SYNTHESIZED_WIRE_0 = SYNTHESIZED_WIRE_2 & E;

assign	SYNTHESIZED_WIRE_2 =  ~D6;


endmodule
