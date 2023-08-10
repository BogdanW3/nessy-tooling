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
// CREATED		"Wed Aug  9 16:26:23 2023"

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
wire	KBRESET;
wire	KBSR;
wire	KBTEST;
wire	[7:0] KBTESTDELAY;
wire	L;
reg	OUT_ALTERA_SYNTHESIZED0;
reg	DFF_KB7;
wire	SYNTHESIZED_WIRE_0;
reg	JKFF_inst90;
wire	SYNTHESIZED_WIRE_1;
wire	[7:0] SYNTHESIZED_WIRE_2;
reg	DFF_KB0;
reg	DFF_KB1;
reg	DFF_KB2;
reg	DFF_KB3;
reg	DFF_KB4;
reg	DFF_KB5;
reg	DFF_KB6;

wire	[15:0] GDFX_TEMP_SIGNAL_0;
wire	[7:0] GDFX_TEMP_SIGNAL_1;


assign	GDFX_TEMP_SIGNAL_0 = {L,H,L,L,L,L,L,L,L,L,L,H,L,H,H,L};
assign	GDFX_TEMP_SIGNAL_1 = {H,H,H,H,H,H,H,H};


always@(posedge CLK)
begin
	KBEND <= ~KBEND & DFF_KB7 | KBEND & ~KBTEST;
end


assign	KBDOUT = KBEND;


assign	KBRESET = SYNTHESIZED_WIRE_0 | nNMI;

assign	A = GDFX_TEMP_SIGNAL_0;


assign	SYNTHESIZED_WIRE_1 =  ~JKFF_inst90;


RisingEdge	b2v_inst3(
	.D(SYNTHESIZED_WIRE_1),
	.CLK(CLK),
	.Q(KBTEST));



REG8_INC_CL	b2v_inst5(
	.CLK(CLK),
	.INC(KBEND),
	.CL(KBTEST),
	.DOUT(KBTESTDELAY));


REG8_LD_SR	b2v_inst6(
	.CLK(CLK),
	.LD(L),
	.SR(KBSR),
	.IR(D[1]),
	
	
	.DOUT(SYNTHESIZED_WIRE_2));

assign	D[7] = KBDOUT ? SYNTHESIZED_WIRE_2[7] : 1'bz;
assign	D[6] = KBDOUT ? SYNTHESIZED_WIRE_2[6] : 1'bz;
assign	D[5] = KBDOUT ? SYNTHESIZED_WIRE_2[5] : 1'bz;
assign	D[4] = KBDOUT ? SYNTHESIZED_WIRE_2[4] : 1'bz;
assign	D[3] = KBDOUT ? SYNTHESIZED_WIRE_2[3] : 1'bz;
assign	D[2] = KBDOUT ? SYNTHESIZED_WIRE_2[2] : 1'bz;
assign	D[1] = KBDOUT ? SYNTHESIZED_WIRE_2[1] : 1'bz;
assign	D[0] = KBDOUT ? SYNTHESIZED_WIRE_2[0] : 1'bz;


CMP8	b2v_inst8(
	.A(KBTESTDELAY),
	.B(GDFX_TEMP_SIGNAL_1),
	
	.E(SYNTHESIZED_WIRE_0)
	);

assign	KBSR = ~(KBEND | OUT_ALTERA_SYNTHESIZED0);


always@(posedge CLK)
begin
	JKFF_inst90 <= ~JKFF_inst90 & H | JKFF_inst90 & ~KBRESET;
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

assign	OUT0 = OUT_ALTERA_SYNTHESIZED0;
assign	H = 1;
assign	L = 0;

endmodule
