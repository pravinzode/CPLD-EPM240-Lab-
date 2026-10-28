//LED Wave Effect
// LEDs glow in a repeating sequence, one after another.
module LEDwave (
    input clk,
    output [3:0] LED
);

reg [23:0] cnt;

always @(posedge clk)
    cnt <= cnt + 1'b1;

assign LED[0] = cnt[23];
assign LED[1] = cnt[22];
assign LED[2] = cnt[21];
assign LED[3] = cnt[20];

endmodule