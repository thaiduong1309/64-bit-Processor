`timescale 1ns/10ps
module Bit_Slice(sel, a, b, cin, cout, sum);
					 
	input logic [2:0]sel;
	input logic a, b, cin;
	output logic sum, cout;
	
 	logic [7:0]in,carry_o;

/*************************************************************/
//call all the math in the ALU	
	
//cntrl			Operation						Notes:
// 000:			result = B						value of overflow and carry_out unimportant
// 010:			result = A + B
// 011:			result = A - B
// 100:			result = bitwise A & B		value of overflow and carry_out unimportant
// 101:			result = bitwise A | B		value of overflow and carry_out unimportant
// 110:			result = bitwise A XOR B	value of overflow and carry_out unimportant
	
	// result = b
	assign in[0] = b;
	// full adder result = a+ b
	full_adder 	fa		(a, b, cin, in[2], carry_o[2]);
	// subtract result = a+b
	subs 			sub	(a, b, cin, in[3], carry_o[3]);
	// and gate
	and #50		a1		(in[4], a, b);
	// or gate
	or  #50		o1		(in[5], a, b);
	//xor gate
	xor #50		xo1   (in[6], a, b);
	
/*************************************************************/
//8_1 mux will pick what value will be coming out base on the ALUcntrl	
	mux8_1 m81(sel,in,sum);
	mux8_1 m82(sel,carry_o,cout);
	
endmodule

//module Bit_Slice_testbench();
//	logic [2:0]sel;
//	logic a, b, cin;
//	logic sum, cout;
//	
//	Bit_Slice b1 (Bit_Slice(sel, a, b, cin, cout, sum);
//	integer i;
// initial begin
// in = 32'd1309; 
// for(i = 0; i <32; i++) begin
// sel[4:0] = i; #10;
// end
// end
//endmodule 
