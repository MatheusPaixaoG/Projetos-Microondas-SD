module debouncer(input wire clear,input wire clk, output reg out);
  reg [3:0] timer=4'b0000;
  
  always @(clear) //reseta o timer caso o clear mude
	 begin
       out<=1'b0;
       timer<=4'b0000;
     end
  
  always @(posedge clk)
	begin
      if(timer>=4) //ativa apos 4 ciclos
        begin
          out<=1'b1;
        end
      
      if(timer<7 & ~clear) //para de contar no 7 ciclo
        begin
        	timer <= timer+1;
        end
        
    end
    
endmodule