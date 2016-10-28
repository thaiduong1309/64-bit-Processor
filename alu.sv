`timescale 1ns/10ps

module alu (A,B,cntrl,result,negative,zero,overflow,carry_out);
	//data input from 2 register
	input logic		[63:0]	A, B;
	//control the ALU
	input logic		[2:0]		cntrl;
	//output of the ALU: result and all the flags
	output logic	[63:0]	result;
	output logic	negative, zero, overflow, carry_out ;
 
	logic [64:0]c;
	
	//select the value for the c[0] 
	//if ALUcntrl = 011 then c[0]=1
	parameter [7:0]c_in = 8'b00001000;
	mux8_1 m1 (cntrl,c_in,c[0]);
	
	
/*************************************************************/
//generate statement to make 64 of the Bit_clice
//carry out of one bit is carry in of the next bit 
	genvar i;
	generate
	for(i=0; i<64; i++) begin : eachDff
		
		Bit_Slice b1 (cntrl,A[i],B[i],c[i],c[i+1],result[i]); 
	
	end
 
 endgenerate

//wire negative signal with the output bit 63
	ZeroFlag z1 (zero,result);

//*************************************************************/

	assign negative = result[63];


	assign carry_out = c[64];

//overflow tells you that the previous carry and the last carry dont match
	xor xo1 (overflow, c[63], c[64]);

 
endmodule

// Test bench for ALU
`timescale 1ns/10ps

// Meaning of signals in and out of the ALU:

// Flags:
// negative: whether the result output is negative if interpreted as 2's comp.
// zero: whether the result output was a 64-bit zero.
// overflow: on an add or subtract, whether the computation overflowed if the inputs are interpreted as 2's comp.
// carry_out: on an add or subtract, whether the computation produced a carry-out.

// cntrl			Operation						Notes:
// 000:			result = B						value of overflow and carry_out unimportant
// 010:			result = A + B
// 011:			result = A - B
// 100:			result = bitwise A & B		value of overflow and carry_out unimportant
// 101:			result = bitwise A | B		value of overflow and carry_out unimportant
// 110:			result = bitwise A XOR B	value of overflow and carry_out unimportant

module alustim();

	parameter delay = 100000;

	logic		[63:0]	A, B;
	logic		[2:0]		cntrl;
	logic		[63:0]	result;
	logic					negative, zero, overflow, carry_out ;

	parameter ALU_PASS_B=3'b000, ALU_ADD=3'b010, ALU_SUBTRACT=3'b011, ALU_AND=3'b100, ALU_OR=3'b101, ALU_XOR=3'b110;
	

	alu dut (.A, .B, .cntrl, .result, .negative, .zero, .overflow, .carry_out);

	// Force %t's to print in a nice format.
	initial $timeformat(-9, 2, " ns", 10);

	integer i,k;
	logic [63:0] test_val;
	initial begin
	
//*************************************************************/
// PASSING VALUE cntrl =000
		$display("%t testing PASS_A operations", $time);
		cntrl = ALU_PASS_B;
		for (i=0; i<100; i++) begin
			A = $random(); B = $random();
			#(delay);
			assert(result == B && negative == B[63] && zero == (B == '0));
		end
	
//*************************************************************/	
// ADDING A+B cntrl = 010
		$display("%t testing addition", $time);
		cntrl = ALU_ADD;
		A = 64'h0000000000000001; B = 64'h0000000000000001;
		#(delay);
		assert(result == 64'h0000000000000002 && carry_out == 0 && overflow == 0 && negative == 0 && zero == 0);
		
		$display("%t testing addition", $time);
		cntrl = ALU_ADD;
		A = 64'hFFFFFFFFFFFFFFFF; B = 64'h0000000000000001;
		#(delay);
		assert(result == 64'h0000000000000000 && carry_out == 1 && overflow == 0 && negative == 0 && zero == 1);
		
		$display("%t testing addition", $time);
		cntrl = ALU_ADD;
		A = 64'h8000000000000000; B = 64'h8000000000000000;
		#(delay);
		assert(result == 64'd0 && carry_out == 1 && overflow == 1 && negative == 0 && zero == 1);
		
//*************************************************************/	
// SUBTRACTING A-B cntrl = 011
		$display("%t testing addition", $time);
		cntrl = ALU_SUBTRACT;
		A = 64'h0000000000000111; B = 64'h0000000000000111;
		#(delay);
		assert(result == 64'd0 && carry_out == 1 && overflow == 0 && negative == 0 && zero == 1);
		
		
		$display("%t testing addition", $time);
		cntrl = ALU_SUBTRACT;
		A = 64'h8000000000000000; B = 64'h0fffffffffffffff;
		#(delay);
		assert(result == 64'h7000000000000001 && carry_out == 1 && overflow == 1 && negative == 0 && zero == 0);
		
		$display("%t testing addition", $time);
		cntrl = ALU_SUBTRACT;
		for (i=0; i<13; i++) begin
			A = $random(); B = $random();
			#(delay);
			assert(result == (A - B) && negative == result[63] && zero == (result == '0));
		end
		
//*************************************************************/	
// AND GATE BIT BY BIT cntrl = 100
		$display("%t testing addition", $time);
		cntrl = ALU_AND;
		A = 64'hf01000000000000f; B = 64'h8fffffffffffffff;
		#(delay);
		assert(result == 64'h801000000000000f && /*carry_out == 1'bx && overflow == 1'bx &&*/ negative == 1 && zero == 0);
		
//*************************************************************/	
// OR GATE BIT BY BIT cntrl = 100
		$display("%t testing addition", $time);
		cntrl = ALU_OR;
		A = 64'h3000000000000000; B = 64'h5fffffffffff1309;
		#(delay);
		assert(result == 64'h7fffffffffff1309 && /*carry_out == 1'bx && overflow == 1'bx &&*/ negative == 0 && zero == 0);
		
//*************************************************************/	
// XOR GATE BIT BY BIT cntrl = 110
		$display("%t testing addition", $time);
		cntrl = ALU_XOR;
		A = 64'h80000000000000ef; B = 64'h9fffffffffffffff;
		#(delay);
		assert(result == 64'h1fffffffffffff10 && /*carry_out == 1'bx && overflow == 1'bx &&*/ negative == 0 && zero == 0);
		
//*************************************************************/	
// cntrl = 111 NOTHING HAPPENED
		$display("%t testing addition", $time);
		cntrl = 3'b111;
		A = 64'h8000000000000000; B = 64'h0fffffffffffffff;
		#(delay);
		//assert(result == 64'd0 && carry_out == 1 && overflow == 1 && negative == 0 && zero == 0);
		
//*************************************************************/	
// cntrl = 001 NOTHING HAPPENED
		$display("%t testing addition", $time);
		cntrl = 3'b001;
		A = 64'h8000000000000000; B = 64'h0fffffffffffffff;
		#(delay);
		//assert(result == 64'd0 && carry_out == 1 && overflow == 1 && negative == 0 && zero == 0);
		
	end
endmodule