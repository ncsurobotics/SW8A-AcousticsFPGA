// acoustic data collection with FPGA - Controller

module Controller(
                    input clk,
                    input reset_b, 
                    input triggered,
                    input cross_correlation_done,
                    input UART_transmission_done,
                    input sample_counter_14,
                    input buffer_full_counter,

                    output reg chip_select,
                    output reg[1:0] data_input_sel,
                    output reg fft_en_sel
                    output reg cross_correlation_en_sel
                    output reg[1:0] UART_input_sel
                 );

    //data_input_sel 
    //00 is the pass 0 
    //01 is the hold value 
    //10 is take on new value
    //11 will also be tied to 0

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

                chip_select <= 1;
                data_input_sel <= 2'b00;
                fft_en_sel <= 0;
                cross_correlation_en_sel <= 0;
                UART_input_sel <= 2'b00;

            end
        
        S1:         // Not triggered data wait
            begin
                if(sample_counter_14) next_state = S2;
                else next_state = S1;
                chip_select <= 0;
                data_input_sel <= 2'b01;
                fft_en_sel <= 1;
                cross_correlation_en_sel <= 0;
                UART_input_sel <= 2'b00;
            end
        
        S2:         // Not triggered data ready
            begin
                if(trigger) next_state = S3;
                else next_state = S2;
                chip_select <= 1;
                data_input_sel <= 2'b10;
                fft_en_sel <= 0;
                cross_correlation_en_sel <= 0;
                UART_input_sel <= 2'b00;

            end
                    
        S3:         // Triggered Data wait
            begin
                if(sample_counter_14) next_state = S4;
                else next_state = S3;
                chip_select <= 0;
                data_input_sel <= 2'b01;
                fft_en_sel <= 1;
                cross_correlation_en_sel <= 0;
                UART_input_sel <= 2'b00;
            end
                    
        S4:         // Triggered data ready
            begin
                if(buffer_counter_full) next_state = S5;
                else next_state = S4;
                chip_select <= 1;
                data_input_sel <= 2'b10;
                fft_en_sel <= 0;
                cross_correlation_en_sel <= 0;
                UART_input_sel <= 2'b00;
            end
            
        S5:         // Cross correlation state
            begin
                if(cross_correltaion_done) next_state = S6;
                else next_state = S5;
                chip_select <= 1;
                data_input_sel <= 2'b10;
                fft_en_sel <= 0;
                cross_correlation_en_sel <= 1;
                UART_input_sel <= 2'b00;
            end
        S6:         //UART dummy state (will neeed expansion)
            begin
                next_state = S0;
                chip_select <= 1;
                data_input_sel <= 2'b10;
                fft_en_sel <= 0;
                cross_correlation_en_sel <= 0;
                UART_input_sel <= 2'b00;
            end

        endcase


        end
         

endmodule