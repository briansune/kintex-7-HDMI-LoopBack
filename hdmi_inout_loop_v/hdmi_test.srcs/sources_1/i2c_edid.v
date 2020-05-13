
`default_nettype none

module i2c_edid(
	
	input wire		clk,
	input wire		rst,
	input wire		scl,
	inout wire		sda
);
	
	localparam EDID_IDLE		= 3'b000;
	localparam EDID_ADDR		= 3'b001;
	localparam EDID_ADDR_ACK	= 3'b010;
	localparam EDID_ADDR_ACK2	= 3'b011;
	localparam EDID_DATA		= 3'b100;
	localparam EDID_DATA_ACK	= 3'b101;
	localparam EDID_DATA_ACK2	= 3'b110;
	
	reg					hiz;
	reg					sda_out;
	reg		[4 : 0]		count;
	reg		[15 : 0]	rdata;
	reg		[7 : 0]		addr;
	reg		[7 : 0]		data;
	
	reg		[2 : 0]		edid_state;
	reg		[3 : 0]		scl_data;
	reg		[3 : 0]		sda_data;
	
	wire				scl_posedge;
	wire				scl_negedge;
	wire				scl_high;
	wire	[7 : 0]		dout;
	
	assign scl_posedge	= (scl_data == 4'b0111);
	assign scl_negedge	= (scl_data == 4'b1000);
	assign scl_high		= (scl_data == 4'b1111);
	
	
	edid_rom edid_rom_inst0(
		
		.clock		(clk),
		.address	(addr),
		.q			(dout)
	);
	
	assign sda = (hiz) ? 1'hz : sda_out;
	
	always@(posedge clk)begin
	
		if(rst)begin
			
			hiz <= 1'b1;
			sda_out <= 1'b0;
			count <= 5'd0;
			rdata <= 24'h0;
			addr <= 8'h0;
			data <= 8'h0;
			scl_data <= 4'h00;
			sda_data <= 4'h00;
			
			edid_state <= EDID_ADDR;
			
		end else begin
			
			scl_data <= {scl_data[2:0], scl};
			sda_data <= {sda_data[2:0], sda};
			
			if(sda_data == 4'b1000 && scl_high)begin
				count <= 5'd0;
				hiz <= 1'b1;
				sda_out <= 1'b0;
				edid_state <= EDID_ADDR;
			end else if(sda_data == 4'b0111 && scl_high)begin
				edid_state <= EDID_IDLE;
			end else
			
			case(edid_state)
				
				EDID_IDLE: begin
					hiz <= 1'b1;
					sda_out <= 1'b0;
				end
				
				EDID_ADDR: begin
					if(scl_posedge)begin
					count <= count + 5'd1;
					rdata  <= {rdata[14:0], sda};
					if(count[2:0] == 3'd7)begin
					if(count == 5'd15)
					addr <= {rdata[6:0],sda};
					edid_state <= EDID_ADDR_ACK;
					end
					end
				end
				
				EDID_ADDR_ACK: begin
					
					if(scl_negedge)begin
						
						hiz <= 1'b0;
						sda_out <= 1'b0;
						
						if(count == 5'd8 && rdata [0] == 1'b1)begin
							data <= dout;
							edid_state <= EDID_DATA;
						end else begin
							edid_state <= EDID_ADDR_ACK2;
						end
					end
				end
				
				EDID_ADDR_ACK2: begin
					
					if(scl_negedge)begin
						hiz <= 1'b1;
						edid_state <= EDID_ADDR;
					end
				end
				
				EDID_DATA: begin
					
					if(scl_negedge)begin
						
						count <= count + 5'd1;
						hiz <= 1'b0;
						sda_out <= data[7];
						data <= {data[6:0], 1'b0};
						
						if(count[2:0] == 3'd7)begin
							addr <= addr + 8'h1;
							edid_state <= EDID_DATA_ACK;
						end
					end
				end
				
				EDID_DATA_ACK: begin
					
					if(scl_negedge)begin
						data <= dout;
						hiz <= 1'b1;
						sda_out <= 1'b0;
						edid_state <= EDID_DATA_ACK2;
					end
				end
				
				EDID_DATA_ACK2: begin
					
					if(scl_posedge)begin
						if(sda)
							edid_state <= EDID_IDLE;
						else
							edid_state <= EDID_DATA;
					end
				end
				
				default: edid_state <= EDID_IDLE;
				
			endcase
		end
	end
	
endmodule
