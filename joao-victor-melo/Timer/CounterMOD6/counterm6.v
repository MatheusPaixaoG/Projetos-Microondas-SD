module counterm6 (data, loadn, clrn, clk, en, tens, tc, zero);

input [3:0] data;
input loadn, clrn, clk, en;

output [3:0] tens;
output tc, zero;

reg [3:0] atual;
assign tens = atual;

assign zero = (atual == 1'b0) ? 1 : 0;
assign tc = ((atual == 1'b0) & en) ? 1 : 0;

always @(posedge clk) begin
  if (en) begin
    if (atual == 4'b0000) begin
      atual <= 4'd5;
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