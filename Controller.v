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
            S0  =   3'b000;
            S1  =   3'b001;
            S2  =   3'b010;
            S3  =   3'b011;
            S4  =   3'b100; 

    always @ (posedge clk)
        begin
        
        // state machine
        case (state)
        
        S0:         // reset state
            begin

            end
        
        S1:         // start filling buffer, check new data for trigger
            begin

            end
        
        S2:         // triggered; fill buffer; keep 500 pre-trigger samples
            begin

            end
                    
        S3:         // cross correlation
            begin

            end
                    
        S4:         // transfer results of TDOA to computer
            begin

            end

        endcase
        end
         

endmodule