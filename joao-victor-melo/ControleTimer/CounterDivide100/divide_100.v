module divide_100(input wire clk_in,output reg clk_out);
  reg [7:0] timer=7'b0000000;
  
  always @(posedge clk_in)
    begin
      timer <= timer+1;
      
      if(timer<50) //0-49 no low
        begin
          clk_out <=0;
        end
      
      else if(timer<99) //50-99 no high
        begin
          clk_out <=1;
        end
      
      else	//reseta
        begin
          timer <= 7'b0000000;
        end
      
    end
endmodule