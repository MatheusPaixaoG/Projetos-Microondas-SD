`timescale 1ns/1ps
`include "microwave.v"
`include "clock.v"

module microwave_tb ();

    reg [9:0] keypad;
    wire clock;
    reg startn;
    reg stopn;
    reg clearn;
    reg door_closed;
    wire mag_on;
    wire [6:0] blank_digits;
    wire [6:0] sec_ones_segs;
    wire [6:0] sec_tens_segs;
    wire [6:0] min_segs;
    reg en;

    initial begin
        en = 1'b1;
    end

    clock c(en, clock);
    microwave dut (keypad, clock, startn, stopn, clearn, door_closed, mag_on, blank_digits, sec_ones_segs, sec_tens_segs, min_segs);

    initial begin

        $dumpfile("microwave.vcd");
        $dumpvars(0, microwave_tb);

        // Limpando o visor
        keypad = 9'b000000000; startn = 1; stopn = 1; clearn = 0; door_closed = 1; #15;
        // Um botão do keypad está sendo pressionado
        keypad = 9'b000000001; startn = 1; stopn = 1; clearn = 1; door_closed = 1; #15;
        // Um botão do keypad está sendo pressionado
        keypad = 9'b000000010; startn = 1; stopn = 1; clearn = 1; door_closed = 1; #15;
        // Um botão do keypad está sendo pressionado
        keypad = 9'b000000100; startn = 1; stopn = 1; clearn = 1; door_closed = 1; #15;
        // Start é pressionado
        keypad = 9'b000000000; startn = 0; stopn = 1; clearn = 1; door_closed = 1; #15;
        // Espera
        keypad = 9'b000000000; startn = 1; stopn = 1; clearn = 1; door_closed = 1; #100;
        // Stop é pressionado
        keypad = 9'b000000000; startn = 1; stopn = 0; clearn = 1; door_closed = 1; #15;
        // Espera
        keypad = 9'b000000000; startn = 1; stopn = 1; clearn = 1; door_closed = 1; #100;
        // Start é pressionado
        keypad = 9'b000000000; startn = 0; stopn = 1; clearn = 1; door_closed = 1; #15;
        // Espera
        keypad = 9'b000000000; startn = 1; stopn = 1; clearn = 1; door_closed = 1; #100;
        // A porta é aberta
        keypad = 9'b000000000; startn = 1; stopn = 1; clearn = 1; door_closed = 0; #15;
        // Espera
        keypad = 9'b000000000; startn = 1; stopn = 1; clearn = 1; door_closed = 1; #100;

        en = 1'b0;

    end
    
endmodule