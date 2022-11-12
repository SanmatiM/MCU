`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:18:12 09/22/2022 
// Design Name: 
// Module Name:    data_memory 
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
module data_memory(
input clk,
input [7:0] addr,
input we,
input [7:0] data_in,
output reg [7:0] d_out
);
parameter DATA_WIDTH = 8;
parameter ADDR_WIDTH = 8;
parameter DEPTH = 256;
reg [DATA_WIDTH-1 : 0] mem [0:DEPTH-1];

always @ (posedge clk)
	begin
		if (we) begin
			mem[addr] = data_in;
		end else begin
				d_out = mem[addr];
			end
	end
endmodule
