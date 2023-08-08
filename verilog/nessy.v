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
// CREATED		"Tue Aug  8 16:04:53 2023"

module nessy(
	CLK,
	PS2_DATA,
	PS2_CLK,
	SDRAM_CKE,
	nSDRAM_CS,
	nSDRAM_RAS,
	nSDRAM_CAS,
	nSDRAM_WE,
	SDRAM_UDQM,
	SDRAM_LDQM,
	VGA_VS,
	VGA_HS,
	SDRAM_CLK,
	LED,
	SDRAM_A,
	SDRAM_BA,
	SDRAM_DQ,
	VGA_B,
	VGA_G,
	VGA_R
);


input wire	CLK;
input wire	PS2_DATA;
input wire	PS2_CLK;
output wire	SDRAM_CKE;
output wire	nSDRAM_CS;
output wire	nSDRAM_RAS;
output wire	nSDRAM_CAS;
output wire	nSDRAM_WE;
output wire	SDRAM_UDQM;
output wire	SDRAM_LDQM;
output wire	VGA_VS;
output wire	VGA_HS;
output wire	SDRAM_CLK;
output wire	[7:0] LED;
output wire	[11:0] SDRAM_A;
output wire	[1:0] SDRAM_BA;
inout wire	[15:0] SDRAM_DQ;
output wire	[3:0] VGA_B;
output wire	[3:0] VGA_G;
output wire	[3:0] VGA_R;

wire	[15:0] A;
wire	[7:0] D;
wire	GPU_nCS;
wire	H;
wire	L;
wire	nNMI;
wire	OUT0;
wire	RAM_nCS;
wire	RD;
wire	WR;
wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;
wire	[7:0] SYNTHESIZED_WIRE_3;


initial begin
    if ($test$plusargs("trace") != 0) begin
        $display("[%0t] Tracing to logs/vlt_dump.vcd...\n", $time);
        $dumpfile("logs/vlt_dump.vcd");
        $dumpvars();
    end
    $display("[%0t] Model running...\n", $time);
end


gpu	b2v_inst(
	.nCS(GPU_nCS),
	.RD(RD),
	.WR(WR),
	.CLK(CLK),
	.A(A[2:0]),
	.D(D),
	.SDRAM_DQ(SDRAM_DQ),
	.nNMI(nNMI),
	.SDRAM_CLK(SDRAM_CLK),
	.SDRAM_CKE(SDRAM_CKE),
	.nSDRAM_CS(nSDRAM_CS),
	.nSDRAM_RAS(nSDRAM_RAS),
	.nSDRAM_CAS(nSDRAM_CAS),
	.nSDRAM_WE(nSDRAM_WE),
	.SDRAM_UDQM(SDRAM_UDQM),
	.SDRAM_LDQM(SDRAM_LDQM),
	.VGA_VS(VGA_VS),
	.VGA_HS(VGA_HS),
	
	.SDRAM_A(SDRAM_A),
	.SDRAM_BA(SDRAM_BA),
	
	.VGA_B(VGA_B),
	.VGA_G(VGA_G),
	.VGA_R(VGA_R));


assign	GPU_nCS = A[14] | SYNTHESIZED_WIRE_0 | A[15];

assign	SYNTHESIZED_WIRE_0 =  ~A[13];



kb_controller	b2v_inst4(
	.PS2_CLK(PS2_CLK),
	.PS2_DATA(PS2_DATA),
	.CLK(CLK),
	.INTA(SYNTHESIZED_WIRE_1),
	.INTR(SYNTHESIZED_WIRE_2),
	.Q(SYNTHESIZED_WIRE_3));


kb_gamepad_bridge	b2v_inst5(
	.KBINTR(SYNTHESIZED_WIRE_2),
	.RD(RD),
	.CLK(CLK),
	.OUT0(OUT0),
	.ADDR(A),
	.KEY(SYNTHESIZED_WIRE_3),
	.KBINTA(SYNTHESIZED_WIRE_1),
	.DATA(D));



cpu	b2v_inst9(
	.CLK(CLK),
	.nNMI(nNMI),
	.D(D),
	.RD(RD),
	.WR(WR),
	.OUT0(OUT0),
	.A(A)
	);

assign	LED = D;
assign	H = 1;
assign	L = 0;

endmodule
