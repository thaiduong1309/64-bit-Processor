`timescale 1ns/10ps
module or_32 (out,in);
	input logic [31:0]in;
	output logic out;
	
	logic [1:0]re;
	
	or_16 o1(re[0],in[15:0]);
	or_16 o2(re[1],in[31:16]);
	or #50 o3(out,re[0],re[1]);

endmodule