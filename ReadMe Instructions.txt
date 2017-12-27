Instructions for running the project:

//////////////////////////////////////////////////////
1. Creating the environmental variable for UVM files

command:
	export UVM_HOME=/pkgs/mentor/questa/10.3/questasim/verilog_src/uvm-1.1d

check with:
		echo $UVM_HOME

Next Run in Puresim mode first.
2. ///////////////Puresim Mode/////////////////////////////////////

 for calling 10000 random test cases use the following command.
command: 
	make all MODE=puresim TEST=test_throw_random_uv TEST_CASES=100000
	
similarly for other generators(optional)
	make all MODE=puresim TEST=test_throw_settled_uv TEST_CASES=100000
	make all MODE=puresim TEST=test_throw_fixed_uv TEST_CASES=100000 TEST=Add
3.//////////////////////////////////////////////////////////////
After choosing one from the above three types of tests proceed to run on velocesolo1
make all MODE=veloce TEST=test_throw_random_uv TEST_CASES=100000

similarly for other generators(optional)
	make all MODE=veloce TEST=test_throw_settled_uv TEST_CASES=100000
	make all MODE=veloce TEST=test_throw_fixed_uv TEST_CASES=100000 TEST=Add

/////////////////////done ////////////////////////////////////////////