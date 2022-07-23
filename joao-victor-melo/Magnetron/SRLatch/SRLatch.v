module SRLatch(input wire set, input wire reset, output reg Q);

  initial begin
    Q <= 0;
  end

  always @(*)
    begin
      if(set)
        begin
        	Q <= 1;
        end
      if(reset)
        begin
        	Q <= 0;
        end
    end
endmodule