`timescale 1 ps / 100 fs

module mux2_1 (sel,in,out);
	input logic sel;
	input logic [1:0]in;
	output logic out;
	
	logic notSel;
	logic out1,out2;
	not #50 n1(notSel,sel);
	
	and #50 a1 (out1,in[0],notSel);
	and #50 a2 (out2,in[1],sel);
	or #50 m1 (out,out1,out2);
endmodule