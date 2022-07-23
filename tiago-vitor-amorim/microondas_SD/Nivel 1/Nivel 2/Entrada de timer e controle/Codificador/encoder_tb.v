`timescale 1ns/1ps
`include "encoder.v"
module encoder_tb();
reg [9:0] A_tb; 
reg en_tb;
wire [3:0] B_tb;
wire dv_tb;
encoder DUT(.B(B_tb), .dv(dv_tb), .A(A_tb), .en(en_tb));
initial 
    begin
        $dumpfile("encoder.vcd");
        $dumpvars(0, encoder_tb);
        en_tb = 1'b0; A_tb = 1'b1; 
        #10 en_tb = 1'b0; A_tb = 2'b10;
        #10 en_tb = 1'b0; A_tb = 3'b100;
        #10 en_tb = 1'b0; A_tb = 4'b1000;
        #10 en_tb = 1'b0; A_tb = 5'b10000;
        #10 en_tb = 1'b0; A_tb = 6'b100000;
        #10 en_tb = 1'b0; A_tb = 7'b1000000;
        #10 en_tb = 1'b0; A_tb = 8'b10000000;
        #10 en_tb = 1'b0; A_tb = 9'b100000000;
        #10 en_tb = 1'b0; A_tb = 10'b1000000000;
        #10 en_tb = 1'b1; A_tb = 1'b1;
        #10 en_tb = 1'b1; A_tb = 2'b10;
        #10 en_tb = 1'b1; A_tb = 3'b100;
        #10 en_tb = 1'b1; A_tb = 4'b1000;
        #10 en_tb = 1'b1; A_tb = 5'b10000;
        #10 en_tb = 1'b1; A_tb = 6'b100000;
        #10 en_tb = 1'b1; A_tb = 7'b1000000;
        #10 en_tb = 1'b1; A_tb = 8'b10000000;
        #10 en_tb = 1'b1; A_tb = 9'b100000000;
        #10 en_tb = 1'b0; A_tb = 10'b1000000000;
    end
    
endmodule