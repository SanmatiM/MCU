`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/26/2022 12:44:02 AM
// Design Name: 
// Module Name: comparator
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


module comparator(
    input[2:0] A,
    input [2:0] B,
    output out
    );
    
wire temp0, temp1, temp2;
assign temp0 = ~(A[0] ^ B[0]);
assign temp1 = ~(A[1] ^ B[1]);
assign temp2 = ~(A[2] ^ B[2]);
assign out = temp0 & temp1 & temp2;
endmodule