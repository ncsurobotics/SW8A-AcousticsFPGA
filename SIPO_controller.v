module SIPO_controller(
    input clk2,
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
                S5:
                    begin
                        next_state <= S6;
                        data_logging <= 1'b1;
                        data_ready <= 1'b0;
                    end    
                S6:
                    begin
                        next_state <= S7;
                        data_logging <= 1'b1;
                        data_ready <= 1'b0;
                    end    
                S7:
                    begin
                        next_state <= S8;
                        data_logging <= 1'b1;
                        data_ready <= 1'b0;
                    end    
                S8:
                    begin
                        next_state <= S9;
                        data_logging <= 1'b1;
                        data_ready <= 1'b0;
                    end    
                S9:
                    begin
                        next_state <= S10;
                        data_logging <= 1'b1;
                        data_ready <= 1'b0;
                    end    
                S10:
                    begin
                        next_state <= S11;
                        data_logging <= 1'b1;
                        data_ready <= 1'b0;
                    end    
                S11:
                    begin
                        next_state <= S12;
                        data_logging <= 1'b1;
                        data_ready <= 1'b0;
                    end    
                S12:
                    begin
                        next_state <= S13;
                        data_logging <= 1'b1;
                        data_ready <= 1'b0;
                    end    
                S13:
                    begin
                        next_state <= S14;
                        data_logging <= 1'b1;
                        data_ready <= 1'b0;
                    end      
                S14:
                    begin
                        next_state <= S15;
                        data_logging <= 1'b1;
                        data_ready <= 1'b0;
                    end    
                S15:
                    begin
                        next_state <= S15;
                        data_logging <= 1'b0;
                        data_ready <= 1'b1;
                    end    
            endcase
        end


endmodule