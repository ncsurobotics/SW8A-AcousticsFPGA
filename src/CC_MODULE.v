

module CC_MODULE( //TODO 
	input clk, reset_b, slow_clk, SPI_clk, Trigger, tx_ready,
    input [31:0] Channel_X_Ring_Buffer_in, Channel_Y_Ring_Buffer_in,
	output Channel_X_Send_Frame, Channel_Y_Send_Frame, Trigger_Persistant, CC_TX_en, SPI_en,
	output [7:0] Index_out
	);
	wire CC_DONE;

	CC_PIPELINE_CONTROLLER cc_pipeline_controller_inst(
    .clk(clk),
    .slow_clk(slow_clk),
    .SPI_clk(SPI_clk),
    .reset_b(reset_b),
    .Trigger(Trigger),
    .CC_Done(CC_Done),
    .Tx_Ready(tx_ready),
    //.RsTx(RsTx),
    
    .Trigger_Persistant(Trigger_Persistant),
    .Start_CC(Start_CC),
    .TX_en(CC_TX_en),
    //.TX_Write_en(CC_TX_Write_en),
    .SPI_en(SPI_en)
	);
	
	
CC_BLOCK cc_block_inst(
    .clk(clk),
    .reset_b(reset_b),
    .Start_CC(Start_CC),
    .Channel_X_Ring_Buffer_in(Channel_X_Ring_Buffer_in),
    .Channel_Y_Ring_Buffer_in(Channel_Y_Ring_Buffer_in),
    .Channel_X_Send_Frame(Channel_X_Send_Frame), // OR'd with Trigger_Send_Frame
    .Channel_Y_Send_Frame(Channel_Y_Send_Frame), // directly into Ring Buffer
    .Index_out(Index_out),
    .CC_Done(CC_Done)
	);
endmodule