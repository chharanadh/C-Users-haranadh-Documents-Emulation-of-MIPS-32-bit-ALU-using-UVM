class test_throw_fixed_uv extends uvm_test;
`uvm_component_utils(test_throw_fixed_uv)


environment e;

function new(string name, uvm_component parent);
super.new(name, parent);
endfunction

function void build_phase(uvm_phase phase);
e = environment::type_id::create("e",this);
endfunction
endclass