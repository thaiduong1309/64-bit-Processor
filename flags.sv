module flags (en, negative,zero,overflow,carry_out, reset, clk, q);
	input logic en,reset, clk, negative,zero,overflow,carry_out;
	output logic [3:0]q;
	
	logic [3:0]reData;
	
	D_FF d0 (q[0], reData[0] , reset, clk);
	D_FF d1 (q[1], reData[1] , reset, clk);
	D_FF d2 (q[2], reData[2] , reset, clk);
	D_FF d3 (q[3], reData[3] , reset, clk);
	
	mux2_1 m0 (en, {negative , 1'bX},reData[0]);
	mux2_1 m1 (en, {zero		 , 1'bX},reData[1]);
	mux2_1 m2 (en, {overflow , 1'bX},reData[2]);
	mux2_1 m3 (en, {carry_out, 1'bX},reData[3]);

endmodule