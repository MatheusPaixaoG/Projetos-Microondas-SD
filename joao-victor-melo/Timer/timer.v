`include "Timer/CounterMOD6/counterm6.v"
`include "Timer/CounterMOD10/counterm10.v"

module timer(data, loadn, clrn, clock, enable, sec_ones, sec_tens, mins, zero);

input [3:0] data;
input loadn, clrn, clock, enable;

output [3:0] sec_ones; //unidades de segs
output [3:0] sec_tens; //dezenas de segs
output [3:0] mins; //minutos
output zero; //zero

wire en_segundinhos, en_segundao, en_minutos; //fios de enable do contador de segundos(unidade - mod10), contador de decimos de segundos(mod6), e contador de minutos(mod10);
wire zero_segundinhos, zero_segundao, zero_minutos; //fios de zero para os mesmos contadores acima, na ordem apresentada no comentário;
wire aux;

counterm10 segundinhos (.data(data), .loadn(loadn), .clrn(clrn), .clock(clock), .enable(enable), .ones(sec_ones), .tc(en_segundao), .zero(zero_segundinhos));

counterm6 segundao (.data(sec_ones), .loadn(loadn), .clrn(clrn), .clk(clock), .en(en_segundao), .tens(sec_tens), .tc(en_minutos), .zero(zero_segundao));

counterm10 minutos (.data(sec_tens), .loadn(loadn), .clrn(clrn), .clock(clock), .enable(en_minutos), .ones(mins), .tc(aux), .zero(zero_minutos));

assign zero = zero_segundinhos & zero_segundao & zero_minutos;

endmodule