module FFT_CONTROLLER ( input clk,
                        input reset_b,

                        input s_axis_config_tready,     // from FFT
                        input enable,
                        input samples_sent_count_reached,     // from TRIGGER_FFT block

                        output reg s_axis_config_tvalid,
                        output reg s_axis_data_tvalid,      // outputs to FFT
                        output reg s_axis_data_tlast,

                        output reg [1:0] samples_sent_counter_sel, // outputs to TRIGGER_FFT block

                        //output reg start_frame,             // outputs to RING_BUFFER
                        //output reg end_frame,
                        output reg send_frame
);
    
localparam [2:0] // states
    START       = 3'b000,
    CONFIG_FFT  = 3'b001,
    WAIT        = 3'b010,
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
            s_axis_config_tvalid     = 1'b0;
            s_axis_data_tvalid       = 1'b0;
            s_axis_data_tlast        = 1'b0;
            samples_sent_counter_sel = ZERO;
            //start_frame              = 1'b0;
            //end_frame                = 1'b0;
            send_frame               = 1'b0;

            if (s_axis_config_tready) next_state = CONFIG_FFT;
            else next_state = START;
        end

        CONFIG_FFT: begin                    // configure FFT
            s_axis_config_tvalid     = 1'b1;
            s_axis_data_tvalid       = 1'b0;
            s_axis_data_tlast        = 1'b0;
            samples_sent_counter_sel = ZERO;
            //start_frame              = 1'b0;
            //end_frame                = 1'b0;
            send_frame               = 1'b0;
            
            next_state = WAIT;
        end

        WAIT: begin                    // wait for enable
            s_axis_config_tvalid     = 1'b0;
            s_axis_data_tvalid       = 1'b0;
            s_axis_data_tlast        = 1'b0;
            samples_sent_counter_sel = ZERO;
            //start_frame              = 1'b0;
            //end_frame                = 1'b0;
            send_frame               = 1'b0;

            if (enable) next_state = START_FRAME;
            else next_state = WAIT;
        end

        START_FRAME: begin                    // signal to outside that we're sending a frame
            s_axis_config_tvalid     = 1'b0;
            s_axis_data_tvalid       = 1'b0;
            s_axis_data_tlast        = 1'b0;
            samples_sent_counter_sel = ZERO;
            //start_frame              = 1'b1;
            //end_frame                = 1'b0;
            send_frame               = 1'b1;

            next_state = SENDING;
        end

        SENDING: begin                    // send a frame
            s_axis_config_tvalid     = 1'b0;
            s_axis_data_tvalid       = 1'b1;
            s_axis_data_tlast        = 1'b0;
            samples_sent_counter_sel = COUNT;
            //start_frame              = 1'b0;
            //end_frame                = 1'b0;
            send_frame               = 1'b1;

            if (samples_sent_count_reached) next_state = END_FRAME;
            else next_state = SENDING;
        end

        END_FRAME: begin                    // send the last sample & assert end_frame
            s_axis_config_tvalid     = 1'b0;
            s_axis_data_tvalid       = 1'b1;
            s_axis_data_tlast        = 1'b1;
            samples_sent_counter_sel = ZERO;
            //start_frame              = 1'b0;
            //end_frame                = 1'b1;
            send_frame               = 1'b0;

            next_state = WAIT;
        end

        default: begin
            s_axis_config_tvalid     = 1'b0;
            s_axis_data_tvalid       = 1'b0;
            s_axis_data_tlast        = 1'b0;
            samples_sent_counter_sel = ZERO;
            //start_frame              = 1'b0;
            //end_frame                = 1'b0;
            send_frame               = 1'b0;

            next_state = START;
        end
    endcase
end
endmodule