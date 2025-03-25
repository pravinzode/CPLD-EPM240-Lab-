module led_fade (
    input wire clk,      // 50 MHz system clock
    input wire rst,      // Active-high reset
    output reg led       // PWM-controlled LED output
);

// Define PWM parameters
reg [7:0] duty_cycle = 8'd0;   // Duty cycle (0-255)
reg [7:0] fade_step = 8'd1;    // Step size for fading
reg up = 1'b1;                 // Direction flag for fading

// 16-bit Counter for PWM control
reg [15:0] pwm_counter = 16'd0;  

// Clock divider for PWM frequency (~1 kHz)
always @(posedge clk or posedge rst) begin
    if (rst) begin
        pwm_counter <= 16'd0;
    end else begin
        pwm_counter <= pwm_counter + 1;
    end
end

// PWM logic: LED ON when counter < duty cycle
always @(posedge clk or posedge rst) begin
    if (rst)
        led <= 1'b0;
    else
        led <= (pwm_counter[15:8] < duty_cycle) ? 1'b1 : 1'b0;
end

// Gradual Fading Effect (Increase/Decrease Duty Cycle)
always @(posedge pwm_counter[15] or posedge rst) begin
    if (rst) begin
        duty_cycle <= 8'd0;
        up <= 1'b1;
    end else begin
        if (up) begin
            duty_cycle <= duty_cycle + fade_step;  
            if (duty_cycle >= 8'd255) up <= 1'b0; // Reverse direction at max brightness
        end else begin
            duty_cycle <= duty_cycle - fade_step;  
            if (duty_cycle == 8'd0) up <= 1'b1; // Reverse direction at min brightness
        end
    end
end

endmodule
