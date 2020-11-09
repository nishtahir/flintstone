`timescale 1ns / 1ps

/**
* Arithmetic Logic Unit
*/
module alu (
    input [15:0] x,
    input [15:0] y, 
    input zx,
    input nx,
    input zy,
    input ny,
    input f,
    input no,
    output [15:0] d_out,
    output zr,
    output ng
);

    wire[15:0] zx_wire;
    wire[15:0] nx_wire;

    wire[15:0] zy_wire;
    wire[15:0] ny_wire;

    wire[15:0] and_xy_wire;
    wire[15:0] add_xy_wire;

    wire[15:0] out_wire;

    assign zx_wire = zx ? 0 : x;
    assign nx_wire = nx ? ~zx_wire : zx_wire;
    
    assign zy_wire = zy ? 0 : y;
    assign ny_wire = ny ? ~zy_wire : zy_wire;
    
    assign and_xy_wire = nx_wire & ny_wire;
    
    // This is sufficient since we don't care about carry bits
    // and are not checking for or handling overflow
    assign add_xy_wire = nx_wire + ny_wire;

    assign out_wire = f ? add_xy_wire : and_xy_wire;
    assign d_out = no ? ~out_wire : out_wire;

    assign zr = ~| d_out;

    // out is negative - value is a signed integer check the sign bit or msb
    assign ng = d_out[15];
endmodule
