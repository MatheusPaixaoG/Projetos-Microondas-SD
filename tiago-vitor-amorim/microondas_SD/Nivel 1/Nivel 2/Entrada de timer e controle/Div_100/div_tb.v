`timescale 1ns/1ps
`include "div.v"
module div_tb ();
reg Clk;
wire Divs;
div DUT(.divs(Divs),.clk(Clk));
initial begin
    $dumpfile("div_tb.vcd");
    $dumpvars(0, div_tb);
    Clk = 1; 
    repeat(200)
    begin
       #5 Clk = ~Clk; 
    end 
end  
endmodule