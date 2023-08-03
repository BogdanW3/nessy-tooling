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
// CREATED		"Thu Aug 03 15:58:54 2023"

module RisingEdge(
	CLK,
	D,
	Q
);


input wire	CLK;
input wire	D;
output wire	Q;

reg	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_0;
reg	DFF_inst1;





always@(posedge CLK)
begin
	begin
	SYNTHESIZED_WIRE_1 <= D;
	end
end


always@(posedge CLK)
begin
	begin
	DFF_inst1 <= SYNTHESIZED_WIRE_1;
	end
end

assign	Q = SYNTHESIZED_WIRE_1 & SYNTHESIZED_WIRE_0;

assign	SYNTHESIZED_WIRE_0 =  ~DFF_inst1;


endmodule
