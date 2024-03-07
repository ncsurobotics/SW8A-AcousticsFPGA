module CDC_DRIVER #(
    parameter DATA_LENGTH = 10
)(
    input src_clk,
    input dest_clk,
    input reset_b,
    input Data_Ready,
    input [DATA_LENGTH-1:0] Data_in,

    output [DATA_LENGTH-1:0] Data_out,
    output dest_req
);

    wire src_send, src_rcv;
    reg[DATA_LENGTH-1:0] data_in_held;

    always @ (posedge src_clk) begin
        if(!reset_b) data_in_held <= 0;
        else data_in_held <= Data_Ready ? Data_in : data_in_held;
    end

    xpm_cdc_handshake #(.DEST_EXT_HSK(0), .WIDTH(DATA_LENGTH)) xpm_cdc_handshake_inst(
        .src_clk(src_clk),
        .dest_clk(dest_clk),
        
        .src_in(data_in_held),
        .src_send(src_send), // Signals to CDC src_in. Should only be deasserted once src_rcv goes high

        .dest_out(Data_out),
        .src_rcv(src_rcv), // Acknowledges that src_in data has been received
        .dest_req(dest_req) // Indicates that new dest_out data has been received and is ready to be captured
    );

    CDC_DRIVER_CONTROLLER CDC_DRIVER_CONTROLLER_inst(
        .src_clk(src_clk),
        .reset_b(reset_b),
        .src_rcv(src_rcv),
        .Data_Ready(Data_Ready),

        .src_send(src_send)
    );

endmodule


module CDC_DRIVER_CONTROLLER(
    input src_clk,
    input reset_b,
    input src_rcv,
    input Data_Ready,

    output reg src_send
);
    reg[1:0] current_state, next_state;

    parameter[1:0]
        IDLE = 2'b00,
        SRC_SEND = 2'b01,
        WAIT = 2'b10;

    always @ (posedge src_clk) begin
        if(!reset_b) current_state <= IDLE;
        else current_state <= next_state;
    end

    always @ (*) begin
        src_send = 0; // Default value
        case(current_state)
            IDLE: next_state = Data_Ready ? SRC_SEND : IDLE;
            SRC_SEND: begin
                src_send = 1;
                next_state = WAIT;
            end
            WAIT: next_state = src_rcv ? IDLE : WAIT;
            default: next_state <= IDLE;
        endcase
    end

endmodule