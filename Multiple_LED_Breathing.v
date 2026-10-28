//Multiple Breathing LEDs

//This project uses your original PWM technique, with four LEDs sharing the same breathing pattern.

module LEDbreathing4 (
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

assign LED = {4{PWM[4]}};

endmodule