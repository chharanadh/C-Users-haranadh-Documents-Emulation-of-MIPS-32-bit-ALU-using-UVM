class test_throw_settled extends test_throw;
`uvm_component_utils(test_throw_settled)


   ///function1 for data1
function logic [31:0] get_data1();
bit [4:0] d;
d= $random;
if(d== 5'd0) begin
return 32'hffff;
end
else if (d>5'd0 && d<=5'd31)
return $random;
else if (d>5'd31 && d<=5'd47)
return 32'h1010;
else if (d>5'd47 && d<=5'd63)
return $random;
else
return 32'hffff;

endfunction

function logic [31:0] get_data2();
bit [4:0] d;
d= $random;
if(d== 5'd0)
return 32'h0001;
else if (d>5'd0 && d<=5'd31)
return $random;
else if (d>5'd31 && d<=5'd47)
return $random;
else if (d>5'd47 && d<=5'd63)
return 32'h0101;
else
return 32'hffff;

endfunction

function logic [4:0] get_shamt();
bit [4:0] d;
d= $random;
if(d==5'd0)
return $random;
else if (d>5'd0 && d<=5'd31)
return 5'h05;
else if (d>5'd31 && d<=5'd47)
return 5'h0a;
else if (d>5'd47 && d<=5'd63)
return 5'h0f;
else
return 5'h1f;

endfunction
//function for opcode traversing
//traversing through the opcodes
function opcode_list get_op();

//declaring a static variable for tranversing through the opcodes deterministically

static int opnum=0;
case(opnum)
1: begin opnum= opnum +1;
   return Add;
	
   end
2: begin opnum= opnum +1;
   return Addu;
	
   end
3: begin opnum= opnum +1;
   return And;
	
   end
4: begin opnum= opnum +1;
   return Clo;
	
   end
5: begin opnum= opnum +1;
   return Clz;
	
   end
6: begin opnum= opnum +1;
   return Mul;
	
   end
7: begin opnum= opnum +1;
   return Nor;
	
   end
8: begin opnum= opnum +1;
   return Or;
	
   end
9: begin opnum= opnum +1;
   return Sll;
	
   end
10: begin opnum= opnum +1;
   return Sllc;
	
   end
11: begin opnum= opnum +1;
   return Sllv;
	
   end
12: begin opnum= opnum +1;
   return Slt;
	
   end
13: begin opnum= opnum +1;
   return Sltu;
	
   end
14: begin opnum= opnum +1;
   return Sra;
	
   end
15: begin opnum= opnum +1;
   return Srav;
	
   end
16: begin opnum= opnum +1;
   return Srl;
	
   end
17: begin opnum= opnum +1;
   return Srlv;
	
   end
18: begin 	opnum= opnum +1;
   return Sub;

   end
19: begin 	opnum= opnum +1;
   return Subu;

   end
20: begin
	opnum= opnum +1;
   return Xor;
	
   end
default:
begin
		opnum=0; 
		opnum = opnum+1;
end		
endcase
endfunction
   
function new (string name, uvm_component parent);
      super.new(name, parent);
   endfunction : new
endclass