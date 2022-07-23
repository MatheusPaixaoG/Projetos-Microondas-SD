`include "encoder_dec_to_bcd.v"

module encoder_dec_to_bcd_tb();
    reg [9:0] DEC;
    reg EN;
    wire [3:0] BCD;
    wire DATA_VALID;

    encoder_dec_to_bcd dut(DEC, EN, BCD, DATA_VALID);

    initial begin
        EN = 0; #10;
        DEC = 10'b0000000001; #10;
        DEC = 10'b0000000010; #10;
        DEC = 10'b0000000100; #10;
        DEC = 10'b0000001000; #10;
        DEC = 10'b0000010000; #10;
        DEC = 10'b0000100000; #10;
        DEC = 10'b0001000000; #10;
        DEC = 10'b0010000000; #10;
        DEC = 10'b0100000000; #10;
        DEC = 10'b1000000000; #10;

        DEC = 10'b0000000000; #10;

        EN = 1; #10;
        DEC = 10'b0000000001; #10;
        DEC = 10'b0000000010; #10;
        DEC = 10'b0000000100; #10;
        DEC = 10'b0000001000; #10;
        DEC = 10'b0000010000; #10;
        DEC = 10'b0000100000; #10;
        DEC = 10'b0001000000; #10;
        DEC = 10'b0010000000; #10;
        DEC = 10'b0100000000; #10;
        DEC = 10'b1000000000; #10;

        DEC = 10'b0000000000; #10;

        EN = 0; #10;
        DEC = 10'b0000100001; #10;
        DEC = 10'b0000000010; #10;
        DEC = 10'b1000000100; #10;
        DEC = 10'b0000001000; #10;
        DEC = 10'b0000010000; #10;
        DEC = 10'b0000101000; #10;
        DEC = 10'b0001000000; #10;
        DEC = 10'b0010000000; #10;
        DEC = 10'b0100000000; #10;
        DEC = 10'b1000000001; #10;

        DEC = 10'b0000000000; #10;
    end


    initial begin
        $dumpfile("encoder_dec_to_bcd_tb.vcd");
        $dumpvars(0, encoder_dec_to_bcd_tb);
    end

endmodule
