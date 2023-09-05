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
#include "Vcpu_decode.h"

// Legacy function required only so linking works on Cygwin and MSVC++
double sc_time_stamp() { return 0; }

const char* nes_instructions_matrix[256] = 
{
    "BRK", "OR_", "KIL", "SLO", "NOP", "OR_", "ASL", "SLO", "PHP", "OR_", "ASL", "ANC", "NOP", "OR_", "ASL", "SLO",
    "BPL", "OR_", "KIL", "SLO", "NOP", "OR_", "ASL", "SLO", "CLC", "OR_", "NOP", "SLO", "NOP", "OR_", "ASL", "SLO",
    "JSR", "AND_", "KIL", "RLA", "BIT", "AND_", "ROL", "RLA", "PLP", "AND_", "ROL", "ANC", "BIT", "AND_", "ROL", "RLA",
    "BMI", "AND_", "KIL", "RLA", "NOP", "AND_", "ROL", "RLA", "SEC", "AND_", "NOP", "RLA", "NOP", "AND_", "ROL", "RLA",
    "RTI", "XOR_", "KIL", "SRE", "NOP", "XOR_", "LSR", "SRE", "PHA", "XOR_", "LSR", "ALR", "JMP", "XOR_", "LSR", "SRE",
    "BVC", "XOR_", "KIL", "SRE", "NOP", "XOR_", "LSR", "SRE", "CLI", "XOR_", "NOP", "SRE", "NOP", "XOR_", "LSR", "SRE",
    "RTS", "ADC", "KIL", "RRA", "NOP", "ADC", "ROR", "RRA", "PLA", "ADC", "ROR", "ARR", "JMP", "ADC", "ROR", "RRA",
    "BVS", "ADC", "KIL", "RRA", "NOP", "ADC", "ROR", "RRA", "SEI", "ADC", "NOP", "RRA", "NOP", "ADC", "ROR", "RRA",
    "NOP", "STA", "NOP", "SAX", "STY", "STA", "STX", "SAX", "DEY", "NOP", "TXA", "XAA", "STY", "STA", "STX", "SAX",
    "BCC", "STA", "KIL", "AHX", "STY", "STA", "STX", "SAX", "TYA", "STA", "TXS", "TAS", "SHY", "STA", "SHX", "AHX",
    "LDY", "LDA", "LDX", "LAX", "LDY", "LDA", "LDX", "LAX", "TAY", "LDA", "TAX", "LAX", "LDY", "LDA", "LDX", "LAX",
    "BCS", "LDA", "KIL", "LAX", "LDY", "LDA", "LDX", "LAX", "CLV", "LDA", "TSX", "LAS", "LDY", "LDA", "LDX", "LAX",
    "CPY", "CMP", "NOP", "DCP", "CPY", "CMP", "DEC", "DCP", "INY", "CMP", "DEX", "AXS", "CPY", "CMP", "DEC", "DCP",
    "BNE", "CMP", "KIL", "DCP", "NOP", "CMP", "DEC", "DCP", "CLD", "CMP", "NOP", "DCP", "NOP", "CMP", "DEC", "DCP",
    "CPX", "SBC", "NOP", "ISC", "CPX", "SBC", "INC", "ISC", "INX", "SBC", "NOP", "SBC", "CPX", "SBC", "INC", "ISC",
    "BEQ", "SBC", "KIL", "ISC", "NOP", "SBC", "INC", "ISC", "SED", "SBC", "NOP", "ISC", "NOP", "SBC", "INC", "ISC"
};


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
    const std::unique_ptr<Vcpu_decode> top{new Vcpu_decode{contextp.get(), "TOP"}};

    // Set Vtop's input signals
    top->IR0_ = 0;
   
    uint8_t opcode = 0;

    // Simulate until $finish
    while (!contextp->gotFinish()) {
        // Historical note, before Verilator 4.200 Verilated::gotFinish()
        // was used above in place of contextp->gotFinish().
        // Most of the contextp-> calls can use Verilated:: calls instead;
        // the Verilated:: versions just assume there's a single context
        // being used (per thread).  It's faster and clearer to use the
        // newer contextp-> versions.

        contextp->timeInc(1);  // 1 timeprecision period passes...
        // Historical note, before Verilator 4.200 a sc_time_stamp()
        // function was required instead of using timeInc.  Once timeInc()
        // is called (with non-zero), the Verilated libraries assume the
        // new API, and sc_time_stamp() will no longer work.


                  
        /*
        The component itself has these outputs:
        NOP, BRK, PHP, BPL, CLC, JSR, PLP, BMI, SEC, RTI, PHA, BVC, CLI, BIT, RTS, PLA, BVS, SEI, DEY, BCC, TYA, SHY, TAY, BCS, CLV, INY, BNE, CLD, INX, BEQ, SED, JMP, STY, CPX, CPY, LDY, SUB, CMP, LDA, STA, DEX, TAX, TXA, TSX, TXS, ADD, XOR_, AND_, OR_ INC, DEC, LDX, STX, ROR, LSR, ROL, LSL
        and I want to see if these outputs are triggered by the correct inputs, 0-255, mapped using the nes_instructions_matrix
        */
        top->IR0_ = opcode;
        
        // Evaluate model
        // (If you have multiple models being simulated in the same
        // timestep then instead of eval(), call eval_step() on each, then
        // eval_end_step() on each. See the manual.)
        top->eval();

        // Print results

        if (nes_instructions_matrix[opcode] == "NOP" && top->NOP != true)
        {
            printf("Error: %s  %i\n", nes_instructions_matrix[opcode], opcode);
        } else if (nes_instructions_matrix[opcode] == "BRK" && top->BRK != true)
        {
            printf("Error: %s  %i\n", nes_instructions_matrix[opcode], opcode);
        } else if (nes_instructions_matrix[opcode] == "PHP" && top->PHP != true)
        {
            printf("Error: %s  %i\n", nes_instructions_matrix[opcode], opcode);
        } else if (nes_instructions_matrix[opcode] == "BPL" && top->BPL != true)
        {
            printf("Error: %s  %i\n", nes_instructions_matrix[opcode], opcode);
        } else if (nes_instructions_matrix[opcode] == "CLC" && top->CLC != true)
        {
            printf("Error: %s  %i\n", nes_instructions_matrix[opcode], opcode);
        } else if (nes_instructions_matrix[opcode] == "JSR" && top->JSR != true)
        {
            printf("Error: %s  %i\n", nes_instructions_matrix[opcode], opcode);
        } else if (nes_instructions_matrix[opcode] == "PLP" && top->PLP != true)
        {
            printf("Error: %s  %i\n", nes_instructions_matrix[opcode], opcode);
        } else if (nes_instructions_matrix[opcode] == "BMI" && top->BMI != true)
        {
            printf("Error: %s  %i\n", nes_instructions_matrix[opcode], opcode);
        } else if (nes_instructions_matrix[opcode] == "SEC" && top->SEC != true)
        {
            printf("Error: %s  %i\n", nes_instructions_matrix[opcode], opcode);
        } else if (nes_instructions_matrix[opcode] == "RTI" && top->RTI != true)
        {
            printf("Error: %s  %i\n", nes_instructions_matrix[opcode], opcode);
        } else if (nes_instructions_matrix[opcode] == "PHA" && top->PHA != true)
        {
            printf("Error: %s  %i\n", nes_instructions_matrix[opcode], opcode);
        } else if (nes_instructions_matrix[opcode] == "BVC" && top->BVC != true)
        {
            printf("Error: %s  %i\n", nes_instructions_matrix[opcode], opcode);
        } else if (nes_instructions_matrix[opcode] == "CLI" && top->CLI != true)
        {
            printf("Error: %s  %i\n", nes_instructions_matrix[opcode], opcode);
        } else if (nes_instructions_matrix[opcode] == "BIT" && top->BIT != true)
        {
            printf("Error: %s  %i\n", nes_instructions_matrix[opcode], opcode);
        } else if (nes_instructions_matrix[opcode] == "RTS" && top->RTS != true)
        {
            printf("Error: %s  %i\n", nes_instructions_matrix[opcode], opcode);
        } else if (nes_instructions_matrix[opcode] == "PLA" && top->PLA != true)
        {
            printf("Error: %s  %i\n", nes_instructions_matrix[opcode], opcode);
        } else if (nes_instructions_matrix[opcode] == "BVS" && top->BVS != true)
        {
            printf("Error: %s  %i\n", nes_instructions_matrix[opcode], opcode);
        } else if (nes_instructions_matrix[opcode] == "SEI" && top->SEI != true)
        {
            printf("Error: %s  %i\n", nes_instructions_matrix[opcode], opcode);
        } else if (nes_instructions_matrix[opcode] == "DEY" && top->DEY != true)
        {
            printf("Error: %s  %i\n", nes_instructions_matrix[opcode], opcode);
        } else if (nes_instructions_matrix[opcode] == "BCC" && top->BCC != true)
        {
            printf("Error: %s  %i\n", nes_instructions_matrix[opcode], opcode);
        } else if (nes_instructions_matrix[opcode] == "TYA" && top->TYA != true)
        {
            printf("Error: %s  %i\n", nes_instructions_matrix[opcode], opcode);
        } else if (nes_instructions_matrix[opcode] == "SHY" && top->SHY != true)
        {
            printf("Error: %s  %i\n", nes_instructions_matrix[opcode], opcode);
        } 
        // the instructions left to check are  TAY, BCS, CLV, INY, BNE, CLD, INX, BEQ, SED, JMP, STY, CPX, CPY, LDY, SUB, CMP, LDA, STA, DEX, TAX, TXA, TSX, TXS, ADD, XOR_, AND_, OR_ INC, DEC, LDX, STX, ROR, LSR, ROL, LSL

        else if (nes_instructions_matrix[opcode] == "TAY" && top->TAY != true)
        {
            printf("Error: %s  %i\n", nes_instructions_matrix[opcode], opcode);
        } 
        else if (nes_instructions_matrix[opcode] == "BCS" && top->BCS != true)
        {
            printf("Error: %s  %i\n", nes_instructions_matrix[opcode], opcode);
        } 
        else if (nes_instructions_matrix[opcode] == "CLV" && top->CLV != true)
        {
            printf("Error: %s  %i\n", nes_instructions_matrix[opcode], opcode);
        } 
        else if (nes_instructions_matrix[opcode] == "INY" && top->INY != true)
        {
            printf("Error: %s  %i\n", nes_instructions_matrix[opcode], opcode);
        } 
        else if (nes_instructions_matrix[opcode] == "BNE" && top->BNE != true)
        {
            printf("Error: %s  %i\n", nes_instructions_matrix[opcode], opcode);
        } 
        else if (nes_instructions_matrix[opcode] == "CLD" && top->CLD != true)
        {
            printf("Error: %s  %i\n", nes_instructions_matrix[opcode], opcode);
        } 
        else if (nes_instructions_matrix[opcode] == "INX" && top->INX != true)
        {
            printf("Error: %s  %i\n", nes_instructions_matrix[opcode], opcode);
        } 
        else if (nes_instructions_matrix[opcode] == "BEQ" && top->BEQ != true)
        {
            printf("Error: %s  %i\n", nes_instructions_matrix[opcode], opcode);
        } 
        else if (nes_instructions_matrix[opcode] == "SED" && top->SED != true)
        {
            printf("Error: %s  %i\n", nes_instructions_matrix[opcode], opcode);
        }
        else if (nes_instructions_matrix[opcode] == "JMP" && top->JMP != true)
        {
            printf("Error: %s  %i\n", nes_instructions_matrix[opcode], opcode);
        }
        else if (nes_instructions_matrix[opcode] == "STY" && top->STY != true)
        {
            printf("Error: %s  %i\n", nes_instructions_matrix[opcode], opcode);
        }
        else if (nes_instructions_matrix[opcode] == "CPX" && top->CPX != true)
        {
            printf("Error: %s  %i\n", nes_instructions_matrix[opcode], opcode);
        }
        else if (nes_instructions_matrix[opcode] == "CPY" && top->CPY != true)
        {
            printf("Error: %s  %i\n", nes_instructions_matrix[opcode], opcode);
        }
        else if (nes_instructions_matrix[opcode] == "LDY" && top->LDY != true)
        {
            printf("Error: %s  %i\n", nes_instructions_matrix[opcode], opcode);
        }
        else if (nes_instructions_matrix[opcode] == "SUB" && top->SUB != true)
        {
            printf("Error: %s  %i\n", nes_instructions_matrix[opcode], opcode);
        }
        else if (nes_instructions_matrix[opcode] == "CMP" && top->CMP != true)
        {
            printf("Error: %s  %i\n", nes_instructions_matrix[opcode], opcode);
        }
        else if (nes_instructions_matrix[opcode] == "LDA" && top->LDA != true)
        {
            printf("Error: %s  %i\n", nes_instructions_matrix[opcode], opcode);
        }
        else if (nes_instructions_matrix[opcode] == "STA" && top->STA != true)
        {
            printf("Error: %s  %i\n", nes_instructions_matrix[opcode], opcode);
        }
        else if (nes_instructions_matrix[opcode] == "DEX" && top->DEX != true)
        {
            printf("Error: %s  %i\n", nes_instructions_matrix[opcode], opcode);
        }
        else if (nes_instructions_matrix[opcode] == "TAX" && top->TAX != true)
        {
            printf("Error: %s  %i\n", nes_instructions_matrix[opcode], opcode);
        }
        else if (nes_instructions_matrix[opcode] == "TXA" && top->TXA != true)
        {
            printf("Error: %s  %i\n", nes_instructions_matrix[opcode], opcode);
        } 
        else if (nes_instructions_matrix[opcode] == "TSX" && top->TSX != true)
        {
            printf("Error: %s  %i\n", nes_instructions_matrix[opcode], opcode);
        } 
        else if (nes_instructions_matrix[opcode] == "TXS" && top->TXS != true)
        {
            printf("Error: %s  %i\n", nes_instructions_matrix[opcode], opcode);
        } 
        else if (nes_instructions_matrix[opcode] == "ADD" && top->ADD != true)
        {
            printf("Error: %s  %i\n", nes_instructions_matrix[opcode], opcode);
        } 
        else if (nes_instructions_matrix[opcode] == "XOR_" && top->XOR_ != true)
        {
            printf("Error: %s  %i\n", nes_instructions_matrix[opcode], opcode);
        } 
        else if (nes_instructions_matrix[opcode] == "AND_" && top->AND_ != true)
        {
            printf("Error: %s  %i\n", nes_instructions_matrix[opcode], opcode);
        } 
        else if (nes_instructions_matrix[opcode] == "OR_" && top->OR_ != true)
        {
            printf("Error: %s  %i\n", nes_instructions_matrix[opcode], opcode);
        } 
        else if (nes_instructions_matrix[opcode] == "INC" && top->INC != true)
        {
            printf("Error: %s  %i\n", nes_instructions_matrix[opcode], opcode);
        } 
        else if (nes_instructions_matrix[opcode] == "DEC" && top->DEC != true)
        {
            printf("Error: %s  %i\n", nes_instructions_matrix[opcode], opcode);
        } 
        else if (nes_instructions_matrix[opcode] == "LDX" && top->LDX != true)
        {
            printf("Error: %s  %i\n", nes_instructions_matrix[opcode], opcode);
        } 
        else if (nes_instructions_matrix[opcode] == "STX" && top->STX != true)
        {
            printf("Error: %s  %i\n", nes_instructions_matrix[opcode], opcode);
        }
        else if (nes_instructions_matrix[opcode] == "ROR" && top->ROR != true)
        {
            printf("Error: %s  %i\n", nes_instructions_matrix[opcode], opcode);
        }
        else if (nes_instructions_matrix[opcode] == "LSR" && top->LSR != true)
        {
            printf("Error: %s  %i\n", nes_instructions_matrix[opcode], opcode);
        }
        else if (nes_instructions_matrix[opcode] == "ROL" && top->ROL != true)
        {
            printf("Error: %s  %i\n", nes_instructions_matrix[opcode], opcode);
        }
        else if (nes_instructions_matrix[opcode] == "LSL" && top->LSL != true)
        {
            printf("Error: %s  %i\n", nes_instructions_matrix[opcode], opcode);
        }


        if (opcode == 255u)
            break;

        opcode++;
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
