// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.2 (win64) Build 2258646 Thu Jun 14 20:03:12 MDT 2018
// Date        : Sun May  3 06:59:03 2020
// Host        : Briansune-PC running 64-bit Service Pack 1  (build 7601)
// Command     : write_verilog -force -mode synth_stub
//               c:/Users/Briansune/Desktop/hdmi_loop_v/hdmi_test.srcs/sources_1/ip/dvi_pll_v1/dvi_pll_v1_stub.v
// Design      : dvi_pll_v1
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7k325tffg900-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module dvi_pll_v1(pixel_clk, ddr_clk, reset, locked, sys_clk)
/* synthesis syn_black_box black_box_pad_pin="pixel_clk,ddr_clk,reset,locked,sys_clk" */;
  output pixel_clk;
  output ddr_clk;
  input reset;
  output locked;
  input sys_clk;
endmodule
