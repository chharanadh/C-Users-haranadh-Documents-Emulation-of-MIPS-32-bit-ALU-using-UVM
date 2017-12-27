class test_throw_fixed extends test_throw;

`uvm_component_utils(test_throw_fixed)
   
 
   
   ///function1 for data1
function opcode_list get_op();
      bit [2:0] op_choice;
      return Add;   
   endfunction : get_op
   
    function logic [31:0] get_data1();
			bit [2:0]   zero_ones;
			zero_ones = $random;
			if 	(zero_ones == 3'b000)
			return 0;
		else if (zero_ones == 3'b111)
			return '1;
		else if (zero_ones == 3'b001) 
			return 5'b01; 
		else if (zero_ones == 3'b010) 
			return 5'hFE;
		else
        return $random;
	   endfunction : get_data1
	   
    function logic [31:0] get_data2();
			bit [2:0]   zero_ones;
			zero_ones = $random;
			if 	(zero_ones == 3'b000)
			return 0;
		else if (zero_ones == 3'b111)
			return '1;
		else if (zero_ones == 3'b001) 
			return 5'b01; 
		else if (zero_ones == 3'b010) 
			return 5'hFE;
		else
        return $random;
	   endfunction : get_data2
   
   function logic [4:0] get_shamt();
		bit [2:0]   zero_ones;
			zero_ones = $random;
			if 	(zero_ones == 3'b000)
			return 0;
		else if (zero_ones == 3'b111)
			return '1;
		else if (zero_ones == 3'b001) 
			return 5'b01; 
		else if (zero_ones == 3'b010) 
			return 5'hFE;
		else
        return $random;
   endfunction : get_shamt

   
         
   function new (string name, uvm_component parent);
      super.new(name, parent);
   endfunction : new
 
endclass