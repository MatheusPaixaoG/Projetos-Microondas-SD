`include "Nivel 3/Logicquest/logicQuest.v"
`include "Nivel 3/sr_latch/sr_latch.v"
module magn (
    input wire startn, stopn, clearn, door_closed, timer_done,
    output wire mag_on
);
    wire set, reset;
  	
    logicQuest U1(.startn(startn), .stopn(stopn), .clearn(clearn), 
                  .door_closed(door_closed), .timer_done(timer_done), .S(set), .R(reset));

    sr_latch U2(.set(set), .reset(reset), .mag_on(mag_on));

endmodule