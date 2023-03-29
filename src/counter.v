module counter(
    input [1:0] counter_sel,
    input reset_b,
    input clk,
    input enable,
    output wire[19:0] counter_value
);

reg[19:0] counter_reg = 4'b0;

always@(posedge clk or negedge reset_b or negedge enable)
begin
    if(!reset_b | !enable) counter_reg <= 20'b0;
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




module eighth_second(  input clk,  // 7.2 MHz spi_clk
                        input reset_b,
                        output reg eighth_out);

wire [19:0] counter_val;
reg [1:0] current_state, next_state;
reg counter_next;
reg [1:0] counter_sel;

parameter [1:0]
    S0 = 2'b00,
    S1 = 2'b01,
    S2 = 2'b10,
    S3 = 2'b11;

counter button_counter( .clk(clk),
                        .reset_b(reset_b),
                        .counter_sel(counter_sel),
                        .counter_value(counter_val),
                        .enable(1'b1)
                        );

always @ (posedge clk or negedge reset_b) begin
    if (!reset_b) current_state <= S0;
    else current_state <= next_state;   
end

always @ (*) begin
    case (current_state)
        S0: begin
            next_state <= S1;
            counter_sel <= 2'b00;
            eighth_out <= 1'b0;
        end

        S1: begin
            if(counter_val == 20'd900000) begin
                next_state <= S0;
                counter_sel <= 2'b00;
                eighth_out <= 1'b1;
            end
            else begin
                next_state <= S1;
                counter_sel <= 2'b11;
                eighth_out <= 1'b0;
            end
        end
        
        default: begin
            next_state <= S0;
            counter_sel <= 2'b00;
            eighth_out <= 1'b0;
        end
    endcase
end

endmodule