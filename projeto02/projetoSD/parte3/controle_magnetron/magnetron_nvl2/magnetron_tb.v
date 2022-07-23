`timescale 1ns/1ps
`include "magnetron.v"

module magnetron_tb ();

    reg startn;
    reg stopn;
    reg clearn;
    reg door_closed;
    reg timer_done;
    wire mag_on;

    magnetron dut (startn, stopn, clearn, door_closed, timer_done, mag_on);

    initial begin

        $dumpfile("magnetron.vcd");
        $dumpvars(0, magnetron_tb);

        startn = 1; stopn = 1; clearn = 1; door_closed = 1; timer_done = 0; #10;
        startn = 0; stopn = 1; clearn = 1; door_closed = 1; timer_done = 0; #10;
        startn = 1; stopn = 1; clearn = 1; door_closed = 1; timer_done = 0; #10;
        startn = 1; stopn = 0; clearn = 1; door_closed = 1; timer_done = 0; #10;
        startn = 1; stopn = 1; clearn = 1; door_closed = 1; timer_done = 0; #10;
        startn = 0; stopn = 1; clearn = 1; door_closed = 1; timer_done = 0; #10;
        startn = 1; stopn = 1; clearn = 1; door_closed = 1; timer_done = 0; #10;
        startn = 1; stopn = 1; clearn = 0; door_closed = 1; timer_done = 0; #10;
        startn = 1; stopn = 1; clearn = 1; door_closed = 1; timer_done = 0; #10;
        startn = 0; stopn = 1; clearn = 1; door_closed = 1; timer_done = 0; #10;
        startn = 1; stopn = 1; clearn = 1; door_closed = 1; timer_done = 0; #10;
        startn = 1; stopn = 1; clearn = 1; door_closed = 0; timer_done = 0; #10;
        startn = 1; stopn = 1; clearn = 1; door_closed = 1; timer_done = 0; #10;
        startn = 0; stopn = 1; clearn = 1; door_closed = 1; timer_done = 0; #10;
        startn = 1; stopn = 1; clearn = 1; door_closed = 1; timer_done = 0; #10;
        startn = 1; stopn = 1; clearn = 1; door_closed = 1; timer_done = 1; #10;
        startn = 1; stopn = 1; clearn = 1; door_closed = 1; timer_done = 0; #10;
        startn = 0; stopn = 1; clearn = 1; door_closed = 1; timer_done = 0; #10;
        startn = 1; stopn = 1; clearn = 1; door_closed = 1; timer_done = 0; #10;

    end
    
endmodule