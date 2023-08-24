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
// CREATED		"Thu Aug 24 10:29:13 2023"

module REG2_INC_DEC(
	CLK,
	INC,
	DEC,
	DOUT
);


input wire	CLK;
input wire	INC;
input wire	DEC;
output wire	[1:0] DOUT;

reg	[1:0] DOUT_ALTERA_SYNTHESIZED;
wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_3;
wire	SYNTHESIZED_WIRE_4;





always@(posedge CLK)
begin
	DOUT_ALTERA_SYNTHESIZED[0] <= DOUT_ALTERA_SYNTHESIZED[0] ^ SYNTHESIZED_WIRE_0;
end

assign	SYNTHESIZED_WIRE_0 = DEC | INC;

assign	SYNTHESIZED_WIRE_3 = DOUT_ALTERA_SYNTHESIZED[0] & INC;

assign	SYNTHESIZED_WIRE_2 = SYNTHESIZED_WIRE_1 & DEC;

assign	SYNTHESIZED_WIRE_4 = SYNTHESIZED_WIRE_2 | SYNTHESIZED_WIRE_3;

assign	SYNTHESIZED_WIRE_1 =  ~DOUT_ALTERA_SYNTHESIZED[0];


always@(posedge CLK)
begin
	DOUT_ALTERA_SYNTHESIZED[1] <= DOUT_ALTERA_SYNTHESIZED[1] ^ SYNTHESIZED_WIRE_4;
end

assign	DOUT = DOUT_ALTERA_SYNTHESIZED;

endmodule
