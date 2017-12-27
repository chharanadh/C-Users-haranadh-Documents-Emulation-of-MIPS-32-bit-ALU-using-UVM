`include "alu_structure_pkg.sv"
import alu_structure_pkg::*;
import top_hvl_pkg::monitor1;
import top_hvl_pkg::monitor2;
interface alu_bfm();
//pragma attribute alu_bfm partition_interface_xif

//wiring the signals

logic [31:0] A;
logic [31:0] B;
opcode_list opcode;
logic [4:0] operation_acutal_5bit;
logic [4:0] Shamt;
logic EX_Stall;
logic EX_Flush;

logic [31:0] result;
logic BZero;
logic EXC_Ov;
logic ALU_Stall;
logic [31:0] HI;
logic [31:0] LO;

logic clock;
logic reset;
// tbx clkgen
initial
begin
clock=0;
forever begin
#(10/2) clock = ~clock;  //CLKPERIOD=10
end

end

//tasks used for passing test case signals to the design under test i.e.ALU
//By the driver in uvm environment

/*
////Task1- for passing A signal to the ALU input port
task send_A(input logic [31:0] A_in); // pragma tbx xtf
@(posedge clock) begin
A= A_in;
end
endtask
////Task2- for passing B signal to the ALU input port
task send_B(input logic [31:0] B_in); // pragma tbx xtf
@(posedge clock) begin
B= B_in;
end
endtask
////Task3- for passing Opcode signal to the ALU input port
task send_opcode(input opcode_list opcodex, input Shamtx); // pragma tbx xtf
@(posedge clock) 
if (opcodex == EX_Flush)
begin
EX_Flush=1;
Shamt=0;
reset=0;
EX_Stall=0;
@(posedge clock)
EX_Flush=0;
end
else if( opcodex== EX_Stall)
begin
EX_Stall = 1;
EX_Flush = 0;
Shamt =0;
reset = 0;
@(posedge clock)
EX_Stall=0;
end

else if(opcodex == rst)
begin
reset =1;
//making remaining to zero
EX_Stall =0;
EX_Flush = 0;
Shamt = 0;
@(posedge clock)
reset = 0;
end
else begin
opcode= opcodex;
Shamt= Shamtx;
end

endtask*/

task send(
input logic [31:0] A1,
input logic [31:0] B1,
input opcode_list op1,
input logic [4:0] Shamt1); //pragma tbx xtf
@(posedge clock);
if(op1 == rst) 
begin 
reset =1;
//making remaining to zero
EX_Stall =0;
EX_Flush = 0;
Shamt = 0;
@(posedge clock);
reset = 0;
end
else if(op1 ==EX_Stall) 
begin
reset = 0;
EX_Stall = 1;
EX_Flush = 0;
Shamt =0;
@(posedge clock);
EX_Stall=0;
end
else if(op1 ==EX_Flush)
begin
reset=0;
EX_Stall=0;
EX_Flush=1;
Shamt=0;
@(posedge clock);
EX_Flush=0;
end
else begin
A= A1;
B=B1;
opcode = op1;
Shamt =Shamt1;
end

endtask

assign operation_acutal_5bit= opcode[5:0]; //getting the correct required opcode to drive alu input ports

task totalreset(); 
begin
reset=1;
		@(negedge clock);
		@(negedge clock);
		reset =0;
end
endtask

//////////////////////For the Monitors assigning the bfm signals at every posedge clock///////////
monitor1 m1;
monitor2 m2;

always @(posedge clock)
begin
aluin aluin_m1;
aluout aluout_m2;

aluin_m1.A = A;
aluin_m1.B = B;
aluin_m1.opcode = opcode;
aluin_m1.Shamt = Shamt;

aluout_m2.result = result;
aluout_m2.BZero = BZero;
aluout_m2.EXC_Ov = EXC_Ov;
aluout_m2.ALU_Stall = ALU_Stall;
aluout_m2.HI = HI;
aluout_m2.LO = LO;

m1.write_m1(aluin_m1);
m2.write_m2(aluout_m2);

end



endinterface










