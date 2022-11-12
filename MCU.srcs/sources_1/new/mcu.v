`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 09/22/2022 01:56:24 PM
// Design Name:
// Module Name: mcu
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


module mcu(
    input clk,
    input reset,
    input [7:0] data_in,
    output [7:0] out,
    output [7:0] data_out_address,
    output [7:0] data_out_color
);
    wire [7:0] instr_mem_adress;
    wire [16:0] instr_mem_out;
    wire RW;
    wire [2:0] DA;
    wire [1:0] MD;
    wire [1:0] BS;
    wire PS;
    wire MW;
    wire [3:0] FS;
    wire MA;
    wire MB;
    wire [2:0] AA;
    wire [2:0] BA;
    wire CS;
    wire [16:0] IR_out;
    wire [5:0] IM = IR_out[5:0];
    wire [2:0] SH = IR_out[2:0];
    wire [7:0] A_data;
    wire [7:0] B_data;
    wire [7:0] const_out;
    wire Z;
    wire C;
    wire V;
    wire N;
    wire [7:0] BrA;
    wire [7:0] data_mem_out;
    wire [1:0] BS1;
    wire PS1;
    wire [1:0] muxC_sel;
    wire [7:0] muxC_out;
    wire [7:0] PC_out;
    wire [7:0] PC_out_inc;
    wire [7:0] PC_1_out;
    wire [7:0] PC_2_out;
    wire [7:0] muxA_out;
    wire [7:0] muxB_out;
    wire [7:0] BusA_out;
    wire [7:0] BusB_out;
    wire [7:0] BusD_out;
    wire RW1;
    wire [2:0] DA1;
    wire [1:0] MD1;
    wire MW1;
    wire [3:0] FS1;
    wire [2:0] SH1;
    wire [7:0] RAA;
    wire [7:0] alu_out;
    wire n_xor_v;
    wire [7:0] muxD_in2;
    wire [7:0] muxD_in1;
    wire [7:0] muxD_in0;
    wire RW2;
    wire [2:0] DA2;
    wire [1:0] MD2;
    wire [7:0] muxD_out;
    wire DA_or_out;
    wire HA;
    wire HB;
    wire DHS;
    wire BHS;
    wire comp1_out;
    wire comp2_out;
    wire [7:0] RAA_out;
    wire IE;
    wire OE;
    wire OE1;
    wire [7:0] muxIn_out;
    wire IE_out;
    wire IE_1;
    reg RW_r2;
    reg [2:0] DA_r2;
    reg [1:0] MD_r2;
    reg [7:0] PC = 8'b0;
    reg [7:0] PC_1;
    reg [7:0] PC_2;
    reg [7:0] alu_out_r;
    reg [7:0] data_out_r;
    reg n_xor_v_r;
    reg [16:0] IR;
    reg [7:0] BusA;
    reg [7:0] BusB;
    reg [7:0] BusD;
    reg RW_r;
    reg [2:0] DA_r;
    reg [1:0] MD_r;
    reg [1:0] BS_r;
    reg PS_r;
    reg MW_r;
    reg [3:0] FS_r;
    reg [2:0] SH_r;
    reg [7:0] RAA_r;
    reg [7:0] data_out_color_r;
    reg [7:0] data_out_address_r;
    reg IE_r;
    reg OE_r;
    reg OE_r2;
    reg IE_r2;
    assign PC_out = PC;
    assign PC_1_out = PC_1;
    assign PC_2_out = PC_2;
    assign PC_out_inc = PC_out + 1'b1;
    assign instr_mem_adress = PC_out;
    assign IR_out = IR;
    assign BusA_out = BusA;
    assign BusB_out = BusB;
    assign BusD_out = BusD;
    assign RAA = BusA_out;
    assign RW1 = RW_r;
    assign RW2 = RW_r2;
    assign DA1 = DA_r;
    assign DA2 = DA_r2;
    assign MD1 = MD_r;
    assign MD2 = MD_r2;
    assign BS1 = BS_r;
    assign PS1 = PS_r;
    assign MW1 = MW_r;
    assign FS1 = FS_r;
    assign SH1 = SH_r;
    assign n_xor_v = N ^ V;
    assign muxD_in2 = {7'b0000000, n_xor_v_r};
    assign muxD_in0 = alu_out_r;
    assign muxD_in1 = data_out_r;
    assign out = BusD_out;
    assign DA_or_out = DA1[0] | DA1[1] | DA1[2];
    assign HA = comp1_out & (~ MA) & RW1 & DA_or_out;
    assign HB = comp2_out & (~ MB) & RW1 & DA_or_out;
    assign DHS = HA | HB;
    assign BHS = muxC_sel[0] | muxC_sel[1];
    assign RAA_out = RAA_r;
    assign data_out_address = data_out_address_r;
    assign data_out_color = data_out_color_r;
    assign IE_1 = IE_r;
    assign IE_out = IE_r2;
    assign OE1 = OE_r;
    
    assign muxC_sel = {BS1[1], ((PS1^Z)|BS1[1])& BS1[0]};
    muxC muxC(.out(muxC_out), .sel(muxC_sel),.b(BrA), .d(BrA), .c(RAA), .a(PC_out_inc));
    instruction_memory instr_mem(.addr(instr_mem_adress), .instr(instr_mem_out));
    instruction_decoder instr_dec(.instruction (IR_out),.RW(RW),.DA(DA),.MD(MD),.BS(BS),.PS(PS), .MW(MW), .FS(FS), .MA(MA),.MB(MB),.AA(AA), .BA(BA), .CS(CS), .IE(IE
        ),.OE(OE));
    register register1(.a_address(AA), .b_address(BA), .a_data_out(A_data), .b_data_out(B_data), .w_en(RW2), .d_address(DA2), .data_in(muxIn_out), .clk(clk));
    muxD muxD(.sel(MD2), .in0(muxD_in0), .in1(muxD_in1), .in2(muxD_in2), .out(muxD_out), .in3(RAA_out));
    data_memory data_mem1(.we(MW1), .addr(BusA_out), .data_in(BusB_out), .d_out(data_mem_out), .clk(clk));
    alu alu(.fn_sel(FS1), .sh(SH1), .A(BusA_out), .B(BusB_out), .Z(Z), .C(C), .N(N),.V(V), .d_out(alu_out));
    muxA muxA(.select(MA),.in1(A_data), .out(muxA_out), .in2(PC_1_out));
    muxB muxB(.select(MB), .in1(B_data), .in2(const_out), .out(muxB_out));
    constant constant_unit(.CS(CS), .in(IM), .out(const_out));
    adder adder(.A(PC_2_out), .B(BusB_out), .SUM(BrA));
    comparator comp1(.A(DA1), .B(AA), .out(comp1_out));
    comparator comp2(.A(DA1), .B(BA), .out(comp2_out));
    mux_in mux_input(.data_in(data_in), .busD(muxD_out),.sel_ie_wb(IE_out),.busD_out(muxIn_out));
    initial begin
        PC = 8'b0;
        RW_r2 = 0;
        DA_r2= 0;
        MD_r2= 0;
        PC_1= 0;
        PC_2= 0;
        alu_out_r= 0;
        data_out_r= 0;
        n_xor_v_r= 0;
        IR= 0;
        BusA= 0;
        BusB= 0;
        BusD= 0;
        RW_r= 0;
        DA_r= 0;
        MD_r= 0;
        BS_r= 0;
        PS_r= 0;
        MW_r= 0;
        FS_r= 0;
        SH_r= 0;
        IE_r = 0;
        IE_r2 = 0;
    end
    always @ (posedge clk) begin
        if(~reset == 1'b1) begin
            PC = 8'b0;
        end
        else begin
            if(DHS == 0 && BHS == 0) begin
                //fetch
                PC = muxC_out;

                //decode
                PC_1 = PC_out_inc;
                IR = instr_mem_out;

                //   execute
                BusA = muxA_out;
                BusB = muxB_out;
                PC_2 = PC_1_out;
                RW_r = RW;
                DA_r = DA;
                MD_r = MD;
                BS_r = BS;
                PS_r = PS;
                MW_r = MW;
                FS_r = FS;
                SH_r = SH;
                IE_r = IE;
                OE_r = OE;
               OE_r2 = OE1;

                //    #writeback
                n_xor_v_r = n_xor_v;
                alu_out_r = alu_out;
                data_out_r = data_mem_out;
                RAA_r = RAA;
                RW_r2 = RW1;
                DA_r2 = DA1;
                MD_r2 = MD1;
                IE_r2 = IE_1;
                BusD = muxD_out;
            end

            if(DHS == 1 && BHS == 0) begin
                //fetch
                PC = PC_out;

                //decode
                PC_1 = PC_1_out;
                IR = IR_out;

                //   execute
                BusA = muxA_out;
                BusB = muxB_out;
                PC_2 = PC_2_out;
                RW_r = ~DHS & RW;
                DA_r = {3{~DHS}} & DA;
                MD_r = MD;
                BS_r = {2{~DHS}} & BS;
                PS_r = PS;
                MW_r = ~DHS & MW;
                FS_r = FS;
                SH_r = SH;
                IE_r = IE;
                OE_r = OE;
                              OE_r2 = OE1;

                //    #writeback
                n_xor_v_r = n_xor_v;
                alu_out_r = alu_out;
                data_out_r = data_mem_out;
                RW_r2 = RW1;
                DA_r2 = DA1;
                MD_r2 = MD1;
                BusD = muxD_out;
                IE_r2 = IE_1;

            end

            if(DHS == 0 && BHS == 1) begin
                //fetch
                PC = muxC_out;

                //decode
                PC_1 = PC_out_inc;
                IR = instr_mem_out & ~BHS;

                //   execute
                BusA = muxA_out;
                BusB = muxB_out;
                PC_2 = PC_1_out;
                RW_r = ~BHS & RW;
                DA_r = DA;
                MD_r = MD;
                BS_r = ~BHS & BS;
                PS_r = PS;
                MW_r = ~BHS & MW;
                FS_r = FS;
                SH_r = SH;
                IE_r = IE;
                OE_r = OE;
               OE_r2 = OE1;

                //    #writeback
                n_xor_v_r = n_xor_v;
                alu_out_r = alu_out;
                data_out_r = data_mem_out;
                RW_r2 = RW1;
                DA_r2 = DA1;
                MD_r2 = MD1;
                BusD = muxD_out;
                IE_r2 = IE_1;

            end
            if(OE_r2 == 1) begin
                    data_out_color_r = BusB_out;
                    data_out_address_r = BusA_out;
            end 


        end
    end
endmodule