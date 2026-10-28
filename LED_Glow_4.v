// Four LEDs with Alternate Breathing
// LED0 and LED2 glow together, followed by LED1 and LED3, with alternating brightness.

module LEDglow4 (
    input clk,
    output [3:0] LED
);

reg [23:0] cnt;
always @(posedge clk)
    cnt <= cnt + 1'b1;

reg [4:0] PWM;

wire [3:0] intensity =
    cnt[23] ? cnt[22:19] : ~cnt[22:19];

always @(posedge clk)
    PWM <= PWM[3:0] + intensity;

assign LED[0] =  cnt[24-1] ? PWM[4] : 1'b0;
assign LED[1] = ~cnt[23]     ? PWM[4] : 1'b0;
assign LED[2] =  cnt[23]     ? PWM[4] : 1'b0;
assign LED[3] = ~cnt[23]     ? PWM[4] : 1'b0;

endmodule