`timescale 1ns/1ps
`include "sr_latch.v"

module sr_latch_tb ();

    reg S;
    reg R;
    wire Q;

    sr_latch dut (S, R, Q);

    initial begin
        
         $dumpfile("sr_latch.vcd");
         $dumpvars(0, sr_latch_tb);

         S = 0; R = 0; #10;
         S = 1; R = 0; #10;
         S = 0; R = 0; #10;
         S = 0; R = 1; #10;
         S = 0; R = 0; #10;

    end
    
endmodule