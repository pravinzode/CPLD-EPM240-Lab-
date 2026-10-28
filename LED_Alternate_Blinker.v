module LEDalternate (
    input clk,
    output [3:0] LED
);

reg [23:0] cnt;

always @(posedge clk)
    cnt <= cnt + 1'b1;

assign LED[0] = cnt[23];
assign LED[1] = ~cnt[23];
assign LED[2] = cnt[23];
assign LED[3] = ~cnt[23];

endmodule