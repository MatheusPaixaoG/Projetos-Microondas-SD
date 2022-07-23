`include "ControleTimer/CounterDivide100/divide_100.v"
`include "ControleTimer/Debouncer/debouncer.v"
`include "ControleTimer/Encoder/timerControler.v"
`include "ControleTimer/Mux/mux2_1.v"

module timer_controler(input wire [0:9] keypad, input wire enablen, input wire clk_100Hz, output wire [3:0] bcd, output wire loadn, output wire pgt_1Hz);
  //fios internos
  wire clk_1Hz;
  wire debnc_out;
  
  timerControler tmCtrl (.keypad(keypad), .enablen(enablen), .bcd(bcd), .loadn(loadn));
  
  divide_100 dvdr(.clk_in(clk_100Hz),.clk_out(clk_1Hz));
  
  debouncer dbc(.clear(loadn),.clk(clk_100Hz),.out(debnc_out));
  
  mux2_1 mux(.sel(enablen),.i0(debnc_out),.i1(clk_1Hz),.out(pgt_1Hz));
  
endmodule