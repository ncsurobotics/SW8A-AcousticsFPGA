// Datapath for June 17 pool test

module Test_Datapath(

                        input clk,
                        input reset_b,
                        input [9:0] ADC_Channel_1,
                        input [9:0] ADC_Channel_2,
                        input [9:0] ADC_Channel_3,
                        input [9:0] ADC_Channel_4,
                        input [7:0] UART_Rx_Data_in,
                        input Hold_Data_sel,
                        input Byte_To_Send_sel,
                        
                        output [7:0] Word_To_Send

);


    wire [15:0] Channel_1_Largest, Channel_2_Largest, Channel_3_Largest, Channel_4_Largest;
    reg [15:0] Channel_1_Largest_reg, Channel_2_Largest_reg, Channel_3_Largest_reg, Channel_4_Largest_reg;
    
    wire [7:0] Channel_sel;
    
    reg [15:0] Channel_Data;
    
    reg [15:0] Data_To_Send_reg;
    wire [15:0] Data_To_Send;
    
    
    always@(posedge clk or negedge reset_b) begin
        if(!reset_b) begin
            Channel_1_Largest_reg <= 16'b0;
            Channel_2_Largest_reg <= 16'b0;
            Channel_3_Largest_reg <= 16'b0;
            Channel_4_Largest_reg <= 16'b0;
        end
        else begin
            Channel_1_Largest_reg <= Channel_1_Largest;
            Channel_2_Largest_reg <= Channel_2_Largest;
            Channel_3_Largest_reg <= Channel_3_Largest;
            Channel_4_Largest_reg <= Channel_4_Largest;
        end 
    end

    assign Channel_1_Largest = (Channel_1_Largest > Channel_1_Largest_reg) ? Channel_1_Largest : Channel_1_Largest_reg;
    assign Channel_2_Largest = (Channel_2_Largest > Channel_2_Largest_reg) ? Channel_2_Largest : Channel_2_Largest_reg;
    assign Channel_3_Largest = (Channel_3_Largest > Channel_3_Largest_reg) ? Channel_3_Largest : Channel_3_Largest_reg;
    assign Channel_4_Largest = (Channel_4_Largest > Channel_4_Largest_reg) ? Channel_4_Largest : Channel_4_Largest_reg;
    
    always@(*) begin
        case(Channel_sel) 
            8'd1:
                Channel_Data <= Channel_1_Largest_reg;
            8'd2:
                Channel_Data <= Channel_2_Largest_reg;
            8'd3:
                Channel_Data <= Channel_3_Largest_reg;
            8'd4:
                Channel_Data <= Channel_4_Largest_reg;
            default:
                Channel_Data <= Channel_1_Largest_reg;
        
        endcase 
    
    end
    
    always@(posedge clk or negedge reset_b) begin
        if(!reset_b) begin 
            Data_To_Send_reg <= 16'b0;
        end
        else begin
            Data_To_Send_reg <= Data_To_Send;
        end
    end
    
    
    assign Data_To_Send = Hold_Data_sel ? Data_To_Send_reg : Channel_Data;
    
    
    assign Word_To_Send = Byte_To_Send_sel ? Data_To_Send[15:8] : Data_To_Send[7:0];
    
    
    

endmodule