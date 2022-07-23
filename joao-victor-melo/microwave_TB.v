`timescale 1ms/1ms
`include "microwave.v"

module microwave_TB;
    reg startn_TB, stopn_TB, clearn_TB, door_closed_TB;
    reg [0:9] keypad_TB;
    wire [6:0] sec_ones_segs_TB, sec_tens_segs_TB, min_segs_TB, blank_digit_TB;
    wire mag_on_TB;

    wire clk_100Hz_TB;

    clock clock(.clk(clk_100Hz_TB));

    microwave microwave_TB (.sec_ones_segs(sec_ones_segs_TB), .sec_tens_segs(sec_tens_segs_TB), .min_segs(min_segs_TB), 
                            .blank_digit(blank_digit_TB), .mag_on(mag_on_TB), .keypad(keypad_TB), .clk_100Hz(clk_100Hz_TB), 
                            .startn(startn_TB), .stopn(stopn_TB), .clearn(clearn_TB), .door_closed(door_closed_TB));

    initial begin
        $dumpfile("microwave.vcd");
        $dumpvars(0, microwave_TB);

        stopn_TB = 1'b1; //INATÍVO
        startn_TB = 1'b1; //INATÍVO
        clearn_TB = 1'b1; //INATÍVO
        door_closed_TB = 1'b1; //PORTA FECHADA
        keypad_TB = 10'b0000000000; //NENHUM BOTÃO NUMÉRICO PRESSIONADO

        #50  keypad_TB = 10'b0000000010; //1 PRESSIONADO (1s)
        #50  keypad_TB = 10'b0000000000;
        #50  keypad_TB = 10'b0000000001; //0 PRESSIONADO (10s)
        #50  keypad_TB = 10'b0000000000;
        #50  keypad_TB = 10'b0100000000; //8 PRESSIONADO (1min 08s)
        #50  keypad_TB = 10'b0000000000; //NENHUM BOTÃO NUMÉRICO PRESSIONADO
        #200  startn_TB = 1'b0; //BOTÃO START PRESSIONADO (INICIA O TIMER DE 1min 08s)

        #50  startn_TB = 1'b1; //BOTÃO START NÃO PRESSIONADO (CONTINUA O TIMER)

        #37950 stopn_TB = 1'b0; //BOTÃO STOP PRESSIONADO (PARA O TIMER EM 30s)
        #50 stopn_TB = 1'b1; //BOTÃO STOP NÃO PRESSIONADO (TIMER CONTINUA PARADO)
        #50 clearn_TB = 1'b0; //BOTÃO CLEAR PRESSIONADO (TIMER ZERA)
        #50 clearn_TB = 1'b1; //BOTÃO CLEAR NÃO PRESSIONADO (TIMER CONTINUA ZERADO)

        #50 keypad_TB = 10'b0010011000; //INVÁLIDA (MAIS DE UM DÍGITO APERTADO)
        #50 keypad_TB = 10'b1100001001; //INVÁLIDA (MAIS DE UM DÍGITO APERTADO)
        #50 keypad_TB = 10'b0000000000; //INVÁLIDA (MAIS DE UM DÍGITO APERTADO)

        #50 keypad_TB = 10'b0000000100; //2 PRESSIONADO (2s)
        #50 keypad_TB = 10'b0000000000;
        #50 keypad_TB = 10'b0001000000; //6 PRESSIONADO (26s)
        #50 keypad_TB = 10'b0000000000;
        #50 door_closed_TB = 1'b0; //PORTA ABERTA
        #50 startn_TB = 1'b0; //BOTÃO START PRESSIONADO (NÃO INICIA O TIMER PQ A PORTA TÁ ABERTA)
        #50 startn_TB = 1'b1; //BOTÃO START NÃO PRESSIONADO

        #50 door_closed_TB = 1'b1; //PORTA FECHADA
        #50 startn_TB = 1'b0; //BOTÃO START PRESSIONADO (INICIA TIMER DE 26s)
        #50 startn_TB = 1'b1; //BOTÃO START NÃO PRESSIONADO

        #50 keypad_TB = 10'b0100000000;
        #50 keypad_TB = 10'b0000000000;

    end
endmodule

module clock(output reg clk);

  integer ct;

  initial
    begin
      clk=0;
      ct=0;
    end

  always @(clk)
    begin
      if (ct < 15000) begin //LIMITE DE 75s NO WAVEFORM
        #5
        clk<=~clk;
        ct<=ct+1; //AUMENTA EM 200 A CADA SEGUNDO
      end
    end
endmodule