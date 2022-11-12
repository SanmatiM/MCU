`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/22/2022 01:42:04 PM
// Design Name: 
// Module Name: register
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


module register(
    input clk,
    input [7:0] data_in,
    input [2:0] a_address,
    input [2:0] b_address,
    input [2:0] d_address,
    input w_en,
    output [7:0] a_data_out,
    output [7:0] b_data_out
    );
    
parameter DATA_WIDTH = 8;
parameter DEPTH = 8;

reg [DATA_WIDTH-1:0] a_data_out;
reg [DATA_WIDTH-1:0] b_data_out;
reg [DATA_WIDTH-1:0] register [0:DEPTH-1];

always @ (posedge clk)
    begin
        if(w_en)
            begin
                register[3'b000] = 8'b0;
                register[d_address] = data_in;
            end else begin
            a_data_out = register[a_address];
            b_data_out = register[b_address];
            end
     end
           
endmodule
