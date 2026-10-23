module LED_PWM(clk, PWM_input, LED);
input clk;
input [3:0] PWM_input;     // 16 intensity levels
output LED;

reg [4:0] PWM;
always @(posedge clk) PWM <= PWM[3:0] + PWM_input;

assign LED = PWM[4];
endmodule

