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
// CREATED		"Wed Aug  9 16:26:28 2023"

module kb_controller(
	INTA,
	CLK,
	INTR,
	PS2_DATA,
	PS2_CLK,
	Q
);


input wire	INTA;
input wire	CLK;
output wire	INTR;
inout wire	PS2_DATA;
inout wire	PS2_CLK;
output wire	[7:0] Q;

reg	D0;
reg	D1;
reg	D2;
reg	D3;
reg	D4;
reg	D5;
reg	D6;
reg	D7;
wire	H;
wire	idle;
wire	KBCLK;
wire	L;
wire	LD;
reg	parity;
reg	[7:0] Q_ALTERA_SYNTHESIZED;
reg	tick0;
reg	tick1;
reg	tick2;
reg	tick3;
reg	tick4;
reg	tick5;
reg	tick6;
reg	tick7;
reg	tick8;
reg	tick9;
reg	VALID;
wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_4;
wire	SYNTHESIZED_WIRE_3;
reg	DFF_inst38;

assign	SYNTHESIZED_WIRE_4 = 0;




kb_debouncer	b2v_inst(
	
	.CLK(CLK),
	.Q(KBCLK));


always@(posedge KBCLK)
begin
	begin
	parity <= PS2_DATA;
	end
end


always@(posedge KBCLK)
begin
	begin
	tick0 <= SYNTHESIZED_WIRE_0;
	end
end


always@(posedge KBCLK)
begin
	begin
	tick1 <= tick0;
	end
end


always@(posedge KBCLK)
begin
	begin
	tick2 <= tick1;
	end
end


always@(posedge KBCLK)
begin
	begin
	tick3 <= tick2;
	end
end


always@(posedge KBCLK)
begin
	begin
	tick4 <= tick3;
	end
end


always@(posedge KBCLK)
begin
	begin
	tick5 <= tick4;
	end
end


always@(posedge KBCLK)
begin
	begin
	tick6 <= tick5;
	end
end


always@(posedge KBCLK)
begin
	begin
	tick7 <= tick6;
	end
end


always@(posedge KBCLK)
begin
	begin
	tick8 <= tick7;
	end
end


always@(posedge KBCLK)
begin
	begin
	D7 <= parity;
	end
end


always@(posedge KBCLK)
begin
	begin
	tick9 <= tick8;
	end
end


assign	SYNTHESIZED_WIRE_3 = ;


always@(posedge CLK)
begin
if (LD)
	begin
	Q_ALTERA_SYNTHESIZED[7] <= D7;
	end
end


RisingEdge	b2v_inst27(
	.D(tick9),
	.CLK(CLK),
	.Q(LD));


always@(posedge CLK)
begin
if (LD)
	begin
	Q_ALTERA_SYNTHESIZED[6] <= D6;
	end
end


always@(posedge CLK)
begin
if (LD)
	begin
	Q_ALTERA_SYNTHESIZED[5] <= D5;
	end
end


always@(posedge KBCLK)
begin
	begin
	D6 <= D7;
	end
end


always@(posedge CLK)
begin
if (LD)
	begin
	Q_ALTERA_SYNTHESIZED[4] <= D4;
	end
end


always@(posedge CLK)
begin
if (LD)
	begin
	Q_ALTERA_SYNTHESIZED[3] <= D3;
	end
end


always@(posedge CLK)
begin
if (LD)
	begin
	Q_ALTERA_SYNTHESIZED[2] <= D2;
	end
end


always@(posedge CLK)
begin
if (LD)
	begin
	Q_ALTERA_SYNTHESIZED[1] <= D1;
	end
end


always@(posedge CLK)
begin
if (LD)
	begin
	Q_ALTERA_SYNTHESIZED[0] <= D0;
	end
end


always@(posedge CLK)
begin
	VALID <= ~VALID & LD | VALID & ~INTA;
end

assign	idle = ~(tick9 | tick8 | tick7 | tick5 | tick6 | tick4 | tick2 | tick3 | tick1 | SYNTHESIZED_WIRE_4 | tick0 | SYNTHESIZED_WIRE_4);


always@(posedge KBCLK)
begin
	begin
	DFF_inst38 <= PS2_DATA;
	end
end


always@(posedge KBCLK)
begin
	begin
	D5 <= D6;
	end
end


always@(posedge KBCLK)
begin
	begin
	D4 <= D5;
	end
end


always@(posedge KBCLK)
begin
	begin
	D3 <= D4;
	end
end




always@(posedge KBCLK)
begin
	begin
	D2 <= D3;
	end
end

assign	SYNTHESIZED_WIRE_0 = SYNTHESIZED_WIRE_3 & DFF_inst38 & idle;


always@(posedge KBCLK)
begin
	begin
	D1 <= D2;
	end
end


always@(posedge KBCLK)
begin
	begin
	D0 <= D1;
	end
end

assign	INTR = VALID;
assign	Q = Q_ALTERA_SYNTHESIZED;
assign	H = 1;
assign	L = 0;

endmodule
