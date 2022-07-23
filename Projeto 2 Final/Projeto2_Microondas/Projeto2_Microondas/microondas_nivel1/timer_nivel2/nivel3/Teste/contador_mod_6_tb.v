`timescale 1ns/1ps
`include "../HDL/contador_mod_6.v"

module Counter_mod_6_tb();

    reg [3:0] data_tb;
    reg clk_tb, clearn_tb, EN_tb, loadn_tb;
    wire [3:0] tens_tb;
    
    Counter_mod_6 UUT(.data(data_tb), .clk(clk_tb), .clearn(clearn_tb), .EN(EN_tb), .loadn(loadn_tb));
    
    // Testa vários possível casos de entrada para o contador_mod_6

    initial 
        begin
            $dumpfile("contador_mod_6_tb.vcd");
            $dumpvars(0, Counter_mod_6_tb);

                clk_tb=0; clearn_tb=1; EN_tb=1; loadn_tb=0; data_tb=0;
            #10 clk_tb=1; clearn_tb=1; EN_tb=1; loadn_tb=0; data_tb=5;
            #10 clk_tb=0; clearn_tb=1; EN_tb=1; loadn_tb=1; data_tb=5;
            #10 clk_tb=1; clearn_tb=1; EN_tb=1; loadn_tb=1; data_tb=0;
            #10 clk_tb=0; clearn_tb=1; EN_tb=1; loadn_tb=1; data_tb=0;
            #10 clk_tb=1; clearn_tb=1; EN_tb=1; loadn_tb=1; data_tb=0;
            #10 clk_tb=0; clearn_tb=1; EN_tb=1; loadn_tb=1; data_tb=0;
            #10 clk_tb=1; clearn_tb=1; EN_tb=1; loadn_tb=1; data_tb=0;
            #10 clk_tb=0; clearn_tb=1; EN_tb=1; loadn_tb=1; data_tb=0;
            #10 clk_tb=1; clearn_tb=1; EN_tb=1; loadn_tb=1; data_tb=0;
            #10 clk_tb=0; clearn_tb=1; EN_tb=1; loadn_tb=1; data_tb=0;
            #10 clk_tb=1; clearn_tb=1; EN_tb=1; loadn_tb=1; data_tb=0;
            #10 clk_tb=0; clearn_tb=1; EN_tb=1; loadn_tb=1; data_tb=0;
            #10 clk_tb=1; clearn_tb=1; EN_tb=1; loadn_tb=1; data_tb=0;
            #10 clk_tb=0; clearn_tb=1; EN_tb=1; loadn_tb=1; data_tb=0;
            #10 clk_tb=1; clearn_tb=1; EN_tb=1; loadn_tb=1; data_tb=0;
            #10 clk_tb=0; clearn_tb=1; EN_tb=1; loadn_tb=1; data_tb=0;
            #10 clk_tb=1; clearn_tb=1; EN_tb=1; loadn_tb=1; data_tb=0;
            #10 clk_tb=0; clearn_tb=1; EN_tb=1; loadn_tb=1; data_tb=0;
            #10 clk_tb=1; clearn_tb=1; EN_tb=1; loadn_tb=1; data_tb=0;
            #10 clk_tb=0; clearn_tb=1; EN_tb=1; loadn_tb=1; data_tb=0;
            #10 clk_tb=1; clearn_tb=0; EN_tb=1; loadn_tb=1; data_tb=0;
            #10 clk_tb=0; clearn_tb=1; EN_tb=1; loadn_tb=1; data_tb=0;
            #10 clk_tb=1; clearn_tb=1; EN_tb=1; loadn_tb=1; data_tb=0;
            #10 clk_tb=0; clearn_tb=1; EN_tb=1; loadn_tb=1; data_tb=0;
            #10 clk_tb=1; clearn_tb=1; EN_tb=1; loadn_tb=1; data_tb=0;
            #10 clk_tb=0; clearn_tb=1; EN_tb=1; loadn_tb=1; data_tb=0;
            #10 clk_tb=1; clearn_tb=1; EN_tb=1; loadn_tb=1; data_tb=0;
            #10 clk_tb=0; clearn_tb=1; EN_tb=1; loadn_tb=1; data_tb=0;
            #10 clk_tb=1; clearn_tb=1; EN_tb=1; loadn_tb=1; data_tb=0;
            #10 clk_tb=0; clearn_tb=1; EN_tb=1; loadn_tb=1; data_tb=0;
            #10 clk_tb=1; clearn_tb=1; EN_tb=1; loadn_tb=1; data_tb=0;
            #10 clk_tb=0; clearn_tb=1; EN_tb=1; loadn_tb=1; data_tb=0;
            #10;
        end
endmodule