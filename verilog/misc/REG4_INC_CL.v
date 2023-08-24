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
// CREATED		"Thu Aug 24 10:29:18 2023"

module REG4_INC_CL(
	CLK,
	INC,
	CL,
	DOUT
);


input wire	CLK;
input wire	INC;
input wire	CL;
output wire	[3:0] DOUT;

wire	[3:0] DOUT_ALTERA_SYNTHESIZED;
wire	LOWMAX;
wire	SYNTHESIZED_WIRE_0;





REG2_INC_CL	b2v_inst(
	.CLK(CLK),
	.INC(INC),
	.CL(CL),
	.DOUT(DOUT_ALTERA_SYNTHESIZED[1:0]));


REG2_INC_CL	b2v_inst1(
	.CLK(CLK),
	.INC(SYNTHESIZED_WIRE_0),
	.CL(CL),
	.DOUT(DOUT_ALTERA_SYNTHESIZED[3:2]));

assign	SYNTHESIZED_WIRE_0 = INC & LOWMAX;

assign	LOWMAX = DOUT_ALTERA_SYNTHESIZED[1] & DOUT_ALTERA_SYNTHESIZED[0];

assign	DOUT = DOUT_ALTERA_SYNTHESIZED;

endmodule
