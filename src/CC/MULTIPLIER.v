// MULTIPLIER.v -- multiplies complex numbers from two FFT IP cores
// Channel X = a + jb, Channel Y = c + jd
// Deprecated in favor of Vivado's complex multiplier IP core
module MULTIPLIER (
    input clk,
    input reset_b,
    input [31:0] X_Data_From_Axi,
    input [31:0] Y_Data_From_Axi,
    output reg signed [46:0] Multiplier_out
);

wire signed [46:0] multiplier_out_next;

always @ (posedge clk or negedge reset_b) begin
    if (!reset_b) Multiplier_out <= 47'b0;
    else Multiplier_out <= multiplier_out_next;
end

// Channel X = a + jb, Channel Y = c + jd
wire signed [10:0] a, b, c, d;
assign a = X_Data_From_Axi[10:0];
assign b = X_Data_From_Axi[26:16];
assign c = Y_Data_From_Axi[10:0];
assign d = Y_Data_From_Axi[26:16];

wire signed [21:0] ac, bd, ad, bc;
assign ac = a * c;
assign bd = b * d;
assign ad = a * d;
assign bc = b * c;

wire signed [22:0] sub_1, sub_2;
assign sub_1 = ac - bd;
assign sub_2 = ad - bc;

wire signed [45:0] square_1, square_2;
assign square_1 = sub_1 * sub_1;
assign square_2 = sub_2 * sub_2;

assign multiplier_out_next = square_1 + square_2;

endmodule