virtual class test_throw extends uvm_component;
`uvm_component_utils(test_throw)

virtual alu_bfm bfm;
uvm_put_port #(aluin) aluin_port;

function void build_phase (uvm_phase phase);
aluin_port = new("aluin_port",this);
endfunction

pure virtual function opcode_list get_op();
pure virtual function logic [31:0] get_data1();   
pure virtual function logic [31:0] get_data2();   
pure virtual function logic [4:0] get_shamt();

task run_phase(uvm_phase phase);
aluin aluin_m1;
$display("Just before Raise Objection");
phase.raise_objection(this);
$display("Raise Objection");
repeat(5) begin
$display("repeat reset loop inside test_throw run_phase");
aluin_m1.opcode = rst;
aluin_port.put(aluin_m1);
$display("tt_port put completed");
//$display("A: %h B: %h Opcode: %h",aluin_m1.A, aluin_m1.B, aluin.opcode);
$display("opcode:%d",aluin_m1.opcode);
end

repeat(`TEST_CASES)
begin
$display("Throwing testcases");
aluin_m1.opcode = get_op();
$display("opcode:%d",aluin_m1.opcode);
aluin_m1.A = get_data1();
$display("A:%d ",aluin_m1.A);
aluin_m1.B = get_data2();
$display("B:%d",aluin_m1.B);
aluin_m1.Shamt = get_shamt();
aluin_port.put(aluin_m1);
$display("Shamt:%d",aluin_m1.Shamt);
end

$display("Drop Objection");
phase.drop_objection(this);
endtask

function new(string name, uvm_component parent);
super.new(name, parent);
endfunction
endclass