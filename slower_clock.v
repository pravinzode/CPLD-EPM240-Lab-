module slower_clock(input clk, output reg clkOutput);

reg [22:0] counter;

always @(posedge clk) 
    if(counter==5000000) counter <= 0; else counter <= counter+1;

always @(posedge clk) 
    if(counter==5000000) 
        begin
            clkOutput <= ~clkOutput;
        end
endmodule

