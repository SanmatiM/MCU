`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/22/2022 01:09:42 PM
// Design Name: 
// Module Name: instruction_memory
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


module instruction_memory(
    input [7:0] addr,
    output [16:0] instr
);
    reg [16:0] mem [0:255];
    initial begin
	  mem[0] = 17'b01001001xxxxxxxxx;
     mem[1] = 17'b10111010001xxx100;
     mem[2] = 17'b00111010010xxx100;
     mem[3] = 17'b00111011001xxx100;
     mem[4] = 17'b01000xxx010011xxx;
     mem[5] = 17'b00100xxx000xxxxxx;
	 end
    assign instr = mem[addr];
endmodule
