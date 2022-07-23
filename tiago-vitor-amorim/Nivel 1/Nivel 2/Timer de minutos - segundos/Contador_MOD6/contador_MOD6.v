module mod6(
  	output wire [3:0] tens, 
    output wire       tc, zero,
    input wire        clearn, loadn, clock, en,
    input wire  [3:0] data); 
    

    reg [3:0] counter; 
    
    always @(posedge clock, negedge clearn)
        begin
          if (clearn == 1'b0)
              counter <= 0;
            else
              if (en == 1'b0)
                begin
                  if (loadn == 1'b0)
                    counter <= data;
                end
          	  else 
                begin
                  if (counter == 0)
                      counter <= 5;
                  else
                      counter <= counter - 1;

                end 
        end

    assign tc = ((counter == 0) && (en == 1'b1)) ? 1'b1 : 1'b0;

    assign zero = (counter == 0) ? 1'b1 : 1'b0;

    assign tens = counter;

endmodule