`timescale 1ns/10ps
module or_8 (out,in);
	input logic [7:0]in;
	output logic out;
	
	logic [1:0]re;
	
	or_4 o1(re[0],in[3:0]);
	or_4 o2(re[1],in[7:4]);
	or #50 o3(out,re[0],re[1]);

endmodule