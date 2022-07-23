`include "Control_Input/control_input.v"
`include "Decoder/decoder.v"
`include "Magnetron/control_mag.v"
`include "Timer/timer.v"

module micro_ondas (input wire [9:0] keypad,input wire clock, startn, stopn, clearn, door_closed,output wire [6:0] sec_ones_segs, sec_tens_segs, mins_segs, mins_tens_segs,output wire mag_on);

    wire zero, loadn, pgt_1Hz;
    wire [3:0] BCD, sec_ones, sec_tens, mins;

    control_mag  M (.startn(startn),.stopn(stopn),.clearn(clearn),.door_closed(door_closed),.timer_done(zero),.Q(mag_on));

    control_input C (.keypad(keypad), .clock(clock), .en(mag_on),.BCD(BCD), .loadn(loadn), .pgt_1Hz(pgt_1Hz));

    timer T (.data(BCD),.loadn(loadn),.clearn(clearn),.clock(pgt_1Hz),.en(mag_on),.sec_ones(sec_ones),.sec_tens(sec_tens),.mins(mins),.zero(zero));

    decoder D (.sec_ones(sec_ones),.sec_tens(sec_tens),.mins(mins),.ones_saida(sec_ones_segs),.tens_saida(sec_tens_segs),.mins_saida(mins_segs),.mins_tens_saida(mins_tens_segs));

endmodule

/*

Para rodar Projeto Forno Microondas:

todos os comandos abaixo devem ser digitados no terminal aberto na pasta  ->  Nivel 1

Control Input: iverilog -o saida.vvp Control_Input/control_input.v Control_Input/control_input_TB.v
Decoder: iverilog -o saida.vvp Decoder/decoder.v Decoder/decoder_TB.v 
Magnetron: iverilog -o saida.vvp Magnetron/control_mag.v Magnetron/control_mag_TB.v
Timer: iverilog -o saida.vvp Timer/timer.v Timer/timer_TB.v 
Microondas: iverilog -o saida.vvp micro_ondas.v micro_ondas_TB.v

Esses comandos geram o executável com o nome “saida.vvp”, então deve ser colocado no terminal : “vvp saída.vvp" ;
será criado  o arquivo vcd, que pode ser aberto no gtkwave e é usado para criar as formas de onda.

*/