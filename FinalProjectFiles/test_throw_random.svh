class test_throw_random extends test_throw;
   `uvm_component_utils(test_throw_random)
   
   
   
   
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

function opcode_list get_op();
bit [5:0] opcode;
opcode =$random;
case(opcode) inside
	[0:5]:	return 	Addu;
	[6:11]:	return 	Add;
	[12:17]:	return	And;
	[18:23]:	return	Clo;
	[24:29]:	return	Clz;
	[30:35]:	return	Mul;
	[36:41]:	return	Nor;
	[42:47]:	return	Or;
	[48:53]:	return	Sll;
	[54:59]:	return	Sllc;
	[60:65]:	return	Sllv;
	[66:71]:	return	Slt;
	[71:76]:	return	Sltu;
	[77:82]:	return	Sra;
	[83:88]:	return	Srav;
	[89:94]:	return	Srl;
	[95:100]:	return	Srlv;
	[101:106]:	return	Sub;
	[107:112]:	return	Subu;
	[113:118]:	return	Xor;
	[119:124]:	return 	Mul; 
	default: return Add;
	
	endcase

   endfunction
   
     
         
   function new (string name, uvm_component parent);
      super.new(name, parent);
   endfunction : new
 
endclass