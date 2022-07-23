module mux2_1(input wire sel, input wire i0, input wire i1, output reg out);
  
  always @(*)
    begin
      out <= (~sel&&i0) || (sel&&i1);
    end
  
endmodule