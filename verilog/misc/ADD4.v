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
// CREATED		"Sat Aug 12 22:54:04 2023"

module ADD4(
	Cin,
	A,
	B,
	Cout,
	Q
);


input wire	Cin;
input wire	[3:0] A;
input wire	[3:0] B;
output wire	Cout;
output wire	[3:0] Q;

wire	[3:0] Q_ALTERA_SYNTHESIZED;
wire	SYNTHESIZED_WIRE_0;





ADD2	b2v_inst(
	.Cin(Cin),
	.A(A[1:0]),
	.B(B[1:0]),
	.Cout(SYNTHESIZED_WIRE_0),
	.Q(Q_ALTERA_SYNTHESIZED[1:0]));


ADD2	b2v_inst6(
	.Cin(SYNTHESIZED_WIRE_0),
	.A(A[3:2]),
	.B(B[3:2]),
	.Cout(Cout),
	.Q(Q_ALTERA_SYNTHESIZED[3:2]));

assign	Q = Q_ALTERA_SYNTHESIZED;

endmodule
