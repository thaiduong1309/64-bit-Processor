`timescale 1ns/10ps

module CPU(clk, reset);
	input logic clk, reset;
	
	//regfile
	logic [63:0]WriteData1, WriteData;
	logic [4:0]ReadRegister1, ReadRegister2, WriteRegister;
	//logic RegWrite;
	logic [63:0]ReadData1, ReadData2;
	
	//ALU
	logic	[2:0]		cntrl;
	logic	[63:0]	A, B, result;
	logic	negative, zero, overflow, carry_out;
	
	//instrumem
	logic	[31:0]	instruction;
	logic	[63:0]	PC,PC_result,PC1,PCadd4;
	
	//datamem
	logic	write_enable;
	logic	read_enable;
	logic	[63:0]	write_data;
	//logic	[3:0]		xfer_size;
	logic	[63:0]	read_data;
	//control
	logic Reg2Loc, ALUsrc, MemtoReg, RegWrite, MemWri, BrTaken, UncondBr, Readmem, ALUsrc1, enFlags, WriteRd, BR;
	logic [2:0]ALUOp;
	logic [63:0]DAddr9, CondAddr19, BrAddr26, Imm12, ALUsrc_re;
	//
	logic [3:0] flag;
	
	
	//Program counter
	DFF_VAR cp (1'b1, PC, clk, reset, PC_result);
	mux64_2_1 mBR(BR, PC1, ReadData2, PC_result);
	calPC cal (PC,PC1, PCadd4, CondAddr19, BrAddr26, UncondBr, BrTaken);
	
	
	//get the instruction from instruction memory
	instructmem ins (PC,instruction,clk);
	
	//CONTROL: run the instruction through the control signal
	Control c1 (instruction, zero, Reg2Loc, ALUsrc, MemtoReg,
	RegWrite, MemWri, BrTaken, UncondBr, ALUOp, Readmem, ALUsrc1, enFlags, WriteRd, BR);
	
	//
	flags f (enFlags, negative,zero,overflow,carry_out, reset, clk, flag);
	
	//sign-extend result
	SignExtend SE (instruction, DAddr9, CondAddr19, BrAddr26, Imm12);
	
	//Execution step
	assign A = ReadData1;
	mux64_2_1 m3 (ALUsrc1, DAddr9, Imm12, ALUsrc_re);
	mux64_2_1 m4 (ALUsrc, ReadData2, ALUsrc_re, B);
	alu exc (A, B, ALUOp, result, negative, zero, overflow, carry_out);
	
	// Pick between datamem and result from ALU
	mux64_2_1 m5(MemtoReg, result, read_data, WriteData1);
	
	//REGFILE: Rd,Rn,Rm, RegWrite, Reg2Loc, Da, Db
	
	// Pick if store PC or WriteData into Rd;
	mux64_2_1 m6 (WriteRd, PCadd4, WriteData1, WriteData );
	
	assign ReadRegister1 = instruction[9:5];
	
	mux5_2_1 mRD (Reg2Loc,instruction[4:0],instruction[20:16],ReadRegister2);
	
	mux5_2_1 mWR (WriteRd, 5'b11110, instruction[4:0] ,WriteRegister);
	
	regfile r (ReadData1, ReadData2, WriteData, 
					 ReadRegister1, ReadRegister2, WriteRegister,
					 RegWrite, clk,reset);
	
	
	//
	

	
	
	//get the data from datamemmory result of the ALU
	assign write_data = ReadData2;
	assign write_enable = MemWri;
	assign read_enable = Readmem;
	datamem da (result, write_enable, read_enable, write_data, clk, 4'd8, read_data);
	
	
endmodule
`timescale 1ns/10ps

module CPU_testbench ();
	logic clk,reset;
	CPU dut (clk, reset);

parameter CLOCK_PERIOD  = 1000000; 

initial begin
clk <= 0; 

//clk <= 0;
forever #(CLOCK_PERIOD/2) clk <= ~clk;
end

initial begin 
reset <= 1;								@(posedge clk); 
reset <= 0;   							@(posedge clk);
											@(posedge clk); 
											@(posedge clk); 
											@(posedge clk); 
											@(posedge clk); 
											@(posedge clk); 
											@(posedge clk); 
											@(posedge clk); 
											@(posedge clk); 
											@(posedge clk); 
											@(posedge clk);
											@(posedge clk); 
											@(posedge clk); 
											@(posedge clk);
											@(posedge clk);
											@(posedge clk); 
											@(posedge clk); 
											@(posedge clk);
											@(posedge clk); 
											@(posedge clk); 
											@(posedge clk);	



$stop ; // End Simulation 
end  
endmodule