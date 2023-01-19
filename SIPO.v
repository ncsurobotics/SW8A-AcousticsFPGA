module SIPO(
    input clk2,
    input data_in,
    input reset_b,
    input data_logging,
    output wire[9:0] data_out   
);

    reg [9:0]  data_buffer;

    always@(posedge clk2 or negedge reset_b)
    begin
        if(!reset_b) data_buffer = 10'b0;
        
        else
            if(data_logging) 
            begin
                data_buffer = data_buffer >> 1;
                data_buffer[9] = data_in;
            end        
            else data_buffer = data_buffer; 
    end

    assign data_out = data_buffer;

endmodule