`timescale 1 ps / 100 fs

module mux32_1(sel,in,out);
	input logic [4:0]sel;
	input logic [31:0]in;
	output logic out;
	
	logic [1:0]selout;
	
	mux16_1 m1(sel[3:0],in[15:0],selout[0]);
	mux16_1 m2(sel[3:0],in[31:16],selout[1]);
	mux2_1 m3(sel[4],selout,out);

endmodule

module mux32_1_testbench();
 logic [31:0] in;
 logic [4:0] sel;
 logic out;
 

 mux32_1 m1 (.sel, .in, .out);

 // Try all combinations of inputs.
 integer i;
 initial begin
 in = 32'd1309; 
 for(i = 0; i <32; i++) begin
 sel[4:0] = i; #10;
 end
 end
endmodule 