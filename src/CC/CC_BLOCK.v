// Cross Correlation Pipeline
// 2x AXI Master to Ring Buffers --> 2x 256 pt FFTs --> Complex multiplier --> 256 pt IFFT --> Argmax

module CC_BLOCK (
    input clk,
    input reset_b,

    input Start_CC,

);

FFT_CONTROLLER TRIGGER_FFT_CONTROLLER_inst(

    .clk(clk),
    .reset_b(reset_b),
    .Config_T_Ready(s_axis_config_tready),
    .FFT_Configure_tvalid(fft_s_axis_config_tvalid),
    .FFT_Configure_Complete(fft_configure_complete)
);


    
endmodule

module CC_BLOCK_CONTROLLER (
    input clk,
    input reset_b,
    input Start_CC,
    input FFT_Configure_Complete,
    
    output reg AXI_Master_enable
);

localparam [1:0]
    IDLE = 2'b00,
    WAIT_FOR_CONFIG = 2'b01,
    START_CC = 2'b10,
    WAIT = 2'b11;

reg [1:0] current_state, next_state;

always @ (posedge clk or negedge reset_b) begin
    if (!reset_b) current_state <= IDLE;
    else current_state <= next_state;
end

always @ (*) begin
    case (current_state)
        IDLE:
            AXI_Master_enable = 1'b0;
            if (Start_CC) begin
                if (FFT_Configure_Complete) next_state <= START_CC;
                else next_state <= WAIT_FOR_CONFIG;
            end
            else next_state <= IDLE;
        WAIT_FOR_CONFIG:
            AXI_Master_enable = 1'b0;
            if (FFT_Configure_Complete) next_state <= START_CC;
            else next_state <= WAIT_FOR_CONFIG;
        START_CC:
            AXI_Master_enable = 1'b1;
            next_state <= WAIT;
        WAIT:
            AXI_Master_enable = 1'b0;
            if (Start_CC) next_state <= START_CC;
            else next_state <= WAIT;
        default:
            AXI_Master_enable = 1'b0;
            next_state <= IDLE; 
    endcase
end
    
endmodule