`timescale 1ns/1ps
`include "magn.v"
`include "logicQuest.v"
`include "sr_latch.v"

module magn_tb();

    reg startn_tb, stopn_tb, clearn_tb, door_closed_tb, timer_done_tb;
    wire mag_on_tb;

    magn DUT(
    .startn(startn_tb), .stopn(stopn_tb), .clearn(clearn_tb), 
    .door_closed(door_closed_tb), .timer_done(timer_done_tb), 
    .mag_on(mag_on_tb));

integer i;

    initial begin
        
        $dumpfile("magn_tb.vcd");
        $dumpvars(0,magn_tb);
        for(i=0 ; i<3000; i++)begin
        #10startn_tb = (i%2);
            stopn_tb = $urandom%2;
            clearn_tb = $urandom%2;
            door_closed_tb =$urandom%2;
            timer_done_tb = $urandom%2;
        end
    end
endmodule