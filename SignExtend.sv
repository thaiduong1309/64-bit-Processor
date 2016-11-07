module SignExtend (instr, DAddr9, CondAddr19, BrAddr26, Imm12);

	input logic [31:0]instr;
	output logic [63:0]DAddr9, CondAddr19, BrAddr26, Imm12;
	
	assign DAddr9[8:0]= instr[20:12];
	assign CondAddr19[18:0]= instr[23:5];
	assign BrAddr26[25:0]= instr[25:0];
	assign Imm12[11:0]=instr[21:10];
	
	integer i;
	
	always_comb begin
	for (i=9; i<64; i++) begin
		DAddr9[i]=instr[20];
	end
	
	for (i=19; i<64; i++) begin
		CondAddr19[i]=instr[23];
	end
	
	for (i=26; i<64; i++) begin
		BrAddr26[i]=instr[25];
	end
	
	for (i=12; i<64; i++) begin
		Imm12[i]=instr[21];
	end
	end
	
endmodule