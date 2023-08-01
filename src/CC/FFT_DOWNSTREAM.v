module FFT_DOWNSTREAM (
    input clk,
    input reset_b,
    input Frame_Start,
    input [31:0] x_m_axis_data_tdata,
    input [31:0] y_m_axis_data_tdata,
    input [15:0] x_m_axis_data_tuser,
    // TODO: add error flag
    output [6:0] Max_Index
);

reg [6:0] index;
wire [13:0] multiplier_out;

// Buffer the index by 1 clock cycle to match MULTIPLIER latency
always @ (posedge clk or negedge reset_b) begin
    if (!reset_b) index <= 8'b0;
    else index <= x_m_axis_data_tuser[6:0];
end

// Multiplier latency = 1 clock cycle
MULTIPLIER multiplier(.clk(clk),
                .reset_b(reset_b),
                .X_Data_From_Axi(x_m_axis_data_tdata),
                .Y_Data_From_Axi(y_m_axis_data_tdata),
                .Multiplier_out(multiplier_out)

);

// Cache max index based on multiplier out
CACHE_MAX_INDEX cache_max_index(.clk(clk),
                                .reset_b(reset_b),
                                .Frame_Start(Frame_Start),
                                .Value_in(multiplier_out),
                                .Index_in(index),
                                .Max_Index(Max_Index)
);
    
endmodule