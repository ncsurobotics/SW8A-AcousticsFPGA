// UART TX CONTROLLER -- 9/13/2023 -- Omar Obeid
// This is the new UART TX Controller made to eliminate the slow UART "clock" which was causing timing issues

module UART_TX_CONTROLLER(
    input clk, // 5.76 MHz
    input reset_b, // Active low

    input TX_en, Count_Reached,

    output reg TX_Ready, // Lets the outside world know the TX is ready to recieve data
    output reg Counter_Reset, // When IDLE, tell the clock counter in the Datapath to reset
    output reg [3:0] TX_Bit_sel // Outputs a value 0-9 to the Datapath as the select line to a MUX
);

    // The States of the State Machine
    parameter [3:0]
        IDLE = 4'b0000,
        START = 4'b0001,
        D0 = 4'b0010,
        D1 = 4'b0011,
        D2 = 4'b0100,
        D3 = 4'b0101,
        D4 = 4'b0110,
        D5 = 4'b0111,
        D6 = 4'b1000,
        D7 = 4'b1001,
        STOP = 4'b1010;
    
    reg [3:0] current_state, next_state;

    always @(posedge clk) begin
        if(!reset_b) begin
            current_state <= IDLE;
        end
        else begin
            current_state <= next_state;
        end
    end

    always @ (*) begin
        case (current_state)
            // Waits until the outside world lets the TX know there is data to send. Until then, lets the outside world know that it is ready to recieve a new world and lets the counter know not to start counting, while sending STOP bits to the outside world.
            IDLE: begin
                TX_Ready <= 1'b1;
                Counter_Reset <= 1'b1;
                TX_Bit_sel <= 4'd9;
                next_state <= TX_en ? START:IDLE;
            end
            // Lets the outside world know that TX is not ready to receive a new Word and lets the counter know to start counting. Each state below selects which bit of the Word the Datapath will output.
            START: begin
                TX_Ready <= 1'b0;
                Counter_Reset <= 1'b0;
                TX_Bit_sel <= 4'd0;
                next_state <= Count_Reached ? D0:START;
            end
            D0: begin
                TX_Ready <= 1'b0;
                Counter_Reset <= 1'b0;
                TX_Bit_sel <= 4'd1;
                next_state <= Count_Reached ? D1:D0;
            end
            D1: begin
                TX_Ready <= 1'b0;
                Counter_Reset <= 1'b0;
                TX_Bit_sel <= 4'd2;
                next_state <= Count_Reached ? D2:D1;
            end
            D2: begin
                TX_Ready <= 1'b0;
                Counter_Reset <= 1'b0;
                TX_Bit_sel <= 4'd3;
                next_state <= Count_Reached ? D3:D2;
            end
            D3: begin
                TX_Ready <= 1'b0;
                Counter_Reset <= 1'b0;
                TX_Bit_sel <= 4'd4;
                next_state <= Count_Reached ? D4:D3;
            end
            D4: begin
                TX_Ready <= 1'b0;
                Counter_Reset <= 1'b0;
                TX_Bit_sel <= 4'd5;
                next_state <= Count_Reached ? D5:D4;
            end
            D5: begin
                TX_Ready <= 1'b0;
                Counter_Reset <= 1'b0;
                TX_Bit_sel <= 4'd6;
                next_state <= Count_Reached ? D6:D5;
            end
            D6: begin
                TX_Ready <= 1'b0;
                Counter_Reset <= 1'b0;
                TX_Bit_sel <= 4'd7;
                next_state <= Count_Reached ? D7:D6;
            end
            D7: begin
                TX_Ready <= 1'b0;
                Counter_Reset <= 1'b0;
                TX_Bit_sel <= 4'd8;
                next_state <= Count_Reached ? STOP:D7;
            end
            STOP: begin
                TX_Ready <= 1'b0;
                Counter_Reset <= 1'b0;
                TX_Bit_sel <= 4'd9;
                next_state <= Count_Reached ? IDLE:STOP;
            end
            // If we end up in this state something went horribly wrong, we want to let the outside world know we are NOT ready to receive a new word, reset the counter, and return to IDLE as soon as possible.
            default: begin
                TX_Ready <= 1'b0;
                Counter_Reset <= 1'b1;
                TX_Bit_sel <= 4'd9;
                next_state <= IDLE;
            end
        endcase
    end

endmodule