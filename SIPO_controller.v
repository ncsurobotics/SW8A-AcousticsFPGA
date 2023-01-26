module SIPO_controller(
    input clk,
    input reset_b,
    input [19:0] counter_value,
    output reg data_logging,
    output reg data_ready,
    output reg [1:0]counter_sel,
    output reg control_signal     
);

    parameter [3:0]
                S0       =      4'd0,
                S1       =      4'd1,
                S2       =      4'd2,
                S3       =      4'd3,
                S4       =      4'd4;


    reg [3:0] current_state, next_state;

    always@(posedge clk or negedge reset_b) 
        if (!reset_b) current_state <= S0;
        else current_state <= next_state;

    always@(*)
        begin
            case(current_state)
                S0:
                    begin
                       counter_sel <= 2'b00;
                       data_logging <= 1'b0;
                       data_ready <= 1'b0;
                       control_signal <= 1'b1;

                       next_state <= S1;

                    end
                S1:
                    begin
                        counter_sel <= 2'b00;
                        data_logging <= 1'b0;
                        data_ready <= 1'b0;
                        control_signal <= 1'b0;
                        next_state <= S2;

                    end
                S2:
                    begin
                        counter_sel <= 2'b11;
                        data_logging <= 1'b0;
                        data_ready <= 1'b0;
                        control_signal <= 1'b0;

                        if(counter_value == 3) next_state <= S3;
                        else next_state <= S2;
                    end    
                S3:
                    begin
                        counter_sel <= 2'b11;
                        data_logging <= 1'b1;
                        data_ready <= 1'b0;
                        control_signal <= 1'b0;

                        if(counter_value == 14) next_state <= S4;
                        else next_state <= S3;
                    end    
                S4:
                    begin
                        counter_sel <= 2'b10;
                        data_logging <= 1'b0;
                        data_ready <= 1'b1;
                        control_signal <= 1'b0;

                        next_state <= S4;
                    end    
                default:
                    begin
                       counter_sel <= 2'b00;
                       data_logging <= 1'b0;
                       data_ready <= 1'b0;
                        control_signal <= 1'b0;

                       next_state <= S0;
                    end
            endcase
        end


endmodule








