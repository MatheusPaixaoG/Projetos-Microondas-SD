`timescale 1ns/1ps
`include "sr_latch.v"

module sr_latch_tb();

    reg set, reset;
    wire mag_on;

    sr_latch DUT(.set(set), .reset(reset), .mag_on(mag_on));

    initial begin
        $dumpfile("sr_latch_tb.vcd");
        $dumpvars(0, sr_latch_tb);

        #10 set = 1'b1 ; reset = 1'b0;
        #10 set = 1'b0 ; reset = 1'b0;
        #10 set = 1'b0 ; reset = 1'b1;
        #10 set = 1'b0 ; reset = 1'b0;
        #10 set = 1'b1 ; reset = 1'b0;
        #10 set = 1'b0 ; reset = 1'b0;
        #10;
    end
endmodule