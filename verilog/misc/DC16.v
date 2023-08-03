// Copyright (C) 1991-2013 Altera Corporation
// Your use of Altera Corporation's design tools, logic functions 
// and other software and tools, and its AMPP partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Altera Program License 
// Subscription Agreement, Altera MegaCore Function License 
// Agreement, or other applicable license agreement, including, 
// without limitation, that your use is for the sole purpose of 
// programming logic devices manufactured by Altera and sold by 
// Altera or its authorized distributors.  Please refer to the 
// applicable agreement for further details.

// PROGRAM		"Quartus II 64-Bit"
// VERSION		"Version 13.1.0 Build 162 10/23/2013 SJ Web Edition"
// CREATED		"Thu Aug 03 15:46:38 2023"

module DC16(
	E,
	D3,
	D2,
	D1,
	D0,
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
	Q15
);


input wire	E;
input wire	D3;
input wire	D2;
input wire	D1;
input wire	D0;
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

wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;





DC8	b2v_inst(
	.D2(D2),
	.D1(D1),
	.D0(D0),
	.E(SYNTHESIZED_WIRE_0),
	.Q7(Q7),
	.Q6(Q6),
	.Q5(Q5),
	.Q4(Q4),
	.Q3(Q3),
	.Q2(Q2),
	.Q1(Q1),
	.Q0(Q0));


DC8	b2v_inst1(
	.D2(D2),
	.D1(D1),
	.D0(D0),
	.E(SYNTHESIZED_WIRE_1),
	.Q7(Q15),
	.Q6(Q14),
	.Q5(Q13),
	.Q4(Q12),
	.Q3(Q11),
	.Q2(Q10),
	.Q1(Q9),
	.Q0(Q8));

assign	SYNTHESIZED_WIRE_1 = D3 & E;

assign	SYNTHESIZED_WIRE_0 = SYNTHESIZED_WIRE_2 & E;

assign	SYNTHESIZED_WIRE_2 =  ~D3;


endmodule
