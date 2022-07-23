`include "Magnetron/Logic/magnetron_control.v"
`include "Magnetron/SRLatch/SRLatch.v"

module magnetron(input wire startn,input wire stopn,input wire clearn,input wire door_closed,input wire timer_done,output wire Q);
  wire set;
  wire reset;
  
  magnetron_control mg_ctrl(.startn(startn),.stopn(stopn),.clearn(clearn),.door_closed(door_closed),.timer_done(timer_done),.set(set),.reset(reset));
  
  SRLatch sr(.set(set),.reset(reset),.Q(Q));
  
endmodule