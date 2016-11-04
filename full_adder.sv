`timescale 1 ps / 100 fs
//Name1: Duong Bui
//Name2: Devin Stoen

module full_adder(a, b, cin, sum, cout);
					 
	input logic a, b, cin;
	//two outputs (sum + cout)
	output logic cout, sum;
	//outputs from the xor, and and gates 
	logic [2:0]out;
	//logic gates constructing the adder
	xor #50 xorgate (out[0], a, b); // Sets output to XOR of inputs
	and #50 andgate (out[1], a, b);
	//xorgate to the sum
	xor #50 xorgate2 (sum, out[0], cin);
	and andgate2 (out[2], cin, out[0]);
	//or gate to the cout 
	or #50 orgate (cout, out[2], out[1]);
	
endmodule