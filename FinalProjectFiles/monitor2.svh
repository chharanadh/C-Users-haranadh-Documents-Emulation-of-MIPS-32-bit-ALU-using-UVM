class monitor2 extends uvm_component;
`uvm_component_utils(monitor2)
uvm_analysis_port #(aluout) map;

function void build_phase(uvm_phase phase);

virtual alu_bfm bfm;
if(!uvm_config_db #(virtual alu_bfm)::get(null,"*","bfm",bfm))
$fatal("BFM not gettable");

bfm.m2 = this;
map = new("map",this);

endfunction


function void write_m2(aluout aluout_m2);
map.write(aluout_m2);
endfunction

function new(string name, uvm_component parent);
super.new(name,parent);
endfunction

endclass