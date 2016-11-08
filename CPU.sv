module CPU(clk, reset);
	input logic clk, reset;
	
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
	logic	[63:0]	PC,PC_result;
	//datamem
	logic	write_enable;
	logic	read_enable;
	logic	[63:0]	write_data;
	logic	[3:0]		xfer_size;
	logic	[63:0]	read_data;
	
	//control
	logic Reg2Loc, ALUscr, MemtoReg, RegWri, MemWri, BrTaken, UncondBr, Readmem;
	
	//sign-extend result
	logic [63:0]DAddr9, CondAddr19, BrAddr26, Imm12;
	
	//Decide Rd,Rn,Rm
	ReadRegister1 = instruction[9:5];
	mux5_2_1 mRD (Reg2Log,instruction[20:16],instruction[4:0],ReadRegister2);
	
	//Execution step
	alu (ReadData1, ReadData2, ALUOp, result, negative, zero, overflow, carry_out);
	
	//
	SignExtend(instruction, DAddr9, CondAddr19, BrAddr26, Imm12);
	
	//run the instruction through the control signal
	Control c1 (instruction, zero, Reg2Loc, ALUscr, MemtoReg,
	RegWri, MemWri, BrTaken, UncondBr, ALUOp,Readmem);
	
	//get the data from datamemmory
	datamem da (address, write_enable, read_enable, write_data, clk, xfer_size, read_data);
	
	//get the instruction from instruction memory
	instructmem ins ();
	
	//Program counter
	DFF_VAR cp (1'b1, PC, clk, reset, PC_result);
	
//	always_ff @(posedge clk) begin
//		if (reset)
//			PC <=0;
//		else
//			PC <= PC_result;
//	end
	
	
endmodule