`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:34:42 11/10/2022
// Design Name:   mcu_top
// Module Name:   /home/011/s/sx/sxm210368/mcu_top/mcu_top_tb.v
// Project Name:  mcu_top
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: mcu_top
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module mcu_top_tb;

	// Inputs
	reg clk;
	reg reset;
	reg [8:0] fpga_in;

	// Outputs
	wire [9:0] fpga_out;

	// Instantiate the Unit Under Test (UUT)
	mcu_top uut (
		.clk(clk), 
		.reset(reset), 
		.fpga_in(fpga_in), 
		.fpga_out(fpga_out)
	);
always #50 clk =~clk;
	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 1;

		// Wait 100 ns for global reset to finish
      fpga_in = 9'b000101110;

		// Add stimulus here

	end
      
endmodule

