ifneq ($(words $(CURDIR)),1)
 $(error Unsupported: GNU Make cannot build in directories containing spaces, build elsewhere: '$(CURDIR)')
endif

BDF_DIR=nessy/src
VERILOG_DIR=verilog
TLE=gpu/render_rect

default: verilog run

SOURCES_BDF = $(shell find $(BDF_DIR) -name "*.bdf" -printf "%P ")
SOURCES_VERILOG = $(addprefix $(VERILOG_DIR)/,$(SOURCES_BDF:.bdf=.v))
INCLUDE_FOLDERS = $(shell find ./nessy/src -type d -printf "-I${VERILOG_DIR}/%P ")

${VERILOG_DIR}/%.v: ${BDF_DIR}/%.bdf
	quartus_map --convert_bdf_to_verilog=$< && dirname $@ | xargs mkdir --parents  && mv $(BDF_DIR)/$*.v $@

.PHONY: verilog
verilog: $(SOURCES_VERILOG)

ifeq ($(VERILATOR_ROOT),)
VERILATOR = verilator
VERILATOR_COVERAGE = verilator_coverage
else
export VERILATOR_ROOT
VERILATOR = $(VERILATOR_ROOT)/bin/verilator
VERILATOR_COVERAGE = $(VERILATOR_ROOT)/bin/verilator_coverage
endif

# Generate C++ in executable form
VERILATOR_FLAGS += -cc --exe
# Generate makefile dependencies (not shown as complicates the Makefile)
#VERILATOR_FLAGS += -MMD
# Optimize
VERILATOR_FLAGS += -x-assign fast
# Warn abount lint issues; may not want this on less solid designs
VERILATOR_FLAGS += -Wno-fatal
# Make waveforms
VERILATOR_FLAGS += --trace
# Check SystemVerilog assertions
#VERILATOR_FLAGS += --assert
# Generate coverage analysis
#VERILATOR_FLAGS += --coverage
# Run Verilator in debug mode
#VERILATOR_FLAGS += --debug
# Add this trace to get a backtrace in gdb
#VERILATOR_FLAGS += --gdbbt

# Input files for Verilator
VERILATOR_INPUT =  -f input.vc $(INCLUDE_FOLDERS) verilog/${TLE}.v tests/${TLE}/sim_main.cpp


run:
	@echo
	@echo "-- VERILATE ----------------"
	$(VERILATOR) $(VERILATOR_FLAGS) $(VERILATOR_INPUT)

	@echo
	@echo "-- BUILD -------------------"
# To compile, we can either
# 1. Pass --build to Verilator by editing VERILATOR_FLAGS above.
# 2. Or, run the make rules Verilator does:
#	$(MAKE) -j -C obj_dir -f Vtop.mk
# 3. Or, call a submakefile where we can override the rules ourselves:
	$(MAKE) -j4 -C obj_dir -f ../Makefile_obj -E TLE=${TLE}

	@echo
	@echo "-- RUN ---------------------"
	@rm -rf logs
	@mkdir -p logs
	obj_dir/V${shell basename ${TLE}} +trace

#	@echo
#	@echo "-- COVERAGE ----------------"
#	@rm -rf logs/annotated
#	$(VERILATOR_COVERAGE) --annotate logs/annotated logs/coverage.dat

	@echo
	@echo "-- DONE --------------------"
	@echo "To see waveforms, open vlt_dump.vcd in a waveform viewer"
	@echo


######################################################################
# Other targets

show-config:
	$(VERILATOR) -V

maintainer-copy::
clean mostlyclean distclean maintainer-clean::
	-rm -rf obj_dir logs *.log *.dmp *.vpd coverage.dat core
