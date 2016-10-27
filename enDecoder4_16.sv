`timescale 1 ps / 100 fs

module enDecoder4_16(en, in, out);
	input logic en;
	input logic [3:0]in;
	output logic [15:0]out;

	logic [3:0]enout;
	enDecoder2_4 n1(en,in[3:2],enout);
	
	enDecoder2_4 a1(enout[0],in[1:0],out[3:0]);
	enDecoder2_4 a2(enout[1],in[1:0],out[7:4]);
	enDecoder2_4 a3(enout[2],in[1:0],out[11:8]);
	enDecoder2_4 a4(enout[3],in[1:0],out[15:12]);
endmodule
	