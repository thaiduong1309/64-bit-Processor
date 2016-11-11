`timescale 1 ps / 100 fs

module SignExtend (instr, DAddr9, CondAddr19, BrAddr26, Imm12);

	input logic [31:0]instr;
	output logic [63:0]DAddr9, CondAddr19, BrAddr26, Imm12;
	
	
	
	integer i,j,k,l;
	
	always_comb begin
	
	DAddr9[8:0]= instr[20:12];
	CondAddr19[18:0]= instr[23:5];
	BrAddr26[25:0]= instr[25:0];
	Imm12[11:0]=instr[21:10];
	
	for (i=9; i<64; i++) begin
		DAddr9[i] = instr[20];
	end
	
	for (j=19; j<64; j++) begin
		CondAddr19[j]=instr[23];
	end
	
	for (k=26; k<64; k++) begin
		BrAddr26[k]=instr[25];
	end
	
	for (l=12; l<64; l++) begin
		Imm12[l]=instr[21];
	end
	end
	
endmodule

module SignExtend_testbench();
	logic [31:0]instr;
	logic [63:0]DAddr9, CondAddr19, BrAddr26, Imm12;
	
	SignExtend abc (instr, DAddr9, CondAddr19, BrAddr26, Imm12);
	parameter delay = 100000;
	
	initial begin
	instr = 32'h11111111;
	#delay;
	
	instr = 32'h1234567;
	#delay;
	end
	
endmodule