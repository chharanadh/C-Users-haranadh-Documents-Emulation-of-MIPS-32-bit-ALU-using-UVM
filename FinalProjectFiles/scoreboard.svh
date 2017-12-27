class scoreboard extends uvm_subscriber #(aluout);
`uvm_component_utils(scoreboard)

aluout theory;

logic [32:0] A2;


virtual alu_bfm bfm;

uvm_tlm_analysis_fifo #(aluin) aluin_scff;


function new(string name, uvm_component parent);
super.new(name, parent);
endfunction

function void build_phase(uvm_phase phase);
aluin_scff = new("aluin_scff",this);
endfunction


function void write(aluout t);

logic signed [31:0] A1, B1;
logic [4:0] Shamt;
logic [31:0] CountLead;

aluin aluin_m1;




//initializing inputs to zero
aluin_m1.A=0;
aluin_m1.B=0;
aluin_m1.Shamt=0;

do
	if(!aluin_scff.try_get(aluin_m1))
	$fatal(1, "Didnot get input");
while (aluin_m1.opcode == rst);


//outputs calculating theoritically
theory.BZero = (aluin_m1.B==0);
theory.EXC_Ov= 0;
theory.ALU_Stall= 0;
case(aluin_m1.opcode)

Addu:
	begin
	A2 = aluin_m1.A + aluin_m1.B;
	 {theory.EXC_Ov,theory.result} = A2;  //appendin a 0 overflow
	end
Add:
	begin
	A2 = aluin_m1.A + aluin_m1.B;
	 {theory.EXC_Ov,theory.result} = A2;  //appendin a 0 overflow
	end
And:
	begin
	theory.result = (aluin_m1.A & aluin_m1.B);
	end
Clo:
	begin
	CountLead = count("countones", aluin_m1.A);
	theory.result = {26'b0, CountLead};
	end
Clz:
	begin
	CountLead = count("countzeros", aluin_m1.A);
	theory.result = {26'b0, CountLead};
	end	
Mul:
	begin
	theory.result = (aluin_m1.A * aluin_m1.B);
	end
Nor:
	begin
	theory.result = ~(aluin_m1.A | aluin_m1.B);
	end
Or:
	begin
	theory.result = (aluin_m1.A | aluin_m1.B);
	end 
Sll:
	begin
	theory.result = (aluin_m1.B<<Shamt);
	end 
Sllc:
	begin
	theory.result = (aluin_m1.B<<16);
	end
Sllv:
	begin
	theory.result= aluin_m1.B << aluin_m1.A[4:0];
	end
Slt:
	begin
	theory.result= (aluin_m1.A < aluin_m1.B) ? 1:0;
	end
Sltu:
	begin
	theory.result= (aluin_m1.A < aluin_m1.B) ? 1:0;
	end
Sra: begin
	theory.result= aluin_m1.B >>> Shamt;
	end
Srav: begin
	theory.result= aluin_m1.B >>> aluin_m1.A[4:0];
	end
Srl:
	begin
	theory.result = (aluin_m1.B>>Shamt);
	end 
Srlv:
	begin
	theory.result= aluin_m1.B >> aluin_m1.A[4:0];
	end
Sub:
	begin
	if(aluin_m1.A<aluin_m1.B)
	theory.EXC_Ov=1;
	theory.result= (aluin_m1.A-aluin_m1.B);
	end
Subu:
	begin
	if(aluin_m1.A<aluin_m1.B)
	theory.EXC_Ov=1;
	theory.result= (aluin_m1.A-aluin_m1.B);
	end
Xor: 
	begin
	theory.result = aluin_m1.A^aluin_m1.B;
	end
	
endcase

//Checking the above opcodes only

if(theory.result == t.result) 
begin
$display("############Passed######: A: %0h, B: %0h, op: %s, Obtained result: %0h, Theoritical result: %0h", aluin_m1.A, aluin_m1.B, aluin_m1.opcode, t.result, theory.result);
end
else begin
$display("*************Failed*****: A: %0h, B: %0h, op: %s, Obtained result: %0h, Theoritical result: %0h", aluin_m1.A, aluin_m1.B, aluin_m1.opcode, t.result, theory.result);
end
endfunction

function logic[5:0] count(string d, logic [31:0] A);
int k;
if(d == "countones")
begin
for(k =32; k>0; k--)
	if(A[k-1]==1)
	count = count+1;
	else 
	return count;
	
end

else if (d== "countzeros")
begin
for(k=32; k>0; k--)

if(A[k-1] == 0)
count++;
else 
return count;

end

endfunction
endclass