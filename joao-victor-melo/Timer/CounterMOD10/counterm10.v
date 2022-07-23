module counterm10(data, loadn, clrn, clock, enable, ones, tc, zero);

input loadn, clrn, clock, enable;
input [3:0] data;

output [3:0] ones;
output tc, zero;

reg [3:0] atual;
assign ones = atual;

assign zero = (atual == 1'b0) ? 1 : 0;
assign tc = ((atual == 1'b0) & enable) ? 1 : 0;

always @(posedge clock) begin
  if (enable == 1'b1) begin
    if (atual == 4'b0000) begin
      atual <= 4'b1001;
    end
    else begin
      atual <= atual - 1;
    end
  end
  else begin
    if (loadn == 1'b0) begin
      atual <= data;
    end
  end
end

always @(negedge clrn) begin
  if (clrn == 1'b0) begin
    atual <= 4'b0000;
  end
end

endmodule