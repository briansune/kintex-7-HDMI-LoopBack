-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.2 (win64) Build 2258646 Thu Jun 14 20:03:12 MDT 2018
-- Date        : Mon May  4 20:17:00 2020
-- Host        : Briansune-PC running 64-bit Service Pack 1  (build 7601)
-- Command     : write_vhdl -force -mode funcsim
--               C:/Users/Briansune/Desktop/camera_dis/hdmi_test_v/hdmi_test.srcs/sources_1/ip/dvi_pll_v2/dvi_pll_v2_sim_netlist.vhdl
-- Design      : dvi_pll_v2
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7k325tffg900-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity dvi_pll_v2_dvi_pll_v2_clk_wiz is
  port (
    pixel_clock : out STD_LOGIC;
    dvi_bit_clock : out STD_LOGIC;
    reset : in STD_LOGIC;
    locked : out STD_LOGIC;
    sysclk : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of dvi_pll_v2_dvi_pll_v2_clk_wiz : entity is "dvi_pll_v2_clk_wiz";
end dvi_pll_v2_dvi_pll_v2_clk_wiz;

architecture STRUCTURE of dvi_pll_v2_dvi_pll_v2_clk_wiz is
  signal clkfbout_buf_dvi_pll_v2 : STD_LOGIC;
  signal clkfbout_dvi_pll_v2 : STD_LOGIC;
  signal pixel_clock_dvi_pll_v2 : STD_LOGIC;
  signal NLW_plle2_adv_inst_CLKOUT2_UNCONNECTED : STD_LOGIC;
  signal NLW_plle2_adv_inst_CLKOUT3_UNCONNECTED : STD_LOGIC;
  signal NLW_plle2_adv_inst_CLKOUT4_UNCONNECTED : STD_LOGIC;
  signal NLW_plle2_adv_inst_CLKOUT5_UNCONNECTED : STD_LOGIC;
  signal NLW_plle2_adv_inst_DRDY_UNCONNECTED : STD_LOGIC;
  signal NLW_plle2_adv_inst_DO_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  attribute BOX_TYPE : string;
  attribute BOX_TYPE of clkf_buf : label is "PRIMITIVE";
  attribute BOX_TYPE of clkout1_buf : label is "PRIMITIVE";
  attribute BOX_TYPE of plle2_adv_inst : label is "PRIMITIVE";
begin
clkf_buf: unisim.vcomponents.BUFG
     port map (
      I => clkfbout_dvi_pll_v2,
      O => clkfbout_buf_dvi_pll_v2
    );
clkout1_buf: unisim.vcomponents.BUFG
     port map (
      I => pixel_clock_dvi_pll_v2,
      O => pixel_clock
    );
plle2_adv_inst: unisim.vcomponents.PLLE2_ADV
    generic map(
      BANDWIDTH => "OPTIMIZED",
      CLKFBOUT_MULT => 37,
      CLKFBOUT_PHASE => 0.000000,
      CLKIN1_PERIOD => 5.000000,
      CLKIN2_PERIOD => 0.000000,
      CLKOUT0_DIVIDE => 10,
      CLKOUT0_DUTY_CYCLE => 0.500000,
      CLKOUT0_PHASE => 0.000000,
      CLKOUT1_DIVIDE => 2,
      CLKOUT1_DUTY_CYCLE => 0.500000,
      CLKOUT1_PHASE => 0.000000,
      CLKOUT2_DIVIDE => 1,
      CLKOUT2_DUTY_CYCLE => 0.500000,
      CLKOUT2_PHASE => 0.000000,
      CLKOUT3_DIVIDE => 1,
      CLKOUT3_DUTY_CYCLE => 0.500000,
      CLKOUT3_PHASE => 0.000000,
      CLKOUT4_DIVIDE => 1,
      CLKOUT4_DUTY_CYCLE => 0.500000,
      CLKOUT4_PHASE => 0.000000,
      CLKOUT5_DIVIDE => 1,
      CLKOUT5_DUTY_CYCLE => 0.500000,
      CLKOUT5_PHASE => 0.000000,
      COMPENSATION => "ZHOLD",
      DIVCLK_DIVIDE => 5,
      IS_CLKINSEL_INVERTED => '0',
      IS_PWRDWN_INVERTED => '0',
      IS_RST_INVERTED => '0',
      REF_JITTER1 => 0.010000,
      REF_JITTER2 => 0.010000,
      STARTUP_WAIT => "FALSE"
    )
        port map (
      CLKFBIN => clkfbout_buf_dvi_pll_v2,
      CLKFBOUT => clkfbout_dvi_pll_v2,
      CLKIN1 => sysclk,
      CLKIN2 => '0',
      CLKINSEL => '1',
      CLKOUT0 => pixel_clock_dvi_pll_v2,
      CLKOUT1 => dvi_bit_clock,
      CLKOUT2 => NLW_plle2_adv_inst_CLKOUT2_UNCONNECTED,
      CLKOUT3 => NLW_plle2_adv_inst_CLKOUT3_UNCONNECTED,
      CLKOUT4 => NLW_plle2_adv_inst_CLKOUT4_UNCONNECTED,
      CLKOUT5 => NLW_plle2_adv_inst_CLKOUT5_UNCONNECTED,
      DADDR(6 downto 0) => B"0000000",
      DCLK => '0',
      DEN => '0',
      DI(15 downto 0) => B"0000000000000000",
      DO(15 downto 0) => NLW_plle2_adv_inst_DO_UNCONNECTED(15 downto 0),
      DRDY => NLW_plle2_adv_inst_DRDY_UNCONNECTED,
      DWE => '0',
      LOCKED => locked,
      PWRDWN => '0',
      RST => reset
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity dvi_pll_v2 is
  port (
    pixel_clock : out STD_LOGIC;
    dvi_bit_clock : out STD_LOGIC;
    reset : in STD_LOGIC;
    locked : out STD_LOGIC;
    sysclk : in STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of dvi_pll_v2 : entity is true;
end dvi_pll_v2;

architecture STRUCTURE of dvi_pll_v2 is
begin
inst: entity work.dvi_pll_v2_dvi_pll_v2_clk_wiz
     port map (
      dvi_bit_clock => dvi_bit_clock,
      locked => locked,
      pixel_clock => pixel_clock,
      reset => reset,
      sysclk => sysclk
    );
end STRUCTURE;
