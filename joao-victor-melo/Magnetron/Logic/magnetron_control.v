module magnetron_control(input wire startn,input wire stopn,input wire clearn,input wire door_closed,input wire timer_done,output reg set, output reg reset);

  always @(*)
    begin
      set <= (~startn && door_closed) && ~(~stopn || ~clearn || timer_done);
      
      reset <= (~door_closed || ~stopn || ~clearn || timer_done);
      
    end
endmodule