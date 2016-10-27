`timescale 1 ps / 100 fs

module enDecoder1_2 (en, in, out);
	input logic in; 
	input logic en;
	output logic [1:0]out;
   logic notIn;  
	
	not #50 n1(notIn,in); 
   and #50 a1(out[0],en,notIn);  
	and #50 a2(out[1],en,in);
endmodule 