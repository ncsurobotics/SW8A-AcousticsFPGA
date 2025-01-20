module SIPO( //Serial in Parallel out shift register
    input clk,
    input data_in, //serial in
    input reset_b, //async active low
    input data_logging, //enable
    output wire[9:0] data_out   //parallel out
);

    reg [9:0]  data_buffer;

    always@(posedge clk or negedge reset_b)
    begin
        if(!reset_b) data_buffer = 10'b0;
        
        else
            if(data_logging) 
            begin
                data_buffer = data_buffer << 1;
                data_buffer[0] = data_in;
            end        
            else data_buffer = data_buffer; 
    end

    assign data_out = data_buffer;

endmodule

