`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/20/2022 01:45:26 AM
// Design Name: 
// Module Name: blinky
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module top (
    input clk, btnC, btnU,
    input [15:0] sw,
    output led,
    output [6:0] seg,
    output [3:0] an
);

// blink LED
reg [24:0] count = 0;
assign led = count[24];

always @ (posedge clk) count = count + 1;

// BRAM test. address = sw[15:12], data = sw[3:0]
wire [3:0] ram_out;
wire [15:0] display;

ram_test ram(   .clk(clk), 
                .write_en(btnU), 
                .address(sw[15:12]),
                .data_in(sw[3:0]),
                .data_out(ram_out)
);

assign display = {sw[15:12], 8'h00, ram_out};

seven_segment seg7(.clk(clk), .btnC(btnC), .decimal_num(display),
                    .segments(seg), .anode(an));

endmodule

module ram_test (
    input clk, write_en,
    input [3:0] address,
    input [3:0] data_in,
    output reg [3:0] data_out 
);

(* ram_style = "block" *) reg [3:0] mem [0:15];

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