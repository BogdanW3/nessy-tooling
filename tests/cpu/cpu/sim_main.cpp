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

	uint8_t instruction[8] = {
		//LDY #00
		0xA0,
		0x00,
		//LDX #AA
		0xA2,
		0xAA,
		//LDA #BB
		0xA9,
		0xBB,
		//TAX
		0xAA,
		//TXS
		0x9A
	};


    instance->CLK = 0;
	instance->nNMI = 1;
	instance->DIN = 0;
	instance->FC = 0;

	int i = 0;
	int mem_delay = 1;
	int instr_cnt = 0;
	int set = -1;
    // Simulate until $finish
    while (!ctx->gotFinish()) {
		
		if(instance->RD == true)
		{
			if(mem_delay%3 == 0)
			{
				instance->FC = true;
				instance->DIN = instruction[instr_cnt++];
				set = i;
			}
			mem_delay++;
		}

		if(set + 1 == i)
			instance->FC = false;


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
		if (instr_cnt == 9 || i == 240) break;
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
