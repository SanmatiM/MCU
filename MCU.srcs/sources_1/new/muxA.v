`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/22/2022 02:06:56 PM
// Design Name: 
// Module Name: mu0A
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module muxA(
    input [7:0] in1, input [7:0] in2, input select,output [7:0]out
    );
assign out = select ? in2 : in1;
endmodule
