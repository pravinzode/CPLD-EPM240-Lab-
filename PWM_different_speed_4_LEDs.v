//Four LEDs with Different Breathing Speeds

module LEDglow_speed (
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

assign LED[0] = PWM[4];
assign LED[1] = cnt[23] ^ PWM[4];
assign LED[2] = cnt[22] ^ PWM[4];
assign LED[3] = cnt[21] ^ PWM[4];

endmodule

// Instructions for download 

// Pin Assignments

// Clock Pin PIN_12
// Use 4 LEDs Pins 