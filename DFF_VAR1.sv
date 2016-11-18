`timescale 1 ps / 100 fs

module DFF_VAR1 #(parameter WIDTH=64) (en,q, clk, reset, data );

 output logic [WIDTH-1:0] q;
 //input logic [WIDTH-1:0] d;
 input logic clk, reset, en;
 input logic [63:0]data;
 
 initial assert(WIDTH>0);
 
 logic [63:0]reData;
 
 
 genvar i;
 
 generate
	for(i=0; i<WIDTH; i++) begin : eachDff
 
		D_FF1 d1 (.q(q[i]), .d(reData[i]), .clk, .reset);
		mux2_1 m1 (en, {data[i],q[i]},reData[i]);
		
	end
 
 endgenerate
 
endmodule 