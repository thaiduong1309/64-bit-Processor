module enDecoder (enWri,in,out);
	input logic enWri;
	input logic in[4:0];
	output logic out[31:0];

assign out[0]  = enWri & ~in[4] & ~in[3] & ~in[2] & ~in[1] & ~in[0];
assign out[1]  = enWri & ~in[4] & ~in[3] & ~in[2] & ~in[1] &  in[0];
assign out[2]  = enWri & ~in[4] & ~in[3] & ~in[2] &  in[1] & ~in[0];
assign out[3]  = enWri & ~in[4] & ~in[3] & ~in[2] &  in[1] &  in[0];
assign out[4]  = enWri & ~in[4] & ~in[3] &  in[2] & ~in[1] & ~in[0];
assign out[5]  = enWri & ~in[4] & ~in[3] &  in[2] & ~in[1] &  in[0];
assign out[6]  = enWri & ~in[4] & ~in[3] &  in[2] &  in[1] & ~in[0];
assign out[7]  = enWri & ~in[4] & ~in[3] &  in[2] &  in[1] &  in[0];
assign out[8]  = enWri & ~in[4] &  in[3] & ~in[2] & ~in[1] & ~in[0];
assign out[9]  = enWri & ~in[4] &  in[3] & ~in[2] & ~in[1] &  in[0];
assign out[10] = enWri & ~in[4] &  in[3] & ~in[2] &  in[1] & ~in[0];
assign out[11] = enWri & ~in[4] &  in[3] & ~in[2] &  in[1] &  in[0];
assign out[12] = enWri & ~in[4] &  in[3] &  in[2] & ~in[1] & ~in[0];
assign out[13] = enWri & ~in[4] &  in[3] &  in[2] & ~in[1] &  in[0];
assign out[14] = enWri & ~in[4] &  in[3] &  in[2] &  in[1] & ~in[0];
assign out[15] = enWri & ~in[4] &  in[3] &  in[2] &  in[1] &  in[0];
assign out[16] = enWri &  in[4] & ~in[3] & ~in[2] & ~in[1] & ~in[0];
assign out[17] = enWri &  in[4] & ~in[3] & ~in[2] & ~in[1] &  in[0];
assign out[18] = enWri &  in[4] & ~in[3] & ~in[2] &  in[1] & ~in[0];
assign out[19] = enWri &  in[4] & ~in[3] & ~in[2] &  in[1] &  in[0];
assign out[20] = enWri &  in[4] & ~in[3] &  in[2] & ~in[1] & ~in[0];
assign out[21] = enWri &  in[4] & ~in[3] &  in[2] & ~in[1] &  in[0];
assign out[22] = enWri &  in[4] & ~in[3] &  in[2] &  in[1] & ~in[0];
assign out[23] = enWri &  in[4] & ~in[3] &  in[2] &  in[1] &  in[0];
assign out[24] = enWri &  in[4] &  in[3] & ~in[2] & ~in[1] & ~in[0];
assign out[25] = enWri &  in[4] &  in[3] & ~in[2] & ~in[1] &  in[0];
assign out[26] = enWri &  in[4] &  in[3] & ~in[2] &  in[1] & ~in[0];
assign out[27] = enWri &  in[4] &  in[3] & ~in[2] &  in[1] &  in[0];
assign out[28] = enWri &  in[4] &  in[3] &  in[2] & ~in[1] & ~in[0];
assign out[29] = enWri &  in[4] &  in[3] &  in[2] & ~in[1] &  in[0];
assign out[30] = enWri &  in[4] &  in[3] &  in[2] &  in[1] & ~in[0];
assign out[31] = enWri &  in[4] &  in[3] &  in[2] &  in[1] &  in[0];

endmodule

module enDecoder_testbench();
 logic [31:0] out;
 logic [4:0] in;
 logic enWri;
 

 enDecoder dut (enWri,in,out);

 // Try all combinations of inputs.
 integer i;
 initial begin
 enWri = 1'b1; 
 for(i = 0; i <32; i++) begin
 in[4:0] = i; #10;
 end
 end
endmodule 
