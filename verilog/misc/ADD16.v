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
// CREATED		"Fri Aug  4 21:44:30 2023"

module ADD16(
	Cin,
	A,
	B,
	Cout,
	Q
);


input wire	Cin;
input wire	[15:0] A;
input wire	[15:0] B;
output wire	Cout;
output wire	[15:0] Q;

wire	[15:0] Q_ALTERA_SYNTHESIZED;
wire	SYNTHESIZED_WIRE_0;





ADD8	b2v_inst(
	.Cin(Cin),
	.A(A[7:0]),
	.B(B[7:0]),
	.Cout(SYNTHESIZED_WIRE_0),
	.Q(Q_ALTERA_SYNTHESIZED[7:0]));


ADD8	b2v_inst1(
	.Cin(SYNTHESIZED_WIRE_0),
	.A(A[15:8]),
	.B(B[15:8]),
	.Cout(Cout),
	.Q(Q_ALTERA_SYNTHESIZED[15:8]));

assign	Q = Q_ALTERA_SYNTHESIZED;

endmodule