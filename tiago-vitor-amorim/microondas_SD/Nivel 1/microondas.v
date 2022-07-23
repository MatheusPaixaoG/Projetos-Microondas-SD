`include "Nivel 2/Entrada de timer e controle/timerinput.v"
`include "Nivel 2/decodificador.v"
`include "Nivel 2/controle de magnetron/magn.v"
`include "Nivel 2/Timer de minutos - segundos/contador.v"

module microwave(
    output wire [6:0] sec_tens_segs, sec_tens_segs, min_segs, , min_ten_segs

    output wire mag_on,
    
    input reg [9:0] keypad,
    input reg clock,

    input reg startn, stopn, clearn, door_closed,
);

    // encoder wires
    wire [3:0] data;
    wire load_clock, loadn;
    
    // control wire
    wire mag_on;

    // timer wires
    wire zero;
    wire [3:0] sec_one, sec_tens, minss;

    timerinput U1 (.D(data), .pgt_1Hz(load_clock), .loadn(loadn),
                    .key(keypad), .clk(clock), .enablen(mag_on));

    magn U2 (.startn(startn), .stopn(stopn), .clearn(clearn), .door_closed(door_closed),
             .timer_done(zero), .mag_on(mag_on));

    contador U3 (.sec_ones(sec_one), .sec_tens(sec_tens), .mins(mins),
                .zero(zero), .data(data), .loadn(loadn), .clock(load_clock), 
                .en(mag_on), .clearn(clearn));
    
    decodificador U4 (.sec_ones(sec_one), .sec_tens(sec_tens), mins(mins),
                    .ones_saida(sec_tens_segs), .tens_saida(sec_tens_segs), .mins_saida(min_segs),
                    .mins_tens_saida(min_ten_segs));
endmodule