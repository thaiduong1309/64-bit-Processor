`timescale 1 ps / 100 fs

module mux4_1(sel,in,out);
	input logic [1:0]sel;
	input logic [3:0]in;
	output logic out;
	
	logic [1:0]selout;
	
	mux2_1 m1(sel[0],in[1:0],selout[0]);
	mux2_1 m2(sel[0],in[3:2],selout[1]);
	mux2_1 m3(sel[1],selout,out);

endmodule