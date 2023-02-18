module ram_test #(parameter WORD_SIZE = 10)(
    input clk, write_en,
    input [3:0] address,
    input [WORD_SIZE-1:0] data_in,
    output reg [WORD_SIZE-1:0] data_out 
);

(* ram_style = "block" *) reg [WORD_SIZE-1:0] mem [0:15];

always @ (posedge clk) begin
    if (write_en) begin // write 
        mem[address] <= data_in;
        data_out <= data_in;
        
    end
    else begin // read
        data_out <= mem[address];
    end
end

endmodule