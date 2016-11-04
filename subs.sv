//Name1: Duong Bui
//Name2: Devin Stoen
`timescale 1ns/10ps

module subs(a, b, cin, sum, cout);
					 
	input logic a, b, cin;
	//outputs to subtraction 
	output logic cout, sum;
	//input b for subtraction
	logic notb;
	//invert the b for the substraction.
	not #50 n1(notb, b);
	//logic [2:0]out;
	//call the full adder but with an inverted b.
	full_adder sub (a,notb,cin,sum,cout);
	
//	xor xorgate (out[0], a, notb); // Sets output to XOR of inputs
//	and andgate (out[1], a, notb);
//	xor xorgate2 (sum, out[0], cin);
//	and andgate2 (out[2], cin, out[0]);
//	or orgate (cout, out[2], out[1]);
	
endmodule