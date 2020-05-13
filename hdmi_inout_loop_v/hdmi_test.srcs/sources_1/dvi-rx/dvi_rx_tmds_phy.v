module dvi_rx_tmds_phy(
	
	input				pixel_clock,
	input				ddr_bit_clock,
	input				reset,
	
	input				pBitslip,
	input				pIDLY_LD,
	input				pIDLY_CE,
	input				pIDLY_INC,
	input	[4 : 0]		pIDLY_CNT,
	
	input	[1 : 0]		tmds_lane,
	output	[9 : 0]		data
);
	
	wire dq_tmds;
	wire icascade1;
	wire icascade2;
	wire sDataInDly;
	
	wire ddr_bit_clock_inv;
	
	assign ddr_bit_clock_inv = !ddr_bit_clock;
	
	IBUFDS #(
		.DIFF_TERM		("FALSE"),
		.IBUF_LOW_PWR	("FALSE"),
		.IOSTANDARD		("TMDS_33")
	)IBUFDS_inst0(
		.I	(tmds_lane[1]),
		.IB	(tmds_lane[0]),
		.O	(dq_tmds)
	);
	
	IDELAYE2 #(
		
		.CINVCTRL_SEL			("FALSE"),
		.DELAY_SRC				("IDATAIN"),
		.HIGH_PERFORMANCE_MODE	("TRUE"),
		.IDELAY_TYPE			("VARIABLE"),
		.IDELAY_VALUE			(0),
		.PIPE_SEL				("FALSE"),
		.REFCLK_FREQUENCY		(200.0),
		.SIGNAL_PATTERN			("DATA")
		
	)IDELAYE2_inst (
		.DATAOUT			(sDataInDly),
		.DATAIN				(1'b0),
		.C					(pixel_clock),
		.CE					(pIDLY_CE),
		.INC				(pIDLY_INC),
		.IDATAIN			(dq_tmds),
		.CINVCTRL			(1'b0),
		.CNTVALUEIN			(5'b00000),
		.LD					(pIDLY_LD),
		.CNTVALUEOUT		(pIDLY_CNT),
		.LDPIPEEN			(1'b0),
		.REGRST				(1'b0)
	);
	
	ISERDESE2 #(
		
		.DATA_RATE			("DDR"),
		.DATA_WIDTH			(10),
		.INTERFACE_TYPE		("NETWORKING"),
		.DYN_CLKDIV_INV_EN	("FALSE"),
		.DYN_CLK_INV_EN		("FALSE"),
		.NUM_CE				(2),
		.OFB_USED			("FALSE"),
		.IOBDELAY			("IFD"),
		.SERDES_MODE		("MASTER")
		
	)master_iserdes(
		
		.RST			(reset),
		
		.O				(),
		.Q1				(data[0]),
		.Q2				(data[1]),
		.Q3				(data[2]),
		.Q4				(data[3]),
		.Q5				(data[4]),
		.Q6				(data[5]),
		.Q7				(data[6]),
		.Q8				(data[7]),
		
		.SHIFTIN1		(1'b0),
		.SHIFTIN2		(1'b0),
		.SHIFTOUT1		(icascade1),
		.SHIFTOUT2		(icascade2),
		
		.BITSLIP		(pBitslip),
		
		.CE1			(1'b1),
		.CE2			(1'b1),
		
		.CLK			(ddr_bit_clock),
		.CLKB			(ddr_bit_clock_inv),
		.CLKDIV			(pixel_clock),
		.CLKDIVP		(1'b0),
		
		.D				(1'b0),
		.DDLY			(sDataInDly),
		
		.OCLK			(1'b0),
		.DYNCLKDIVSEL	(1'b0),
		.DYNCLKSEL		(1'b0),
		.OFB			(1'b0),
		.OCLKB			(1'b0)
	);
	
	ISERDESE2 #(
		
		.DATA_RATE			("DDR"),
		.DATA_WIDTH			(10),
		.INTERFACE_TYPE		("NETWORKING"),
		.DYN_CLKDIV_INV_EN	("FALSE"),
		.DYN_CLK_INV_EN		("FALSE"),
		.NUM_CE				(2),
		.OFB_USED			("FALSE"),
		.IOBDELAY			("IFD"),
		.SERDES_MODE		("SLAVE")
		
	)slave_iserdes(
		
		.RST			(reset),
		
		.O				(),
		.Q1				(),
		.Q2				(),
		.Q3				(data[8]),
		.Q4				(data[9]),
		.Q5				(),
		.Q6				(),
		.Q7				(),
		.Q8				(),
		
		.SHIFTIN1		(icascade1),
		.SHIFTIN2		(icascade2),
		.SHIFTOUT1		(),
		.SHIFTOUT2		(),
		
		.BITSLIP		(pBitslip),
		
		.CE1			(1'b1),
		.CE2			(1'b1),
		
		.CLK			(ddr_bit_clock),
		.CLKB			(ddr_bit_clock_inv),
		.CLKDIV			(pixel_clock),
		.CLKDIVP		(1'b0),
		
		.D				(1'b0),
		.DDLY			(1'b0),
		
		.OCLK			(1'b0),
		.DYNCLKDIVSEL	(1'b0),
		.DYNCLKSEL		(1'b0),
		.OFB			(1'b0),
		.OCLKB			(1'b0)
	);
	
endmodule
