`include "timer_input_control.v"

module timer_input_control_tb();

    reg [9:0] KPAD;
    reg EN_N, CLK_100HZ;
    wire [3:0] D;
    wire LOAD_N, CLK_1HZ;

    always #5 CLK_100HZ = ~CLK_100HZ;

    timer_input_control dut(KPAD, EN_N, CLK_100HZ, D, LOAD_N, CLK_1HZ);

    initial begin
        CLK_100HZ = 0;

        EN_N = 0; KPAD=10'b0000000001; #1000;
        EN_N = 0; KPAD=10'b0000010000; #1000;
        EN_N = 0; KPAD=10'b1000000000; #1000;
        EN_N = 0; KPAD=10'b0100000010; #1000;
        EN_N = 1; KPAD=10'b0000000001; #1000;
        EN_N = 1; KPAD=10'b0000010000; #1000;
        EN_N = 1; KPAD=10'b1000000000; #1000;
        EN_N = 1; KPAD=10'b0100000010; #1000;
        #200;

        $finish();
    end

    initial begin
        $dumpfile("timer_input_control_tb.vcd");
        $dumpvars(0, timer_input_control_tb);


    end
endmodule
