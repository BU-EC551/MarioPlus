`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:16:25 04/08/2015 
// Design Name: 
// Module Name:    TEST 
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
module TEST(
    input clk,
	 //input wire  [1:0]  b1, b2,
	 //input wire effect,
	 input wire [5:0] hero,
	 output wire [7:0] joy,
    output wire hsync, vsync,
	 output wire [11:0] rgb,
	 output wire [4:0] LED,
	 output wire up,
	    
	 input wire _1LFT,
    input wire _1S3,
    input wire _1DN,
    input wire _1S2,
    input wire _1UP,
    input wire _1S1,
    input wire _START1,
    input wire _1RGT
    );
	 wire [11:0] rgb_now;
	 wire [10:0] x, y;
	 wire [1:0] btn1, btn2;
	 wire blank, effect, clk_temp, jump;
	 
	 joystick js(_1LFT,_1S3,_1DN,_1S2,_1UP,_1S1,_START1,_1RGT,joy);
	 clk_50 cc(clk, clk_temp);
	 //debounce d1(clk, b1[0], btn1[0]);
	 //debounce d2(clk, b1[1], btn1[1]);
	 //debounce d3(clk, b2[0], btn2[0]);
	 //debounce d4(clk, b2[1], btn2[1]);
	 //debounce d5(clk, effect, eff);
	 
	 
	 vga_sync v1(clk, hsync, vsync, x, y, blank);
	 
	 graph g(clk_temp, btn1, btn2, effect, jump, hero, x, y, rgb_now, LED, up);
	 
	 assign rgb = blank? 12'd0 : rgb_now;
	 assign btn1[0:0] = ~_1LFT;
	 assign btn1[1:1] = ~_1RGT;
	 assign btn2[0:0] = ~_1UP;
	 assign btn2[1:1] = ~_1DN;
	 assign effect = ~_1S3; // yellow
	 assign jump = ~_1S2; // blue


endmodule
