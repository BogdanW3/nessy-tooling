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
// CREATED		"Tue Aug 29 21:47:26 2023"

module REG2_LD_INC_DEC(
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
input wire	[1:0] DIN;
output wire	[1:0] DOUT;

reg	[1:0] DOUT_ALTERA_SYNTHESIZED;
wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_3;
wire	SYNTHESIZED_WIRE_4;
wire	SYNTHESIZED_WIRE_5;
wire	SYNTHESIZED_WIRE_6;
wire	SYNTHESIZED_WIRE_7;
wire	SYNTHESIZED_WIRE_8;





always@(posedge CLK)
begin
	DOUT_ALTERA_SYNTHESIZED[0] <= DOUT_ALTERA_SYNTHESIZED[0] ^ SYNTHESIZED_WIRE_0;
end

assign	SYNTHESIZED_WIRE_8 = DIN[1] ^ DOUT_ALTERA_SYNTHESIZED[1];

assign	SYNTHESIZED_WIRE_5 = DOUT_ALTERA_SYNTHESIZED[0] & INC;

assign	SYNTHESIZED_WIRE_6 = SYNTHESIZED_WIRE_1 & DEC;

assign	SYNTHESIZED_WIRE_1 =  ~DOUT_ALTERA_SYNTHESIZED[0];

assign	SYNTHESIZED_WIRE_0 = INC | DEC | SYNTHESIZED_WIRE_2;

assign	SYNTHESIZED_WIRE_2 = SYNTHESIZED_WIRE_3 & LD;


always@(posedge CLK)
begin
	DOUT_ALTERA_SYNTHESIZED[1] <= DOUT_ALTERA_SYNTHESIZED[1] ^ SYNTHESIZED_WIRE_4;
end

assign	SYNTHESIZED_WIRE_3 = DIN[0] ^ DOUT_ALTERA_SYNTHESIZED[0];

assign	SYNTHESIZED_WIRE_4 = SYNTHESIZED_WIRE_5 | SYNTHESIZED_WIRE_6 | SYNTHESIZED_WIRE_7;

assign	SYNTHESIZED_WIRE_7 = SYNTHESIZED_WIRE_8 & LD;

assign	DOUT = DOUT_ALTERA_SYNTHESIZED;

endmodule
