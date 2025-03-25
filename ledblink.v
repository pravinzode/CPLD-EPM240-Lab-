module ledblink(clk,led);
input clk; output led; reg led;
reg[23:0] cnt;
always @(posedge clk) begin cnt<= cnt + 1'b1; led<=cnt[23];
end
endmodule




