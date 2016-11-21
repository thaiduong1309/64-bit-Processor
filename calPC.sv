`timescale 1 ps / 100 fs

module calPC (PC,PC_result, PCadd4 ,CondAddr19, BrAddr26, UncondBr, BrTaken);
	input logic [63:0] PC, CondAddr19, BrAddr26;
	input logic UncondBr, BrTaken;
	output logic [63:0] PC_result, PCadd4;

	logic [63:0] shift_pick, pick;
	logic [63:0] result1;
	logic [1:0]result, negative, zero, overflow, carry_out;
	
	// pick is the value between UncondBr mux
	mux64_2_1 m0 (UncondBr,CondAddr19, BrAddr26, pick);
	
	//shift left by 2 the result from the UncondBr mux  
	shifter s1 (pick, 1'b0, 6'd2, shift_pick);
	
	// PC + 4
	alu add0 (PC,64'd4,3'b010,PCadd4,negative[0],zero[0],overflow[0],carry_out[0]);
	
	// PC + add number
	alu add1 (PC,shift_pick,3'b010,result1,negative[1],zero[1],overflow[1],carry_out[1]);
	
	mux64_2_1 m1 (BrTaken, PCadd4, result1, PC_result);

endmodule