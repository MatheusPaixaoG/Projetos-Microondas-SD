`include "Control_Input/modulos_nivel3/count_mod8.v"
`include "Control_Input/modulos_nivel3/div100.v"
`include "Control_Input/modulos_nivel3/encoder.v"
`include "Control_Input/modulos_nivel3/mux_2to1.v"

module control_input (input wire [9:0] keypad,input wire clock, en,

    output wire [3:0] BCD,
    output wire loadn, pgt_1Hz);

    wire clock_div100, F;

    div100  div100(.clock(clock), .clearn(en),.clock_div100(clock_div100));

    encoder encoder(.keypad(keypad), .en(en),.BCD(BCD), .data_valid(loadn));

    counter_mod8 counter(.clearn(loadn), .clock(clock),.F(F));

    mux_2to1 mux(.sel(en), .A(F), .B(clock_div100),.F(pgt_1Hz));

endmodule
