module covariance #(FFT_SIZE = 128) (
    input clk, reset_b,
    
    input tvalid_1, tvalid_2, tvalid_3, tvalid_4, 
    input tlast_1, tlast_2, tlast_3, tlast_4,
    input [31:0] tdata_1, tdata_2, tdata_3, tdata_4,
    output tready,

    output valid_out,
    input  ack,
    output reg [37:0] re11, re12, re13, re14,
                            re22, re23, re24,
                                  re33, re34,
                                        re44,
                      im11, im12, im13, im14,
                            im22, im23, im24,
                                  im33, im34,
                                        im44;
);
    
// Stop operation until all complex multipliers & all FFT cores are ready
assign tready = tvalid_1 & tvalid_2 & tvalid_3 & tvalid_4;

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


endmodule