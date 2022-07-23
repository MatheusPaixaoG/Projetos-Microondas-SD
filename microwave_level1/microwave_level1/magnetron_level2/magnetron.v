`include "magnetron_level2/magnetron_level3/magnetron_logico.v"
`include "magnetron_level2/magnetron_level3/sr_latch.v"

module magnetron (
    input wire startn,
    input wire stopn,
    input wire clearn,
    input wire door_closed,
    input wire timer_done,
    output wire mag_on
);

    wire S, R;

    magnetron_logico mag_log(startn, stopn, clearn, door_closed, ~timer_done, S, R);
    sr_latch sr(S, R, mag_on);
    
endmodule