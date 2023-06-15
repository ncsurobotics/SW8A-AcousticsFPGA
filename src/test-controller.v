// March 11 pool test controller
// submodules: SIPO_Controller, counter, Test_State_Machine

module Test_Controller (
                            input clk,
                            input reset_b,
							input Rx_Data_Ready,
							input Tx_Ready_To_Send,
							
							output reg Byte_To_Send_Sel,
							output reg Tx_en,
							output reg Hold_Data_Sel
);
	reg [2:0] cstate, nstate;

	parameter [2:0]
		IDLE = 3'b000,
		ENABLE_LSB = 3'b001,
		SEND_LSB = 3'b010,
		ENABLE_MSB = 3'b011,
		SEND_MSB = 3'b100;
		
	parameter
		MSB = 1'b0,
		LSB = 1'b1;
	
	
	always @ (posedge clk) begin
		if(!reset_b) begin
			cstate <= IDLE;
		end
		else begin
			cstate <= nstate;
		end
	end
	
	always @ (*) begin
		case(cstate)
			IDLE: begin
				nstate <= Rx_Data_Ready ? ENABLE_LSB:IDLE;
				Byte_To_Send_Sel <= LSB;
				Hold_Data_Sel <= 1'b0;
				Tx_en <= 1'b0;
			end
			ENABLE_LSB: begin
				nstate <= Tx_Ready_To_Send ? ENABLE_LSB:SEND_LSB;
				Byte_To_Send_Sel <= LSB;
				Hold_Data_Sel <= 1'b1;
				Tx_en <= 1'b1;
			end
			SEND_LSB: begin
				nstate <= Tx_Ready_To_Send ? ENABLE_MSB:SEND_LSB;
				Byte_To_Send_Sel <= LSB;
				Hold_Data_Sel <= 1'b1;
				Tx_en <= 1'b0;
			end
			ENABLE_MSB: begin
				nstate <= Tx_Ready_To_Send ? ENABLE_MSB:SEND_MSB;
				Byte_To_Send_Sel <= MSB;
				Hold_Data_Sel <= 1'b1;
				Tx_en <= 1'b1;
			end
			SEND_MSB: begin
				nstate <= Tx_Ready_To_Send ? IDLE:SEND_MSB;
				Byte_To_Send_Sel <= MSB;
				Hold_Data_Sel <= 1'b1;
				Tx_en <= 1'b0;
			end
			default: begin
				nstate <= IDLE;
				Byte_To_Send_Sel <= LSB;
				Hold_Data_Sel <= 1'b0;
				Tx_en <= 1'b0;
			end
		
		endcase
	end

endmodule