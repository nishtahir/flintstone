`timescale 1ns / 1ps

module top_test;

reg clk = 0;
reg reset = 1;

wire h_sync;
wire v_sync;

wire [3:0] red;
wire [3:0] green;
wire [3:0] blue;

/**
    input wire CLK_I,
    input wire reset,
    input wire [3:0] SW,       // switches
    output wire VGA_HS_O,       // horizontal sync output
    output wire VGA_VS_O,       // vertical sync output
    output wire [3:0] VGA_R,    // 4-bit VGA red output
    output wire [3:0] VGA_G,    // 4-bit VGA green output
    output wire [3:0] VGA_B,     // 4-bit VGA blue output
    output wire [3:0] LED
*/
top uut(
    .CLK_I(clk),
    .reset(reset),
    .SW(),
    .VGA_HS_O(h_sync),
    .VGA_VS_O(v_sync),
    .VGA_R(red),
    .VGA_G(green),
    .VGA_B(blue),
    .LED()
);

always #1 clk = ~clk;

endmodule
