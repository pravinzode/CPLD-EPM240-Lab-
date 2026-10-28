// Breathing LEDs in Two Groups
//The first two LEDs breathe together, followed by the other two LEDs.

module LEDgroups (
    input clk,
    output [3:0] LED
);

reg [23:0] cnt;
reg [4:0] PWM;

always @(posedge clk)
    cnt <= cnt + 1'b1;

wire [3:0] intensity =
    cnt[23] ? cnt[22:19] : ~cnt[22:19];

always @(posedge clk)
    PWM <= PWM[3:0] + intensity;

assign LED[0] = PWM[4] & ~cnt[23];
assign LED[1] = PWM[4] & ~cnt[23];
assign LED[2] = PWM[4] &  cnt[23];
assign LED[3] = PWM[4] &  cnt[23];

endmodule