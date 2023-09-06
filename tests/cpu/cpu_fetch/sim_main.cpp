// For std::unique_ptr
#include <memory>
#include <cstdint>
// Include common routines
#include <verilated.h>

// Include model header, generated from Verilating "top.v"
#include "Vcpu_fetch.h"

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

    const std::unique_ptr<Vcpu_fetch> instance{new Vcpu_fetch{ctx.get(), "cpu"}};

	int instruction[6] = {
		0x40, //NA1 (RTI)
		0x0A, //A1 (ASL a)
		0x10, //NA2 (BPL)
		0x09, //A2 (ORA #immed)
		0x20, //NA3 (JSR)
		0x6C, //A3 (JMP (memind))
	};

    instance->CLK = 0;
	instance->START = 1;
	instance->FC = 0;
	instance->MDR = 0;
	int i = 0;
	int k = 1;
	int set = -1;
    // Simulate until $finish
    while (!ctx->gotFinish()) {
		if(instance->rdMEM == true)
		{
			if(k%2 == 0) 
			{
				instance->FC = true;
				instance->MDR = instruction[i/15];
				set = i;
			}
			k++;
		}
		//ugasi FC posle jednog takta
		if(set + 1 == i)
			instance->FC = false;

		if(i%15 == 0)
			instance->START = true;
		if(i%15 == 1)
			instance->START = false;

		instance->eval();
			
		//Rastuca ivica;
        ctx->timeInc(1);
		instance->CLK = !instance->CLK;
        instance->eval();
	
		//Padajuca Ivica;
        ctx->timeInc(1);
        instance->CLK = !instance->CLK;
        //instance->eval();

		//Sledeci korak;
		if (i == 90) break;
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
