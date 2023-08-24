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
// CREATED		"Thu Aug 24 10:29:11 2023"

module REG16_LD_INC_DEC(
	CLK,
	INC,
	DEC,
	LD,
	DIN,
	DOUT
);


input wire	CLK;
input wire	INC;
input wire	DEC;
input wire	LD;
input wire	[15:0] DIN;
output wire	[15:0] DOUT;

wire	[15:0] DOUT_ALTERA_SYNTHESIZED;
wire	LOWMAX;
wire	LOWMIN;
wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;





REG8_LD_INC_DEC	b2v_inst(
	.CLK(CLK),
	.LD(LD),
	.INC(INC),
	.DEC(DEC),
	.DIN(DIN[7:0]),
	.DOUT(DOUT_ALTERA_SYNTHESIZED[7:0]));


REG8_LD_INC_DEC	b2v_inst1(
	.CLK(CLK),
	.LD(LD),
	.INC(SYNTHESIZED_WIRE_0),
	.DEC(SYNTHESIZED_WIRE_1),
	.DIN(DIN[15:8]),
	.DOUT(DOUT_ALTERA_SYNTHESIZED[15:8]));

assign	SYNTHESIZED_WIRE_0 = INC & LOWMAX;

assign	SYNTHESIZED_WIRE_1 = DEC & LOWMIN;

assign	LOWMAX = DOUT_ALTERA_SYNTHESIZED[7] & DOUT_ALTERA_SYNTHESIZED[5] & DOUT_ALTERA_SYNTHESIZED[6] & DOUT_ALTERA_SYNTHESIZED[4] & DOUT_ALTERA_SYNTHESIZED[1] & DOUT_ALTERA_SYNTHESIZED[2] & DOUT_ALTERA_SYNTHESIZED[0] & DOUT_ALTERA_SYNTHESIZED[3];

assign	LOWMIN = ~(DOUT_ALTERA_SYNTHESIZED[7] | DOUT_ALTERA_SYNTHESIZED[5] | DOUT_ALTERA_SYNTHESIZED[6] | DOUT_ALTERA_SYNTHESIZED[4] | DOUT_ALTERA_SYNTHESIZED[2] | DOUT_ALTERA_SYNTHESIZED[3] | DOUT_ALTERA_SYNTHESIZED[1] | DOUT_ALTERA_SYNTHESIZED[0]);

assign	DOUT = DOUT_ALTERA_SYNTHESIZED;

endmodule
