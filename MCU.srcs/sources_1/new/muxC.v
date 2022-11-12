`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/22/2022 02:13:00 PM
// Design Name: 
// Module Name: mu0C
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


module muxC(
    input [7:0] a,                 // 4-bit input called a
    input [7:0] b,                 // 4-bit input called b
    input [7:0] c,                 // 4-bit input called c
    input [7:0] d,                 // 4-bit input called d
    input [1:0] sel,               // input sel used to select between a,b,c,d
    output [7:0] out);             // 4-bit output based on input module alu 

   // When sel[1] is 0, (sel[0]? b:a) is selected and when sel[1] is 1, (sel[0] ? d:c) is taken
   // When sel[0] is 0, a is sent to output, else b and when sel[0] is 0, c is sent to output, else d
   assign out = sel[1] ? (sel[0] ? d : c) : (sel[0] ? b : a);

endmodule
