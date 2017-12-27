TEST ?= test_throw_random_uv
SPECIFIC_TEST ?= Add
TEST_CASES ?= 100000
MODE ?= puresim


ifeq ($(MODE), puresim)
all: lib hvlc build sim
else
all: lib hvlcomp velcomp build velsim
endif

lib:
	vlib work
	vmap work.top work
	export UVM=$(QUESTA_HOME)/verilog_src/uvm-1.1d
	

hvlc:
	vlog +incdir+$(UVM_HOME)/src $(UVM_HOME)/src/uvm_pkg.sv $(UVM_HOME)/src/dpi/uvm_dpi.cc
	vlog +incdir+$(UVM_HOME)/src +incdir+$(QUESTA_HOME)/verilog_src/questa_uvm_pkg-1.2/src $(QUESTA_HOME)/verilog_src/questa_uvm_pkg-1.2/src/questa_uvm_pkg.sv 
	vlog +incdir+$(UVM_HOME)/src alu_structure_pkg.sv top_hvl_pkg.sv MIPS_Parameters.v Divide.v ALU.v alu_bfm.sv top_hdl.sv top_hvl.sv +define+$(TEST) +define+TEST_CASES=$(TEST_CASES) +define+OPERATION=$(SPECIFIC_TEST)
hvlcomp:
	vlog +incdir+$(UVM_HOME)/src $(UVM_HOME)/src/uvm_pkg.sv $(UVM_HOME)/src/dpi/uvm_dpi.cc
	vlog +incdir+$(UVM_HOME)/src +incdir+$(QUESTA_HOME)/verilog_src/questa_uvm_pkg-1.2/src $(QUESTA_HOME)/verilog_src/questa_uvm_pkg-1.2/src/questa_uvm_pkg.sv 
	vlog +incdir+$(UVM_HOME)/src -mfcu top_hvl_pkg.sv top_hvl.sv +define+$(TEST) +define+TEST_CASES=$(TEST_CASES) +define+OPERATION=$(SPECIFIC_TEST)
	
velcomp:
	velanalyze alu_structure_pkg.sv
	velanalyze -hdl veriog -extract_hvl_info +define+QUESTA +incdir+$(UVM_HOME)/src $(UVM_HOME)/src/uvm_pkg.sv top_hvl.sv
	velanalyze -hdl verilog alu_bfm.sv 
	velanalyze top_hdl.sv
	velanalyze -hdl verilog MIPS_Parameters.v Divide.v ALU.v
	velcomp -top top_hdl
	
build:
	velhvl -sim $(MODE)
	
hdlc:
	vlog -mfcu +incdir+$(UVM_HOME)/src $(UVM_HOME)/src/uvm_pkg.sv MIPS_Parameters.v Divide.v ALU.v alu_bfm.sv top_hdl.sv
	
sim:
	vsim -c top_hdl top_hvl -do "run -all; simstats" -l mips.log +UVM_TESTNAME=test_throw_random_uv +tbxrun+velrunquesta  
	

velsim:
	echo "run -all; quit" > run.do
	vsim -c top_hdl top_hvl TbxSvManager -do run.do -l mipsv.log +velrunquesta +UVM_TESTNAME=test_throw_random_uv
clean:
	rm -rf work
	rm -rf tbx.dir tbx.log tbx.med tbx.wave veloce.log veloce.med veloce.wave