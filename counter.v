module counter(
    input [1:0] counter_sel,
    input reset_b,
    input clk,
    output wire[19:0] counter_value
);

reg[4:0] counter_reg;

always@(posedge clk or negedge reset_b)
begin
    if(!reset_b) counter_reg <= 20'b0;
    else
        case(counter_sel)
            2'b00:
                counter_reg = 20'b0;
            2'b01:
                counter_reg = counter_reg;
            2'b10:
                counter_reg = counter_reg;
            2'b11:
                counter_reg = counter_reg + 1;
        endcase
end

assign counter_value = counter_reg;


endmodule