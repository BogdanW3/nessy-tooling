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
// CREATED		"Tue Aug 29 21:46:21 2023"

module mem_controller(
	CS,
	RD,
	WR,
	CLK,
	A,
	DIN,
	FC,
	DOUT
);


input wire	CS;
input wire	RD;
input wire	WR;
input wire	CLK;
input wire	[12:0] A;
input wire	[7:0] DIN;
output reg	FC;
output wire	[7:0] DOUT;

wire	SYNTHESIZED_WIRE_0;
reg	DFF_inst;
wire	SYNTHESIZED_WIRE_1;





always@(posedge CLK)
begin
	begin
	DFF_inst <= SYNTHESIZED_WIRE_0;
	end
end


mem	b2v_inst1(
	.wren(WR),
	.clock(CLK),
	.address(A),
	.data(DIN),
	.q(DOUT));


always@(posedge CLK)
begin
	begin
	FC <= DFF_inst;
	end
end

assign	SYNTHESIZED_WIRE_1 = WR | RD;

assign	SYNTHESIZED_WIRE_0 = CS & SYNTHESIZED_WIRE_1;


endmodule
