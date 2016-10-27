module swapbit(in,out);
input logic [31:0][63:0]in;
output logic [63:0][31:0] out;


logic [63:0][31:0]rin;
	
	integer i,j;


 always_comb begin
	for(i=0; i < 64; i++) begin
		for(j=0; j<32; j++) begin
		  rin[j] = in[j][i];
		end
	end
	
	out = rin;
	end
	endmodule
	
	
module swapbit_testbench();
logic [31:0][63:0]in;
logic [63:0][31:0] out;

swapbit s(.in,.out);
integer i;
 initial begin
in[13] = 64'd13;
 in[9] = 64'd1309;
 end
endmodule