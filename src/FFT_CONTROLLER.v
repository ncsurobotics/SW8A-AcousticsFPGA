/*module FFT_CONTROLLER ( input clk,
                        input reset_b,
                        
                        input data_ready, // for fourth_sample_counter_sel
                        input fourth_sample_reached,

                        input s_axis_config_tready,     // from FFT
                        input enable,
                        input samples_sent_count_reached,     // from TRIGGER_FFT block

                        output reg s_axis_config_tvalid,
                        output reg s_axis_data_tvalid,      // outputs to FFT
                        output reg s_axis_data_tlast,

                        output reg [1:0] samples_sent_counter_sel, // outputs to TRIGGER_FFT block
                        output [1:0] fourth_sample_counter_sel,

                        //output reg start_frame,             // outputs to RING_BUFFER
                        //output reg end_frame,
                        output reg send_frame
);
    
localparam [2:0] // states
    START       = 3'b000,
    CONFIG_FFT  = 3'b001,
    EXECUTE     = 3'b010,
    START_FRAME = 3'b011,
    SENDING     = 3'b100,
    END_FRAME   = 3'b101;

localparam [1:0] // counter_sel values 
    ZERO  = 2'b00,
    HOLD  = 2'b10,
    COUNT = 2'b11;

reg [2:0] current_state, next_state;

always @ (posedge clk or negedge reset_b) begin
    if (!reset_b) current_state <= START;
    else current_state <= next_state;
end

always @ (*) begin
    case (current_state)
        START: begin                    // wait for config_tready to go high to config
            s_axis_config_tvalid     <= 1'b0;
            s_axis_data_tvalid       <= 1'b0;
            s_axis_data_tlast        <= 1'b0;
            samples_sent_counter_sel <= ZERO;
            send_frame               <= 1'b0;

            if (s_axis_config_tready) next_state <= CONFIG_FFT;
            else next_state <= START;
        end

        CONFIG_FFT: begin                    // configure FFT
            s_axis_config_tvalid     <= 1'b1;
            s_axis_data_tvalid       <= 1'b0;
            s_axis_data_tlast        <= 1'b0;
            samples_sent_counter_sel <= ZERO;    
            next_state <= WAIT;
        end

        EXECUTE: begin                    // wait for enable
            s_axis_config_tvalid     <= 1'b0;
            s_axis_data_tvalid       <= 1'b0;
            s_axis_data_tlast        <= 1'b0;
            samples_sent_counter_sel <= ZERO;
            send_frame               <= 1'b0;

            if (enable) next_state <= START_FRAME;
            else next_state <= WAIT;
        end

        START_FRAME: begin                    // signal to outside that we're sending a frame
            s_axis_config_tvalid     <= 1'b0;
            s_axis_data_tvalid       <= 1'b0;
            s_axis_data_tlast        <= 1'b0;
            samples_sent_counter_sel <= ZERO;
            send_frame               <= 1'b1;

            next_state <= SENDING;
        end

        SENDING: begin                    // send a frame
            s_axis_config_tvalid     <= 1'b0;
            s_axis_data_tvalid       <= 1'b1;
            s_axis_data_tlast        <= 1'b0;
            samples_sent_counter_sel <= COUNT;
            send_frame               <= 1'b1;

            if (samples_sent_count_reached) next_state <= END_FRAME;
            else next_state <= SENDING;
        end

        END_FRAME: begin                    // send the last sample & assert end_frame
            s_axis_config_tvalid     <= 1'b0;
            s_axis_data_tvalid       <= 1'b1;
            s_axis_data_tlast        <= 1'b1;
            samples_sent_counter_sel <= ZERO;
            send_frame               <= 1'b0;

            next_state <= WAIT;
        end

        default: begin
            s_axis_config_tvalid     <= 1'b0;
            s_axis_data_tvalid       <= 1'b0;
            s_axis_data_tlast        <= 1'b0;
            samples_sent_counter_sel <= ZERO;
            send_frame               <= 1'b0;

            next_state <= START;
        end
    endcase
end

LONG_SIG_CNT_CONTROLLER fourth_sample_cnt_ctrl_inst(.clk(clk),
                                                    .reset_b(reset_b),
                                                    .incr_signal(data_ready),
                                                    .count_reached(fourth_sample_reached),
                                                    .counter_sel(fourth_sample_counter_sel)
);

endmodule

module LONG_SIG_CNT_CONTROLLER(     // General Counter driver that waits for a persistent signal (like data_ready) to go low
                                    // Don't use this if you expect the signal to toggle every clock cycle
    input clk,
    input reset_b,
    input incr_signal,  // signal whose going high should trigger an increment
    input count_reached,
    output reg [1:0] counter_sel
);

localparam [1:0] 
    // counter_sel values
    ZERO  = 2'b00, 
    HOLD  = 2'b10,
    COUNT = 2'b11,

    // states
    ZERO_STATE = 2'b00,   // zero the counter
    HOLD_STATE = 2'b01,           // hold current value
    COUNT_STATE = 2'b10,          // when incr_signal goes high, set counter_sel=COUNT for 1 clock cycle
    HOLDANDWAIT = 2'b11;    // wait for incr_signal to go low again

reg [1:0] current_state, next_state;

always @ (posedge clk or negedge reset_b) begin
    if (!reset_b) current_state = ZERO;
    else current_state = next_state;
end

always @ (*) begin
    case (current_state)
        ZERO_STATE: begin
            counter_sel <= ZERO;
            next_state <= HOLD_STATE;
        end

        HOLD_STATE: begin
            counter_sel <= HOLD;
            if (incr_signal) next_state <= COUNT_STATE;
            else next_state <= HOLD_STATE;
        end

        COUNT_STATE: begin
            counter_sel <= COUNT;
            if (incr_signal) next_state <= HOLDANDWAIT;
            else next_state <= HOLD_STATE; // if incr_signal goes low skip directly to hold_state
        end

        HOLDANDWAIT: begin
            counter_sel <= count_reached ? ZERO : HOLD;
            if (!incr_signal) next_state <= HOLD_STATE;
            else next_state <= HOLDANDWAIT;
        end

        default: begin
            counter_sel <= ZERO;
            next_state <= ZERO_STATE;
        end
    endcase
end

endmodule
*/



module FFT_CONTROLLER(

    input clk,
    input reset_b,
    input Config_T_Ready,
    
    output reg FFT_Configure_tvalid,
    output reg FFT_Configure_Complete

);

    parameter [1:0]
        IDLE = 2'b00,
        CONFIG = 2'b01,
        EXECUTE = 2'b10;
  
    
    reg [1:0] current_state, next_state;
    
    always@(posedge clk or negedge reset_b) begin
        if(!reset_b) begin
            current_state <= IDLE;
        end
        else begin
            current_state <= next_state;
        end
    end
    
    always@(*) begin
        case(current_state)
            IDLE:begin
                FFT_Configure_tvalid <= 1'b0;
                FFT_Configure_Complete <= 1'b0;
                if(Config_T_Ready) next_state <= CONFIG;
                else next_state <= IDLE;
            end
            CONFIG:begin
                FFT_Configure_tvalid <= 1'b1;
                FFT_Configure_Complete <= 1'b0;
                next_state <= EXECUTE;
            end
            EXECUTE:begin
                FFT_Configure_tvalid <= 1'b0;
                FFT_Configure_Complete <= 1'b1;
                next_state <= EXECUTE;            
            end
            default:begin
                FFT_Configure_tvalid <= 1'b0;
                FFT_Configure_Complete <= 1'b0;
                next_state <= IDLE;    
            end
        
        endcase 
    
    end



endmodule


















































