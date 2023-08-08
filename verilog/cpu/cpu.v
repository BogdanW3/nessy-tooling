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
// CREATED		"Tue Aug  8 15:54:53 2023"

module cpu(
	nNMI,
	CLK,
	OUT0,
	RD,
	WR,
	A,
	D
);


input wire	nNMI;
input wire	CLK;
output wire	OUT0;
output wire	RD;
output wire	WR;
output wire	[15:0] A;
inout wire	[7:0] D;

wire	H;
wire	KBDOUT;
reg	KBEND;
wire	KBSR;
wire	KBTEST;
wire	L;
reg	OUT_ALTERA_SYNTHESIZED0;
reg	DFF_KB7;
reg	SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_0;
wire	[7:0] SYNTHESIZED_WIRE_1;
reg	DFF_KB0;
reg	DFF_KB1;
reg	DFF_KB2;
reg	DFF_KB3;
reg	DFF_KB4;
reg	DFF_KB5;
reg	DFF_KB6;

wire	[15:0] GDFX_TEMP_SIGNAL_0;


assign	GDFX_TEMP_SIGNAL_0 = {L,H,L,L,L,L,L,L,L,L,L,H,L,H,H,L};


always@(posedge CLK)
begin
	KBEND <= ~KBEND & DFF_KB7 | KBEND & ~KBTEST;
end


assign	KBDOUT = KBEND;


assign	SYNTHESIZED_WIRE_0 =  ~SYNTHESIZED_WIRE_2;


RisingEdge	b2v_inst3(
	.D(SYNTHESIZED_WIRE_0),
	.CLK(CLK),
	.Q(KBTEST));



REG8_LD_SR	b2v_inst6(
	.CLK(CLK),
	.LD(L),
	.SR(KBSR),
	.IR(D[0]),
	
	
	.DOUT(SYNTHESIZED_WIRE_1));

assign	D[7] = KBDOUT ? SYNTHESIZED_WIRE_1[7] : 1'bz;
assign	D[6] = KBDOUT ? SYNTHESIZED_WIRE_1[6] : 1'bz;
assign	D[5] = KBDOUT ? SYNTHESIZED_WIRE_1[5] : 1'bz;
assign	D[4] = KBDOUT ? SYNTHESIZED_WIRE_1[4] : 1'bz;
assign	D[3] = KBDOUT ? SYNTHESIZED_WIRE_1[3] : 1'bz;
assign	D[2] = KBDOUT ? SYNTHESIZED_WIRE_1[2] : 1'bz;
assign	D[1] = KBDOUT ? SYNTHESIZED_WIRE_1[1] : 1'bz;
assign	D[0] = KBDOUT ? SYNTHESIZED_WIRE_1[0] : 1'bz;

assign	KBSR = ~(KBEND | OUT_ALTERA_SYNTHESIZED0);


always@(posedge CLK)
begin
	SYNTHESIZED_WIRE_2 <= ~SYNTHESIZED_WIRE_2 & H | SYNTHESIZED_WIRE_2 & ~nNMI;
end

assign	RD = KBSR;



always@(posedge CLK)
begin
	begin
	DFF_KB0 <= OUT_ALTERA_SYNTHESIZED0;
	end
end


always@(posedge CLK)
begin
	begin
	DFF_KB1 <= DFF_KB0;
	end
end


always@(posedge CLK)
begin
	begin
	DFF_KB2 <= DFF_KB1;
	end
end


always@(posedge CLK)
begin
	begin
	DFF_KB3 <= DFF_KB2;
	end
end


always@(posedge CLK)
begin
	begin
	DFF_KB4 <= DFF_KB3;
	end
end


always@(posedge CLK)
begin
	begin
	DFF_KB5 <= DFF_KB4;
	end
end


always@(posedge CLK)
begin
	begin
	DFF_KB6 <= DFF_KB5;
	end
end


always@(posedge CLK)
begin
	begin
	DFF_KB7 <= DFF_KB6;
	end
end


always@(posedge CLK)
begin
	begin
	OUT_ALTERA_SYNTHESIZED0 <= KBTEST;
	end
end

assign	A[15] = SYNTHESIZED_WIRE_2 ? GDFX_TEMP_SIGNAL_0[15] : 1'bz;
assign	A[14] = SYNTHESIZED_WIRE_2 ? GDFX_TEMP_SIGNAL_0[14] : 1'bz;
assign	A[13] = SYNTHESIZED_WIRE_2 ? GDFX_TEMP_SIGNAL_0[13] : 1'bz;
assign	A[12] = SYNTHESIZED_WIRE_2 ? GDFX_TEMP_SIGNAL_0[12] : 1'bz;
assign	A[11] = SYNTHESIZED_WIRE_2 ? GDFX_TEMP_SIGNAL_0[11] : 1'bz;
assign	A[10] = SYNTHESIZED_WIRE_2 ? GDFX_TEMP_SIGNAL_0[10] : 1'bz;
assign	A[9] = SYNTHESIZED_WIRE_2 ? GDFX_TEMP_SIGNAL_0[9] : 1'bz;
assign	A[8] = SYNTHESIZED_WIRE_2 ? GDFX_TEMP_SIGNAL_0[8] : 1'bz;
assign	A[7] = SYNTHESIZED_WIRE_2 ? GDFX_TEMP_SIGNAL_0[7] : 1'bz;
assign	A[6] = SYNTHESIZED_WIRE_2 ? GDFX_TEMP_SIGNAL_0[6] : 1'bz;
assign	A[5] = SYNTHESIZED_WIRE_2 ? GDFX_TEMP_SIGNAL_0[5] : 1'bz;
assign	A[4] = SYNTHESIZED_WIRE_2 ? GDFX_TEMP_SIGNAL_0[4] : 1'bz;
assign	A[3] = SYNTHESIZED_WIRE_2 ? GDFX_TEMP_SIGNAL_0[3] : 1'bz;
assign	A[2] = SYNTHESIZED_WIRE_2 ? GDFX_TEMP_SIGNAL_0[2] : 1'bz;
assign	A[1] = SYNTHESIZED_WIRE_2 ? GDFX_TEMP_SIGNAL_0[1] : 1'bz;
assign	A[0] = SYNTHESIZED_WIRE_2 ? GDFX_TEMP_SIGNAL_0[0] : 1'bz;

assign	OUT0 = OUT_ALTERA_SYNTHESIZED0;
assign	H = 1;
assign	L = 0;

endmodule
