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
// CREATED		"Tue Aug 29 21:48:38 2023"

module cpu_decode(
	IR0_,
	NOP,
	BRK,
	PHP,
	BPL,
	CLC,
	JSR,
	PLP,
	BMI,
	SEC,
	RTI,
	PHA,
	BVC,
	CLI,
	BIT,
	RTS,
	PLA,
	BVS,
	SEI,
	DEY,
	BCC,
	TYA,
	SHY,
	TAY,
	BCS,
	CLV,
	INY,
	BNE,
	CLD,
	INX,
	BEQ,
	SED,
	JMP,
	STY,
	CPX,
	CPY,
	LDY,
	memdirXpom,
	shortmemdirXpom,
	shortindYpom,
	memdirYpom,
	memdir,
	pcrel,
	imm,
	indXpom,
	shortmemdir,
	ADDRERROR
);


input wire	[7:0] IR0_;
output wire	NOP;
output wire	BRK;
output wire	PHP;
output wire	BPL;
output wire	CLC;
output wire	JSR;
output wire	PLP;
output wire	BMI;
output wire	SEC;
output wire	RTI;
output wire	PHA;
output wire	BVC;
output wire	CLI;
output wire	BIT;
output wire	RTS;
output wire	PLA;
output wire	BVS;
output wire	SEI;
output wire	DEY;
output wire	BCC;
output wire	TYA;
output wire	SHY;
output wire	TAY;
output wire	BCS;
output wire	CLV;
output wire	INY;
output wire	BNE;
output wire	CLD;
output wire	INX;
output wire	BEQ;
output wire	SED;
output wire	JMP;
output wire	STY;
output wire	CPX;
output wire	CPY;
output wire	LDY;
output wire	memdirXpom;
output wire	shortmemdirXpom;
output wire	shortindYpom;
output wire	memdirYpom;
output wire	memdir;
output wire	pcrel;
output wire	imm;
output wire	indXpom;
output wire	shortmemdir;
output wire	ADDRERROR;

wire	ADD;
wire	ADDRERROR_ALTERA_SYNTHESIZED1;
wire	ADDRERROR_ALTERA_SYNTHESIZED2;
wire	AND;
wire	CMP;
wire	DEC;
wire	ERROR2;
wire	GK;
wire	group_B;
wire	group_G;
wire	group_K;
wire	group_R;
wire	H;
wire	imm_GK;
wire	imm_RB;
wire	INC;
wire	indXpom_GK;
wire	KOLONA1;
wire	KOLONA2;
wire	KOLONA3;
wire	KOLONA4;
wire	KOLONA5;
wire	KOLONA6;
wire	KOLONA7;
wire	KOLONA8;
wire	LDA;
wire	LDX;
wire	LSL;
wire	LSR;
wire	memdir_GK;
wire	memdir_RB;
wire	memdirXpom_GK;
wire	memdirXpom_RB;
wire	memdirYpom_GK;
wire	NOP_B;
wire	NOP_G;
wire	NOP_R;
wire	OR;
wire	pcrel_RB;
wire	RB;
wire	RED1;
wire	RED2;
wire	RED3;
wire	RED4;
wire	RED5;
wire	RED6;
wire	RED7;
wire	RED8;
wire	ROL;
wire	ROR;
wire	shortindYpom_GK;
wire	shortmemdir_GK;
wire	shortmemdir_RB;
wire	shortmemdirXpom_GK;
wire	shortmemdirXpom_RB;
wire	STA;
wire	STX;
wire	SUB;
wire	XOR;
wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_3;
wire	SYNTHESIZED_WIRE_4;
wire	SYNTHESIZED_WIRE_5;
wire	SYNTHESIZED_WIRE_6;
wire	SYNTHESIZED_WIRE_7;
wire	SYNTHESIZED_WIRE_8;
wire	SYNTHESIZED_WIRE_9;
wire	SYNTHESIZED_WIRE_10;
wire	SYNTHESIZED_WIRE_11;
wire	SYNTHESIZED_WIRE_12;
wire	SYNTHESIZED_WIRE_13;
wire	SYNTHESIZED_WIRE_14;
wire	SYNTHESIZED_WIRE_15;
wire	SYNTHESIZED_WIRE_16;
wire	SYNTHESIZED_WIRE_17;
wire	SYNTHESIZED_WIRE_18;
wire	SYNTHESIZED_WIRE_19;
wire	SYNTHESIZED_WIRE_20;
wire	SYNTHESIZED_WIRE_21;
wire	SYNTHESIZED_WIRE_22;
wire	SYNTHESIZED_WIRE_23;
wire	SYNTHESIZED_WIRE_24;
wire	SYNTHESIZED_WIRE_25;
wire	SYNTHESIZED_WIRE_26;
wire	SYNTHESIZED_WIRE_27;
wire	SYNTHESIZED_WIRE_28;
wire	SYNTHESIZED_WIRE_29;
wire	SYNTHESIZED_WIRE_30;
wire	SYNTHESIZED_WIRE_31;
wire	SYNTHESIZED_WIRE_32;
wire	SYNTHESIZED_WIRE_33;
wire	SYNTHESIZED_WIRE_34;
wire	SYNTHESIZED_WIRE_35;
wire	SYNTHESIZED_WIRE_36;
wire	SYNTHESIZED_WIRE_37;
wire	SYNTHESIZED_WIRE_38;
wire	SYNTHESIZED_WIRE_39;
wire	SYNTHESIZED_WIRE_40;
wire	SYNTHESIZED_WIRE_41;
wire	SYNTHESIZED_WIRE_42;
wire	SYNTHESIZED_WIRE_43;




assign	SYNTHESIZED_WIRE_43 = KOLONA4 | KOLONA2;

assign	JSR = RED2 & KOLONA1;

assign	CPY = SYNTHESIZED_WIRE_0 | SYNTHESIZED_WIRE_1 | SYNTHESIZED_WIRE_2;

assign	CPX = SYNTHESIZED_WIRE_3 | SYNTHESIZED_WIRE_4 | SYNTHESIZED_WIRE_5;

assign	NOP_G = STA & imm_GK;

assign	CLI = RED3 & KOLONA7;

assign	BVC = RED3 & KOLONA5;

assign	SYNTHESIZED_WIRE_32 = RED3 & KOLONA4;

assign	PHA = RED3 & KOLONA3;

assign	RTI = RED3 & KOLONA1;

assign	SYNTHESIZED_WIRE_35 = RED5 & KOLONA2;

assign	SYNTHESIZED_WIRE_33 = RED5 & KOLONA4;

assign	SYNTHESIZED_WIRE_34 = RED5 & KOLONA6;

assign	SEI = RED4 & KOLONA7;

assign	BVS = RED4 & KOLONA5;

assign	SYNTHESIZED_WIRE_31 = RED4 & KOLONA4;

assign	PLA = RED4 & KOLONA3;

assign	RTS = RED4 & KOLONA1;

assign	SYNTHESIZED_WIRE_36 = RED6 & KOLONA8;

assign	SYNTHESIZED_WIRE_40 = RED6 & KOLONA1;

assign	SYNTHESIZED_WIRE_39 = RED6 & KOLONA2;

assign	SYNTHESIZED_WIRE_42 = RED6 & KOLONA4;

assign	SHY = RED5 & KOLONA8;

assign	TYA = RED5 & KOLONA7;

assign	BCC = RED5 & KOLONA5;

assign	DEY = RED5 & KOLONA3;

assign	SYNTHESIZED_WIRE_6 =  ~LDX;

assign	SYNTHESIZED_WIRE_9 = SYNTHESIZED_WIRE_6 & imm_RB;

assign	SYNTHESIZED_WIRE_7 = ~(DEC | LDX);

assign	SYNTHESIZED_WIRE_8 = SYNTHESIZED_WIRE_7 & ERROR2;

assign	NOP_B = SYNTHESIZED_WIRE_8 | pcrel_RB | SYNTHESIZED_WIRE_9;

assign	CLV = RED6 & KOLONA7;

assign	BCS = RED6 & KOLONA5;

assign	TAY = RED6 & KOLONA3;

assign	CLD = RED7 & KOLONA7;

assign	BNE = RED7 & KOLONA5;

assign	INY = RED7 & KOLONA3;

assign	SED = RED8 & KOLONA7;

assign	BEQ = RED8 & KOLONA5;

assign	INX = RED8 & KOLONA3;

assign	NOP_R = SYNTHESIZED_WIRE_10 | SYNTHESIZED_WIRE_11 | SYNTHESIZED_WIRE_12;

assign	SYNTHESIZED_WIRE_30 = RED8 & KOLONA8;

assign	SYNTHESIZED_WIRE_24 = RED1 & KOLONA2;

assign	SYNTHESIZED_WIRE_10 = SYNTHESIZED_WIRE_13 | SYNTHESIZED_WIRE_14 | SYNTHESIZED_WIRE_15 | SYNTHESIZED_WIRE_16 | SYNTHESIZED_WIRE_17 | SYNTHESIZED_WIRE_18;

assign	SYNTHESIZED_WIRE_17 = RED4 & KOLONA6;

assign	SYNTHESIZED_WIRE_14 = RED3 & KOLONA8;

assign	SYNTHESIZED_WIRE_15 = RED3 & KOLONA6;

assign	SYNTHESIZED_WIRE_13 = RED3 & KOLONA2;

assign	SYNTHESIZED_WIRE_12 = SYNTHESIZED_WIRE_19 | SYNTHESIZED_WIRE_20 | SYNTHESIZED_WIRE_21 | SYNTHESIZED_WIRE_22 | SYNTHESIZED_WIRE_23 | SYNTHESIZED_WIRE_24;

assign	SYNTHESIZED_WIRE_23 = RED1 & KOLONA4;

assign	SYNTHESIZED_WIRE_22 = RED1 & KOLONA6;

assign	SYNTHESIZED_WIRE_20 = RED1 & KOLONA8;

assign	SYNTHESIZED_WIRE_21 = RED2 & KOLONA6;

assign	SYNTHESIZED_WIRE_19 = RED2 & KOLONA8;

assign	SYNTHESIZED_WIRE_11 = SYNTHESIZED_WIRE_25 | SYNTHESIZED_WIRE_26 | SYNTHESIZED_WIRE_27 | SYNTHESIZED_WIRE_28 | SYNTHESIZED_WIRE_29 | SYNTHESIZED_WIRE_30;

assign	SYNTHESIZED_WIRE_29 = RED8 & KOLONA6;

assign	SYNTHESIZED_WIRE_28 = RED7 & KOLONA8;

assign	SYNTHESIZED_WIRE_26 = RED7 & KOLONA6;

assign	SYNTHESIZED_WIRE_27 = RED5 & KOLONA8;

assign	SYNTHESIZED_WIRE_25 = RED5 & KOLONA1;

assign	JMP = SYNTHESIZED_WIRE_31 | SYNTHESIZED_WIRE_32;

assign	SYNTHESIZED_WIRE_41 = RED6 & KOLONA6;

assign	SYNTHESIZED_WIRE_2 = RED7 & KOLONA1;

assign	SYNTHESIZED_WIRE_0 = RED7 & KOLONA2;

assign	SYNTHESIZED_WIRE_1 = RED7 & KOLONA4;

assign	SYNTHESIZED_WIRE_5 = RED8 & KOLONA1;

assign	SYNTHESIZED_WIRE_3 = RED8 & KOLONA2;

assign	SYNTHESIZED_WIRE_4 = RED8 & KOLONA4;

assign	NOP = NOP_R | NOP_B | group_K | NOP_G;

assign	memdirXpom = memdirXpom_RB | memdirXpom_GK;

assign	memdirYpom = memdirYpom_GK;


assign	shortmemdirXpom = shortmemdirXpom_RB | shortmemdirXpom_GK;

assign	shortindYpom = shortindYpom_GK;


assign	pcrel = pcrel_RB;


assign	memdir = memdir_RB | memdir_GK;

assign	imm = imm_RB | imm_GK;

assign	ADDRERROR = ADDRERROR_ALTERA_SYNTHESIZED2 | ADDRERROR_ALTERA_SYNTHESIZED1;

assign	shortmemdir = shortmemdir_RB | shortmemdir_GK;

assign	indXpom = indXpom_GK;



DC2	b2v_inst65(
	.D0(IR0_[0]),
	.E(H),
	.Q1(GK),
	.Q0(RB));


DC2	b2v_inst66(
	.D0(IR0_[1]),
	.E(GK),
	.Q1(group_K),
	.Q0(group_G));


DC2	b2v_inst67(
	.D0(IR0_[1]),
	.E(RB),
	.Q1(group_B),
	.Q0(group_R));


DC8	b2v_inst68(
	.D2(IR0_[4]),
	.D1(IR0_[3]),
	.D0(IR0_[2]),
	.E(GK),
	.Q7(memdirXpom_GK),
	.Q6(memdirYpom_GK),
	.Q5(shortmemdirXpom_GK),
	.Q4(shortindYpom_GK),
	.Q3(memdir_GK),
	.Q2(imm_GK),
	.Q1(shortmemdir_GK),
	.Q0(indXpom_GK));


DC8	b2v_inst69(
	.D2(IR0_[4]),
	.D1(IR0_[3]),
	.D0(IR0_[2]),
	.E(RB),
	.Q7(memdirXpom_RB),
	.Q6(ADDRERROR_ALTERA_SYNTHESIZED2),
	.Q5(shortmemdirXpom_RB),
	.Q4(pcrel_RB),
	.Q3(memdir_RB),
	.Q2(ADDRERROR_ALTERA_SYNTHESIZED1),
	.Q1(shortmemdir_RB),
	.Q0(imm_RB));


DC8	b2v_inst70(
	.D2(IR0_[7]),
	.D1(IR0_[6]),
	.D0(IR0_[5]),
	.E(group_G),
	
	
	
	.Q4(STA)
	
	
	
	);


DC8	b2v_inst75(
	.D2(IR0_[7]),
	.D1(IR0_[6]),
	.D0(IR0_[5]),
	.E(group_B),
	
	.Q6(DEC),
	.Q5(LDX)
	
	
	
	
	);


DC8	b2v_inst81(
	.D2(IR0_[7]),
	.D1(IR0_[6]),
	.D0(IR0_[5]),
	.E(group_R),
	.Q7(RED8),
	.Q6(RED7),
	.Q5(RED6),
	.Q4(RED5),
	.Q3(RED4),
	.Q2(RED3),
	.Q1(RED2),
	.Q0(RED1));


DC8	b2v_inst82(
	.D2(IR0_[4]),
	.D1(IR0_[3]),
	.D0(IR0_[2]),
	.E(group_R),
	.Q7(KOLONA8),
	.Q6(KOLONA7),
	.Q5(KOLONA6),
	.Q4(KOLONA5),
	.Q3(KOLONA4),
	.Q2(KOLONA3),
	.Q1(KOLONA2),
	.Q0(KOLONA1));

assign	CLC = RED1 & KOLONA7;

assign	STY = SYNTHESIZED_WIRE_33 | SYNTHESIZED_WIRE_34 | SYNTHESIZED_WIRE_35;

assign	LDY = SYNTHESIZED_WIRE_36 | SYNTHESIZED_WIRE_37 | SYNTHESIZED_WIRE_38;

assign	BPL = RED1 & KOLONA5;

assign	SYNTHESIZED_WIRE_16 = RED4 & KOLONA2;

assign	PHP = RED1 & KOLONA3;

assign	SYNTHESIZED_WIRE_18 = RED4 & KOLONA8;

assign	BRK = RED1 & KOLONA1;

assign	SEC = RED2 & KOLONA7;

assign	SYNTHESIZED_WIRE_38 = SYNTHESIZED_WIRE_39 | SYNTHESIZED_WIRE_40;

assign	SYNTHESIZED_WIRE_37 = SYNTHESIZED_WIRE_41 | SYNTHESIZED_WIRE_42;

assign	BMI = RED2 & KOLONA5;

assign	BIT = RED2 & SYNTHESIZED_WIRE_43;

assign	PLP = RED2 & KOLONA3;


endmodule
