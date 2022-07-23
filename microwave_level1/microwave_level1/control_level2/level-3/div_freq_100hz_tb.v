`include "div_freq_100hz.v"

module div_freq_100hz_tb();

    reg CLK_IN;
    wire CLK_OUT;

    div_freq_100hz dut(CLK_IN, CLK_OUT);

    initial begin

        CLK_IN = 0;

    end

    always #5 CLK_IN = ~CLK_IN;


    initial begin
        $dumpfile("div_freq_100hz_tb.vcd");
        $dumpvars(0, div_freq_100hz_tb);
        #10000 $finish();
    end



endmodule