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
#include "Vpixel_buffer.h"

// Legacy function required only so linking works on Cygwin and MSVC++
double sc_time_stamp() { return 0; }

int main(int argc, char** argv) {
    // This is a more complicated example, please also see the simpler examples/make_hello_c.

    // Prevent unused variable warnings
    if (false && argc && argv) {}

    // Create logs/ directory in case we have traces to put under it
    Verilated::mkdir("logs");

    // Construct a VerilatedContext to hold simulation time, etc.
    // Multiple modules (made later below with Vtop) may share the same
    // context to share time, or modules may have different contexts if
    // they should be independent from each other.

    // Using unique_ptr is similar to
    // "VerilatedContext* contextp = new VerilatedContext" then deleting at end.
    const std::unique_ptr<VerilatedContext> contextp{new VerilatedContext};
    // Do not instead make Vtop as a file-scope static variable, as the
    // "C++ static initialization order fiasco" may cause a crash

    // Set debug level, 0 is off, 9 is highest presently used
    // May be overridden by commandArgs argument parsing
    contextp->debug(0);

    // Randomization reset policy
    // May be overridden by commandArgs argument parsing
    contextp->randReset(0);

    // Verilator must compute traced signals
    contextp->traceEverOn(true);

    // Pass arguments so Verilated code can see them, e.g. $value$plusargs
    // This needs to be called before you create any model
    contextp->commandArgs(argc, argv);

    // Construct the Verilated model, from Vtop.h generated from Verilating "top.v".
    // Using unique_ptr is similar to "Vtop* top = new Vtop" then deleting at end.
    // "TOP" will be the hierarchical name of the module.
    const std::unique_ptr<Vpixel_buffer> top{new Vpixel_buffer{contextp.get(), "TOP"}};

    top->CLK = 0;
    top->DIN = 0;
    top->PUSH = 0;
    top->POP = 0;
    
    bool dir = false;
    int i = 0;

    // Simulate until $finish
    while (!contextp->gotFinish()) {
        contextp->timeInc(1);  // 1 timeprecision period passes...

        if(dir == true) {
            if(top->DOUT != i) {
                VL_PRINTF("[%" PRId64 "] CLK=%x  DOUT=%x i=%x\n",
                    contextp->time(), top->CLK, top->DOUT, i
                    );
                //break;
            }
            if(i == 64)  {
				break;
			} else {
				i++;
			}
        }
        
        top->CLK = !top->CLK;
        top->eval();
        
		if(dir == false) {
            top->DIN = i;
			top->PUSH = true;
            if(i == 64) {
				top->PUSH = false;
				top->POP = true;
                i = 0;
                dir = true;
            } else {
				i++;
			} 
		}
        
		contextp->timeInc(1);  // 1 timeprecision period passes...
        top->CLK = !top->CLK;
        top->eval();
    }


    // Final model cleanup
    top->final();

    // Coverage analysis (calling write only after the test is known to pass)
#if VM_COVERAGE
    Verilated::mkdir("logs");
    contextp->coveragep()->write("logs/coverage.dat");
#endif

    // Return good completion status
    // Don't use exit() or destructor won't get called
    return 0;
}
