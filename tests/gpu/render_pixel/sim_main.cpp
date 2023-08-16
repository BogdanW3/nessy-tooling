// DESCRIPTION: Verilator: Verilog example module
//
// This file ONLY is placed under the Creative Commons Public Domain, for
// any use, without warranty, 2017 by Wilson Snyder.
// SPDX-License-Identifier: CC0-1.0
//======================================================================

// For std::unique_ptr
#include <memory>
#include <cstdint>
// Include common routines
#include <verilated.h>

// Include model header, generated from Verilating "top.v"
#include "Vrender_pixel.h"

// Legacy function required only so linking works on Cygwin and MSVC++
double sc_time_stamp() { return 0; }

int main(int argc, char** argv) {
    if(false && argc && argv) {}
	Verilated::mkdir("logs");
    const std::unique_ptr<VerilatedContext> ctx{new VerilatedContext};
    ctx->debug(0);
    ctx->randReset(0);
    ctx->traceEverOn(true);
    ctx->commandArgs(argc, argv);

    const std::unique_ptr<Vrender_pixel> instance{new Vrender_pixel{ctx.get(), "render_pixel"}};

	
    instance->CLK = 0;

	int i = 0;
    // Simulate until $finish
    while (!ctx->gotFinish()) {
		switch(i) {
			case 0:
				instance->DIN = 0b1000;
				instance->LD = true;
				instance->BG = false;
				break;
			case 1:
				instance->DIN = 0b1001;
				instance->LD = true;
				instance->BG = false;
				break;
			case 2:
				instance->DIN = 0b1010;
				instance->LD = false;
				instance->BG = false;
				break;
			case 3:
				instance->DIN = 0b1011;
				instance->LD = true;
				instance->BG = false;
				break;
			case 4:
				instance->DIN = 0b10101010;
				instance->LD = true;
				instance->BG = false;
				break;
			case 5:
				instance->DIN = 0b00000010;
				instance->LD = true;
				instance->BG = false;
				break;
			case 6:
				instance->DIN = 0b01010101;
				instance->LD = true;
				instance->BG = false;
				break;
			case 7:
				instance->DIN = 0b00000001;
				instance->LD = true;
				instance->BG = false;
				break;
			case 8:
				instance->LD = false;
				instance->BG = false;
				break;
			case 9:
				instance->LD = false;
				instance->BG = false;
				break;
			case 10:
				instance->LD = false;
				instance->BG = true;
				break;
			case 11: 
				instance->LD = false;
				instance->BG = false;
				break;
		}
		
		instance->eval();
			
		//Rastuca ivica;
        ctx->timeInc(1);
		instance->CLK = !instance->CLK;
        instance->eval();
	
		//Proveri rezultate
		switch(i) {
			case 0:
				if(instance->BR != false) VL_PRINTF("TEST FAILED: i=%d\n", i);
				break;	
			case 1:
				if(instance->BR != false) VL_PRINTF("TEST FAILED: i=%d\n", i);
				break;
			case 2:
				if(instance->BR != false) VL_PRINTF("TEST FAILED: i=%d\n", i);
				break;
			case 3:
				if(instance->BR != false) VL_PRINTF("TEST FAILED: i=%d\n", i);
				break;
			case 4:
				if(instance->BR != false) VL_PRINTF("TEST FAILED: i=%d\n", i);
				break;
			case 5:
				if(instance->BR != false) VL_PRINTF("TEST FAILED: i=%d\n", i);
				break;
			case 6:
				if(instance->BR != false) VL_PRINTF("TEST FAILED: i=%d\n", i);
				break;
			case 7:
				if(instance->BR != true) VL_PRINTF("TEST FAILED: i=%d\n", i);
				if(instance->DOUT != 0b10101010100101010101100010011011) VL_PRINTF("TEST FAILED: i=%d\n", i);
				break;
			case 8:
				if(instance->BR != true) VL_PRINTF("TEST FAILED: i=%d\n", i);
				if(instance->DOUT != 0b10101010100101010101100010011011) VL_PRINTF("TEST FAILED: i=%d\n", i);
				break;
			case 9:
				if(instance->BR != true) VL_PRINTF("TEST FAILED: i=%d\n", i);
				if(instance->DOUT != 0b10101010100101010101100010011011) VL_PRINTF("TEST FAILED: i=%d\n", i);
				break;
			case 10:
				if(instance->BR != false) VL_PRINTF("TEST FAILED: i=%d\n", i);
				break;
			case 11: 
				if(instance->BR != false) VL_PRINTF("TEST FAILED: i=%d\n", i);
				break;
		}

		//Padajuca Ivica;
        ctx->timeInc(1);
        instance->CLK = !instance->CLK;
        //instance->eval();

		//Sledeci korak;
		if (i == 11) break;
		i++;
    }


    // Final model cleanup
    instance->final();

    // Coverage analysis (calling write only after the test is known to pass)
#if VM_COVERAGE
    Verilated::mkdir("logs");
    ctx->coveragep()->write("logs/coverage.dat");
#endif

    // Return good completion status
    // Don't use exit() or destructor won't get called
    return 0;
}
