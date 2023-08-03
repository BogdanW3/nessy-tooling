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
// CREATED		"Thu Aug 03 15:46:41 2023"

module DC2(
	E,
	D0,
	Q0,
	Q1
);


input wire	E;
input wire	D0;
output wire	Q0;
output wire	Q1;

wire	SYNTHESIZED_WIRE_0;




assign	SYNTHESIZED_WIRE_0 =  ~D0;

assign	Q1 = E & D0;

assign	Q0 = SYNTHESIZED_WIRE_0 & E;


endmodule
