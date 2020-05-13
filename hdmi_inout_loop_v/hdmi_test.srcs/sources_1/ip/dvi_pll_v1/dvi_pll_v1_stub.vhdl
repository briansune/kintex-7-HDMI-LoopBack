-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.2 (win64) Build 2258646 Thu Jun 14 20:03:12 MDT 2018
-- Date        : Sun May  3 06:59:03 2020
-- Host        : Briansune-PC running 64-bit Service Pack 1  (build 7601)
-- Command     : write_vhdl -force -mode synth_stub
--               c:/Users/Briansune/Desktop/hdmi_loop_v/hdmi_test.srcs/sources_1/ip/dvi_pll_v1/dvi_pll_v1_stub.vhdl
-- Design      : dvi_pll_v1
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7k325tffg900-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity dvi_pll_v1 is
  Port ( 
    pixel_clk : out STD_LOGIC;
    ddr_clk : out STD_LOGIC;
    reset : in STD_LOGIC;
    locked : out STD_LOGIC;
    sys_clk : in STD_LOGIC
  );

end dvi_pll_v1;

architecture stub of dvi_pll_v1 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "pixel_clk,ddr_clk,reset,locked,sys_clk";
begin
end;
