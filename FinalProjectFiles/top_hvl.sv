import uvm_pkg::*;
`include "uvm_macros.svh"
`include "top_hvl_pkg.sv"


module top_hvl;
initial 
begin
uvm_config_db #(virtual alu_bfm)::set(null, "*", "bfm", top_hdl.bfm);	


run_test();
end

endmodule
     