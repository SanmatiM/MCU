`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/22/2022 03:30:52 PM
// Design Name: 
// Module Name: constant
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


module constant(
    input CS,
    input [5:0] in,
    output [7:0] out
    );
	 assign out = CS ? {in[5],in[5],in} : {2'b00, in};
endmodule
