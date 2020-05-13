set_property IOSTANDARD TMDS_33 [get_ports {hdmi_clk[1]}]
set_property IOSTANDARD TMDS_33 [get_ports {hdmi_clk[0]}]
set_property IOSTANDARD TMDS_33 [get_ports {hdmi_d0[1]}]
set_property IOSTANDARD TMDS_33 [get_ports {hdmi_d0[0]}]
set_property IOSTANDARD TMDS_33 [get_ports {hdmi_d1[1]}]
set_property IOSTANDARD TMDS_33 [get_ports {hdmi_d1[0]}]
set_property IOSTANDARD TMDS_33 [get_ports {hdmi_d2[0]}]
set_property IOSTANDARD TMDS_33 [get_ports {hdmi_d2[1]}]

#set_property PACKAGE_PIN AG29  [get_ports {hdmi_clk[1]}]
#set_property PACKAGE_PIN AC29 [get_ports {hdmi_d0[1]}]
#set_property PACKAGE_PIN AB29 [get_ports {hdmi_d1[1]}]
#set_property PACKAGE_PIN Y30 [get_ports {hdmi_d2[1]}]

set_property PACKAGE_PIN F20 [get_ports {hdmi_clk[1]}]
set_property PACKAGE_PIN E19 [get_ports {hdmi_d0[1]}]
set_property PACKAGE_PIN D17 [get_ports {hdmi_d1[1]}]
set_property PACKAGE_PIN G18 [get_ports {hdmi_d2[1]}]

set_property PACKAGE_PIN K13 [get_ports reset]
set_property IOSTANDARD LVCMOS33 [get_ports reset]


set_property IOSTANDARD DIFF_SSTL15 [get_ports sys_clk_p]
set_property IOSTANDARD DIFF_SSTL15 [get_ports sys_clk_n]
set_property PACKAGE_PIN AD12 [get_ports sys_clk_p]
set_property PACKAGE_PIN AD11 [get_ports sys_clk_n]





create_clock -period 5.000 -name sys_clk_in -waveform {0.000 2.500} [get_ports sys_clk_p]
#create_clock -period 1.347 -name dvi_ddr_clk -waveform {0.000 0.674} [get_nets dvi_bit_clock]
#create_clock -period 6.734 -name dvi_pixel_clk -waveform {0.000 3.367} [get_nets dvi_bit_clock]
