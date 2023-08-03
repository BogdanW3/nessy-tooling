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
// CREATED		"Thu Aug 03 19:25:25 2023"

module REG2_LD_SR(
	CLK,
	LD,
	SR,
	IR,
	DIN,
	S,
	DOUT
);


input wire	CLK;
input wire	LD;
input wire	SR;
input wire	IR;
input wire	[1:0] DIN;
output wire	S;
output wire	[1:0] DOUT;

reg	[1:0] DOUT_ALTERA_SYNTHESIZED;
wire	E;
wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;





always@(posedge CLK)
begin
if (E)
	begin
	DOUT_ALTERA_SYNTHESIZED[1] <= SYNTHESIZED_WIRE_0;
	end
end


always@(posedge CLK)
begin
if (E)
	begin
	DOUT_ALTERA_SYNTHESIZED[0] <= SYNTHESIZED_WIRE_1;
	end
end


MX2x1	b2v_inst2(
	.D1(IR),
	.D0(DIN[1]),
	.S0(SR),
	.Q(SYNTHESIZED_WIRE_0));


MX2x1	b2v_inst3(
	.D1(DOUT_ALTERA_SYNTHESIZED[1]),
	.D0(DIN[0]),
	.S0(SR),
	.Q(SYNTHESIZED_WIRE_1));

assign	E = SR | LD;

assign	S = DOUT_ALTERA_SYNTHESIZED[0];
assign	DOUT = DOUT_ALTERA_SYNTHESIZED;

endmodule
