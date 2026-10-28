// LED Bargraph Animation
//The number of illuminated LEDs increases and then decreases.
module LEDbargraph (
    input clk,
    output reg [7:0] LED
);

reg [23:0] cnt;

always @(posedge clk)
    cnt <= cnt + 1'b1;

always @(*) begin
    case (cnt[23:21])
        3'd0: LED = 8'b00000001;
        3'd1: LED = 8'b00000011;
        3'd2: LED = 8'b00000111;
        3'd3: LED = 8'b00001111;
        3'd4: LED = 8'b00011111;
        3'd5: LED = 8'b00111111;
        3'd6: LED = 8'b01111111;
        3'd7: LED = 8'b11111111;
    endcase
end

endmodule