module SPI_MAX_VALUE_CACHE_controller(
    input clk,
    input reset_b,
    input[7:0] OP_Code,
    input TX_READY,

    output[2:0] Max_Value_Channel_sel
);
    parameter[2:0]
        ZERO=3'b000;
        IDLE=3'b000,
        CHANNEL_1=3'b001,
        CHANNEL_2=3'b010,
        CHANNEL_3=3'b011,
        CHANNEL_4=3'b100;

    parameter[7:0]
        CHANNEL_1_OP_CODE=8'b01000001,
        CHANNEL_2_OP_CODE=8'b01000010,
        CHANNEL_3_OP_CODE=8'b01000011,
        CHANNEL_4_OP_CODE=8'b01000100;


    reg[2:0] current_state, next_state;

    always @ (*) begin
        case(Op_Code)
                    CHANNEL_1_OP_CODE: Max_Value_Channel_sel <= CHANNEL_1;
                    CHANNEL_2_OP_CODE: Max_Value_Channel_sel <= CHANNEL_2;
                    CHANNEL_3_OP_CODE: Max_Value_Channel_sel <= CHANNEL_3;
                    CHANNEL_4_OP_CODE: Max_Value_Channel_sel <= CHANNEL_4;
                    default: Max_Value_Channel_sel <= ZERO;
        endcase
    end

    always @ (posedge clk) begin
        if(!reset_b) begin
            current_state_state <= IDLE;
        end
        else begin
            current_state <= next_state;
        end
    end

    always @ (*) begin
        case(current_state)
            IDLE: begin
                Max_Value_Channel_sel <= ZERO;
                case(OP_Code)
                    CHANNEL_1_OP_CODE: next_state <= CHANNEL_1;
                    CHANNEL_2_OP_CODE: next_state <= CHANNEL_2;
                    CHANNEL_3_OP_CODE: next_state <= CHANNEL_3;
                    CHANNEL_4_OP_CODE: next_state <= CHANNEL_4;
                    default: next_state <= IDLE;
                endcase
            end
            CHANNEL_1: begin
                Max_Value_Channel_sel <= CHANNEL_1;
                next_state <= TX_READY ? IDLE:CHANNEL_1;
            end
            CHANNEL_2: begin
                Max_Value_Channel_sel <= CHANNEL_2;
                next_state <= TX_READY ? IDLE:CHANNEL_2;
            end
            CHANNEL_3: begin
                Max_Value_Channel_sel <= CHANNEL_3;
                next_state <= TX_READY ? IDLE:CHANNEL_3;
            end
            CHANNEL_4: begin
                Max_Value_Channel_sel <= CHANNEL_4;
                next_state <= TX_READY ? IDLE:CHANNEL_4;
            end
            default: begin
                Max_Value_Channel_sel <= ZERO;
                next_state <= IDLE;
            end
        endcase
    end

endmodule