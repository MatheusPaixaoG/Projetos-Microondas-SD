`timescale 1ns/1ps
`include "logicQuest.v"

module logicQuest_tb();

    reg startn_tb, stopn_tb, clearn_tb, door_closed_tb, timer_done_tb;
    wire set_tb, reset_tb;

    logicQuest DUT(
    .startn(startn_tb), .stopn(stopn_tb), .clearn(clearn_tb), 
    .door_closed(door_closed_tb), .timer_done(timer_done_tb), 
    .set(set_tb), .reset(reset_tb)
    );

integer i;

    initial begin
        
        $dumpfile("logicQuest_tb.vcd");
        $dumpvars(0,logicQuest_tb);
        for(i=0 ; i<3000; i++)begin
        #10startn_tb = (i%2);
            stopn_tb = $urandom%2;
            clearn_tb = $urandom%2;
            door_closed_tb =$urandom%2;
            timer_done_tb = $urandom%2;
        end
    end
endmodule