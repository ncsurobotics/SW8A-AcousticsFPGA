// acoustic data collection with FPGA

//
// clock counter, enable is active low, after 14 clock cycles, toggle enable
module clk_counter(input clk, output reg ADC_en, output reg buffer_en, output reg [3:0] clock_counter); // reset
  always @ (posedge clk or negedge clk) // get rid of negedge clk make CS high longer
    begin
        if (clk)
        begin
            if (clock_counter == 0)
            begin
               ADC_en <= 1'b1;//rename to chip select
               buffer_en <= 1'b1;
            end
        end

        else
        begin
            if (clock_counter == 0)
            begin
                ADC_en <= 1'b0;
                buffer_en <= 1'b0;
            end
            // increment clock_counter
            if (clock_counter == 13) begin
                clock_counter == 0; 
            end
            else begin
            clock_counter <= clock_counter + 1;
            end
        end
    end
endmodule

// SIPO register to capture data from ADC
module input_register(input clk, input [3:0] clock_counter, input new_bit, output reg [9:0] new_data);
    always @ (posedge clk)
    begin

        if (clock_counter >= 5 || clock_counter == 0) begin
            new_data[9:1] <= new_data[8:0];
            new_data[0] <= new_bit;
        end

    end
endmodule

// 2.5 kb buffer
module buffer(input [9:0] new_data, input buffer_en, output reg full_buff); // outputs?
    // s0: clear/reset? buffer
    // s1: collect data, pass new data to trigger_detect
    // s2: fill rest of buffer, keep 500 pre-trigger samples
    // s3: ???
    // s4: ???

    reg [9:0] data_buffer[2499:0];
    integer i;              // can you do this?
    reg data_counter;

    // generic code to fill buffer
    always @ (posedge clk)
    begin
        case (state)
                S0: 
                begin
                    for (i=0; i<2500; i=i+1) begin
                        data_buffer[i] = 0;
                    end
                end
                S1:     
                begin
                    if (buffer_en) // write enable
                    begin
                        //data_buffer[2499:0] <= {new_data,FIFO[:7]};
                        for (i=2499; i>0; i=i-1)
                        begin
                            data_buffer[i] <= data_buffer[i-1];
                        end
                        data_buffer[0] <= data_in; // blocking?
                    end
                end
        endcase
    end


endmodule

// trigger detect - simple level trigger for now
module trigger_detect(output triggered, input buffer_en, input [9:0] new_data);
    if (buffer_en) begin
        if (new_data >= 533) begin
            triggered = 1'b1;
        end
        else begin
            triggered = 1'b0;
        end
    end
endmodule

module fft();

endmodule

module tdoa();

endmodule

// top level module
module Datapath(clk, enable, ADC, reset, input[7:0] triggered); // outputs?

endmodule

  

 