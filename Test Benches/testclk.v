`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:28:27 04/13/2015
// Design Name:   clk_50
// Module Name:   C:/Users/toto/Downloads/PONG-master/TEST/testclk.v
// Project Name:  TEST
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: clk_50
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module testclk;

	// Inputs
	reg clkin;

	// Outputs
	wire clkout;

	// Instantiate the Unit Under Test (UUT)
	clk_50 uut (
		.clkin(clkin), 
		.clkout(clkout)
	);

	initial begin
		// Initialize Inputs
		clkin = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
	always #1 clkin = ~clkin;
      
endmodule

