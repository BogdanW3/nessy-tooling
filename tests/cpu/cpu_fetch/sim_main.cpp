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

    instance->CLK = 0;
	instance->START = 1;
	instance->FC = 0;
	instance->MDR = 0;
	int i = 0;
    // Simulate until $finish
    while (!ctx->gotFinish()) {
		switch(i) {
			//INSTRERROR (ISC a,x):
			case 0:
				//FETCH [SETUP]
				instance->START = true;
				break;
			case 1:
				//FETCH [T0]
				instance->START = false;
				break;
			case 2:
				//FETCH [T1]
				break;
			case 3:
				//FETCH [T1]
				instance->FC = true;
				instance->MDR = 0x1A;
				break;
			case 4:
				//FETCH [T2]
				instance->FC = false;
				break;
			case 5:
				//FETCH [T3]
				//takt pauze (da se EN resetuje);
				break;
			//ADDRERROR (NOP)
			case 6: 
				instance->START = true;
				break;
			case 7:
				//FETCH [T0]
				instance->START = false;
				break;
			case 8:
				//FETCH [T1]
				break;
			case 9:
				//FETCH [T1]
				instance->FC = true;
				instance->MDR = 0x1A;
				break;
			case 10:
				//FETCH [T2]
				instance->FC = false;
				break;
			case 11: 
				//FETCH [T3]
				//takt pauze (da se EN resetuje);
				break;
			//NA1 (RTI)
			case 12:
				//FETCH [SETUP]
				instance->START = true;
				break;
			case 13:
				//FETCH [T0]
				instance->START = false;
				break;
			case 14:
				//FETCH [T1]
				break;
			case 15:
				//FETCH [T1]
				instance->FC = true;
				instance->MDR = 0x40;
				break;
			case 16:
				//FETCH [T2]
				instance->FC = false;
				break;
			case 17:
				//FETCH [T3]
				break;
			case 18:
				//FETCH [T4]
				break;
			//A1 (ASL_ACC)
			case 19:
				//FETCH [SETUP]
				instance->START = true;
				break;
			case 20:
				//FETCH [T0]
				instance->START = false;
				break;
			case 21:
				//FETCH [T1]
				break;
			case 22:
				//FETCH [T1]
				instance->FC = true;
				instance->MDR = 0x0A;
				break;
			case 23:
				//FETCH [T2]
				instance->FC = false;
				break;
			case 24:
				//FETCH [T3]
				//takt pauze (da se EN resetuje);
				break;
			case 25:
				break;
			
		}
		
		instance->eval();
			
		//Rastuca ivica;
        ctx->timeInc(1);
		instance->CLK = !instance->CLK;
        instance->eval();
	
		//Proveri rezultate
		switch(i) {
			//INSTRERROR (ISC a,x)
			case 0: 
				//FETCH [T0]
				if(instance->ldMAR != true)
					VL_PRINTF("[%d] FAIL: Expected ldMAR: 1, got ldMAR: %u\n", i, instance->ldMAR);
				if(instance->mxMAR0 != true)
					VL_PRINTF("[%d] FAIL: Expected mxMAR0: 1, got mxMAR: %u\n", i, instance->mxMAR0);
				break;
			case 1: 
				//FETCH [T1]
				if(instance->rdMEM != true)
					VL_PRINTF("[%d] FAIL: Expected rdMEM: 1, got rdMEM: %u\n", i, instance->rdMEM);
				break;
			case 2:
				//FETCH [T1]
				if(instance->rdMEM != true)
					VL_PRINTF("[%d] FAIL: Expected rdMEM: 1, got rdMEM: %u\n", i, instance->rdMEM);
				break;
			case 3:
				//FETCH [T2]
				break;
			case 4:
				//FETCH [T3]
				if(instance->IR0_ != 0x92)
					VL_PRINTF("[%d] FAIL: Expected IR0_: 0x92, got IR0_: %02x\n", i, instance->IR0_);
				if(instance->START_INTR != true)
					VL_PRINTF("[%d] FAIL: Expected START_INTR: 1, got START_INTR: %u\n", i, instance->START_INTR);
				break;
			//ADDRERROR (STA #immed)
			case 5: 
				//Takt pauze (da se CNT resetuje):
				break;
			case 6: 
				//FETCH [T0]
				if(instance->ldMAR != true)
					VL_PRINTF("[%d] FAIL: Expected ldMAR: 1, got ldMAR: %u\n", i, instance->ldMAR);
				if(instance->mxMAR0 != true)
					VL_PRINTF("[%d] FAIL: Expected mxMAR0: 1, got mxMAR: %u\n", i, instance->mxMAR0);
				break;
			case 7: 
				//FETCH [T1]
				if(instance->rdMEM != true)
					VL_PRINTF("[%d] FAIL: Expected rdMEM: 1, got rdMEM: %u\n", i, instance->rdMEM);
				break;
			case 8:
				//FETCH [T1]
				if(instance->rdMEM != true)
					VL_PRINTF("[%d] FAIL: Expected rdMEM: 1, got rdMEM: %u\n", i, instance->rdMEM);
				break;
			case 9:
				//FETCH [T2]
				break;
			case 10:
				//FETCH [T3]
				if(instance->IR0_ != 0x1a)
					VL_PRINTF("[%d] FAIL: Expected IR0_: 0x1a, got IR0_: %02x\n", i, instance->IR0_);
				if(instance->START_INTR != true)
					VL_PRINTF("[%d] FAIL: Expected START_INTR: 1, got START_INTR: %u\n", i, instance->START_INTR);
				break;
			//NA1 [RTI]
			case 11:
				//FETCH [SETUP]
				break;
			case 12: 
				//FETCH [T0]
				if(instance->ldMAR != true)
					VL_PRINTF("[%d] FAIL: Expected ldMAR: 1, got ldMAR: %u\n", i, instance->ldMAR);
				if(instance->mxMAR0 != true)
					VL_PRINTF("[%d] FAIL: Expected mxMAR0: 1, got mxMAR: %u\n", i, instance->mxMAR0);
				break;
			case 13: 
				//FETCH [T1]
				if(instance->rdMEM != true)
					VL_PRINTF("[%d] FAIL: Expected rdMEM: 1, got rdMEM: %u\n", i, instance->rdMEM);
				break;
			case 14:
				//FETCH [T1]
				if(instance->rdMEM != true)
					VL_PRINTF("[%d] FAIL: Expected rdMEM: 1, got rdMEM: %u\n", i, instance->rdMEM);
				break;
			case 15:
				//FETCH [T2]
				break;
			case 16:
				//FETCH [T3]
				if(instance->IR0_ != 0x40)
					VL_PRINTF("[%d] FAIL: Expected IR0_: 0x40, got IR0_: %02x\n", i, instance->IR0_);
				if(instance->START_INTR != false)
					VL_PRINTF("[%d] FAIL: Expected START_INTR: 0, got START_INTR: %u\n", i, instance->START_INTR);
				break;
			case 17:
				//FETCH [T4]
				if(instance->START_EXEC != true)
					VL_PRINTF("[%d] FAIL: Expected START_EXEC: 1, got START_EXEC: %u\n", i, instance->START_EXEC);
				if(instance->START_ADDR != false)
					VL_PRINTF("[%d] FAIL: Expected START_ADDR: 0, got START_ADDR: %u\n", i, instance->START_ADDR);
				break;
			//A1 (ASL_ACC)
			case 18:
				//FETCH [SETUP]
				break;
			case 19: 
				//FETCH [T0]
				if(instance->ldMAR != true)
					VL_PRINTF("[%d] FAIL: Expected ldMAR: 1, got ldMAR: %u\n", i, instance->ldMAR);
				if(instance->mxMAR0 != true)
					VL_PRINTF("[%d] FAIL: Expected mxMAR0: 1, got mxMAR: %u\n", i, instance->mxMAR0);
				break;
			case 20: 
				//FETCH [T1]
				if(instance->rdMEM != true)
					VL_PRINTF("[%d] FAIL: Expected rdMEM: 1, got rdMEM: %u\n", i, instance->rdMEM);
				break;
			case 21:
				//FETCH [T1]
				if(instance->rdMEM != true)
					VL_PRINTF("[%d] FAIL: Expected rdMEM: 1, got rdMEM: %u\n", i, instance->rdMEM);
				break;
			case 22:
				//FETCH [T2]
				break;
			case 23:
				//FETCH [T3]
				if(instance->IR0_ != 0x0A)
					VL_PRINTF("[%d] FAIL: Expected IR0_: 0x40, got IR0_: %02x\n", i, instance->IR0_);
				if(instance->START_INTR != false)
					VL_PRINTF("[%d] FAIL: Expected START_INTR: 0, got START_INTR: %u\n", i, instance->START_INTR);
				break;
			case 24:
				//FETCH [T4]
				if(instance->START_EXEC != false)
					VL_PRINTF("[%d] FAIL: Expected START_EXEC: 0, got START_EXEC: %u\n", i, instance->START_EXEC);
				if(instance->START_ADDR != true)
					VL_PRINTF("[%d] FAIL: Expected START_ADDR: 1, got START_ADDR: %u\n", i, instance->START_ADDR);
				break;
			
		}	

		//Padajuca Ivica;
        ctx->timeInc(1);
        instance->CLK = !instance->CLK;
        //instance->eval();

		//Sledeci korak;
		if (i == 26) break;
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
