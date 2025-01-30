`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/29/2025 07:44:56 PM
// Design Name: 
// Module Name: SPI_TRIGGER
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


module SPI_trigger(
	input[9:0] SPI_data_in,//10 bit number
	input data_ready,//high if should read
	input reset_n, //active low asynch
	input clk, 
	output trigger //goes high when 2 consecutive rising edges are received
	);
	parameter THRESHOLD=950;//minimum value for spi_data_in to count as rising
	parameter WINDOW=16;//clock cycles between two rising edges
	parameter WAITTIME = 32;//clock cycles before another window starts
	
	dff readyBuffer(.d(data_ready),.clk(clk),.reset_n(reset_n),.q(dataProcessReady));
	wire dataProcessReady;
	
	wire counterReset, window, waitTime;
	SPI_Trigger_Controller controller(
		.clk(clk),
		.reset_n(reset_n),
		.waitTime(waitTime),
		.window(window),
		.threshold(threshold),
		.trigger(trigger),
		.counterReset(counterReset),
		.dataProcessReady(dataProcessReady)
	);
	
    SPI_Trigger_Datapath #(
		.THRESHOLD(THRESHOLD),
		.WINDOW(WINDOW),
		.WAITTIME(WAITTIME)) 
	datapath(
		.SPI_data_in(SPI_data_in),
		.clk(clk),.reset_n(reset_n),
		.counterReset(counterReset),
		.windowSignal(window),
		.waitTimeSignal(waitTime),
		.thresholdSignal(threshold)
	);
	

endmodule

module SPI_Trigger_Datapath(
    input[9:0] SPI_data_in,
    input clk,
    input reset_n,
    input counterReset,
    output thresholdSignal,
    output windowSignal,
    output waitTimeSignal
    );
    parameter THRESHOLD=950;//minimum value for spi_data_in to count as rising
	parameter WINDOW=16;//clock cycles between two rising edges
	parameter WAITTIME = 32;//clock cycles before another window starts
    
    	//State Machine Inputs
		//Counter
	wire window, waitTime; 
	SPI_counter #(.WINDOW(WINDOW),.WAITTIME(WAITTIME)) counter(.clk(clk),.reset_n(reset_n),.zero(counterReset),.window(windowSignal),.waitTime(waitTimeSignal));

	
		//Threshold Detector
	wire threshold;
	thresholdDetector #(.THRESHOLD(THRESHOLD)) thresholdDetector1(.data_in(SPI_data_in),.signal(thresholdSignal));
		
		
endmodule

module SPI_Trigger_Controller(
        input threshold,
        input window,
        input waitTime,
        input dataProcessReady,
        output reg trigger,
        output reg counterReset,
        input clk,
        input reset_n
        );

        localparam Receiving = 3'b000;
        localparam FirstEdge = 3'b001;
        localparam BetweenEdges = 3'b010;
        localparam SecondEdge = 3'b011;
        localparam TriggerOutput = 3'b100;
        localparam Waiting = 3'b101;
        localparam X0 = 3'b110;	//unused state
        localparam X1 = 3'b111; //unused state

        reg[2:0] current_state, next_state;


        always@(posedge clk or negedge reset_n)begin
                if(~reset_n) current_state <= 0;
                else current_state <= next_state;

        end

        always@(*)begin 
                case(current_state)
                        Receiving:begin
                                trigger<=0;
                                counterReset<=1;
                                
                                if(threshold & dataProcessReady) next_state<=FirstEdge;
								else next_state <= Receiving;
                        end
                        FirstEdge:begin
                                trigger<=0;
                                counterReset<=0;
                                
								if(threshold)begin
									if(window) next_state<=Receiving;
									else next_state<=FirstEdge;
								end
								else begin
									if(window) next_state<=Receiving;
									else next_state<=BetweenEdges;
								end
                        end
                        BetweenEdges:begin
                                trigger<=0;
                                counterReset<=0;
                                
                                if(threshold)begin
									if(window) next_state<=Receiving;
									else next_state<=SecondEdge;
								end
								else begin
									if(window) next_state<=Receiving;
									else next_state<=BetweenEdges;
								end
                        end
                        SecondEdge:begin
                                trigger<=0;
                                counterReset<=0;
                                
                                if(threshold)begin
									if(window) next_state<=Receiving;
									else next_state<=SecondEdge;
								end
								else begin
									if(window) next_state<=Receiving;
									else next_state<=TriggerOutput;
								end
                        end
                        TriggerOutput:begin
                                trigger<=1;
                                counterReset<=1;
                                
                                next_state<=Waiting;
                        end
                        Waiting:begin
                                trigger<=0;
                                counterReset<=0;
                                
                                if(waitTime) next_state<=Receiving;
								 else next_state<= Waiting;
                        end
                        default: begin
                            trigger<=0;
                            counterReset<=0;
                            next_state<=Receiving;
                        end

                endcase
        end
endmodule


    
module dff(
	input d,
	input clk,
	input reset_n,
	output reg q
	);
	always@(posedge clk or negedge reset_n) begin
		if(~reset_n) q <= 0;
		else q <= d;
	end	

endmodule
 
module thresholdDetector(
	input[9:0] data_in,//10 bit number
	output reg signal
	);
	parameter THRESHOLD = 1024;
	
	always@(data_in) begin
	if(data_in > THRESHOLD) signal = 1;
	else signal = 0;
	end
	
endmodule

module SPI_counter(
	input reset_n,
	input zero,
	input clk,
	output reg window,
	output reg waitTime
	);
	parameter WINDOW=16;
	parameter WAITTIME = 32;
	
	reg[6:0] counter = 0;
	
	always@(posedge clk or negedge reset_n) begin
		if(~reset_n | zero) begin
			counter <= 0;
			window <= 0;
			waitTime <= 0;
		end
		else begin
			counter <= counter + 1;
			if(counter > WINDOW) window	<= 1;
			else window <= 0;
			
			if(counter > WAITTIME) waitTime	<= 1;
			else waitTime <= 0;
		
		end
	end
	
endmodule
