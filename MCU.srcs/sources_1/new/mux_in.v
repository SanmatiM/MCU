`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/02/2022 01:01:45 AM
// Design Name: 
// Module Name: mux_in
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


module mux_in(
input [7:0] busD,
input [7:0] data_in,
output [7:0] busD_out,
input sel_ie_wb
    );
    assign busD_out = sel_ie_wb ? data_in : busD;
endmodule
