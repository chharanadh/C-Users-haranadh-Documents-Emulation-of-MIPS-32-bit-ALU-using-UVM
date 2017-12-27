class driver extends uvm_component;
`uvm_component_utils(driver)

virtual alu_bfm bfm;
uvm_get_port #(aluin) aluin_port;

function void build_phase(uvm_phase phase);
if(!uvm_config_db #(virtual alu_bfm)::get(null,"*","bfm",bfm))
$fatal("BFM not gettable");
aluin_port = new("aluin_port",this);
endfunction

task run_phase(uvm_phase phase);
aluin aluin_m1;
aluout aluout_m2;
$display("Driver inside run_phase");
forever 
begin
aluin_port.get(aluin_m1);
$display("Forever loop just before bfm.send Driver inside run_phase");
bfm.send(aluin_m1.A, aluin_m1.B, aluin_m1.opcode, aluin_m1.Shamt);
$display("bfm send completed");
end

endtask

function new(string name, uvm_component parent);
super.new(name, parent);
endfunction
endclass