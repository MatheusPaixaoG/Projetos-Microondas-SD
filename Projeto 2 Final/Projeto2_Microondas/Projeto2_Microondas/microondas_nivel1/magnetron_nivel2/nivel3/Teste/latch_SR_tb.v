`timescale 1ns/1ps
`include "../HDL/latch_SR.v"

module latch_SR_tb();

    reg S_tb,R_tb;
    wire Q_tb;
    
    latch_SR UUT(.S(S_tb), .R(R_tb), .Q(Q_tb));
    
    initial 
        begin
            $dumpfile("latch_SR_tb.vcd");
            $dumpvars(0, latch_SR_tb);

                 R_tb=0; S_tb=0; // Testando todos os casos de entrada do latch
            #10  R_tb=0; S_tb=1; 
            #10  R_tb=1; S_tb=0; 
            #10  R_tb=1; S_tb=1;
            #10  R_tb=1; S_tb=0;  
            #10  R_tb=0; S_tb=0; 
            #10  R_tb=0; S_tb=0; 
            #10;
        end
endmodule