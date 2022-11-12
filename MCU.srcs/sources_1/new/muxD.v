`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/22/2022 02:24:21 PM
// Design Name: 
// Module Name: mu0D
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


module muxD(
    input [7:0] in0,
    input [7:0] in1,
    input [7:0] in2,
    input [7:0] in3,
    input [1:0] sel,
    output reg [7:0] out
    );
     always @ (in0 or in1 or in2 or sel) begin
      case (sel)
         2'b00 : out <= in0;
         2'b01 : out <= in1;
         2'b10 : out <= in2;
         2'b11 : out <= in3;

      endcase
   end

    
endmodule
