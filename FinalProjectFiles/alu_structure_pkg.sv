package alu_structure_pkg;

`timescale 1ns/1ps


////creating a structure for outputs from the ALU//
typedef struct packed{
logic [31:0] result;
logic BZero;
logic EXC_Ov;
logic ALU_Stall;
logic [31:0] HI; //added port:output port to the design 
logic [31:0] LO; //added port:output port to the design 
} aluout;

//creating the list of opcodes for different operations//
typedef enum logic [5:0] 
{
		Addu	=	6'd0,
		Add		= 	6'd1,
		And		= 	6'd2,
		Clo		= 	6'd3,
		Clz		= 	6'd4,
		Div		= 	6'd5,
		Divu	= 	6'd6,
		Madd	= 	6'd7,
		Maddu	= 	6'd8,
		Mfhi	= 	6'd9,
		Mflo	= 	6'd10,
		Mthi	= 	6'd11,
		Mtlo	= 	6'd12,
		Msub	= 	6'd13,
		Msubu	= 	6'd14,
		Mul		= 	6'd15,
		Mult	= 	6'd16,
		Multu	= 	6'd17,
		Nor		= 	6'd18,
		Or 		= 	6'd19,
		Sll		= 	6'd20,
		Sllc	= 	6'd21,
		Sllv	= 	6'd22,
		Slt		= 	6'd23,
		Sltu	= 	6'd24,
		Sra		= 	6'd25,
		Srav	= 	6'd26,
		Srl		= 	6'd27,
		Srlv	= 	6'd28,
		Sub		= 	6'd29,
		Subu	= 	6'd30,
		Xor		= 	6'd31,
		rst 	= 	6'd32,
		EX_Stall= 	6'd33,
		EX_Flush= 	6'd34

} opcode_list;

///creating a structure for inputs to the ALU//
typedef struct packed{
logic clock; 
logic reset;
logic [31:0] A;
logic [31:0] B;
opcode_list opcode;
logic [4:0] Shamt;
}aluin;

endpackage



