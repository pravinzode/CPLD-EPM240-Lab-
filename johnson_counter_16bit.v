module johnson_counter_16bit (
    input wire clk,      // System clock (e.g., 50 MHz)
    input wire rst,      // Reset signal
    output reg [15:0] q  // 16-bit Johnson counter output
);

// Clock divider to create a 1Hz clock from the system clock
reg [23:0] count;      // Counter for clock division
reg clk_1Hz;           // 1Hz clock signal

// Clock divider logic
always @(posedge clk or posedge rst) begin
    if (rst) begin
        count <= 0;
        clk_1Hz <= 0;
    end else begin
        if (count == 24'd49999999) begin // Assuming 50 MHz clock
            count <= 0;
            clk_1Hz <= ~clk_1Hz; // Toggle 1Hz clock
        end else begin
            count <= count + 1;
        end
    end
end

// Johnson counter logic
always @(posedge clk_1Hz or posedge rst) begin
    if (rst) begin
        q <= 16'b0000_0000_0000_0000; // Reset the counter
    end else begin
        q <= {q[14:0], ~q[15]}; // Johnson counter update
    end
end

endmodule
