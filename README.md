Objective:
To perform Emulation of the DUT which is “MIPS ALU 32bit” in a UVM environment
Techniques applied in achieving the Objective:
Server side:
UVM based verfication strategy consisting of
1.Stimulus generators : Created three types of test input generators
-Type1: Randomized generated test input(test_throw_random.sv)
-Type2: Settled generated test input
(traversing through each opcode-test_throw_settled.svh)
-Type3: Opcode targeted test input generator(test_throw_fixed.svh)
2.Driver: Driver is created and used to get the test input from the generators and passed
to virtual bfm.
3.Monitor_input side, Monitor_Output side, Scoreboard: Monitors use the calls the write
function of the Scoreboard for updating the test inputs, results.Scoreboard checks and
compares the resuls and displays on the terminal.
4. Environment: environment encloses the above mentioned uvm components and
connections of the ports using tlm fifo.
5. Created uvm_tests for the different types of tests mentioned in the generators
6. Created top_hvl module which calls the run_test method.
Emulator side:
1. Created a module for the Bus Function Model for access the pinlevel connectivity from
the DUT.Created tasks for passing the inputs to the DUT.
2. Top_hdl module is created and included the instances of the BFM, DUT.
Emulation is performed by passing the test cases using the bfm by accessing the UVM
environment on the Server side.
Results Achieved:
1.Successfully able to integrate the UVM test environment with the top_hdl environment
and able to pass test cases from the Veloce Server to the Emulator using the bfm setup.
2.ALU operations are checked using scoreboard and Monitor setup.
3. Two million different test inputs are generated and ran on the emulator for 30mins.
Below is the emulation Report for 100,000 Random Test cases executed:
Results:
#
========================================================================
=====
# SIMULATION STATISTICS
#
========================================================================
=====
# Simulation finished at time 1094275
#
# Total number of TBX clocks: 206612242
# Total number of TBX clocks spent in HDL time advancement: 218855
# Total number of TBX clocks spent in HDL due to callee execution: 0
# Percentage TBX clocks spent in HDL time advance: 0.11 %
# -----------------------------------------------------------------------------
# Total CPU time (user mode): 26.74 seconds.
# Total time spent: 114.30 seconds.
# -----------------------------------------------------------------------------
