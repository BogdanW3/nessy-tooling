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
// CREATED		"Thu Aug  3 14:28:57 2023"

module REG2_LD_SR(
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
input wire	[1:0] D;
output wire	S;
output wire	[1:0] Q;

wire	E;
reg	[1:0] Q_ALTERA_SYNTHESIZED;
wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;





always@(posedge CLK)
begin
if (E)
	begin
	Q_ALTERA_SYNTHESIZED[1] <= SYNTHESIZED_WIRE_0;
	end
end


always@(posedge CLK)
begin
if (E)
	begin
	Q_ALTERA_SYNTHESIZED[0] <= SYNTHESIZED_WIRE_1;
	end
end


MX2x1	b2v_inst2(
	.D1(IR),
	.D0(D[1]),
	.S0(SR),
	.Q(SYNTHESIZED_WIRE_0));


MX2x1	b2v_inst3(
	.D1(Q_ALTERA_SYNTHESIZED[1]),
	.D0(D[0]),
	.S0(SR),
	.Q(SYNTHESIZED_WIRE_1));

assign	E = SR | LD;

assign	S = Q_ALTERA_SYNTHESIZED[0];
assign	Q = Q_ALTERA_SYNTHESIZED;

endmodule
