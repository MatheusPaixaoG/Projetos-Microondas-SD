`timescale 1ns/1ps

module clock (
    input wire enable,
    output reg clk
);

    initial begin
        clk = 1'b0;
        repeat (120) #5 clk = ~ clk;
    end

endmodule