`include "mux_2to1.v"

module mux_2to1_tb();
    wire OUT;
    reg SEL;
    reg D0;
    reg D1;

    mux_2to1 dut(SEL, D0, D1, OUT);

    initial begin

        SEL = 1'b0; #10;
        D0 = 1'b0; D1 = 1'b0; #10;
        D0 = 1'b0; D1 = 1'b1; #10;
        D0 = 1'b1; D1 = 1'b0; #10;
        D0 = 1'b1; D1 = 1'b1; #10;
        D0 = 1'b0; D1 = 1'b0; #10;

        SEL = 1'b1; #10;
        D0 = 1'b0; D1 = 1'b0; #10;
        D0 = 1'b0; D1 = 1'b1; #10;
        D0 = 1'b1; D1 = 1'b0; #10;
        D0 = 1'b1; D1 = 1'b1; #10;
        D0 = 1'b0; D1 = 1'b0; #10;

    end

    initial begin
        $dumpfile("mux_2to1_tb.vcd");
        $dumpvars(0, mux_2to1_tb);
    end

endmodule