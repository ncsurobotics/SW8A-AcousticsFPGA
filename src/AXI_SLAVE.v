`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/22/2023 12:03:14 AM
// Design Name: 
// Module Name: AXI_SLAVE
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


module AXI_SLAVE(

    input clk,
    input reset_b,
    input [31:0] T_DATA,
    input T_VALID,
    output Write_Address_sel,
    output T_READY,
    output [31:0] Next_RAM_Data,
    output [5:0] Write_Address
  
);
    
    AXI_SLAVE_CONTROLLER AXI_SLAVE_CONTROLLER_inst(
        
        .clk(clk),
        .reset_b(reset_b),
        .T_VALID(T_VALID),
        .Write_Address_sel(Write_Address_sel)
    
    );    
    
    AXI_SLAVE_DATAPATH AXI_SLAVE_DATAPATH_inst(
    
        .clk(clk),
        .reset_b(reset_b),
        .T_DATA(T_DATA),
        .Write_Address_sel(Write_Address_sel),
        .Next_RAM_Data(Next_RAM_Data),
        .Write_Address(Write_Address)
        
    );

endmodule


module AXI_SLAVE_CONTROLLER(

    input clk,
    input reset_b,
    input T_VALID,
    
    output reg Write_Address_sel

);

    reg current_state, next_state;
    parameter
        IDLE = 1'b0,
        WRITE = 1'b1;
    parameter
        NEW = 1'b1,
        OLD = 1'b0;
    
    always@(posedge clk or negedge reset_b) begin
        if(!reset_b)begin
            current_state <= IDLE;
        end
        else begin
            current_state <= next_state;
        end
    end

    always@(*) begin
        case(current_state)
            IDLE:begin
                if(T_VALID) next_state <= WRITE;
                else next_state <= IDLE;
                Write_Address_sel <= OLD; 
            end
            WRITE:begin
                if(!T_VALID) next_state <= IDLE;
                else next_state <= WRITE;
                Write_Address_sel <= NEW;
            end
        endcase
    end
endmodule

module AXI_SLAVE_DATAPATH(
    
    input clk,
    input reset_b,
    input [31:0] T_DATA,
    input Write_Address_sel,
    output reg [31:0] Next_RAM_Data,
    output [5:0]  Write_Address 

);

    reg  [5:0]  New_Write_Address, 
                Old_Write_Address;

    assign Write_Address = Write_Address_sel ? New_Write_Address : Old_Write_Address;
    
    always@(posedge clk or negedge reset_b) begin
        if(!reset_b) begin
            New_Write_Address <= 0;
        end
        else begin
            New_Write_Address <= Write_Address_sel ? New_Write_Address + 1 : New_Write_Address;
        end
    end
    
    always@(posedge clk or negedge reset_b) begin
        if(!reset_b) begin
            Old_Write_Address <= 0;
        end
        else begin
            Old_Write_Address <= Write_Address_sel ? New_Write_Address : Old_Write_Address;
        end
    end
    
    always@(posedge clk or negedge reset_b) begin
        if(!reset_b) begin
            Next_RAM_Data <= 0;
        end
        else begin
            Next_RAM_Data <= T_DATA;
        end
    end
    


endmodule