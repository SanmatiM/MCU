`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:07:52 09/22/2022 
// Design Name: 
// Module Name:    instruction_decoder 
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
module instruction_decoder(
    input [16:0] instruction,
    output reg RW,
    output reg [2:0] DA,
    output reg [1:0] MD,
    output reg [1:0] BS,
    output reg PS,
    output reg MW,
    output reg [3:0] FS,
    output reg MA,
    output reg MB,
    output reg [2:0] AA,
    output reg [2:0] BA,
    output reg CS,
    output reg IE,
    output reg OE
);

    wire [4:0] opcode;
    assign opcode = instruction[16:12];
    initial begin
        RW = 1'b0;
        DA = 3'b0;
        MD = 2'b0;
        BS = 2'b0;
        PS = 1'b0;
        MW = 1'b0;
        FS = 4'b0;
        MA = 1'b0;
        MB = 1'b0;
        AA = 3'b0;
        BA = 3'b0;
        CS = 1'b0;
        OE = 1'b0;

    end
    always @ (*) begin
        case(opcode)
            5'b11000: begin //ADD
                FS = 4'b0000;
                DA = instruction[11:9];
                AA = instruction[8:6];
                BA = instruction[5:3];
                MA = 1'b0;
                MB = 1'b0;
                MD = 2'b00;
                RW = 1'b1;
                IE = 1'b0;
                OE = 1'b0;

            end
            5'b10011: begin //MOV
                DA = instruction[11:9];
                AA = instruction[8:6];
                MA = 1'b0;
                MD = 2'b11;
                RW = 1'b1;
                IE = 1'b0;
                OE = 1'b0;

            end
            5'b11100: begin //NOT
                FS = 4'b1000;
                DA = instruction[11:9];
                AA = instruction[8:6];
                MA = 1'b0;
                MD = 2'b00;
                RW = 1'b1;
                IE = 1'b0;
                OE = 1'b0;

            end
            5'b11001: begin //LD
                DA = instruction[11:9];
                AA = instruction[8:6];
                MA = 1'b0;
                MD = 2'b01;
                RW = 1'b1;
                IE = 1'b0;
                OE = 1'b0;

            end
            5'b11101: begin //ST
                AA = instruction[8:6];
                BA = instruction[5:3];
                MA = 1'b0;
                MB = 1'b0;
                MD = 2'b01;
                MW = 1'b1;
                IE = 1'b0;
                OE = 1'b0;

            end
            5'b01010: begin //BZ
                BS = 2'b01;
                PS = 1'b0;
                MB = 1'b1;
                IE = 1'b0;
                OE = 1'b0;

            end
            5'b01110: begin //BNZ
                BS = 2'b01;
                PS = 1'b1;
                MB = 1'b1;
                IE = 1'b0;
                OE = 1'b0;

            end
            5'b00100: begin //JMR
                AA = instruction[8:6];
                MA = 1'b0;
                BS = 2'b10;
                IE = 1'b0;
                OE = 1'b0;

            end
            5'b00011: begin //JMP
                BS = 2'b11;
                MB = 1'b1;
                IE = 1'b0;
                OE = 1'b0;
            end
            5'b01101: begin //JML
                BS = 2'b00;
                DA = instruction[11:9];
                RW = 1'b1;
                IE = 1'b0;
                OE = 1'b0;
            end
            5'b10000: begin //AND
                FS = 4'b0011;
                DA = instruction[11:9];
                AA = instruction[8:6];
                BA = instruction[5:3];
                MA = 1'b0;
                MB = 1'b0;
                MD = 2'b00;
                RW = 1'b1;
                IE = 1'b0;
                OE = 1'b0;

            end
            5'b10001: begin //ADDI
                FS = 4'b0000;
                DA = instruction[11:9];
                AA = instruction[8:6];
                MA = 1'b0;
                MB = 1'b1;
                MD = 2'b00;
                RW = 1'b1;
                IE = 1'b0;
                OE = 1'b0;

            end
            5'b00111: begin //LRS
                FS = 4'b1010;
                DA = instruction[11:9];
                AA = instruction[8:6];
                MA = 1'b0;
                MD = 2'b00;
                RW = 1'b1;
                IE = 1'b0;
                OE = 1'b0;

            end
            5'b10111: begin //LSL
                FS = 4'b1001;
                DA = instruction[11:9];
                AA = instruction[8:6];
                MA = 1'b0;
                MD = 2'b00;
                RW = 1'b1;
                IE = 1'b0;
                OE = 1'b0;

            end
            5'b01001: begin //INPUT
                IE = 1'b1;
                DA = instruction[11:9];
                RW = 1'b1;
                OE = 1'b0;

            end
            5'b01000: begin //OUTPUT
                OE = 1'b1;
                AA = instruction[8:6];
                BA = instruction[5:3];
                RW = 1'b0;
            end
        endcase
    end
endmodule
