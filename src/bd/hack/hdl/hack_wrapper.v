//Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2020.1 (win64) Build 2902540 Wed May 27 19:54:49 MDT 2020
//Date        : Thu Aug 20 23:15:08 2020
//Host        : DESKTOP-8Q9JG21 running 64-bit major release  (build 9200)
//Command     : generate_target hack_wrapper.bd
//Design      : hack_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module hack_wrapper
   (clk_100MHz,
    reset);
  input clk_100MHz;
  input reset;

  wire clk_100MHz;
  wire reset;

  hack hack_i
       (.clk_100MHz(clk_100MHz),
        .reset(reset));
endmodule
