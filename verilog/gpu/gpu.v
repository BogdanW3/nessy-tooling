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
// CREATED		"Thu Aug 03 21:15:03 2023"

module gpu(
	CLK,
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
	SDRAM_A,
	SDRAM_BA,
	SDRAM_DQ,
	VGA_B,
	VGA_G,
	VGA_R
);


input wire	CLK;
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
output wire	[11:0] SDRAM_A;
output wire	[1:0] SDRAM_BA;
inout wire	[15:0] SDRAM_DQ;
output wire	[3:0] VGA_B;
output wire	[3:0] VGA_G;
output wire	[3:0] VGA_R;

wire	[3:0] B;
wire	DRAW;
wire	[3:0] G;
wire	H;
wire	L;
wire	[3:0] R;
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
wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_3;
wire	SYNTHESIZED_WIRE_4;
wire	SYNTHESIZED_WIRE_5;
wire	SYNTHESIZED_WIRE_6;
wire	SYNTHESIZED_WIRE_7;
wire	SYNTHESIZED_WIRE_8;

wire	[3:0] GDFX_TEMP_SIGNAL_0;
wire	[3:0] GDFX_TEMP_SIGNAL_1;
wire	[3:0] GDFX_TEMP_SIGNAL_2;


assign	GDFX_TEMP_SIGNAL_0 = {DRAW,DRAW,DRAW,DRAW};
assign	GDFX_TEMP_SIGNAL_1 = {DRAW,DRAW,DRAW,DRAW};
assign	GDFX_TEMP_SIGNAL_2 = {DRAW,DRAW,DRAW,DRAW};


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


CONSTX	b2v_inst1(
	.data(X_VIS));
	defparam	b2v_inst1.const = 800;
	defparam	b2v_inst1.size = 16;




CONSTX	b2v_inst12(
	.data(Y_BP));
	defparam	b2v_inst12.const = 665;
	defparam	b2v_inst12.size = 16;


CONSTX	b2v_inst2(
	.data(X_FP));
	defparam	b2v_inst2.const = 856;
	defparam	b2v_inst2.size = 16;


CONSTX	b2v_inst3(
	.data(X_SP));
	defparam	b2v_inst3.const = 976;
	defparam	b2v_inst3.size = 16;


CMPX	b2v_inst35(
	.A(X),
	.B(X_VIS),
	.ls(X_DRAW)
	
	);
	defparam	b2v_inst35.size = 16;


CMPX	b2v_inst354(
	.A(Y),
	.B(Y_VIS),
	.ls(Y_DRAW)
	
	);
	defparam	b2v_inst354.size = 16;


CMPX	b2v_inst36(
	.A(X),
	.B(X_FP),
	
	.eq(SYNTHESIZED_WIRE_0),
	.gr(SYNTHESIZED_WIRE_1));
	defparam	b2v_inst36.size = 16;

assign	SYNTHESIZED_WIRE_3 = SYNTHESIZED_WIRE_0 | SYNTHESIZED_WIRE_1;


CMPX	b2v_inst39(
	.A(X),
	.B(X_SP),
	.ls(SYNTHESIZED_WIRE_2)
	
	);
	defparam	b2v_inst39.size = 16;


CONSTX	b2v_inst4(
	.data(X_BP));
	defparam	b2v_inst4.const = 1039;
	defparam	b2v_inst4.size = 16;

assign	VGA_HS = SYNTHESIZED_WIRE_2 & SYNTHESIZED_WIRE_3;


CMPX	b2v_inst41(
	.A(X),
	.B(X_BP),
	
	.eq(X_END)
	);
	defparam	b2v_inst41.size = 16;


CMPX	b2v_inst43(
	.A(Y),
	.B(Y_FP),
	
	.eq(SYNTHESIZED_WIRE_4),
	.gr(SYNTHESIZED_WIRE_5));
	defparam	b2v_inst43.size = 16;

assign	SYNTHESIZED_WIRE_7 = SYNTHESIZED_WIRE_4 | SYNTHESIZED_WIRE_5;


CMPX	b2v_inst45(
	.A(Y),
	.B(Y_SP),
	.ls(SYNTHESIZED_WIRE_6)
	
	);
	defparam	b2v_inst45.size = 16;

assign	VGA_VS = SYNTHESIZED_WIRE_6 & SYNTHESIZED_WIRE_7;


CMPX	b2v_inst47(
	.A(Y),
	.B(Y_BP),
	
	.eq(Y_END)
	);
	defparam	b2v_inst47.size = 16;

assign	DRAW = X_DRAW & Y_DRAW;


CONSTX	b2v_inst5(
	.data(Y_VIS));
	defparam	b2v_inst5.const = 600;
	defparam	b2v_inst5.size = 16;

assign	VGA_R = R & GDFX_TEMP_SIGNAL_0;

assign	VGA_G = G & GDFX_TEMP_SIGNAL_1;

assign	VGA_B = B & GDFX_TEMP_SIGNAL_2;

assign	SYNTHESIZED_WIRE_8 = X_END & Y_END;






REG16_INC_CL	b2v_inst6(
	.CLK(CLK),
	.INC(H),
	.CL(X_END),
	.DOUT(X));


REG16_INC_CL	b2v_inst7(
	.CLK(CLK),
	.INC(X_END),
	.CL(SYNTHESIZED_WIRE_8),
	.DOUT(Y));


CONSTX	b2v_inst8(
	.data(Y_FP));
	defparam	b2v_inst8.const = 637;
	defparam	b2v_inst8.size = 16;


CONSTX	b2v_inst9(
	.data(Y_SP));
	defparam	b2v_inst9.const = 643;
	defparam	b2v_inst9.size = 16;

assign	B = 4'b0000;
assign	G = 4'b0000;
assign	H = 1;
assign	L = 0;
assign	R = 4'b0000;

endmodule
