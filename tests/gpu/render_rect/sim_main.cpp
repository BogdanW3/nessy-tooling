// For std::unique_ptr
#include <memory>
#include <cstdint>
// Include common routines
#include <verilated.h>

// Include model header, generated from Verilating "top.v"
#include "Vrender_rect.h"

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

    const std::unique_ptr<Vrender_rect> instance{new Vrender_rect{ctx.get(), "render_pixel"}};

    instance->CLK = 0;

	int i = 0;
    // Simulate until $finish
    while (!ctx->gotFinish()) {
		switch(i) {
			case 0:
				//Load RED
				instance->DIN = 0b1000;
				instance->LD = true;
				instance->BG = false;
				break;
			case 1:
				//Load GREEN
				instance->DIN = 0b1001;
				instance->LD = true;
				instance->BG = false;
				break;
			case 2:
				//NOOP
				instance->DIN = 0b1010;
				instance->LD = false;
				instance->BG = false;
				break;
			case 3:
				//Load BLUE
				instance->DIN = 0b1011;
				instance->LD = true;
				instance->BG = false;
				break;
			case 4:
				//Load X_START low bits
				instance->DIN = 0b10101010;
				instance->LD = true;
				instance->BG = false;
				break;
			case 5:
				//Load X_START high bits
				instance->DIN = 0b00000010;
				instance->LD = true;
				instance->BG = false;
				break;
			case 6:
				//Load Y_START low bits
				instance->DIN = 0b01010101;
				instance->LD = true;
				instance->BG = false;
				break;
			case 7:
				//Load Y_START high bits
				instance->DIN = 0b00000001;
				instance->LD = true;
				instance->BG = false;
				break;
			case 8:
				//Load X_END low bits
				instance->DIN = 0b10101101;
				instance->LD = true;
				instance->BG = false;
				break;
			case 9:
				//Load X_END high bits
				instance->DIN = 0b00000010;
				instance->LD = true;
				instance->BG = false;
				break;
			case 10:
				//Load Y_END low bits
				instance->DIN = 0b01010111;
				instance->LD = true;
				instance->BG = false;
				break;
			case 11:
				//Load Y_END high bits
				instance->DIN = 0b00000001;
				instance->LD = true;
				instance->BG = false;
				break;
			case 12:
				instance->LD = false;
				instance->BG = true;
				break;
			case 13:
				instance->LD = false;
				instance->BG = false;
				break;
			case 14:
				instance->LD = false;
				instance->BG = true;
				break;
			case 15:
				instance->LD = false;
				instance->BG = false;
				break;
			case 16:
				instance->LD = false;
				instance->BG = true;
				break;
			case 17:
				instance->LD = false;
				instance->BG = false;
				break;
			case 18:
				instance->LD = false;
				instance->BG = true;
				break;
			case 19:
				instance->LD = false;
				instance->BG = false;
				break;
			case 20:
				instance->LD = false;
				instance->BG = true;
				break;
			case 21:
				instance->LD = false;
				instance->BG = false;
				break;
			case 22:
				instance->LD = false;
				instance->BG = true;
				break;
			case 23:
				instance->LD = false;
				instance->BG = false;
				break;
			case 24:
				instance->LD = false;
				instance->BG = true;
				break;
			case 25:
				instance->LD = false;
				instance->BG = false;
				break;
			case 26:
				instance->LD = false;
				instance->BG = true;
				break;
			case 27:
				instance->LD = false;
				instance->BG = false;
				break;
			case 28:
				instance->LD = false;
				instance->BG = true;
				break;
			case 29:
				instance->LD = false;
				instance->BG = false;
				break;
			case 30:
				instance->LD = false;
				instance->BG = true;
				break;
			case 31:
				instance->LD = false;
				instance->BG = false;
				break;
			case 32:
				instance->LD = false;
				instance->BG = true;
				break;
			case 33:
				instance->LD = false;
				instance->BG = false;
				break;
			case 34:
				instance->LD = false;
				instance->BG = true;
				break;
			case 35:
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
				if(instance->BR != false) VL_PRINTF("TEST FAILED: i=%d\n", i);
				break;
			case 8:
				if(instance->BR != false) VL_PRINTF("TEST FAILED: i=%d\n", i);
				break;
			case 9:
				if(instance->BR != false) VL_PRINTF("TEST FAILED: i=%d\n", i);
				break;
			case 10:
				if(instance->BR != false) VL_PRINTF("TEST FAILED: i=%d\n", i);
				break;
			case 11: 
				if(instance->BR != true) VL_PRINTF("TEST FAILED: i=%d\n", i);
				if(instance->DOUT != 0b1010101010'0101010101'1000'1001'1011) VL_PRINTF("TEST FAILED: i=%d\n", i);
				break;
			case 12: 
				if(instance->BR != true) VL_PRINTF("TEST FAILED: i=%d\n", i);
				if(instance->DOUT != 0b1010101011'0101010101'1000'1001'1011) VL_PRINTF("TEST FAILED: i=%d\n", i);
				break;
			case 13: 
				if(instance->BR != true) VL_PRINTF("TEST FAILED: i=%d\n", i);
				if(instance->DOUT != 0b1010101011'0101010101'1000'1001'1011) VL_PRINTF("TEST FAILED: i=%d\n", i);
				break;	
			case 14: 
				if(instance->BR != true) VL_PRINTF("TEST FAILED: i=%d\n", i);
				if(instance->DOUT != 0b1010101100'0101010101'1000'1001'1011) VL_PRINTF("TEST FAILED: i=%d\n", i);
				break;
			case 15: 
				if(instance->BR != true) VL_PRINTF("TEST FAILED: i=%d\n", i);
				if(instance->DOUT != 0b1010101100'0101010101'1000'1001'1011) VL_PRINTF("TEST FAILED: i=%d\n", i);
				break;
			case 16: 
				if(instance->BR != true) VL_PRINTF("TEST FAILED: i=%d\n", i);
				if(instance->DOUT != 0b1010101101'0101010101'1000'1001'1011) VL_PRINTF("TEST FAILED: i=%d\n", i);
				break;
			case 17: 
				if(instance->BR != true) VL_PRINTF("TEST FAILED: i=%d\n", i);
				if(instance->DOUT != 0b1010101101'0101010101'1000'1001'1011) VL_PRINTF("TEST FAILED: i=%d\n", i);
				break;
			case 18: 
				if(instance->BR != true) VL_PRINTF("TEST FAILED: i=%d\n", i);
				if(instance->DOUT != 0b1010101010'0101010110'1000'1001'1011) VL_PRINTF("TEST FAILED: i=%d\n", i);
				break;
			case 19: 
				if(instance->BR != true) VL_PRINTF("TEST FAILED: i=%d\n", i);
				if(instance->DOUT != 0b1010101010'0101010110'1000'1001'1011) VL_PRINTF("TEST FAILED: i=%d\n", i);
				break;
			case 20: 
				if(instance->BR != true) VL_PRINTF("TEST FAILED: i=%d\n", i);
				if(instance->DOUT != 0b1010101011'0101010110'1000'1001'1011) VL_PRINTF("TEST FAILED: i=%d\n", i);
				break;
			case 21: 
				if(instance->BR != true) VL_PRINTF("TEST FAILED: i=%d\n", i);
				if(instance->DOUT != 0b1010101011'0101010110'1000'1001'1011) VL_PRINTF("TEST FAILED: i=%d\n", i);
				break;
			case 22: 
				if(instance->BR != true) VL_PRINTF("TEST FAILED: i=%d\n", i);
				if(instance->DOUT != 0b1010101100'0101010110'1000'1001'1011) VL_PRINTF("TEST FAILED: i=%d\n", i);
				break;
			case 23: 
				if(instance->BR != true) VL_PRINTF("TEST FAILED: i=%d\n", i);
				if(instance->DOUT != 0b1010101100'0101010110'1000'1001'1011) VL_PRINTF("TEST FAILED: i=%d\n", i);
				break;
			case 24: 
				if(instance->BR != true) VL_PRINTF("TEST FAILED: i=%d\n", i);
				if(instance->DOUT != 0b1010101101'0101010110'1000'1001'1011) VL_PRINTF("TEST FAILED: i=%d\n", i);
				break;
			case 25: 
				if(instance->BR != true) VL_PRINTF("TEST FAILED: i=%d\n", i);
				if(instance->DOUT != 0b1010101101'0101010110'1000'1001'1011) VL_PRINTF("TEST FAILED: i=%d\n", i);
				break;
			case 26: 
				if(instance->BR != true) VL_PRINTF("TEST FAILED: i=%d\n", i);
				if(instance->DOUT != 0b1010101010'0101010111'1000'1001'1011) VL_PRINTF("TEST FAILED: i=%d\n", i);
				break;
			case 27: 
				if(instance->BR != true) VL_PRINTF("TEST FAILED: i=%d\n", i);
				if(instance->DOUT != 0b1010101010'0101010111'1000'1001'1011) VL_PRINTF("TEST FAILED: i=%d\n", i);
				break;
			case 28: 
				if(instance->BR != true) VL_PRINTF("TEST FAILED: i=%d\n", i);
				if(instance->DOUT != 0b1010101011'0101010111'1000'1001'1011) VL_PRINTF("TEST FAILED: i=%d\n", i);
				break;
			case 29: 
				if(instance->BR != true) VL_PRINTF("TEST FAILED: i=%d\n", i);
				if(instance->DOUT != 0b1010101011'0101010111'1000'1001'1011) VL_PRINTF("TEST FAILED: i=%d\n", i);
				break;
			case 30: 
				if(instance->BR != true) VL_PRINTF("TEST FAILED: i=%d\n", i);
				if(instance->DOUT != 0b1010101100'0101010111'1000'1001'1011) VL_PRINTF("TEST FAILED: i=%d\n", i);
				break;
			case 31: 
				if(instance->BR != true) VL_PRINTF("TEST FAILED: i=%d\n", i);
				if(instance->DOUT != 0b1010101100'0101010111'1000'1001'1011) VL_PRINTF("TEST FAILED: i=%d\n", i);
				break;
			case 32: 
				if(instance->BR != true) VL_PRINTF("TEST FAILED: i=%d\n", i);
				if(instance->DOUT != 0b1010101101'0101010111'1000'1001'1011) VL_PRINTF("TEST FAILED: i=%d\n", i);
				break;
			case 33: 
				if(instance->BR != true) VL_PRINTF("TEST FAILED: i=%d\n", i);
				if(instance->DOUT != 0b1010101101'0101010111'1000'1001'1011) VL_PRINTF("TEST FAILED: i=%d\n", i);
				break;
			case 34: 
				if(instance->BR != false) VL_PRINTF("TEST FAILED: i=%d\n", i);
				break;
			case 35: 
				if(instance->BR != false) VL_PRINTF("TEST FAILED: i=%d\n", i);
				break;

		}	

		//Padajuca Ivica;
        ctx->timeInc(1);
        instance->CLK = !instance->CLK;
        //instance->eval();

		//Sledeci korak;
		if (i == 50) break;
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
