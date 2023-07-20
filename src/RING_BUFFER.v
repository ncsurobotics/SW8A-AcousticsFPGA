`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/19/2023 08:18:36 PM
// Design Name: 
// Module Name: RING_BUFFER
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


module RING_BUFFER(

    input clk,
    input reset_b,
    
    input [9:0] Input_Data,
    input Input_Data_Ready,
    input Send_Frame,
    
    output RAM_Overflow,
    output [9:0] Output_Data

);

    wire RAM_Write_Address_sel, Head_Counter_sel, RAM_Read_Address_sel;
    
    
    RING_BUFFER_DATAPATH RING_BUFFER_DATAPATH_inst(
        
        .clk(clk),
        .reset_b(reset_b),
        .Input_Data(Input_Data),
        .Data_Ready(Input_Data_Ready),
        .RAM_Write_Address_sel(RAM_Write_Address_sel),
        .Head_Counter_sel(Head_Counter_sel),
        .RAM_Read_Address_sel(RAM_Read_Address_sel),
        
        .RAM_Overflow(RAM_Overflow),
        .Output_Data(Output_Data)
            
    );
    
    RING_BUFFER_CONTROLLER RING_BUFFER_CONTROLLER_inst(
        .clk(clk),
        .reset_b(reset_b),
        .RAM_Overflow(RAM_Overflow),
        .data_ready(Input_Data_Ready),
        .Send_Frame(Send_Frame),
    
        .RAM_Write_Address_sel(RAM_Write_Address_sel),
        .Head_Counter_sel(Head_Counter_sel),
        .RAM_Read_Address_sel(RAM_Read_Address_sel)
    );
        
endmodule


module RING_BUFFER_DATAPATH(

    input clk,
    input reset_b,
    input [9:0] Input_Data,
    input Data_Ready,
    
    input RAM_Write_Address_sel,
    input Head_Counter_sel,
    input RAM_Read_Address_sel,
    
    output RAM_Overflow,
    output [9:0] Output_Data

);
    
    reg  [7:0] RAM_Write_Address;
    reg  [7:0] Head_Address;
    reg  [7:0] RAM_Read_Address;
    wire [7:0] Next_Head_Address;
    wire [7:0] Next_Write_Address;
    wire [7:0] Next_Read_Address;
    
    
    
    assign Next_Write_Address = RAM_Write_Address_sel ? RAM_Write_Address : RAM_Write_Address + 1;
    
    always@(posedge clk or negedge reset_b) begin
        if(!reset_b) begin
            RAM_Write_Address = 8'b0;
        end
        else begin
            RAM_Write_Address = Next_Write_Address;
        end
            
    end    

    assign RAM_Overflow = (RAM_Write_Address == 255);
    
    
    
    assign Next_Head_Address = Head_Counter_sel ? Head_Address : Head_Address + 1;
    always@(posedge clk or negedge reset_b) begin
        if(!reset_b) begin
            Head_Address = 8'b0;
        end
        else begin
            Head_Address = Next_Head_Address;
        end
    end
    
    assign Next_Read_Address = RAM_Read_Address_sel ? Head_Address : RAM_Read_Address + 4;
    always@(posedge clk or negedge reset_b) begin
        if(!reset_b) begin
            RAM_Read_Address = 8'b0;
        end
        else begin
            RAM_Read_Address = Next_Read_Address;
        end
    end
    
    
    RING_BUFFER_RAM RING_BUFFER_RAM_inst(
        
        .clka(clk),
        .clkb(clk),
        .ena(1'b1),
        .enb(1'b1),
        .wea(Data_Ready),
        .web(1'b0),
        .addra(RAM_Write_Address),
        .addrb(RAM_Read_Address),
        .dina(Input_Data),
        .doutb(Output_Data)  
        
    );
    
    

endmodule



module RING_BUFFER_CONTROLLER(

    input clk,
    input reset_b,
    input RAM_Overflow,
    input data_ready,
    input Send_Frame,
    
    output RAM_Write_Address_sel,
    output Head_Counter_sel,
    output RAM_Read_Address_sel

);
    HEAD_CONTROLLER HEAD_CONTROLLER_inst(
        
        .clk(clk),
        .reset_b(reset_b),
        .RAM_Overflow(RAM_Overflow),
        .data_ready(data_ready),
        .Head_Counter_sel(Head_Counter_sel)
        
    );
    
    WRITE_CONTROLLER WRITE_CONTROLLER_inst(
    
        .clk(clk),
        .reset_b(reset_b),
        .data_ready(data_ready),
        .RAM_Write_Address_sel(RAM_Write_Address_sel)
        
    );
    
    READ_CONTROLLER READ_CONTROLLER_inst(
    
        .clk(clk),
        .reset_b(reset_b),
        .Send_Frame(Send_Frame),
        .RAM_Read_Address_sel(RAM_Read_Address_sel)
 
    );


endmodule

module HEAD_CONTROLLER(

    input clk,
    input reset_b,
    input RAM_Overflow,
    input data_ready,
    
    output reg Head_Counter_sel
    

);

    parameter [1:0]     
        START_UP = 2'b00,
        INCREMENT = 2'b01,
        HOLDANDWAIT = 2'b10,
        HOLD = 2'b11;

    reg [1:0] current_state, next_state;

    always@(posedge clk or negedge reset_b) begin
        if(!reset_b) begin
            current_state = START_UP;
        end
        else begin
            current_state = next_state;
        end
    end
    
    always@(*) begin
    
        case(current_state) 
            START_UP:begin
                Head_Counter_sel <= 1'b1;
                if(RAM_Overflow) next_state <= INCREMENT;
                else next_state <= START_UP;
            end
            INCREMENT: begin
                Head_Counter_sel <= 1'b0;
                next_state <= HOLDANDWAIT;
            end
            HOLDANDWAIT: begin
                Head_Counter_sel <= 1'b1;
                if(!data_ready) next_state <= HOLDANDWAIT;
                else next_state <= HOLD; 
            end
            HOLD: begin
                Head_Counter_sel <= 1'b1;
                if(data_ready) next_state <= INCREMENT;
                else next_state <= HOLD;
            end 
        endcase
    
    end


endmodule


module WRITE_CONTROLLER(

    input clk,
    input reset_b,
    input data_ready,
    
    output reg RAM_Write_Address_sel    

);

    reg[1:0] current_state, next_state;
    
    parameter[1:0]
        HOLD = 2'b00,
        INCREMENTANDWRITE = 2'b01,
        HOLDANDWAIT = 2'b10;
        
    always@(posedge clk or negedge reset_b) begin
        if(!reset_b) begin
            current_state <= HOLD;
        end    
        else begin
            current_state <= next_state;
        end
    end    
    
    always@(*) begin
        
        case(current_state)
            HOLD: begin
                RAM_Write_Address_sel = 1'b1;
                if(data_ready) next_state <= INCREMENTANDWRITE;
                else next_state <= HOLD;
            end
            INCREMENTANDWRITE: begin
                RAM_Write_Address_sel = 1'b0;
                next_state <= HOLDANDWAIT;
            end
            HOLDANDWAIT: begin
                RAM_Write_Address_sel = 1'b1;
                if(!data_ready) next_state <= HOLD;
                else next_state <= HOLDANDWAIT;
            end
            default: begin
                RAM_Write_Address_sel = 1'b0;
                next_state <= HOLD;
            end            
        endcase
    
    end 
   
   
   
    

endmodule


module READ_CONTROLLER(

    input clk,
    input reset_b,
    input Send_Frame,
    
    output reg RAM_Read_Address_sel

);
    
    reg current_state, next_state;
    
    parameter 
        HEAD = 1'b0,
        INCREMENT = 1'b1;
    
    always@(posedge clk or negedge reset_b) begin
        if(!reset_b) begin
            current_state <= HEAD;
        end
        else begin
            current_state <= next_state;
        end
    end
    
    always@(*) begin
        case(current_state)
            HEAD:begin
                RAM_Read_Address_sel <= 1'b1;
                if(Send_Frame) next_state = INCREMENT;
                else next_state = HEAD;
            end 
            INCREMENT:begin
                RAM_Read_Address_sel <= 1'b0;
                if(!Send_Frame) next_state = HEAD;
                else next_state = INCREMENT;
            end
        endcase
    end
    
    
    
    
    
    
    
    
    
    
    
    
    
    


endmodule

