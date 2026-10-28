// Two LEDs Breathing in Opposite Patterns
//LED0 breathes while LED1 follows the complementary PWM output.

module LED_breathe2 (
    input clk,
    output [1:0] LED
);

reg [23:0] cnt = 0;
reg [4:0] PWM = 0;

wire [3:0] intensity =
    cnt[23] ? cnt[22:19] : ~cnt[22:19];

always @(posedge clk) begin
    cnt <= cnt + 1'b1;
    PWM <= PWM[3:0] + intensity;
end

assign LED[0] = PWM[4];
assign LED[1] = ~PWM[4];

endmodule