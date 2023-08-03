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
// CREATED		"Fri Aug  4 00:10:40 2023"

module gpu(
	CLK,
	nCS,
	A,
	SDRAM_CLK,
	SDRAM_CKE,
	nSDRAM_CS,
	nSDRAM_RAS,
	nSDRAM_CAS,
	nSDRAM_WE,
	SDRAM_UDQM,
	SDRAM_LDQM,
	VGA_VS,
	VGA_HS,
	nNMI,
	D,
	SDRAM_A,
	SDRAM_BA,
	SDRAM_DQ,
	VGA_B,
	VGA_G,
	VGA_R
);


input wire	CLK;
input wire	nCS;
input wire	[2:0] A;
output wire	SDRAM_CLK;
output wire	SDRAM_CKE;
output wire	nSDRAM_CS;
output wire	nSDRAM_RAS;
output wire	nSDRAM_CAS;
output wire	nSDRAM_WE;
output wire	SDRAM_UDQM;
output wire	SDRAM_LDQM;
output wire	VGA_VS;
output wire	VGA_HS;
output wire	nNMI;
inout wire	[7:0] D;
output wire	[11:0] SDRAM_A;
output wire	[1:0] SDRAM_BA;
inout wire	[15:0] SDRAM_DQ;
output wire	[3:0] VGA_B;
output wire	[3:0] VGA_G;
output wire	[3:0] VGA_R;

wire	A_STATUSREG;
wire	[3:0] B;
wire	DRAW;
wire	[3:0] G;
wire	H;
wire	L;
wire	noX;
wire	[3:0] R;
wire	VBLANK_START;
wire	[19:0] VRAM_A;
wire	[15:0] VRAM_D;
wire	VRAM_READ;
wire	VRAM_START;
wire	VRAM_WRITE;
wire	WRITE;
wire	[15:0] X;
wire	[15:0] X_BP;
wire	X_DRAW;
wire	X_END;
wire	[15:0] X_FP;
wire	[15:0] X_SP;
wire	[15:0] X_VIS;
wire	[15:0] Y;
wire	[15:0] Y_BP;
wire	Y_DRAW;
wire	Y_END;
wire	[15:0] Y_FP;
wire	[15:0] Y_SP;
wire	[15:0] Y_VIS;
reg	SRFF_NMI_occured;
reg	DFFE_NMI_output;
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
wire	SYNTHESIZED_WIRE_12;

wire	[7:0] GDFX_TEMP_SIGNAL_11;
wire	[15:0] GDFX_TEMP_SIGNAL_7;
wire	[15:0] GDFX_TEMP_SIGNAL_6;
wire	[15:0] GDFX_TEMP_SIGNAL_5;
wire	[15:0] GDFX_TEMP_SIGNAL_4;
wire	[15:0] GDFX_TEMP_SIGNAL_3;
wire	[15:0] GDFX_TEMP_SIGNAL_2;
wire	[15:0] GDFX_TEMP_SIGNAL_1;
wire	[15:0] GDFX_TEMP_SIGNAL_0;
wire	[3:0] GDFX_TEMP_SIGNAL_8;
wire	[3:0] GDFX_TEMP_SIGNAL_9;
wire	[3:0] GDFX_TEMP_SIGNAL_10;


assign	GDFX_TEMP_SIGNAL_11 = {L,L,L,L,L,L,L,L};
assign	GDFX_TEMP_SIGNAL_7 = {L,L,L,L,L,L,H,L,H,L,L,H,H,L,L,H};
assign	GDFX_TEMP_SIGNAL_6 = {L,L,L,L,L,L,H,L,H,L,L,L,L,L,H,H};
assign	GDFX_TEMP_SIGNAL_5 = {L,L,L,L,L,L,H,L,L,H,H,H,H,H,L,H};
assign	GDFX_TEMP_SIGNAL_4 = {L,L,L,L,L,L,H,L,L,H,L,H,H,L,L,L};
assign	GDFX_TEMP_SIGNAL_3 = {L,L,L,L,L,H,L,L,L,L,L,L,H,H,H,H};
assign	GDFX_TEMP_SIGNAL_2 = {L,L,L,L,L,L,H,H,H,H,L,H,L,L,L,L};
assign	GDFX_TEMP_SIGNAL_1 = {L,L,L,L,L,L,H,H,L,H,L,H,H,L,L,L};
assign	GDFX_TEMP_SIGNAL_0 = {L,L,L,L,L,L,H,H,L,L,H,L,L,L,L,L};
assign	GDFX_TEMP_SIGNAL_8 = {DRAW,DRAW,DRAW,DRAW};
assign	GDFX_TEMP_SIGNAL_9 = {DRAW,DRAW,DRAW,DRAW};
assign	GDFX_TEMP_SIGNAL_10 = {DRAW,DRAW,DRAW,DRAW};

assign	X_VIS = GDFX_TEMP_SIGNAL_0;


assign	X_FP = GDFX_TEMP_SIGNAL_1;


assign	X_SP = GDFX_TEMP_SIGNAL_2;


assign	X_BP = GDFX_TEMP_SIGNAL_3;


assign	Y_VIS = GDFX_TEMP_SIGNAL_4;


assign	Y_FP = GDFX_TEMP_SIGNAL_5;


assign	Y_SP = GDFX_TEMP_SIGNAL_6;


assign	Y_BP = GDFX_TEMP_SIGNAL_7;



vram_controller	b2v_inst(
	.CLK(CLK),
	.start(VRAM_START),
	.read_scanline(VRAM_READ),
	.write_pixel(VRAM_WRITE),
	.A(VRAM_A),
	.D(VRAM_D),
	.SDRAM_DQ(SDRAM_DQ),
	.SDRAM_CLK(SDRAM_CLK),
	.SDRAM_CKE(SDRAM_CKE),
	.nSDRAM_CS(nSDRAM_CS),
	.nSDRAM_RAS(nSDRAM_RAS),
	.nSDRAM_CAS(nSDRAM_CAS),
	.nSDRAM_WE(nSDRAM_WE),
	.SDRAM_UDQM(SDRAM_UDQM),
	.SDRAM_LDQM(SDRAM_LDQM),
	.SDRAM_A(SDRAM_A),
	.SDRAM_BA(SDRAM_BA)
	);



assign	nNMI = SRFF_NMI_occured & DFFE_NMI_output;


CMP16	b2v_inst14(
	.A(X),
	.B(X_BP),
	
	.E(X_END)
	);


CMP16	b2v_inst15(
	.A(Y),
	.B(Y_BP),
	
	.E(Y_END)
	);


CMP16	b2v_inst16(
	.A(X),
	.B(X_VIS),
	
	
	.L(X_DRAW));

assign	SYNTHESIZED_WIRE_11 = noX & VBLANK_START;

assign	SYNTHESIZED_WIRE_12 = noX & Y_END;

assign	SYNTHESIZED_WIRE_0 = ~(X[0] | X[2] | X[1] | X[3] | X[5] | X[4] | X[6] | X[7]);

assign	SYNTHESIZED_WIRE_1 = ~(X[8] | X[10] | X[9] | X[11] | X[13] | X[12] | X[14] | X[15]);

assign	noX = SYNTHESIZED_WIRE_0 & SYNTHESIZED_WIRE_1;


CMP16	b2v_inst22(
	.A(Y),
	.B(Y_VIS),
	
	.E(VBLANK_START),
	.L(Y_DRAW));


CMP16	b2v_inst23(
	.A(X),
	.B(X_FP),
	.G(SYNTHESIZED_WIRE_3),
	.E(SYNTHESIZED_WIRE_2)
	);


CMP16	b2v_inst24(
	.A(Y),
	.B(Y_FP),
	.G(SYNTHESIZED_WIRE_7),
	.E(SYNTHESIZED_WIRE_6)
	);


CMP16	b2v_inst25(
	.A(X),
	.B(X_SP),
	
	
	.L(SYNTHESIZED_WIRE_4));


CMP16	b2v_inst26(
	.A(Y),
	.B(Y_SP),
	
	
	.L(SYNTHESIZED_WIRE_8));

assign	SYNTHESIZED_WIRE_5 = SYNTHESIZED_WIRE_2 | SYNTHESIZED_WIRE_3;

assign	VGA_HS = SYNTHESIZED_WIRE_4 & SYNTHESIZED_WIRE_5;

assign	SYNTHESIZED_WIRE_9 = SYNTHESIZED_WIRE_6 | SYNTHESIZED_WIRE_7;

assign	VGA_VS = SYNTHESIZED_WIRE_8 & SYNTHESIZED_WIRE_9;

assign	DRAW = X_DRAW & Y_DRAW;

assign	VGA_R = R & GDFX_TEMP_SIGNAL_8;

assign	VGA_G = G & GDFX_TEMP_SIGNAL_9;

assign	VGA_B = B & GDFX_TEMP_SIGNAL_10;

assign	SYNTHESIZED_WIRE_10 = X_END & Y_END;






REG16_INC_CL	b2v_inst6(
	.CLK(CLK),
	.INC(H),
	.CL(X_END),
	.DOUT(X));

assign	A_STATUSREG = ~(nCS | A[1] | A[2] | A[0]);


REG16_INC_CL	b2v_inst7(
	.CLK(CLK),
	.INC(X_END),
	.CL(SYNTHESIZED_WIRE_10),
	.DOUT(Y));

assign	D[7] = L ? GDFX_TEMP_SIGNAL_11[7] : 1'bz;
assign	D[6] = L ? GDFX_TEMP_SIGNAL_11[6] : 1'bz;
assign	D[5] = L ? GDFX_TEMP_SIGNAL_11[5] : 1'bz;
assign	D[4] = L ? GDFX_TEMP_SIGNAL_11[4] : 1'bz;
assign	D[3] = L ? GDFX_TEMP_SIGNAL_11[3] : 1'bz;
assign	D[2] = L ? GDFX_TEMP_SIGNAL_11[2] : 1'bz;
assign	D[1] = L ? GDFX_TEMP_SIGNAL_11[1] : 1'bz;
assign	D[0] = L ? GDFX_TEMP_SIGNAL_11[0] : 1'bz;


always@(posedge CLK)
begin
	SRFF_NMI_occured <= ~SRFF_NMI_occured & SYNTHESIZED_WIRE_11 | SRFF_NMI_occured & ~SYNTHESIZED_WIRE_12;
end


always@(posedge CLK)
begin
if (A_STATUSREG)
	begin
	DFFE_NMI_output <= D[7];
	end
end

assign	B = 4'b0000;
assign	G = 4'b0000;
assign	H = 1;
assign	L = 0;
assign	R = 4'b0000;

endmodule
