module mux64_2_1 (sel, in0, in1, out);
	input logic sel;
	input logic [63:0] in0, in1;
	output logic [63:0]out;
	
	genvar k;
	
 generate
 for(k=0; k<64; k++) begin : eachDff
 mux2_1 m (sel,{in1[k],in0[k]},out[k]);
 end
 endgenerate
endmodule