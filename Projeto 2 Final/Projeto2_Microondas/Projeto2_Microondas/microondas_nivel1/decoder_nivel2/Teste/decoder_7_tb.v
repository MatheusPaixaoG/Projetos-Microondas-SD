`timescale 1ns/1ps
`include "../HDL/decoder_7.v"

module decoder_7_tb();
 
    reg [3:0] sec_ones_tb,sec_tens_tb,min_tb;

    wire [6:0] sec_ones_segs_tb, sec_tens_segs_tb, mins_segs_tb;
    
    
    decoder_7 DUT(.sec_ones(sec_ones_tb), .sec_tens(sec_tens_tb), .min(min_tb));
    
/*
O teste feito insere os valores de 0 a 9 na entrada sec_ones do decoder_7.v
*/    
    initial
    begin
        $dumpfile("decoder_7_tb.vcd");
        $dumpvars(0, decoder_7_tb);
            sec_ones_tb = 0; sec_tens_tb = 0; min_tb = 0; 
        #10 sec_ones_tb = 1; sec_tens_tb = 0; min_tb = 0; 
        #10 sec_ones_tb = 2; sec_tens_tb = 0; min_tb = 0; 
        #10 sec_ones_tb = 3; sec_tens_tb = 0; min_tb = 0; 
        #10 sec_ones_tb = 4; sec_tens_tb = 0; min_tb = 0; 
        #10 sec_ones_tb = 5; sec_tens_tb = 0; min_tb = 0; 
        #10 sec_ones_tb = 6; sec_tens_tb = 0; min_tb = 0; 
        #10 sec_ones_tb = 7; sec_tens_tb = 0; min_tb = 0; 
        #10 sec_ones_tb = 8; sec_tens_tb = 0; min_tb = 0; 
        #10 sec_ones_tb = 9; sec_tens_tb = 0; min_tb = 0;
        #10;
    end
endmodule