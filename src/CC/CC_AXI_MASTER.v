// CC_AXI_MASTER -- AXI_MASTER + zero padding + config

module CC_AXI_MASTER #(ZERO_PAD = 1) (
    input clk,
    input reset_b,
    input Start_CC, // from top level state machine
    
    // Config channel -- to/from FFT_CONTROLLER module
    input Config_tready,
    output Config_tvalid,
    
    // S axis data channel -- to/from AXI_MASTER & internal datapath
    input Data_tready,
    output Data_tvalid,
    output [31:0] Data_tdata,
    output Data_tlast,

    // To/from Ring Buffer
    input [31:0] Input_Data_From_Ring_Buffer,
    output Send_Frame
);

// Internal wires
wire axi_master_enable;
wire send_frame_axi_master; // AXI Master output
wire count_reached_axi_master;
wire fft_configure_complete;
wire data_or_zero_sel;

// Zero pad handling
localparam  
    SEND_ZERO = 1'b0,
    SEND_DATA = 1'b1;

wire [31:0] input_data_with_padding;
assign input_data_with_padding = (data_or_zero_sel == SEND_DATA) ? Input_Data_From_Ring_Buffer : 32'd512;
assign Send_Frame = (data_or_zero_sel == SEND_DATA) ? send_frame_axi_master : 1'b0;

FFT_CONTROLLER fft_controller_inst( .clk(clk),
                                    .reset_b(reset_b),
                                    .Config_T_Ready(Config_tready),
                                    .FFT_Configure_tvalid(Config_tvalid),
                                    .FFT_Configure_Complete(fft_configure_complete)
);

CC_BLOCK_CONTROLLER #(.ZERO_PAD(ZERO_PAD)) cc_block_controller_inst(
    .clk(clk),
    .reset_b(reset_b),
    .Start_CC(Start_CC),
    .FFT_Configure_Complete(fft_configure_complete),
    .Count_Reached(count_reached_axi_master),

    .AXI_Master_enable(axi_master_enable),
    .Data_or_Zero_sel(data_or_zero_sel),
    .TLAST(Data_tlast)
);

AXI_MASTER #(.COUNT_VAL(127), .COUNT_BIT_WIDTH(8)) axi_master_inst( 
    .clk(clk),
    .reset_b(reset_b),
    .Input_Data(input_data_with_padding),
    .T_READY(Data_tready),
    .Fourth_Sample_Ready(axi_master_enable),
    .Send_Frame(send_frame_axi_master),

    .T_VALID(Data_tvalid),
    .T_DATA(Data_tdata),
    .Count_Reached(count_reached_axi_master)
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
        IDLE: begin
            AXI_Master_enable = 1'b0;
            Data_or_Zero_sel = SEND_ZERO;
            if (Start_CC) begin
                if (FFT_Configure_Complete) next_state <= START_1ST_FRAME;
                else next_state <= WAIT_FOR_CONFIG;
            end
            else next_state <= IDLE;
        end  
        WAIT_FOR_CONFIG: begin
            AXI_Master_enable = 1'b0;
            Data_or_Zero_sel = SEND_ZERO;
            if (FFT_Configure_Complete) next_state <= START_1ST_FRAME;
            else next_state <= WAIT_FOR_CONFIG;
        end
        START_1ST_FRAME: begin
            AXI_Master_enable = 1'b1;
            Data_or_Zero_sel = (ZERO_PAD == FRONT_PAD) ? SEND_ZERO : SEND_DATA;
            next_state <= FRAME_1;
        end
        FRAME_1: begin
            AXI_Master_enable = 1'b0;
            Data_or_Zero_sel = (ZERO_PAD == FRONT_PAD) ? SEND_ZERO : SEND_DATA;
            if (Count_Reached) next_state <= START_2ND_FRAME;
            else next_state <= FRAME_1;
        end
        START_2ND_FRAME: begin
            AXI_Master_enable = 1'b1;
            Data_or_Zero_sel = (ZERO_PAD == FRONT_PAD) ? SEND_DATA : SEND_ZERO;
            next_state <= FRAME_2;
        end
        FRAME_2: begin
            AXI_Master_enable = 1'b0;
            Data_or_Zero_sel = (ZERO_PAD == FRONT_PAD) ? SEND_DATA : SEND_ZERO;
            if (Count_Reached) next_state <= IDLE;
            else next_state <= FRAME_2;
        end
        default: begin
            AXI_Master_enable = 1'b0;
            Data_or_Zero_sel = SEND_ZERO;
            next_state <= IDLE; 
        end
    endcase
end

assign TLAST = (current_state == FRAME_2) && Count_Reached;
    
endmodule