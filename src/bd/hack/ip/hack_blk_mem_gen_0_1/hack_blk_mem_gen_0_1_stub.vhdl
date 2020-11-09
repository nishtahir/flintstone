-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2020.1 (win64) Build 2902540 Wed May 27 19:54:49 MDT 2020
-- Date        : Thu Aug 20 23:16:42 2020
-- Host        : DESKTOP-8Q9JG21 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               c:/Users/Nish/Developer/vivado/flintstone/src/bd/hack/ip/hack_blk_mem_gen_0_1/hack_blk_mem_gen_0_1_stub.vhdl
-- Design      : hack_blk_mem_gen_0_1
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a35ticsg324-1L
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity hack_blk_mem_gen_0_1 is
  Port ( 
    clka : in STD_LOGIC;
    addra : in STD_LOGIC_VECTOR ( 14 downto 0 );
    douta : out STD_LOGIC_VECTOR ( 15 downto 0 )
  );

end hack_blk_mem_gen_0_1;

architecture stub of hack_blk_mem_gen_0_1 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clka,addra[14:0],douta[15:0]";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "blk_mem_gen_v8_4_4,Vivado 2020.1";
begin
end;
