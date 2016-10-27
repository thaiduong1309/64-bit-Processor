`timescale 1 ps / 100 fs

module DFF_VAR #(parameter WIDTH=64) (en,q, clk, reset, data );

 output logic [WIDTH-1:0] q;
 //input logic [WIDTH-1:0] d;
 input logic clk, reset, en;
 input logic [63:0]data;
 
 initial assert(WIDTH>0);
 
 logic [63:0]reData;
 
 
 genvar i;
 
 generate
	for(i=0; i<WIDTH; i++) begin : eachDff
 
		D_FF d1 (.q(q[i]), .d(reData[i]), .clk, .reset);
		mux2_1 m1 (en, {data[i],q[i]},reData[i]);
		
	end
 
 endgenerate
 
endmodule 

module DFF_VAR_testbench();
 logic clk, reset;
 logic [63:0] q;
 logic [63:0] d;

 DFF_VAR dut (q, d, clk, reset);

 // Set up the clock.
 
 parameter CLOCK_PERIOD=100;
 initial begin
 
 clk <= 0;
 forever #(CLOCK_PERIOD/2) clk <= ~clk;
 end

 // Set up the inputs to the design. Each line is a clock cycle.
 initial begin
                                        @(posedge clk);
 reset <= 1;                            @(posedge clk);
 reset <= 0; 	                         @(posedge clk);
													 @(posedge clk);
 d<= 64'd1;      								 @(posedge clk);
                                        @(posedge clk);
                                        @(posedge clk);
													 @(posedge clk);
                                        @(posedge clk);
 d<=64'd13;										 @(posedge clk);
													 @(posedge clk);
												 	 @(posedge clk);
													 @(posedge clk);
													 @(posedge clk);
 d<=64'd1309;                           @(posedge clk);
													 @(posedge clk);
													 @(posedge clk);
													 @(posedge clk);
 $stop; // End the simulation.
 end
endmodule 