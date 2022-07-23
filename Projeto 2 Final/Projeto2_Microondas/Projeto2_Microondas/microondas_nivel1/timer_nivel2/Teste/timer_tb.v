`timescale 1ns/1ps
`include "../HDL/timer.v"

module timer_tb ();

    reg [3:0] data_tb;
    reg clk_tb, clearn_tb, EN_tb, loadn_tb;
    wire zero;

    // Inteiro i para que seja possível realizar o loop que troca o valor de clk_tb
    integer i;

    timer UUT(.data(data_tb), .clk(clk_tb), .clearn(clearn_tb), .EN(EN_tb), .loadn(loadn_tb));
    

    initial 
    begin
        $dumpfile("timer_tb.vcd");
        $dumpvars;

        // Troca o valor de clk_tb várias vezes a cada 5000ns
        for(i = 0; i < 3005; i=i+1) 
        begin
            #5000 clk_tb <= ~clk_tb;
        end
    end


    initial begin
        // Configura o loadn_tb, clearn_tb, clk_tb, EN_tb e data_tb iniciais e depois modifica alguns
        // dos valores
        loadn_tb = 0;
        clearn_tb = 1;
        clk_tb = 1;
        EN_tb = 1;
        data_tb = 4'd5;
        #1000;
        loadn_tb = 1;
        #1000;
        clearn_tb = 0;
        #1000;
        clearn_tb = 1;
    end
    
endmodule