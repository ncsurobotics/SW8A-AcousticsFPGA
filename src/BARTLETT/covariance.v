// TODO: Change state machine such that if a new ping's data comes in while waiting for ack, 
//      the new data is processed instead of ignored

// TODO: Fix these numbers based on actual FFT core
parameter TOTAL_INPUT_DATA_SIZE = 32; // real and imaginary
parameter OUTPUT_DATA_SIZE = 38;

// accumulate_sel
parameter [1:0]
    HOLD_ACC = 2'b00,
    COUNT_ACC = 2'b01,
    RESET_ACC = 2'b11;

module covariance #(FFT_SIZE = 128) (
    input clk, reset_b,
    
    // TODO: fix data sizes
    input fft_valid_1, fft_valid_2, fft_valid_3, fft_valid_4, 
    input fft_last_1, fft_last_2, fft_last_3, fft_last_4,
    input [TOTAL_INPUT_DATA_SIZE-1:0] tdata_1, tdata_2, tdata_3, tdata_4,
    output ready_for_fft,

    output valid_out,
    input  ack,
    output [OUTPUT_DATA_SIZE-1:0] re11, re12, re13, re14,
                            re22, re23, re24,
                                  re33, re34,
                                        re44,
                      im11, im12, im13, im14,
                            im22, im23, im24,
                                  im33, im34,
                                        im44;
);

endmodule

module covariance_ctrl #(FFT_SIZE = 128) (
    input clk, reset_b, 
    input mult_valid, mult_last,
    output reg valid_out,
    output reg accumulate_sel
);

localparam [1:0] // states
    IDLE_S = 2'b00,
    HOLD_S = 2'b10,
    RESET_S = 2'b11;

reg [1:0] state, next_state;

always @ (posedge clk or negedge reset_b) begin
    if (!reset_b) state <= IDLE_S;
    else state <= next_state;
end

always @ (*) begin
    case (state)
        IDLE_S: begin
            accumulate_sel = mult_valid ? COUNT_ACC : RESET_ACC;
        end 
        default: 
    endcase
end

endmodule

module covariance_dp #(FFT_SIZE = 128) (
    input clk, reset_b,
    

);
    

// TODO: add flow control for startup, including a clock enable. For now, I am assuming that the Hilbert transform will complete
//      well after the multipliers are ready. 
// Stop operation until all complex multipliers & all FFT cores are ready
//assign tready = tvalid_1 & tvalid_2 & tvalid_3 & tvalid_4;

// instantiate complex multipliers
wire [319:0] a_data_array, b_data_array; // TODO: truncate the lsb not the msb - really probably not necessary so not doing it rn
assign a_data_array = { tdata_1,    tdata_1,    tdata_1,    tdata_1,
                                    tdata_2,    tdata_2,    tdata_2,
                                                tdata_3,    tdata_3,
                                                            tdata_4};
assign b_data_array = { tdata_1,    tdata_2,    tdata_3,    tdata_4,
                                    tdata_2,    tdata_3,    tdata_4,
                                                tdata_3,    tdata_4,
                                                            tdata_4};

wire [9:0] m_axis_dout_tvalid;
wire [9:0] m_axis_dout_tlast;
wire [63:0] m_axis_dout_tdata [0:9];

genvar i;
generate
    for (i=0; i<10; i=i+1) begin
        rhat_mult_core mult (
            .aclk(clk),                              // input wire aclk
            .aclken(1),                          // input wire aclken
            .aresetn(reset_b),                        // input wire aresetn
            .s_axis_a_tvalid(tvalid),        // input wire s_axis_a_tvalid
            .s_axis_a_tlast(tlast_1),          // input wire s_axis_a_tlast
            .s_axis_a_tdata(a_data_array[319-32*i:288-32*i]),          // input wire [31 : 0] s_axis_a_tdata
            .s_axis_b_tvalid(tvalid),        // input wire s_axis_b_tvalid
            .s_axis_b_tlast(tlast_1),          // input wire s_axis_b_tlast
            .s_axis_b_tdata(b_data_array[319-32*i:288-32*i]),          // input wire [31 : 0] s_axis_b_tdata
            .m_axis_dout_tvalid(m_axis_dout_tvalid[i]),  // output wire m_axis_dout_tvalid
            .m_axis_dout_tlast(m_axis_dout_tlast[i]),    // output wire m_axis_dout_tlast
            .m_axis_dout_tdata(m_axis_dout_tdata[i])    // output wire [63 : 0] m_axis_dout_tdata
        );
    end 
endgenerate


// accumulators
always @ (*) begin
    case (accumulate_sel)
        RESET: begin
            
        end
        ACCUMULATE:
        HOLD: 
        default: 
    endcase
end

// reset accumulators at beginning of transaction
reg state, next_state;
always @ (posedge clk or negedge reset_b) begin
    if (!)
end



endmodule