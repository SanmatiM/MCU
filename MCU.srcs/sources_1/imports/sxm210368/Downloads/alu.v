`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:15:15 09/22/2022 
// Design Name: 
// Module Name:    alu 
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
module alu(
    input [7:0] A,
    input [7:0] B,
    input [2:0] sh,
    input [3:0] fn_sel,
    output reg [7:0] d_out,
    output reg Z,
    output reg C,
    output reg N,
    output reg V
    );
    initial begin
        Z = 1'b0;
        V = 1'b0;
        N = 1'b0;
        C = 1'b0;
	end
always @ (A, B, fn_sel)
begin
    case(fn_sel)
        4'b0000: begin
            {C, d_out} = A+B;
        end
        4'b0001: begin 
            d_out = A-B;
            if(d_out[7]==1) 
                N = 1'b1;
        end 
        4'b0010: begin
            d_out = A * B; 
        end 
        4'b0011: begin 
            d_out = A & B;
        end  
        4'b0100: begin 
            d_out = A | B;
        end  
        4'b0101: begin 
            d_out = A ^ B;
        end    
        4'b0110: begin 
            d_out = ~(A | B);
        end    
        4'b0111: begin 
            d_out = ~(A & B);
        end
			4'b1000: begin  
            d_out = ~A;
        end 
		  4'b1001: begin  
            d_out = A << sh;
        end 
		  4'b1010: begin  
            d_out = A >> sh;
        end 
    endcase
    if(d_out == 0)
        Z = 1'b1;
    else
        Z= 0;
	N = 1'b0;
	C = 1'b0;
	if((A[7]==1 & B[7]==1 & d_out[7]==1) | (A[7]==0 & B[7]==0 & d_out[7]==1))
		V = 1'b1;
    end 
endmodule
