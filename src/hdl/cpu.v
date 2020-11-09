`timescale 1ns / 1ps

/**
*   C instruction format
*      header             comp              dest       jump
*   [ 1, 1, 1,] [ a,c1,c2,c3,c4,c5,c6,] [d1,d2,d3,] [j1,j2,j3]
*   [15,14,13,] [12,11,10, 9, 8, 7, 6,] [ 5, 4, 3,] [ 2, 1, 0]
*/
module cpu(
    input wire clk,
    input wire reset,
    input wire[15:0] in_m,
    input wire[15:0] instruction,
    output wire[14:0] out_pc,
    output wire[14:0] address_m,
    output wire[15:0] d_out,
    output wire[15:0] out_m,
    output wire write_m
);

    wire load_a;
    wire pc_load;
    wire c_inst;

    wire jgt;
    wire jeq;
    wire jlt;
    
    wire alu_zr;
    wire alu_ng;

    wire[14:0] a_out;
    wire[15:0] pc;
    
    // This may function as an address or data register
    reg16 a_register(
        .clk(clk),
        .d_in(load_a ? instruction : out_m),
         // Load the register if it's an A instruction
         // or the destination bit is set to the A register
        .load(load_a | (c_inst & instruction[5])),
        .reset(reset),
        .d_out(a_out)
    );

    reg16 d_register(
        .clk(clk),
        .d_in(out_m),
        .load(c_inst & instruction[4]),
        .reset(reset),
        .d_out(d_out)
    );

    alu arithmetic_logic_unit(
        .x(d_out),
        .y(c_inst & instruction[12] ? in_m : a_out),
        .zx(instruction[11]),
        .nx(instruction[10]),
        .zy(instruction[9]),
        .ny(instruction[8]),
        .f(instruction[7]),
        .no(instruction[6]),
        .d_out(out_m),
        .zr(alu_zr),
        .ng(alu_ng)
    );

    counter16 program_counter(
        .d_in(a_out),
        .clk(clk),
        .reset(reset),
        .inc(1),
        .load(pc_load),
        .d_out(pc)
    );

    assign address_m = a_out[14:0];
    assign out_pc = pc[14:0];

    assign c_inst = instruction[15];
    assign load_a = ~instruction[15];

    // jump if alu result is positive 
    assign jgt = ~alu_zr & ~alu_ng & instruction[0];

    // jump if alu result is 0
    assign jeq = alu_zr & instruction[1];

    // jump if alu result is negative
    assign jlt = alu_ng & instruction[2];

    assign pc_load = c_inst & (jgt | jeq | jlt);

    assign write_m = c_inst & instruction[3]; 
    
endmodule