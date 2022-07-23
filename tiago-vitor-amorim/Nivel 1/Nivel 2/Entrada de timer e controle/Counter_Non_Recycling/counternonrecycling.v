module counternonrecycling (clk, rst, q);
    input clk, rst;
    output reg [3:0] q;

    always @(posedge clk or negedge rst) begin
      if (rst == 1'b0)
        q <= 4'b0000;
      else if (q == 4'b0111) begin
        q <= 4'b0000;
        $stop;
      end
      else
        q <= q + 1;
    end
endmodule