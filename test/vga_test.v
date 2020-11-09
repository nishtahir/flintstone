`timescale 1ns / 1ps

module vga_test;

reg clk = 0;
reg pix_clk = 0;
reg reset = 0;

wire h_sync;
wire v_sync;

vga1280x720 uut(
    .i_clk(clk),           // base clock
    .i_pix_stb(pix_clk),       // pixel clock strobe
    .i_rst(reset),           // reset: restarts frame
    .o_hs(h_sync),           // horizontal sync
    .o_vs(v_sync)           // vertical sync
);

always #1 clk = ~clk;
always #4 pix_clk = ~pix_clk;

endmodule
