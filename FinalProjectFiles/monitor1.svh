class monitor1 extends uvm_component;
`uvm_component_utils(monitor1)
uvm_analysis_port #(aluin) map;

function void build_phase(uvm_phase phase);

virtual alu_bfm bfm;
if(!uvm_config_db #(virtual alu_bfm)::get(null,"*","bfm",bfm))
$fatal("BFM not gettable");

bfm.m1 = this;
map = new("map",this);

endfunction


function void write_m1(aluin aluin_m1);
map.write(aluin_m1);
endfunction

function new(string name, uvm_component parent);
super.new(name,parent);
endfunction

endclass