`timescale 1 ps / 100 fs

module calPC (PC,PC_result, CondAddr19, BrAddr26, UncondBr, BrTaken);
	input logic [63:0] PC, CondAddr19, BrAddr26;
	input logic UncondBr, BrTaken;
	output logic [63:0] PC_result;

	logic [63:0] shift_pick, pick;
	logic [63:0] result0, result1;
	logic result, negative, zero, overflow, carry_out;
	
	// pick is the value between UncondBr mux
	mux64_2_1 m0 (UncondBr,CondAddr19, BrAddr26, pick);
	
	//shift left by 2 the result from the UncondBr mux  
	shifter s1 (pick, 1'b0, 5'd2, shift_pick);
	
	//
	alu add0 (PC,64'd4,3'b010,result0,negative,zero,overflow,carry_out);
	
	//
	alu add1 (PC,shift_pick,3'b010,result1,negative,zero,overflow,carry_out);
	
	mux64_2_1 m1 (BrTaken, result0, result1, PC_result);

endmodule