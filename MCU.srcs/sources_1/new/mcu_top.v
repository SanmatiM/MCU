`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/03/2022 02:46:10 PM
// Design Name: 
// Module Name: mcu_top
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


module mcu_top(
    input clk,
    input reset,
    input [8:0] fpga_in,
    output [9:0] fpga_out
    );
    wire [7:0] data_in;
    wire [7:0] data_color;
    wire [7:0] data_address;
    wire out_en = 1'b1;
    mcu mcu(.clk(clk), .reset(reset), .data_in(data_in), .data_out_color(data_color), .data_out_address(data_address));
    mcu_io mcu_io(.clk(clk), .reset(reset),.fpga_in(fpga_in), .input_data_out(data_in), .output_data_in(data_color), .output_data_address(data_address), .fpga_out(fpga_out),.output_write_enable(1'b1));
    
endmodule
