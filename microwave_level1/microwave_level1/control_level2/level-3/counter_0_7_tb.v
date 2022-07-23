`include "counter_0_7.v"

module counter_0_7_tb();

    reg CLK, CLEAR;
    wire OUT;

    counter_0_7 dut(CLK, CLEAR, OUT);

    always #0.5 CLK = ~CLK;

    initial begin
        
        CLK = 0;

        CLEAR = 1;
        #2;

        CLEAR = 0;
        #2;
        CLEAR = 1;
        #2;
        CLEAR = 0;
        #20;

        CLEAR = 1;
        #10;

        $finish();
    end

    initial begin
        $dumpfile("counter_0_7.vcd");
        $dumpvars(0, counter_0_7_tb);
    end
endmodule