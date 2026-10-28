//LED Knight Rider
//A single illuminated LED moves left and right across eight LEDs.

module LEDknight (
    input clk,
    output reg [7:0] LED
);

reg [23:0] cnt;

always @(posedge clk)
    cnt <= cnt + 1'b1;

always @(*) begin
    case (cnt[23:21])
        3'd0: LED = 8'b00000001;
        3'd1: LED = 8'b00000010;
        3'd2: LED = 8'b00000100;
        3'd3: LED = 8'b00001000;
        3'd4: LED = 8'b00010000;
        3'd5: LED = 8'b00100000;
        3'd6: LED = 8'b01000000;
        3'd7: LED = 8'b10000000;
    endcase
end

endmodule