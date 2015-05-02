`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Ryan Silva
// 
// Create Date: 03/03/2015 12:55:13 PM
// Module Name: arcade_wrapper
// Target Devices: Nexys3
// Description: Top-level JAMMA interface for EC551 arcade projects
// 
// Revision:
// Revision 0.01 - File Created
//////////////////////////////////////////////////////////////////////////////////
module joystick(
    //input _2LFT, 
    //input _2S3,
    //input _2DN,
    //input _2S2,
    //input _2UP,
    //input _2S1,
    //input _START,
    //input _2RGT,
    input _1LFT,
    input _1S3,
    input _1DN,
    input _1S2,
    input _1UP,
    input _1S1,
    input _START1,
    input _1RGT,
    //input sw[7:0], 	//select switch for board-level debugging 
    output [7:0] Led
    );

    // Uncomment the line below to debug the JAMMA interface at the board
    // level. You should see the 8 LEDs on the Nexys3 board light up and turn
    // off upon activating a switch
    assign Led = {_1S1,_START1,_1UP,_1DN,_1RGT,_1LFT,_1S2,_1S3};

endmodule

