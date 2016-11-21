`timescale 1 ps / 100 fs

module Control (instr, zero, flag ,Reg2Loc, ALUsrc, MemtoReg, RegWri, MemWri, BrTaken, UncondBr, ALUOp, Readmem, ALUsrc1,enFlags, WriteRd, BR);

	input logic [31:0]instr;
	input logic zero;
	input logic [3:0]flag;
	output logic [2:0]ALUOp;
	output logic Reg2Loc, ALUsrc, MemtoReg, RegWri, MemWri, BrTaken, UncondBr, Readmem, ALUsrc1, enFlags, WriteRd, BR;
	
	always_comb begin
	casex (instr[31:21])
	//ADDS: 558
	11'b10101011000: begin
		Reg2Loc	= 1'b1;
		ALUsrc	= 1'b0;
		MemtoReg = 1'b0;
		RegWri	= 1'b1;
		MemWri	= 1'b0;
		BrTaken	= 1'b0;
		UncondBr = 1'bX;
		ALUOp		= 3'b010;
		Readmem  = 1'b0;
		ALUsrc1 	= 1'bX;
		enFlags  = 1'b1;
		WriteRd  = 1'b1;
		BR 		= 1'b0;
	end
	//ADDI: 244
	11'b1001000100x: begin
		Reg2Loc	= 1'bX;
		ALUsrc	= 1'b1;
		MemtoReg = 1'b0;
		RegWri	= 1'b1;
		MemWri	= 1'b0;
		BrTaken	= 1'b0;
		UncondBr = 1'bX;
		ALUOp		= 3'b010;
		Readmem  = 1'b0;
		ALUsrc1 	= 1'b1;
		enFlags  = 1'b0;
		WriteRd  = 1'b1;
		BR 		= 1'b0;
	end
	//SUBI: 344
	11'b1101000100x: begin
		Reg2Loc	= 1'bX;
		ALUsrc	= 1'b1;
		MemtoReg = 1'b0;
		RegWri	= 1'b1;
		MemWri	= 1'b0;
		BrTaken	= 1'b0;
		UncondBr = 1'bX;
		ALUOp		= 3'b011;
		Readmem  = 1'b0;
		ALUsrc1 	= 1'b1;
		enFlags  = 1'b0;
		WriteRd  = 1'b1;
		BR 		= 1'b0;
	end
	//SUBS: 758
	11'b11101011000: begin
		Reg2Loc	= 1'b1;
		ALUsrc	= 1'b0;
		MemtoReg = 1'b0;
		RegWri	= 1'b1;
		MemWri	= 1'b0;
		BrTaken	= 1'b0;
		UncondBr = 1'bX;
		ALUOp		= 3'b011;
		Readmem  = 1'b0;
		ALUsrc1 	= 1'bX;
		enFlags  = 1'b1;
		WriteRd  = 1'b1;
		BR 		= 1'b0;
	end
	//LDUR: 7C0
	11'b11111000010: begin
		Reg2Loc	= 1'bX;
		ALUsrc	= 1'b1;
		MemtoReg = 1'b1;
		RegWri	= 1'b1;
		MemWri	= 1'b0;
		BrTaken	= 1'b0;
		UncondBr = 1'bX;
		ALUOp		= 3'b010;
		Readmem  = 1'b1;
		ALUsrc1 	= 1'b0;
		enFlags  = 1'b0;
		WriteRd  = 1'b1;
		BR 		= 1'b0;
	end
	//STUR: 7C2
	11'b11111000000: begin
		Reg2Loc	= 1'b0;
		ALUsrc	= 1'b1;
		MemtoReg = 1'bX;
		RegWri	= 1'b0;
		MemWri	= 1'b1;
		BrTaken	= 1'b0;
		UncondBr = 1'bX;
		ALUOp		= 3'b010;
		Readmem  = 1'b1;
		ALUsrc1 	= 1'b0;
		enFlags  = 1'b0;
		WriteRd  = 1'bX;
		BR 		= 1'b0;
	end
	//B: 54
	11'b000101xxxxx: begin
		Reg2Loc	= 1'bX;
		ALUsrc	= 1'bX;
		MemtoReg = 1'bX;
		RegWri	= 1'b0;
		MemWri	= 1'b0;
		BrTaken	= 1'b1;
		UncondBr = 1'b1;
		ALUOp		= 3'bX;
		Readmem  = 1'bX;
		ALUsrc1 	= 1'bX;
		enFlags  = 1'b0;
		WriteRd  = 1'bX;
		BR 		= 1'b0;
	end
	//CBZ: B4
	11'b10110100xxx: begin
		Reg2Loc	= 1'b0;
		ALUsrc	= 1'b0;
		MemtoReg = 1'bX;
		RegWri	= 1'b0;
		MemWri	= 1'b0;
		BrTaken	= zero;
		UncondBr = 1'b0;
		ALUOp		= 3'b000;
		Readmem	= 1'bX;
		ALUsrc1 	= 1'bX;
		enFlags  = 1'b0;
		WriteRd  = 1'bX;
		BR 		= 1'b0;
	end
	
	//B.LT
	11'b01010100xxx: begin
		Reg2Loc	= 1'bX;
		ALUsrc	= 1'bX;
		MemtoReg = 1'bX;
		RegWri	= 1'b0;
		MemWri	= 1'b0;
		BrTaken  = flag[0]^flag[2] ;
		UncondBr = 1'b0;
		ALUOp		= 3'bX;
		Readmem  = 1'bX;
		ALUsrc1 	= 1'bX;
		enFlags  = 1'b0;
		WriteRd  = 1'bX;
		BR 		= 1'b0;
	end
	
	//BL: 
	11'b100101xxxxx: begin
		Reg2Loc	= 1'bX;
		ALUsrc	= 1'bX;
		MemtoReg = 1'bX;
		RegWri	= 1'b1;
		MemWri	= 1'b0;
		BrTaken	= 1'b1;
		UncondBr = 1'b1;
		ALUOp		= 3'bX;
		Readmem  = 1'bX;
		ALUsrc1 	= 1'bX;
		enFlags  = 1'b0;
		WriteRd  = 1'b0;
		BR 		= 1'b0;
	end
	
	//BR
	11'b11010110000: begin
		Reg2Loc	= 1'b0;
		ALUsrc	= 1'bX;
		MemtoReg = 1'bX;
		RegWri	= 1'b0;
		MemWri	= 1'b0;
		BrTaken	= 1'bX;
		UncondBr = 1'bX;
		ALUOp		= 3'bX;
		Readmem  = 1'bX;
		ALUsrc1 	= 1'bX;
		enFlags  = 1'b0;
		WriteRd  = 1'bX;
		BR 		= 1'b1;
	end
//
	default begin
		Reg2Loc	= 1'bX;
		ALUsrc	= 1'bX;
		MemtoReg = 1'bX;
		RegWri	= 1'bX;
		MemWri	= 1'bX;
		BrTaken	= 1'bX;
		UncondBr = 1'bX;
		ALUOp		= 3'bX;
		Readmem	= 1'bX;
		ALUsrc1 	= 1'bX;
		enFlags  = 1'bX;
		WriteRd  = 1'bX;
		BR 		= 1'bX;
	end
	endcase
	end
endmodule	
