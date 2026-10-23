module police_siren (
input clk,
output reg [3:0] red_led,
output reg [3:0] blue_led,
output reg [1:0] white_led,
output wire buzzer
);
reg [23:0] led_counter = 0; //for LED blinking
reg [15:0] buzzer_counter = 0; //for buzzer frequency control
reg siren_toggle = 0; // for switching LED colors
reg buzzer_toggle = 0; //for buzzer frequency variation
// clk divider for LED blinking
always @(posedge clk)
begin
if (led_counter == 25000000) begin
led_counter <= 0;
siren_toggle <= ~siren_toggle;
end

else begin

led_counter <= led_counter + 1;
end
end
// LED toggle
always @(posedge clk)
begin
if (siren_toggle) begin
red_led <= 4'b1111; //all red LEDs on
blue_led <= 4'b0000; // all blue LEDs off
end

else begin

red_led <= 4'b0000; // all red LEDs off
blue_led <= 4'b1111; //all blue LEDs on

end
white_led <= 2'b11; // White LEDs always on
end
// Variable frequency buzzer for siren
always @(posedge clk)
begin
if (buzzer_counter == 50000) begin
buzzer_counter <= 0;
buzzer_toggle <= ~buzzer_toggle;
end

else begin

buzzer_counter <= buzzer_counter + 1;
end
end
assign buzzer = buzzer_toggle;
endmodule