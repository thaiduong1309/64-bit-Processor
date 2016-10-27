`timescale 1 ps / 100 fs

module mux6432_1(sel,in,out);
	input logic [4:0]sel;
	input logic [31:0][63:0]in;
	output logic [63:0]out;
	
	logic [63:0][31:0]rin;
	
	integer i,j;
	


 always_comb begin
	for(i=0; i < 64; i++) begin
		for(j=0; j<32; j++) begin
		  rin[i][j] = in[j][i];
		end
	end
	end

	genvar k;
 generate
 for(k=0; k<64; k++) begin : eachDff
 mux32_1 m (sel,rin[k],out[k]);
 end
 endgenerate
endmodule


module mux6432_1_testbench();
	logic [4:0]sel;
	logic [31:0][63:0] in;
	logic [63:0] out;
	
	 mux6432_1 m1 (.sel, .in, .out);

 // Try all combinations of inputs.
 integer i;
 initial begin
 in[13] = 64'd13;
 in[9] = 64'd1309;
 //for(i = 0; i <32; i++) begin
 sel[4:0] = 5'b01101; #10;
 end
endmodule 
	
		
		  