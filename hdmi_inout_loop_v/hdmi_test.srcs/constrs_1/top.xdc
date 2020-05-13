
########################################################################
#             J10
########################################################################

set_property IOSTANDARD TMDS_33 [get_ports {hdmi_out_clk[1]}]
set_property IOSTANDARD TMDS_33 [get_ports {hdmi_out_clk[0]}]
set_property IOSTANDARD TMDS_33 [get_ports {hdmi_out_d0[1]}]
set_property IOSTANDARD TMDS_33 [get_ports {hdmi_out_d0[0]}]
set_property IOSTANDARD TMDS_33 [get_ports {hdmi_out_d1[1]}]
set_property IOSTANDARD TMDS_33 [get_ports {hdmi_out_d1[0]}]
set_property IOSTANDARD TMDS_33 [get_ports {hdmi_out_d2[0]}]
set_property IOSTANDARD TMDS_33 [get_ports {hdmi_out_d2[1]}]

set_property PACKAGE_PIN F20 [get_ports {hdmi_out_clk[1]}]
set_property PACKAGE_PIN E19 [get_ports {hdmi_out_d0[1]}]
set_property PACKAGE_PIN D17 [get_ports {hdmi_out_d1[1]}]
set_property PACKAGE_PIN G18 [get_ports {hdmi_out_d2[1]}]


set_property IOSTANDARD TMDS_33 [get_ports {hdmi_in_clk[1]}]
set_property IOSTANDARD TMDS_33 [get_ports {hdmi_in_clk[0]}]
set_property IOSTANDARD TMDS_33 [get_ports {hdmi_in_d0[1]}]
set_property IOSTANDARD TMDS_33 [get_ports {hdmi_in_d0[0]}]
set_property IOSTANDARD TMDS_33 [get_ports {hdmi_in_d1[1]}]
set_property IOSTANDARD TMDS_33 [get_ports {hdmi_in_d1[0]}]
set_property IOSTANDARD TMDS_33 [get_ports {hdmi_in_d2[0]}]
set_property IOSTANDARD TMDS_33 [get_ports {hdmi_in_d2[1]}]


set_property PACKAGE_PIN D27 [get_ports {hdmi_in_clk[1]}]
set_property PACKAGE_PIN B28 [get_ports {hdmi_in_d0[1]}]
set_property PACKAGE_PIN B27 [get_ports {hdmi_in_d1[1]}]
set_property PACKAGE_PIN D26 [get_ports {hdmi_in_d2[1]}]

########################################################################
########################################################################

set_property PACKAGE_PIN K13 [get_ports reset]
set_property IOSTANDARD LVCMOS33 [get_ports reset]

set_property PACKAGE_PIN F28 [get_ports hdmi_in_sda]
set_property IOSTANDARD LVCMOS33 [get_ports hdmi_in_sda]
set_property PACKAGE_PIN G28 [get_ports hdmi_in_scl]
set_property IOSTANDARD LVCMOS33 [get_ports hdmi_in_scl]

set_property PACKAGE_PIN H24 [get_ports hdmi_in_hpa]
set_property IOSTANDARD LVCMOS33 [get_ports hdmi_in_hpa]


set_property IOSTANDARD DIFF_SSTL15 [get_ports sys_clk_p]
set_property IOSTANDARD DIFF_SSTL15 [get_ports sys_clk_n]
set_property PACKAGE_PIN AD12 [get_ports sys_clk_p]
set_property PACKAGE_PIN AD11 [get_ports sys_clk_n]

set_property PACKAGE_PIN J13 [get_ports LED]
set_property IOSTANDARD LVCMOS33 [get_ports LED]

########################################################################
########################################################################

set_property BITSTREAM.CONFIG.BPI_SYNC_MODE Type2 [current_design]
set_property BITSTREAM.CONFIG.EXTMASTERCCLK_EN div-1 [current_design]
set_property BITSTREAM.GENERAL.COMPRESS TRUE [current_design]
set_property CONFIG_VOLTAGE 2.5 [current_design]
set_property CFGBVS VCCO [current_design]

create_clock -period 6.734 [get_ports {hdmi_in_clk[1]}]
create_clock -period 5.000 -name sys_clk_in -waveform {0.000 2.500} [get_ports sys_clk_p]
create_generated_clock -name {hdmi_out_clk[1]} -source [get_pins dvi_tx_top_inst0/clock_phy/ODDR_inst/C] -divide_by 1 [get_ports {hdmi_out_clk[1]}]
