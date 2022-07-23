`include "Contador_MOD10/contador_MOD10.v"
`include "Contador_MOD6/contador_MOD10.v"

module timer
  (output [3:0] sec_ones, sec_tens, mins,
   output       zero,
   input  [3:0] data,
   input        loadn, clock, en, clearn);
  
  wire zero_ones, zero_tens, zero_mins; 
  wire en_ones, en_tens, en_mins;
  
  mod10 U1 (.ones(sec_ones),.tc(en_ones), .zero(zero_ones), 	
            .clearn(clearn), .loadn(loadn), .clock(clock), 
            .en(en), .data(data));
  
  mod6 U2 (.tens(sec_tens), .tc(en_tens), .zero(zero_tens),
           .clearn(clearn), .loadn(loadn), .clock(clock), 
           .en(en_ones), .data(sec_ones));
  
  mod10 U3 (.ones(mins), .tc(en_mins), .zero(zero_mins), 
            .clearn(clearn), .loadn(loadn), .clock(clock),
            .en(en_tens), .data(sec_tens));
  
  assign zero = zero_ones | zero_tens | zero_mins;
  
endmodule
           