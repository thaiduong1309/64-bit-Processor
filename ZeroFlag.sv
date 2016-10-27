`timescale 1ns/10ps
module ZeroFlag(out,in);
	input logic [63:0]in;
	output logic out;
	
	logic [1:0]re;
	logic b;
	
	or_32 o1(re[0],in[31:0]);
	or_32 o2(re[1],in[63:32]);
	or #50 o3(b,re[0],re[1]);
   not #50 (out,b);
	
endmodule