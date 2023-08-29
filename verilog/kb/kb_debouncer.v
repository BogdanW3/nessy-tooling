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
// CREATED		"Tue Aug 29 21:46:18 2023"

module kb_debouncer(
	CLK,
	D,
	Q
);


input wire	CLK;
input wire	D;
output reg	Q;

wire	diff;
wire	ndiff;
wire	[3:0] T;
reg	DFF_inst2;
wire	SYNTHESIZED_WIRE_0;





REG4_INC_CL	b2v_inst(
	.CLK(CLK),
	.INC(ndiff),
	.CL(diff),
	.DOUT(T));

assign	diff = D ^ DFF_inst2;

assign	SYNTHESIZED_WIRE_0 = T[0] & T[1] & T[2];


always@(posedge CLK)
begin
if (SYNTHESIZED_WIRE_0)
	begin
	Q <= D;
	end
end


always@(posedge CLK)
begin
	begin
	DFF_inst2 <= D;
	end
end

assign	ndiff =  ~diff;


endmodule
