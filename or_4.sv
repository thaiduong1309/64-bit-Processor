`timescale 1ns/10ps
module or_4 (out,in);
	input logic [3:0]in;
	output logic out;
	
	logic [1:0]re;
	
	or #50 o1(re[0],in[0],in[1]);
	or #50 o2(re[1],in[2],in[3]);
	or #50 o3(out,re[0],re[1]);

endmodule