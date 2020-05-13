`timescale 1ns / 1ns

module hdmi_loop(
	
	input				sys_clk_p,
	input				sys_clk_n,
	input				reset,
	
	output	[1 : 0]		hdmi_out_clk,
	output	[1 : 0]		hdmi_out_d0,
	output	[1 : 0]		hdmi_out_d1,
	output	[1 : 0]		hdmi_out_d2,
	
	input	[1 : 0]		hdmi_in_clk,
	input	[1 : 0]		hdmi_in_d0,
	input	[1 : 0]		hdmi_in_d1,
	input	[1 : 0]		hdmi_in_d2,
	
	inout				hdmi_in_sda,
	input				hdmi_in_scl,
	
	output				hdmi_in_hpa,
	output				LED
);
	
	wire				sys_clock;
	wire				global_rst;
	
	wire				dvi_pixel_clock_in;
	wire				dvi_bit_clock;
	wire				aPixelClkLckd;
	
	reg [23 : 0] rgb_din [2 : 0];
	reg [2 : 0] rgb_vsync;
	reg [2 : 0] rgb_hsync;
	reg [2 : 0] rgb_de;
	
	wire				hdmi_in_pixel_clk;
	
	wire				dvi_den;
	wire				dvi_hsync;
	wire				dvi_vsync;
	wire	[23 : 0]	dvi_data;
	
	wire DDC_SDA_T;
	wire DDC_SDA_O;
	
	reg [31 : 0] dely_cnt;
	reg hdmi_in_hpa_reg;
	
	assign hdmi_in_hpa = hdmi_in_hpa_reg;
	assign LED = global_rst;
	
	always@(posedge sys_clock)begin
		if(reset)begin
			dely_cnt <= 32'd0;
			hdmi_in_hpa_reg <= 1'b0;
		end else begin
			if(dely_cnt < 32'd199_999_999)begin
				dely_cnt <= dely_cnt + 1'b1;
			end
			
			if(dely_cnt >= 32'd199_999_999)begin
				hdmi_in_hpa_reg <= 1'b1;
			end
		end
	end
	
	
	wire pixel_clk;
	wire ddr_clk;
	
	IBUFGDS #(
		.DIFF_TERM("FALSE"),
		.IBUF_LOW_PWR("FALSE"),
		.IOSTANDARD("DIFF_SSTL15")
	) IBUFDS_inst (
		.I		(sys_clk_p),
		.IB		(sys_clk_n),
		.O		(sys_clock)
	);
	
	dvi_pll_v1 dvi_pll_v1_inst0(
		
		.sys_clk		(hdmi_in_pixel_clk),
		.reset			(reset),
		.pixel_clk		(pixel_clk),
		.ddr_clk		(ddr_clk),
		.locked			(global_rst)
	);
	
	dvi_tx_top dvi_tx_top_inst0(
		
		.pixel_clock		(pixel_clk),
		.ddr_bit_clock		(ddr_clk),
		.reset				(!global_rst),
		
		.den				(rgb_de[2]),
		.hsync				(rgb_hsync[2]),
		.vsync				(rgb_vsync[2]),
		.pixel_data			(rgb_din[2]),
		
		.tmds_clk			(hdmi_out_clk),
		.tmds_d0			(hdmi_out_d0),
		.tmds_d1			(hdmi_out_d1),
		.tmds_d2			(hdmi_out_d2)
	);
	
	assign hdmi_in_sda = (DDC_SDA_T) ? 1'bz : DDC_SDA_O;
	
	always@(posedge pixel_clk)begin
		
		rgb_vsync <= {rgb_vsync[1 : 0], dvi_vsync};
		rgb_hsync <= {rgb_hsync[1 : 0], dvi_hsync};
		rgb_de <= {rgb_de[1 : 0], dvi_den};
		
		rgb_din[2] <= rgb_din[1];
		rgb_din[1] <= rgb_din[0];
		rgb_din[0] <= dvi_data;
	end
	
	dvi2rgb #(
		
		.kEmulateDDC		(1'b1),
		.kRstActiveHigh		(1'b1),
		.kAddBUFG			(1'b1),
		.kClkRange			(1)
		
	)dvi2rgb_inst0(
		
		.PixelClk			(hdmi_in_pixel_clk),
		.SerialClk			(),
		.aPixelClkLckd		(),
		
		.DDC_SDA_I			(hdmi_in_sda),
		.DDC_SDA_O			(DDC_SDA_O),
		.DDC_SDA_T			(DDC_SDA_T),
		
		.DDC_SCL_I			(hdmi_in_scl),
		.DDC_SCL_O			(),
		.DDC_SCL_T			(),
		
		.TMDS_Clk_p			(hdmi_in_clk[1]),
		.TMDS_Clk_n			(hdmi_in_clk[0]),
		.TMDS_Data_p		({hdmi_in_d2[1], hdmi_in_d0[1], hdmi_in_d1[1]}),
		.TMDS_Data_n		({hdmi_in_d2[0], hdmi_in_d0[0], hdmi_in_d1[0]}),
		
		.RefClk				(sys_clock),
		.aRst				(reset),
		.pRst				(0),
		
		.vid_pData			(dvi_data),
		.vid_pVDE			(dvi_den),
		.vid_pHSync			(dvi_hsync),
		.vid_pVSync			(dvi_vsync)
	);
	
endmodule
