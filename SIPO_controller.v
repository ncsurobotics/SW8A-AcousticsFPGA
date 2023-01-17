module SIPO_controller(
    input clk,
    input control_signal, // button handler out
    output reg data_logging,
    output reg data_ready
);

    parameter [3:0]
                S0       =      4'd0,
                S1       =      4'd1,
                S2       =      4'd2,
                S3       =      4'd3,
                S4       =      4'd4,
                S5       =      4'd5,
                S6       =      4'd6,
                S7       =      4'd7,
                S8       =      4'd8,
                S9       =      4'd9,
                S10      =      4'd10,
                S11      =      4'd11,
                S12      =      4'd12,
                S13      =      4'd13,
                S14      =      4'd14,
                S15      =      4'd15;

    reg [3:0] current_state, next_state;

    always@(posedge clk2)
        if (control_signal) current_state <= S0;
        else current_state <= next_state;

    always@(*)
        begin
            case(current_state)
                S0:
                    begin
                        if(!control_signal) next_state <= S1;
                        else next_state <= S0;
                        next_state <= S1;
                        data_logging <= 1'b0;
                        data_ready <= 1'b0;
                    end
                S1:
                    begin
                        next_state <= S2;
                        data_logging <= 1'b0;
                        data_ready <= 1'b0;
                    end
                S2:
                    begin
                        next_state <= S3;
                        data_logging <= 1'b0;
                        data_ready <= 1'b0;
                    end    
                S3:
                    begin
                        next_state <= S4;
                        data_logging <= 1'b0;
                        data_ready <= 1'b0;
                    end    
                S4:
                    begin
                        next_state <= S5;
                        data_logging <= 1'b0;
                        data_ready <= 1'b0;
                    end    
                default:
                    begin
                    end
            endcase
        end


endmodule







module counter(
    input counter_sel,
    input reset_b,
    input clk,
    output wire[4:0] counter_value
);

reg[4:0] counter_reg;

always@(posedge clk or negedge reset_b)
begin
    if(!reset_b) counter_reg <= 5'b0;
    else
        case(counter_sel)
            2'b00:
                counter_reg = 5'b0;
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