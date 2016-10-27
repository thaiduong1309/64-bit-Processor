`timescale 1 ps / 100 fs

module DFF_REG (en,q,reset, clk,data);
 
 output logic [31:0][63:0] q;
 //input logic [31:0][63:0] d;
 input logic [63:0]data;
 input logic clk, reset;
 input logic [31:0]en; 
 
 assign q[31]= 64'b0;
 genvar i;
 
 generate
	for(i=0; i< 31; i++) begin : eachDff
		
		DFF_VAR REG (.en(en[i]), .q(q[i]), .clk, .reset, .data);
		
	end
	
 endgenerate
	
endmodule 
	
module DFF_REG_testbench();
	
logic [31:0][63:0] q;
//logic [31:0][63:0] d;
logic clk, reset;
logic [31:0] en;
logic [63:0]data;
	
DFF_REG dut (.en,.q,.reset,.clk,.data);

 parameter CLOCK_PERIOD=100;
 initial begin
 
 clk <= 0;
 forever #(CLOCK_PERIOD/2) clk <= ~clk;
 end

initial begin
                                        @(posedge clk);
 reset <= 1;                            @(posedge clk);
 reset <= 0; 	                         @(posedge clk);
													 @(posedge clk);
 data<= 64'd1;      						 @(posedge clk);
                                        @(posedge clk);
                                        @(posedge clk);
													 @(posedge clk);
                                        @(posedge clk);
 data<=64'd13;									 @(posedge clk);
													 @(posedge clk);
												 	 @(posedge clk);
													 @(posedge clk);
													 @(posedge clk);
 data<=64'd1309;                       @(posedge clk);
													 @(posedge clk);
													 @(posedge clk);
													 @(posedge clk);
 $stop; // End the simulation.
 end
 endmodule