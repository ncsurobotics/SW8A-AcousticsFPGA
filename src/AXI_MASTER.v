`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/22/2023 12:03:14 AM
// Design Name: 
// Module Name: AXI_MASTER
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


module AXI_MASTER(

    input clk,
    input reset_b,
    input [31:0] Input_Data,
    input T_READY,
    input Fourth_Sample_Ready,
    output Send_Frame,
    output T_VALID,
    output [31:0] T_DATA

);

    wire Data_sel;
    wire Count_Reached;
    wire [1:0] Count_sel;

    AXI_MASTER_DATAPATH AXI_MASTER_DATAPATH_inst(
    
        .clk(clk),
        .reset_b(reset_b),
        .Input_Data(Input_Data),
        .Data_sel(Data_sel),
        .Count_sel(Count_sel),
        .Output_Data(T_DATA),
        .Count_Reached(Count_Reached)
    
    );
    
    AXI_MASTER_CONTROLLER AXI_MASTER_CONTROLLER_inst(
        
        .clk(clk),
        .reset_b(reset_b),
        .T_READY(T_READY),
        .Fourth_Sample_Ready(Fourth_Sample_Ready),
        .Send_Frame(Send_Frame),
        .T_VALID(T_VALID),
        .Data_sel(Data_sel),
        .Count_sel(Count_sel),
        .Count_Reached(Count_Reached)
        
    );

endmodule

module AXI_MASTER_DATAPATH(

    input clk,
    input reset_b,
    input [31:0] Input_Data,
    input Data_sel,
    input [1:0] Count_sel,
    output [31:0] Output_Data,
    output Count_Reached

);

    reg [31:0] Old_Data;
    wire [31:0] New_Data;
    /*
    always@(posedge clk or negedge reset_b) begin
        if(!reset_b) begin
            New_Data <= 0;
        end
        else begin
            New_Data <= Input_Data;
        end
            
    end
    */
    
    assign New_Data = Input_Data;
    
    always@(posedge clk or negedge reset_b) begin
        if(!reset_b) begin
            Old_Data <= 0;
        end
        else begin
            Old_Data <= Data_sel ? New_Data: Old_Data;
        end
            
    end

   parameter 
        OLD = 1'b0,
        NEW = 1'b1;
    assign Output_Data = Data_sel ? New_Data : Old_Data;
    
    GENERAL_COUNTER #(.COUNT_VAL(63), . COUNT_BIT_WIDTH(7)) SAMPLE_COUNTER(
    
        .clk(clk),
        .reset_b(reset_b),
        .Count_sel(Count_sel),
        .Count_Reached(Count_Reached)
    
    );
    

endmodule


module AXI_MASTER_CONTROLLER(

    input clk,
    input reset_b,
    input T_READY,
    input Fourth_Sample_Ready,
    input Count_Reached,
    
    output reg[1:0] Count_sel,
    output reg Send_Frame,
    output reg T_VALID,
    output reg Data_sel
    
);
    parameter [1:0]
        IDLE = 2'b00,
        SEND = 2'b01,
        HOLD = 2'b10;
    
    parameter 
        OLD = 1'b0,
        NEW = 1'b1;
        
    parameter 
        FALSE = 1'b0,
        TRUE = 1'b1;
    parameter
        NO = 1'b0,
        YES = 1'b1;
        
        
        
    reg [1:0] current_state, next_state;
 
    always@(posedge clk or negedge reset_b) begin
        if(!reset_b) begin
            current_state <= IDLE;
        end
        else begin
            current_state <= next_state;
        end
    end
    
    always@(*)begin
        case(current_state) 
            IDLE: begin
                Send_Frame = NO;
                T_VALID = FALSE;
                Data_sel = NEW;
                Count_sel = 2'b00;
                if(T_READY && Fourth_Sample_Ready) next_state <= SEND;
                else next_state <= IDLE;
            end
            SEND: begin
                Send_Frame = YES;
                T_VALID = TRUE;
                Data_sel = NEW;
                Count_sel = 2'b11;
                if(Count_Reached) next_state <= IDLE;
                else begin
                    if(T_READY) next_state <= SEND;
                    else next_state <= HOLD;          
                end
            end
            HOLD: begin
                Count_sel = 2'b10;
                Send_Frame = NO;
                T_VALID = TRUE;
                Data_sel = OLD; 
                next_state <= T_READY ? SEND : HOLD; 
            end
            default: begin
                Send_Frame = NO;
                T_VALID = FALSE;
                Data_sel = OLD; 
                next_state <= IDLE;
            end
        endcase
    
    end


    

endmodule
