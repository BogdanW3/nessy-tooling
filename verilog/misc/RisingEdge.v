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
// CREATED		"Tue Aug 29 21:47:46 2023"

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

assign	Q = SYNTHESIZED_WIRE_0 & SYNTHESIZED_WIRE_1;

assign	SYNTHESIZED_WIRE_0 =  ~DFF_inst1;


endmodule
