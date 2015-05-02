`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:07:06 04/08/2015
// Design Name:   TEST
// Module Name:   C:/Users/toto/Downloads/PONG-master/TEST/testvga.v
// Project Name:  TEST
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: TEST
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module testvga;

	// Inputs
	reg clk;

	// Outputs
	wire hsync;
	wire vsync;
	wire [10:0] x;
	wire [10:0] y;
	wire [11:0] rgb;

	// Instantiate the Unit Under Test (UUT)
	TEST uut (
		.clk(clk), 
		.hsync(hsync), 
		.vsync(vsync), 
		.x(x), 
		.y(y), 
		.rgb(rgb)
	);

	initial begin
		// Initialize Inputs
		clk = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
	
	always #1 clk = ~clk;
      
endmodule

