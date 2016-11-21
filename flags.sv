`timescale 1ns/10ps

//setup flags for SUBS and ADDS
module flags (en, negative,zero,overflow,carry_out, reset, clk, q);
	input logic en,reset, clk, negative,zero,overflow,carry_out;
	output logic [3:0]q;
	
	logic [3:0]reData;
	
	D_FF d0 (q[0], reData[0] , reset, clk);
	D_FF d1 (q[1], reData[1] , reset, clk);
	D_FF d2 (q[2], reData[2] , reset, clk);
	D_FF d3 (q[3], reData[3] , reset, clk);
	
	//if SUBS and ADDS, replace the flags, if not, keep the old flags value
	mux2_1 m0 (en, {negative , q[0]},reData[0]);
	mux2_1 m1 (en, {zero		 , q[1]},reData[1]);
	mux2_1 m2 (en, {overflow , q[2]},reData[2]);
	mux2_1 m3 (en, {carry_out, q[3]},reData[3]);

endmodule