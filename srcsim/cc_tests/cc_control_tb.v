/* CC Control Testbench
 * Tests the configuration and data into the CC FFT.
 * CC_Block_Controller + FFT_Controller (config) + AXI_Master + CC FFT
 * Eventually there will be 2 of these, one each for channels X and Y
 *
 * Criteria for success:
 *      event_tlast_unexpected and event_tlast_missing are never high
 *      for now: select lines go high at the right times
 *      for later: look at zero_pad_verify.py 's plots
 */


module cc_control_tb ();
    
reg clk = 1'b0;
reg reset_b = 1'b1;

// For later: ring buffer

AXI_MASTER dut_axi_m();

CC_BLOCK_CONTROLLER #(.ZERO_PAD(0)) dut_cc_ctrl();

FFT_CONTROLLER dut_fft_ctrl();


// downstream FFT wires -- unused

xfft_cc xfft_cc_inst();

endmodule