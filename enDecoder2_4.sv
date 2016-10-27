`timescale 1 ps / 100 fs

module enDecoder2_4(en, in, out);
	input logic [1:0]in;
	input logic en;
	output logic [3:0]out;
	
	logic [1:0]nout;
	enDecoder1_2 n1(en,in[1],nout);
	
	enDecoder1_2 a1(nout[0],in[0],out[1:0]);
	enDecoder1_2 a2(nout[1],in[0],out[3:2]);
endmodule

