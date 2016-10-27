`timescale 1ns/10ps
module or_16 (out,in);
	input logic [15:0]in;
	output logic out;
	
	logic [1:0]re;
	
	or_8 o1(re[0],in[7:0]);
	or_8 o2(re[1],in[15:8]);
	or #50 o3(out,re[0],re[1]);

endmodule