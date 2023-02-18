// simple read-write from SRAM

// infer block RAM on FPGA
module ram(input clk, write, input [3:0] addr, input [7:0] data_in, output reg [7:0] data_out);

    reg [7:0] mem [0:15];

    always @ (posedge clk) begin
        if (write) begin
            mem[addr] <= data_in;
        end

        data_out <= mem[addr];
    end

endmodule

// top-level module

module top(input clk, write, input [7:0] data_in, output [8:0] data_out, output reg sum_ready);

    reg [7:0] A, B; // addends
    reg [2:0] state, next_state;
    reg [3:0] address;
    reg mem_write;
    wire [7:0] mem_out;

    always @ (*) begin
        case (state)
            3'b000: begin
                address <= 4'b0;
                mem_write <= 1'b0;
                A <= A;
                B <= B;

                if (write) next_state <= 3'b001;
                else next_state <= 3'b000;
            end

            3'b001: begin
                address <= 4'b0;
                mem_write <= 1'b0;
                A <= A;
                B <= B;

                next_state <= 3'b010;
            end

            3'b010: begin
                address <= 4'b0;
                mem_write <= 1'b1;
                A <= A;
                B <= B;

                if (write) next_state <= 3'b1;
            end
        endcase
    end



endmodule