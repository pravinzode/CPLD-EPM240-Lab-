//Eight LEDs with a Breathing Effect
//All eight LEDs glow together, producing a brighter visual effect.

module LEDglow8 (
    input clk,
    output [7:0] LED
);

reg [23:0] cnt;
always @(posedge clk)
    cnt <= cnt + 1'b1;

reg [4:0] PWM;

wire [3:0] intensity =
    cnt[23] ? cnt[22:19] : ~cnt[22:19];

always @(posedge clk)
    PWM <= PWM[3:0] + intensity;

assign LED = {8{PWM[4]}};

endmodule