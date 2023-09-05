// For std::unique_ptr
#include <memory>
#include <cstdint>
// Include common routines
#include <verilated.h>

// Include model header, generated from Verilating "top.v"
#include "Vcpu.h"

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

    const std::unique_ptr<Vcpu> instance{new Vcpu{ctx.get(), "cpu"}};

    instance->CLK = 0;
	instance->nNMI = 1;
	instance->DIN = 0;
	instance->FC = 0;

	int i = 0;
    // Simulate until $finish
    while (!ctx->gotFinish()) {
		switch(i) {
			case 0:
				//POWERON [T0]
				break;
			case 1:
				//POWERON [T1]
				break;
			case 2:
				//POWERON [T1]
				instance->FC = true;
				instance->DIN = 0x00;
				break;
			case 3:
				//POWERON [T2]
				instance->FC = false;
				break;
			case 4: 
				//POWERON [T3]
				break;
			case 5:
				//POWERON [T3]
				instance->FC = true;
				instance->DIN = 0x80;
				break;
			case 6:
				//POWERON [T4]
				instance->FC = false;
				break;
			case 7:
				//FETCH [T0]
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
				//POWERON [T1]
				if(instance->RD != true)
					VL_PRINTF("[%d] FAIL: Expected R: 1, got R: %u\n", i, instance->RD);
				if(instance->WR != false)
					VL_PRINTF("[%d] FAIL: Expected WR: 0, got WR: %u\n", i, instance->WR);
				if(instance->A != 0xFFFC)
					VL_PRINTF("[%d] FAIL: Expected A: 0xFFFC, got A: %04x\n", i, instance->A);
				break;
			case 1:
				//POWERON [T1]
				if(instance->RD != true)
					VL_PRINTF("[%d] FAIL: Expected R: 1, got R: %u\n", i, instance->RD);
				if(instance->WR != false)
					VL_PRINTF("[%d] FAIL: Expected WR: 0, got WR: %u\n", i, instance->WR);
				if(instance->A != 0xFFFC)
					VL_PRINTF("[%d] FAIL: Expected A: 0xFFFC, got A: %04x\n", i, instance->A);
				break;
			case 2:
				//POWERON [T2]
				if(instance->RD != false)
					VL_PRINTF("[%d] FAIL: Expected R: 0, got R: %u\n", i, instance->RD);
				if(instance->WR != false)
					VL_PRINTF("[%d] FAIL: Expected WR: 0, got WR: %u\n", i, instance->WR);
				break;
			case 3: 
				//POWERON [T3]
				if(instance->RD != true)
					VL_PRINTF("[%d] FAIL: Expected R: 1, got R: %u\n", i, instance->RD);
				if(instance->WR != false)
					VL_PRINTF("[%d] FAIL: Expected WR: 0, got WR: %u\n", i, instance->WR);
				if(instance->A != 0xFFFD)
					VL_PRINTF("[%d] FAIL: Expected A: 0xFFFD, got A: %04x\n", i, instance->A);
				break;
			case 4:
				//POWERON [T3]
				if(instance->RD != true)
					VL_PRINTF("[%d] FAIL: Expected R: 1, got R: %u\n", i, instance->RD);
				if(instance->WR != false)
					VL_PRINTF("[%d] FAIL: Expected WR: 0, got WR: %u\n", i, instance->WR);
				if(instance->A != 0xFFFD)
					VL_PRINTF("[%d] FAIL: Expected A: 0xFFFD, got A: %04x\n", i, instance->A);
				break;
			case 5:
				//POWERON [T4]
				if(instance->RD != false)
					VL_PRINTF("[%d] FAIL: Expected R: 0, got R: %u\n", i, instance->RD);
				if(instance->WR != false)
					VL_PRINTF("[%d] FAIL: Expected WR: 0, got WR: %u\n", i, instance->WR);
				break;
			case 6:
				//FETCH [T0]
				break;
			case 7:
				//FETVH [T0]
				break;
				
		}	

		//Padajuca Ivica;
        ctx->timeInc(1);
        instance->CLK = !instance->CLK;
        //instance->eval();

		//Sledeci korak;
		if (i == 10) break;
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
