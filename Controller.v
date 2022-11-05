// acoustic data collection with FPGA - Controller

module Controller(
                    input clk,
                    input reset, 

                    input triggered,
                    input buffer_full,
                    input cross_corrleation_done,
                    input transmission_done,
                    input sample_counter,

                    input data_in,

                    output chip_select,
                    output [1:0] data_input_sel,
                    output fft_en_sel
                 );


    reg [3:0] state;    

    parameter [3:0]
            S0  =   4'b0000;
            S1  =   4'b0001;
            S2  =   4'b0010;
            S3  =   4'b0011;
            S4  =   4'b0100; 
            S5  =   4'b0101;
            S6  =   4'b0110;
            S7  =   4'b0111;

    always @(posedge clk or negedge reset_b)
        if(!reset_b) current_state = S0;
        else current_state = next_state;

    always @ (*)
        begin
        
        // state machine
        case (current_state)
        
        S0:         // reset state
            begin
                if(dut_run) next_state <= S1;
                else next_state <= S0;

                fft_en_sel <= 0;
                data_input_sel <= 2'b00;


            end
        
        S1:         // Not triggered data wait
            begin
                if(sample_counter_14) next_state = S2;
                esle next_state = S1;
            end
        
        S2:         // Not triggered data ready
            begin
                if(triggered) next_state = S3;
                else next_state = S2;
            end
                    
        S3:         // Triggered Data wait
            begin
                if(sample_counter_14) next_state = S4;
                else next_state = S3;
            end
                    
        S4:         // Triggered data ready
            begin
                if(buffer_counter_full) next_state = S5;
                else next_state = S4;
            end
            
        S5:         // Cross correlation state
            begin
                if(cross_correltaion_done) next_state = S6;
                else next_state = S5;
            end
        S6:         //UART dummy state (will neeed expansion)
            begin
                next_state = S0;
            end

        endcase
        end
         

endmodule