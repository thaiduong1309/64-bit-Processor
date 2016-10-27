`timescale 1 ps / 100 fs

module mux16_1(sel,in,out);
	input logic [3:0]sel;
	input logic [15:0]in;
	output logic out;
	
	logic [3:0]selout; 
	mux4_1 m1(sel[1:0],in[3:0],selout[0]);
	mux4_1 m2(sel[1:0],in[7:4],selout[1]);
	mux4_1 m3(sel[1:0],in[11:8],selout[2]);
	mux4_1 m4(sel[1:0],in[15:12],selout[3]);
	mux4_1 m5(sel[3:2],selout,out);
	
endmodule
	