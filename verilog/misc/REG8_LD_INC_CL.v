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
// CREATED		"Tue Aug 29 21:47:42 2023"

module REG8_LD_INC_CL(
	LD,
	CL,
	INC,
	CLK,
	DIN,
	DOUT
);


input wire	LD;
input wire	CL;
input wire	INC;
input wire	CLK;
input wire	[7:0] DIN;
output wire	[7:0] DOUT;

wire	[7:0] DOUT_ALTERA_SYNTHESIZED;
wire	LOWMAX;
wire	SYNTHESIZED_WIRE_0;





REG4_LD_INC_CL	b2v_inst(
	.CLK(CLK),
	.LD(LD),
	.INC(INC),
	.CL(CL),
	.DIN(DIN[3:0]),
	.DOUT(DOUT_ALTERA_SYNTHESIZED[3:0]));

assign	LOWMAX = DOUT_ALTERA_SYNTHESIZED[3] & DOUT_ALTERA_SYNTHESIZED[2] & DOUT_ALTERA_SYNTHESIZED[1] & DOUT_ALTERA_SYNTHESIZED[0];


REG4_LD_INC_CL	b2v_inst2(
	.CLK(CLK),
	.LD(LD),
	.INC(SYNTHESIZED_WIRE_0),
	.CL(CL),
	.DIN(DIN[7:4]),
	.DOUT(DOUT_ALTERA_SYNTHESIZED[7:4]));

assign	SYNTHESIZED_WIRE_0 = INC & LOWMAX;

assign	DOUT = DOUT_ALTERA_SYNTHESIZED;

endmodule
