// acoustic data collection with FPGA - Controller

module Controller(
                    input clk,
                    input reset, 

                    input trig,
                    input full_buff,
                    input cc_done,
                    input trans_done,

                    input data_in,

                    output // outputs
                 );

    reg [2:0] state;    

    parameter [2:0]
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
        case (state)
        
        S0:         // reset state
            begin
        
            end
        
        S1:         // Not triggered data wait
            begin

            end
        
        S2:         // Not triggered data ready
            begin

            end
                    
        S3:         // Triggered Data wait
            begin

            end
                    
        S4:         // Triggered data ready
            begin

            end

        S5:         // Cross correlation state
            begin

            end
        S6:         //UART dummy state (will neeed expansion)
            begin
            
            end

        endcase
        end
         

endmodule