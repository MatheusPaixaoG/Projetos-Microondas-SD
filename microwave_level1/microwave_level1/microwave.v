`include "timer_level2/timer.v"
`include "magnetron_level2/magnetron.v"
`include "decodificador_level2/decodificador.v"
`include "control_level2/timer_input_control.v"

module microwave (
    input wire [9:0] keypad,
    input wire clock,
    input wire startn,
    input wire stopn,
    input wire clearn,
    input wire door_closed,
    output reg mag_on,
    output reg [6:0] blank_digits,
    output wire [6:0] sec_ones_segs,
    output wire [6:0] sec_tens_segs,
    output wire [6:0] min_segs
);

    wire mag_on_wire, zero_wire;
    wire [3:0] D_wire;
    wire clock_1hz_wire, loadn_wire;
    wire [3:0] minutes_wire, tens_secs_wire, secs_wire;

    initial begin
        blank_digits = 6'b111111;
    end

    always @(mag_on_wire) begin
        mag_on = mag_on_wire;
    end

    magnetron mag(startn, stopn, clearn, door_closed, zero_wire, mag_on_wire);
    timer_input_control tic(keypad, mag_on_wire, clock, D_wire, loadn_wire, clock_1hz_wire);
    timer t(minutes_wire, tens_secs_wire, secs_wire, zero_wire, D_wire, clearn, mag_on_wire, loadn_wire, clock_1hz_wire);
    decodificador_hep dec(secs_wire, tens_secs_wire, minutes_wire, sec_ones_segs, sec_tens_segs, min_segs);

endmodule