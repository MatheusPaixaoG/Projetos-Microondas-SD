`include "7Segmentos/decoder7seg_f.v"
`include "Magnetron/magnetron.v"
`include "Timer/timer.v"
`include "ControleTimer/timer_controler.v"

module microwave
    (output wire [6:0] sec_ones_segs, sec_tens_segs, min_segs, blank_digit,
     output wire mag_on,
     input wire [0:9] keypad,
     input wire clk_100Hz, startn, stopn, clearn, door_closed);


    wire loadn_aux, pgt_1Hz_aux, mag_on_aux, timer_done_aux;

    wire [3:0] sec_ones_aux, sec_tens_aux, min_aux, bcd_aux;

    timer_controler N2(.bcd(bcd_aux), .loadn(loadn_aux), .pgt_1Hz(pgt_1Hz_aux), 
                       .keypad(keypad), .enablen(mag_on_aux), .clk_100Hz(clk_100Hz));

    magnetron N3(.Q(mag_on_aux), .startn(startn), .stopn(stopn), .clearn(clearn), 
                 .door_closed(door_closed), .timer_done(timer_done_aux));

    timer N1(.sec_ones(sec_ones_aux), .sec_tens(sec_tens_aux), .mins(min_aux), .zero(timer_done_aux), 
             .loadn(loadn_aux), .clrn(clearn), .clock(pgt_1Hz_aux), .enable(mag_on_aux), .data(bcd_aux));

    decoder7seg_f N0(.sec_ones_segs(sec_ones_segs), .sec_tens_segs(sec_tens_segs), .min_segs(min_segs), 
                     .sec_ones(sec_ones_aux), .sec_tens(sec_tens_aux), .min(min_aux));

    assign mag_on = mag_on_aux;

    assign blank_digit = 7'b1111111;

endmodule