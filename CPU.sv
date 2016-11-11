`timescale 1 ps / 100 fs

module CPU(clk, reset);
	input logic clk, reset;
	
	//regfile
	logic [63:0]WriteData;
	logic [4:0]ReadRegister1, ReadRegister2, WriteRegister;
	logic RegWrite;
	logic [63:0]ReadData1, ReadData2;
	//ALU
	logic	[2:0]		cntrl;
	logic	[63:0]	A, B, result;
	logic	negative, zero, overflow, carry_out;
	//instrumem
	logic	[31:0]	instruction;
	logic	[63:0]	PC,PC_result;
//	//datamem
//	logic	write_enable;
//	logic	read_enable;
//	logic	[63:0]	write_data;
//	logic	[3:0]		xfer_size;
//	logic	[63:0]	read_data;
	//control
	logic Reg2Loc, ALUsrc, MemtoReg, RegWri, MemWri, BrTaken, UncondBr, Readmem, ALUsrc1;
	logic [2:0]ALUOp;
	logic [63:0]DAddr9, CondAddr19, BrAddr26, Imm12, ALUsrc_re;
	
	
	//Program counter
	DFF_VAR cp (1'b1, PC, clk, reset, PC_result);
	calPC cal (PC,PC_result, CondAddr19, BrAddr26, UncondBr, BrTaken);
	
	
	//get the instruction from instruction memory
	instructmem ins (PC,instruction,clk);
	
	//CONTROL: run the instruction through the control signal
	Control c1 (instruction[31:21], zero, Reg2Loc, ALUsrc, MemtoReg,
	RegWri, MemWri, BrTaken, UncondBr, ALUOp, Readmem, ALUsrc1);
	
	//sign-extend result
	SignExtend SE (instruction, DAddr9, CondAddr19, BrAddr26, Imm12);
	
	//REGFILE: Rd,Rn,Rm, RegWrite, Reg2Loc, Da, Db
	assign ReadRegister1 = instruction[9:5];
	mux5_2_1 mRD (Reg2Loc,instruction[20:16],instruction[4:0],ReadRegister2);
	regfile r (ReadData1, ReadData2, WriteData, 
					 ReadRegister1, ReadRegister2, WriteRegister,
					 RegWrite, clk,reset);
	
	//Execution step
	assign A = ReadData1;
	mux64_2_1 m3 (ALUsrc1, DAddr9, Imm12, ALUsrc_re);
	mux64_2_1 m4 (ALUsrc, ReadData2, ALUsrc_re, B);
	alu exc (A, B, ALUOp, result, negative, zero, overflow, carry_out);
	
	//
	
	
	
	
	//get the data from datamemmory result of the ALU
//	//assign write_data = ReadData2;
//	//datamem da (result, write_enable, read_enable, write_data, clk, 4'd4, read_data);
	
	
	
	
	
//	always_ff @(posedge clk) begin
//		if (reset)
//			PC <=0;
//		else
//			PC <= PC_result;
//	end
	
	
endmodule

module CPU_testbench ();
	logic clk,reset;
	
	parameter ClockDelay = 5000;
	
	CPU cp(clk,reset);
	initial $timeformat(-9, 2, " ns", 10);

	initial begin // Set up the clock
		clk <= 0;
		forever #(ClockDelay/2) clk <= ~clk;
	end
endmodule