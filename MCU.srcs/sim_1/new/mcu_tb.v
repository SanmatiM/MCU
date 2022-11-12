`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:30:03 10/06/2022
// Design Name:   mcu
// Module Name:   C:/Users/sxm210368/MCU/mcu_tb.v
// Project Name:  MCU
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: mcu
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module mcu_tb;

    // Inputs
    reg clk;
    reg reset;
    reg [7:0] data_in;
    // Outputs
    wire [7:0] out;
    wire [7:0] data_out_address;
    wire [7:0] data_out_color;

    // Instantiate the Unit Under Test (UUT)
    mcu uut (
        .clk(clk),
        .reset(reset),
        .data_in(data_in),
        .out(out),
        .data_out_color(data_out_color),
        .data_out_address(data_out_address)
    );
    always #50 clk = ~clk;

    initial begin
        // Initialize Inputs
        clk = 0;
        reset = 1;

        // Wait 100 ns for global reset to finish

        //		uut.register1.register[1] = 8'd0;
        //		uut.register1.register[2] = 8'd1;
        //		uut.instr_mem.mem[0] =17'b11000011001010xxx;//add
        /*#300
		reset = 1;
		uut.instr_mem.mem[1] =17'b10000110011001xxx;//and

		uut.instr_mem.mem[2] =17'b11000111100101xxx;//and
		
		uut.instr_mem.mem[3] =17'b10011111001xxxxxx;//mov
        uut.instr_mem.mem[4] =17'b10001001010000101;//add imm
        uut.instr_mem.mem[5] =17'b00111010100XXX010;//shift right
        uut.register1.register[4] = 8'd4;
        uut.register1.register[1] = 8'd5;
        uut.instr_mem.mem[6] =17'b11001111001xxxxxx;
        uut.register1.register[1] = 8'd5;
        uut.register1.register[7] = 8'd10;
        uut.instr_mem.mem[7] =17'b11101xxx111001xxx;//store
        */
        //        uut.instr_mem.mem[8] = 17'b00100xxx011xxxxxx;//jmr
        //        uut.instr_mem.mem[9] = 17'b00011xxxxxx000111;//jmp
        //        uut.instr_mem.mem[1] = 17'b01010xxxxxx000111;//bz

        //        uut.instr_mem.mem[1] = 17'b01110xxxxxx000111;//bnz
        //         data_in = 8'd15;
        //         uut.instr_mem.mem[0] = 17'b01001001xxxxxxxxx;//input       
        //        uut.instr_mem.mem[0] = 17'b01000xxx001010xxx;//output

        //Sample program
        data_in = 8'b00101110;
        uut.instr_mem.mem[0] = 17'b01001001xxxxxxxxx;
        //        uut.register1.register[1] = 8'H2E;
        uut.instr_mem.mem[1] = 17'b10111010001xxx100;
        uut.instr_mem.mem[2] = 17'b00111010010xxx100;
        uut.instr_mem.mem[3] = 17'b00111011001xxx100;
        uut.instr_mem.mem[4] = 17'b01000xxx010011xxx;
        uut.instr_mem.mem[5] = 17'b00100xxx000xxxxxx;

    end
endmodule

