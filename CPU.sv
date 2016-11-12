`timescale 1 ps / 100 fs

module CPU(clk, reset);
	input logic clk, reset;
	
	//regfile
	logic [63:0]WriteData;
	logic [4:0]ReadRegister1, ReadRegister2, WriteRegister;
	//logic RegWrite;
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
	logic	[63:0]	read_data;
	//control
	logic Reg2Loc, ALUsrc, MemtoReg, RegWrite, MemWri, BrTaken, UncondBr, Readmem, ALUsrc1;
	logic [2:0]ALUOp;
	logic [63:0]DAddr9, CondAddr19, BrAddr26, Imm12, ALUsrc_re;
	
	
	//Program counter
	DFF_VAR cp (1'b1, PC, clk, reset, PC_result);
	calPC cal (PC,PC_result, CondAddr19, BrAddr26, UncondBr, BrTaken);
	
	
	//get the instruction from instruction memory
	instructmem ins (PC,instruction,clk);
	
	//CONTROL: run the instruction through the control signal
	Control c1 (instruction, zero, Reg2Loc, ALUsrc, MemtoReg,
	RegWrite, MemWri, BrTaken, UncondBr, ALUOp, Readmem, ALUsrc1);
	
	//sign-extend result
	SignExtend SE (instruction, DAddr9, CondAddr19, BrAddr26, Imm12);
	
	//REGFILE: Rd,Rn,Rm, RegWrite, Reg2Loc, Da, Db
	assign ReadRegister1 = instruction[9:5];
	mux5_2_1 mRD (Reg2Loc,instruction[4:0],instruction[20:16],ReadRegister2);
	
	assign WriteRegister = instruction[4:0];
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
	mux64_2_1 m5(MemtoReg, result, read_data, WriteData);
	
	
	
	
//	always_ff @(posedge clk) begin
//		if (reset)
//			PC <=0;
//		else
//			PC <= PC_result;
//	end
	
	
endmodule

module CPU_testbench ();
	logic clk,reset;
	CPU dut (clk, reset);

parameter CLOCK_PERIOD  = 1000000; 

initial begin
clk <= 0; 

forever # (CLOCK_PERIOD  ) clk <= ~clk; 

end 

initial begin 

reset <= 1;								@(posedge clk);
											@(posedge clk); 
											@(posedge clk); 
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



$stop ; // End Simulation 
end  
endmodule