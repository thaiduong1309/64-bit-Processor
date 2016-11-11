`timescale 1 ps / 100 fs
module mux5_2_1 (sel, in0, in1, out);
	input logic sel;
	input logic [4:0] in0, in1;
	output logic [4:0]out;
	
	genvar k;
	
 generate
 for(k=0; k<5; k++) begin : eachDff
 mux2_1 m (sel,{in1[k],in0[k]},out[k]);
 end
 endgenerate
endmodule