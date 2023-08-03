// Cross Correlation Pipeline
// 2x AXI Master to Ring Buffers --> 2x 256 pt FFTs --> Complex multiplier --> 256 pt IFFT --> Argmax

module CC_BLOCK (
    input clk,
    input reset_b,

    input Start_CC,
    // 2x AXI Master inputs
    output [7:0] Index_out,
    output Index_valid
);

FFT_CONTROLLER cc_fft_controller(

    .clk(clk),
    .reset_b(reset_b),
    .Config_T_Ready(s_axis_config_tready),
    .FFT_Configure_tvalid(fft_s_axis_config_tvalid),
    .FFT_Configure_Complete(fft_configure_complete)
);

AXI_MASTER channel_x_axi_master();
AXI_MASTER channel_y_axi_master();


    
endmodule

