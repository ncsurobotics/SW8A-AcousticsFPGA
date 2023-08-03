// CC_AXI_MASTER -- AXI_MASTER + zero padding + config

module CC_AXI_MASTER (
    input clk,
    input reset_b,
    input Start_CC, // from top level state machine
    
    // Config channel -- to/from FFT_CONTROLLER module
    input Config_tready,
    output Config_tvalid,
    
    // S axis data channel -- to/from AXI_MASTER & internal datapath
    

    output wire TLAST,
    output wire TVALID,
    output 
);

// Zero pad handling

FFT_CONTROLLER fft_controller_inst( .clk(clk),
                                    .reset_b(reset_b),
                                    .Config_T_Ready(Config_tready),
                                    .FFT_Configure_tvalid(Config_tvalid),
                                    .FFT_Configure_Complete(fft_configure_complete)
);

AXI_MASTER axi_master_inst( .clk(clk),
                            .reset_b(reset_b),
                            .Input_Data()
);
    
endmodule

// CC Block Controller sits on AXI Master and zero-pads the data
//      ZERO_PAD = 0 --> front pad
//      ZERO_PAD = 1 --> back pad
module CC_BLOCK_CONTROLLER #(ZERO_PAD = 1) (
    input clk,
    input reset_b,
    input Start_CC,
    input FFT_Configure_Complete,
    input Count_Reached, // from AXI Master

    output reg AXI_Master_enable,
    output reg Data_or_Zero_sel,
    output wire TLAST
);

localparam
    FRONT_PAD = 1'b0,
    BACK_PAD = 1'b1;

localparam  
    SEND_ZERO = 1'b0,
    SEND_DATA = 1'b1;

localparam [2:0]
    IDLE            = 3'b000,
    WAIT_FOR_CONFIG = 3'b001,
    START_1ST_FRAME = 3'b010,
    FRAME_1         = 3'b011,
    START_2ND_FRAME = 3'b100,
    FRAME_2         = 3'b101;

reg [2:0] current_state, next_state;

always @ (posedge clk or negedge reset_b) begin
    if (!reset_b) current_state <= IDLE;
    else current_state <= next_state;
end

always @ (*) begin
    case (current_state)
        IDLE:
            AXI_Master_enable = 1'b0;
            Data_or_Zero_sel = SEND_ZERO;
            if (Start_CC) begin
                if (FFT_Configure_Complete) next_state <= START_1ST_FRAME;
                else next_state <= WAIT_FOR_CONFIG;
            end
            else next_state <= IDLE;
        WAIT_FOR_CONFIG:
            AXI_Master_enable = 1'b0;
            Data_or_Zero_sel = SEND_ZERO;
            if (FFT_Configure_Complete) next_state <= START_1ST_FRAME;
            else next_state <= WAIT_FOR_CONFIG;
        START_1ST_FRAME:
            AXI_Master_enable = 1'b1;
            Data_or_Zero_sel = (ZERO_PAD == FRONT_PAD) ? SEND_ZERO : SEND_DATA;
            next_state <= FRAME_1;
        FRAME_1:
            AXI_Master_enable = 1'b0;
            Data_or_Zero_sel = (ZERO_PAD == FRONT_PAD) ? SEND_ZERO : SEND_DATA;
            if (Count_Reached) next_state <= START_2ND_FRAME;
            else next_state <= FRAME_1;
        START_2ND_FRAME:
            AXI_Master_enable = 1'b1;
            Data_or_Zero_sel = (ZERO_PAD == FRONT_PAD) ? SEND_DATA : SEND_ZERO;
            next_state <= FRAME_2;
        FRAME_2:
            AXI_Master_enable = 1'b0;
            Data_or_Zero_sel = (ZERO_PAD == FRONT_PAD) ? SEND_DATA : SEND_ZERO;
            if (Count_Reached) next_state <= IDLE;
        default:
            AXI_Master_enable = 1'b0;
            Data_or_Zero_sel = SEND_ZERO;
            next_state <= IDLE; 
    endcase
end

assign TLAST = (current_state == FRAME_2) && Count_Reached;
    
endmodule