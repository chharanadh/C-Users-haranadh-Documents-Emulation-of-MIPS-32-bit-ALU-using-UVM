module top_hdl;
//pragma attribute top_hdl partition_module_xrtl

//defining signals for the alu ports

//7 inputs
wire clock;
wire reset;
wire [31:0] A;
wire [31:0] B;
wire [4:0] operation_acutal_5bit;
wire [5:0] opcode;
wire [4:0] Shamt;
wire EX_Flush;
wire EX_Stall;


//6 outputs

wire [31:0] result;
wire BZero;
wire EXC_Ov;
wire ALU_Stall;
wire [31:0] HI;
wire [31:0] LO; 


//instantiating the bfm model
alu_bfm bfm();

//instantiating the ALU
ALU  alu_top_hdl(.clock(bfm.clock), .reset(reset),
				 .EX_Stall(bfm.EX_Stall),
				 .EX_Flush(bfm.EX_Flush),
				 .A(bfm.A),
				 .B(bfm.B),
				 .Operation(bfm.operation_acutal_5bit),
				 .Shamt(bfm.Shamt),
				 .BZero(bfm.BZero),
				 .EXC_Ov(bfm.EXC_Ov),
				 .Result(bfm.result),
				 .ALU_Stall(bfm.ALU_Stall),
				 .out_HI(bfm.HI),
				 .out_LO(bfm.LO)
				 );
				 
endmodule
				