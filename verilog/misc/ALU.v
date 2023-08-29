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
// CREATED		"Tue Aug 29 21:46:28 2023"

module ALU(
	Cin,
	ADD_,
	SUB_,
	OR_,
	XOR_,
	AND_,
	INC_,
	DEC_,
	LSL_,
	LSR_,
	ROL_,
	ROR_,
	A,
	B,
	Cout,
	Q
);


input wire	Cin;
input wire	ADD_;
input wire	SUB_;
input wire	OR_;
input wire	XOR_;
input wire	AND_;
input wire	INC_;
input wire	DEC_;
input wire	LSL_;
input wire	LSR_;
input wire	ROL_;
input wire	ROR_;
input wire	[7:0] A;
input wire	[7:0] B;
output wire	Cout;
output wire	[7:0] Q;

wire	Cout_ADD;
wire	H;
wire	L;
wire	[7:0] Q_ADD;
wire	[7:0] Q_AND;
wire	[7:0] Q_LSL;
wire	[7:0] Q_LSR;
wire	[7:0] Q_OR;
wire	[7:0] Q_ROL;
wire	[7:0] Q_ROR;
wire	[7:0] Q_XOR;
wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_3;
wire	SYNTHESIZED_WIRE_4;
wire	[7:0] SYNTHESIZED_WIRE_5;
wire	SYNTHESIZED_WIRE_6;
wire	SYNTHESIZED_WIRE_7;
wire	SYNTHESIZED_WIRE_8;
wire	[7:0] SYNTHESIZED_WIRE_9;
wire	[7:0] SYNTHESIZED_WIRE_10;
wire	SYNTHESIZED_WIRE_11;
wire	SYNTHESIZED_WIRE_12;
wire	SYNTHESIZED_WIRE_13;
wire	SYNTHESIZED_WIRE_14;

wire	[7:0] GDFX_TEMP_SIGNAL_0;
wire	[7:0] GDFX_TEMP_SIGNAL_1;
wire	[7:0] GDFX_TEMP_SIGNAL_5;
wire	[7:0] GDFX_TEMP_SIGNAL_4;
wire	[7:0] GDFX_TEMP_SIGNAL_3;
wire	[7:0] GDFX_TEMP_SIGNAL_2;


assign	GDFX_TEMP_SIGNAL_0 = {L,L,L,L,L,L,L,L};
assign	GDFX_TEMP_SIGNAL_1 = {L,L,L,L,L,L,L,L};
assign	GDFX_TEMP_SIGNAL_5 = {A[0],A[7:1]};
assign	GDFX_TEMP_SIGNAL_4 = {A[6:0],A[7]};
assign	GDFX_TEMP_SIGNAL_3 = {L,A[7:1]};
assign	GDFX_TEMP_SIGNAL_2 = {A[6:0],L};


Mx16x1	b2v_inst10(
	
	
	
	
	
	.D10(A[0]),
	.D9(A[7]),
	.D8(A[0]),
	.D7(A[7]),
	.D6(Cout_ADD),
	.D5(Cout_ADD),
	.D4(L),
	.D3(L),
	.D2(L),
	.D1(Cout_ADD),
	.D0(Cout_ADD),
	.S3(SYNTHESIZED_WIRE_0),
	.S2(SYNTHESIZED_WIRE_1),
	.S1(SYNTHESIZED_WIRE_2),
	.S0(SYNTHESIZED_WIRE_3),
	.Q(Cout));


ADD8	b2v_inst11(
	.Cin(SYNTHESIZED_WIRE_4),
	.A(A),
	.B(SYNTHESIZED_WIRE_5),
	.Cout(Cout_ADD),
	.Q(Q_ADD));


MX2x1	b2v_inst13(
	.D1(SYNTHESIZED_WIRE_6),
	.D0(Cin),
	.S0(SUB_),
	.Q(SYNTHESIZED_WIRE_4));

assign	Q_OR = B | A;

assign	Q_AND = A & B;

assign	Q_XOR = A ^ B;




MX4x8	b2v_inst21(
	.S1(SYNTHESIZED_WIRE_7),
	.S0(SYNTHESIZED_WIRE_8),
	.D0_(B),
	.D1_(SYNTHESIZED_WIRE_9),
	.D2_(GDFX_TEMP_SIGNAL_0),
	.D3_(SYNTHESIZED_WIRE_10),
	.Q_(SYNTHESIZED_WIRE_5));

assign	SYNTHESIZED_WIRE_10 =  ~GDFX_TEMP_SIGNAL_1;


CD4	b2v_inst23(
	.D3(DEC_),
	.D2(INC_),
	.D1(SUB_),
	.D0(ADD_),
	.Q1(SYNTHESIZED_WIRE_7),
	.Q0(SYNTHESIZED_WIRE_8)
	);

assign	SYNTHESIZED_WIRE_6 =  ~Cin;

assign	Q_LSL = GDFX_TEMP_SIGNAL_2;


assign	Q_LSR = GDFX_TEMP_SIGNAL_3;


assign	Q_ROL = GDFX_TEMP_SIGNAL_4;


assign	Q_ROR = GDFX_TEMP_SIGNAL_5;


assign	SYNTHESIZED_WIRE_9 =  ~B;


MX16x8	b2v_inst6(
	.S3(SYNTHESIZED_WIRE_11),
	.S2(SYNTHESIZED_WIRE_12),
	.S1(SYNTHESIZED_WIRE_13),
	.S0(SYNTHESIZED_WIRE_14),
	.D0_(Q_ADD),
	.D10_(Q_ROR),
	
	
	
	
	
	.D1_(Q_ADD),
	.D2_(Q_OR),
	.D3_(Q_XOR),
	.D4_(Q_AND),
	.D5_(Q_ADD),
	.D6_(Q_ADD),
	.D7_(Q_LSL),
	.D8_(Q_LSR),
	.D9_(Q_ROL),
	.Q(Q));


CD16	b2v_inst70(
	
	
	
	
	
	.D10(ROR_),
	.D9(ROL_),
	.D8(LSR_),
	.D7(LSL_),
	.D6(DEC_),
	.D5(INC_),
	.D4(AND_),
	.D3(XOR_),
	.D2(OR_),
	.D1(SUB_),
	.D0(ADD_),
	.Q3(SYNTHESIZED_WIRE_11),
	.Q2(SYNTHESIZED_WIRE_12),
	.Q1(SYNTHESIZED_WIRE_13),
	.Q0(SYNTHESIZED_WIRE_14)
	);


CD16	b2v_inst9(
	
	
	
	
	
	.D10(ROR_),
	.D9(ROL_),
	.D8(LSR_),
	.D7(LSL_),
	.D6(DEC_),
	.D5(INC_),
	.D4(AND_),
	.D3(XOR_),
	.D2(OR_),
	.D1(SUB_),
	.D0(ADD_),
	.Q3(SYNTHESIZED_WIRE_0),
	.Q2(SYNTHESIZED_WIRE_1),
	.Q1(SYNTHESIZED_WIRE_2),
	.Q0(SYNTHESIZED_WIRE_3)
	);

assign	H = 1;
assign	L = 0;

endmodule
