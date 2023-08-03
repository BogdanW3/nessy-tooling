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
// CREATED		"Thu Aug  3 14:28:20 2023"

module REG4_LD_SR(
	CLK,
	LD,
	SR,
	IR,
	D,
	S,
	Q
);


input wire	CLK;
input wire	LD;
input wire	SR;
input wire	IR;
input wire	[3:0] D;
output wire	S;
output wire	[3:0] Q;

wire	[3:0] Q_ALTERA_SYNTHESIZED;
wire	SYNTHESIZED_WIRE_0;





REG2_LD_SR	b2v_inst1(
	.CLK(CLK),
	.LD(LD),
	.SR(SR),
	.IR(IR),
	.D(D[3:2]),
	.S(SYNTHESIZED_WIRE_0),
	.Q(Q_ALTERA_SYNTHESIZED[3:2]));


REG2_LD_SR	b2v_inst2(
	.CLK(CLK),
	.LD(LD),
	.SR(SR),
	.IR(SYNTHESIZED_WIRE_0),
	.D(D[1:0]),
	
	.Q(Q_ALTERA_SYNTHESIZED[1:0]));

assign	S = Q_ALTERA_SYNTHESIZED[0];
assign	Q = Q_ALTERA_SYNTHESIZED;

endmodule
