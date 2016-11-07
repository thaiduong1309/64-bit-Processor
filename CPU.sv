module CPU();

	//regfile
	logic [63:0]WriteData;
	logic [4:0]ReadRegister1, ReadRegister2, WriteRegister;
	logic clk,RegWrite,reset;
	logic [63:0]ReadData1, ReadData2;
	//ALU
	logic	[2:0]		cntrl;
	logic	[63:0]	result;
	logic	negative, zero, overflow, carry_out;
	//instrumem
	logic	[31:0]	instruction;
	logic	[63:0]	address;
	//datamem
	logic	write_enable;
	logic	read_enable;
	logic	[63:0]	write_data;
	logic	[3:0]		xfer_size;
	logic	[63:0]	read_data;
	
	//control
	logic Reg2Loc, ALUscr, MemtoReg, RegWri, MemWri, BrTaken, UncondBr, Readmem;
	
	//sign-extend result
	
	
	ReadRegister1 = instruction[9:5];
	mux5_2_1 mRD (Reg2Log,instruction[20:16],instruction[4:0],ReadRegister2);
	alu ()
	SignExtend
	Control c1 (instruction, zero, Reg2Loc, ALUscr, MemtoReg,
	RegWri, MemWri, BrTaken, UncondBr, ALUOp,Readmem);
	

	
dfa
endmodule