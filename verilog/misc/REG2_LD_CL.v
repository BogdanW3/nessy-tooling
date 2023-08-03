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
// CREATED		"Thu Aug 03 15:47:20 2023"

module REG2_LD_CL(
	CL,
	LD,
	CLK,
	DIN,
	DOUT
);


input wire	CL;
input wire	LD;
input wire	CLK;
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
wire	SYNTHESIZED_WIRE_9;
wire	SYNTHESIZED_WIRE_10;
wire	SYNTHESIZED_WIRE_11;





always@(posedge CLK)
begin
	begin
	DOUT_ALTERA_SYNTHESIZED[1] <= SYNTHESIZED_WIRE_0;
	end
end


always@(posedge CLK)
begin
	begin
	DOUT_ALTERA_SYNTHESIZED[0] <= SYNTHESIZED_WIRE_1;
	end
end

assign	SYNTHESIZED_WIRE_1 = SYNTHESIZED_WIRE_2 & SYNTHESIZED_WIRE_3;

assign	SYNTHESIZED_WIRE_2 = SYNTHESIZED_WIRE_4 | SYNTHESIZED_WIRE_5;

assign	SYNTHESIZED_WIRE_5 = LD & DIN[0];

assign	SYNTHESIZED_WIRE_4 = SYNTHESIZED_WIRE_6 & DOUT_ALTERA_SYNTHESIZED[0];

assign	SYNTHESIZED_WIRE_6 =  ~LD;

assign	SYNTHESIZED_WIRE_8 =  ~CL;

assign	SYNTHESIZED_WIRE_3 =  ~CL;

assign	SYNTHESIZED_WIRE_0 = SYNTHESIZED_WIRE_7 & SYNTHESIZED_WIRE_8;

assign	SYNTHESIZED_WIRE_7 = SYNTHESIZED_WIRE_9 | SYNTHESIZED_WIRE_10;

assign	SYNTHESIZED_WIRE_10 = LD & DIN[1];

assign	SYNTHESIZED_WIRE_9 = SYNTHESIZED_WIRE_11 & DOUT_ALTERA_SYNTHESIZED[1];

assign	SYNTHESIZED_WIRE_11 =  ~LD;

assign	DOUT = DOUT_ALTERA_SYNTHESIZED;

endmodule
