module tb;
reg clk;
reg reset_b;

reg tvalid, tlast_1;
reg [31:0] tdata_1, tdata_2, tdata_3, tdata_4;
wire [319:0] a_data_array, b_data_array;
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
            .s_axis_a_tdata(a_data_array[319-31*i:288-32*i]),          // input wire [31 : 0] s_axis_a_tdata
            .s_axis_b_tvalid(tvalid),        // input wire s_axis_b_tvalid
            .s_axis_b_tlast(tlast_1),          // input wire s_axis_b_tlast
            .s_axis_b_tdata(b_data_array[319-31*i:288-32*i]),          // input wire [31 : 0] s_axis_b_tdata
            .m_axis_dout_tvalid(m_axis_dout_tvalid[i]),  // output wire m_axis_dout_tvalid
            .m_axis_dout_tlast(m_axis_dout_tlast[i]),    // output wire m_axis_dout_tlast
            .m_axis_dout_tdata(m_axis_dout_tdata[i])    // output wire [63 : 0] m_axis_dout_tdata
        );
    end 
endgenerate
 
localparam CLK_PERIOD = 10;
always #(CLK_PERIOD/2) clk=~clk;

initial begin
tdata_1 = 1;
tdata_2 = 2;
tdata_3 = 3;
tdata_4 = 4;
clk = 0;
reset_b = 0;
#10;
end

endmodule

