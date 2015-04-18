`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:26:53 04/13/2015 
// Design Name: 
// Module Name:    clk_50 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module clk_50(
	input wire clkin,
	output wire clkout
    );
	 
	 reg temp;
	 
	 initial temp = 0;
	 
	 always @ (posedge clkin) begin
		temp = ~temp;
	 end
	 
	 assign clkout = temp;


endmodule
