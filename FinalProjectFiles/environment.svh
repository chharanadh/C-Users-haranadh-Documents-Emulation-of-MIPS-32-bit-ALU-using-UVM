class environment extends uvm_env;
`uvm_component_utils(environment)
//creating objects for the classes in the environment

test_throw_random Trandom;
test_throw_settled Tsettled;
test_throw_fixed Tfixed;
driver drv;

uvm_tlm_fifo #(aluin) aluin_ff;

monitor1 m1;
monitor2 m2;
scoreboard sc;


function void build_phase(uvm_phase phase);
aluin_ff = new("aluin_ff", this);
$display("in Testxb_throw");
`ifdef test_throw_random_uv
Trandom = test_throw_random::type_id::create("Trandom",this);
`elsif test_throw_settled_uv
Tsettled = test_throw_settled::type_id::create("Tsettled",this);
`elsif test_throw_fixed_uv
Tfixed = test_throw_fixed::type_id::create("Tfixed",this);
`endif

drv = driver::type_id::create("drv",this);
sc = scoreboard::type_id::create("sc",this);
m1 = monitor1::type_id::create("m1",this);
m2 = monitor2::type_id::create("m2",this);

endfunction
 
function void connect_phase(uvm_phase phase);
$display("in Testxbc_throw");
drv.aluin_port.connect(aluin_ff.get_export);

`ifdef test_throw_random_uv
Trandom.aluin_port.connect(aluin_ff.put_export);
`elsif test_throw_settled_uv
Tsettled.aluin_port.connect(aluin_ff.put_export);
`elsif test_throw_fixed_uv
Tfixed.aluin_port.connect(aluin_ff.put_export);
`endif
m2.map.connect(sc.analysis_export);
$display("in Testxbcm2_throw");
m1.map.connect(sc.aluin_scff.analysis_export);
$display("in Testxbcm1_throw");
endfunction

function new(string name, uvm_component parent);
super.new(name, parent);
endfunction

endclass