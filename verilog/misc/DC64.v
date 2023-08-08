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
// CREATED		"Tue Aug  8 15:01:58 2023"

module DC64(
	E,
	D3,
	D2,
	D1,
	D0,
	D4,
	D5,
	Q0,
	Q2,
	Q3,
	Q1,
	Q4,
	Q6,
	Q7,
	Q5,
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
	Q63
);


input wire	E;
input wire	D3;
input wire	D2;
input wire	D1;
input wire	D0;
input wire	D4;
input wire	D5;
output wire	Q0;
output wire	Q2;
output wire	Q3;
output wire	Q1;
output wire	Q4;
output wire	Q6;
output wire	Q7;
output wire	Q5;
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

wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;





DC32	b2v_inst(
	.D4(D4),
	.D3(D3),
	.D2(D2),
	.D1(D1),
	.D0(D0),
	.E(SYNTHESIZED_WIRE_0),
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


DC32	b2v_inst2(
	.D4(D4),
	.D3(D3),
	.D2(D2),
	.D1(D1),
	.D0(D0),
	.E(SYNTHESIZED_WIRE_1),
	.Q31(Q63),
	.Q30(Q62),
	.Q29(Q61),
	.Q28(Q60),
	.Q27(Q59),
	.Q26(Q58),
	.Q25(Q57),
	.Q24(Q56),
	.Q23(Q55),
	.Q22(Q54),
	.Q21(Q53),
	.Q20(Q52),
	.Q19(Q51),
	.Q18(Q50),
	.Q17(Q49),
	.Q16(Q48),
	.Q15(Q47),
	.Q14(Q46),
	.Q13(Q45),
	.Q12(Q44),
	.Q11(Q43),
	.Q10(Q42),
	.Q9(Q41),
	.Q8(Q40),
	.Q7(Q39),
	.Q6(Q38),
	.Q5(Q37),
	.Q4(Q36),
	.Q3(Q35),
	.Q2(Q34),
	.Q1(Q33),
	.Q0(Q32));

assign	SYNTHESIZED_WIRE_1 = D5 & E;

assign	SYNTHESIZED_WIRE_0 = SYNTHESIZED_WIRE_2 & E;

assign	SYNTHESIZED_WIRE_2 =  ~D5;


endmodule
