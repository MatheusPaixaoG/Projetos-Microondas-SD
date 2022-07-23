`include "Magnetron/modulos_nivel3/latch_sr.v"
`include "Magnetron/modulos_nivel3/ON_OFF_logic.v"

module control_mag (input wire startn, stopn, clearn, door_closed, timer_done, output wire Q);

    wire set, reset;

    ON_OFF_logic U1 (.startn(startn),.stopn(stopn),.clearn(clearn),.door_closed(door_closed),.timer_done(timer_done),.set(set),.reset(reset));
    
    latch_sr U2 (.S(set),.R(reset),.Q(Q));

endmodule
