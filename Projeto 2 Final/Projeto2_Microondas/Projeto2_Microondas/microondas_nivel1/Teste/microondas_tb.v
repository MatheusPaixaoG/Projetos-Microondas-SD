`timescale 1ms/1ps
`include "../HDL/microondas.v"
module microwave_tb();

    reg [9:0] keypad_tb;
    reg clock_tb, door_closed_tb, stopn_tb, clearn_tb, startn_tb;

    wire [6:0] sec_ones_segs_tb, sec_tens_segs_tb, min_segs_tb;
    wire mag_on_tb;

    microwave DUT(.startn(startn_tb), .clearn(clearn_tb), .stopn(stopn_tb), .door_closed(door_closed_tb),
            .keypad(keypad_tb), .clock(clock_tb), .sec_ones_segs(sec_ones_segs_tb),
            .sec_tens_segs(sec_tens_segs_tb), .min_segs(min_segs_tb), .mag_on(mag_on_tb)); 
    integer i;


    initial begin
        $dumpfile("microwave_tb.vcd");
        $dumpvars;

        clock_tb = 1;

        for(i = 0; i < 700005; i=i+1) begin
            #10 clock_tb <= ~clock_tb;
        end
    end

    /*
        Teste 1:
        - O microondas estará com tudo zerado.
        - A porta estará fechada
        - O usuário 'seta' o número 4:47
        - O usuário inicia o micro-ondas
        - O usuário abre a porta
        - O micro ondas para e o contador pausa
        - O usuário fecha a porta e clica em start
        - O microondas vai funcionar normalmente até o tempo acabar
        
        
        Teste 2:
        - O microondas estará com tudo zerado.
        - A porta estará aberta
        - O usuário 'seta' o número 3:92 e o tempo do contador será convertido para 4:32
        - O usuário aperta startn
        - O micro ondas não ligará (A porta está aberta)
        - O usuário fecha a porta e starta o microondas
        - Após 30 segundos min o usuário aperta stop
        - O timer irá parar 
        - Ele inicia o micro ondas para retomar o timer
        - O microondas vai funcionar normalmente até o tempo acabar

        Teste 3:
        - O microondas estará com tudo zerado.
        - A porta estará fechada
        - O usuário apertará o número 2:25
        - O usuário se descuida e aperta a tecla 5 mais de uma vez muito rapidamente (treme) (menos de 40 ms)
        - Apesar da tremida o tempo adicionado no timer será 2:25
        - Inicia o micro-ondas
        - O microondas vai funcionar normalmente até o tempo acabar
    
        Teste 4:
        - O microondas estará com tudo zerado.
        - A porta estará fechada
        - O usuário digitará o número 1:56
        - O usuário pressiona a tecla 5 por 30 segundos e apesar disso, somente um 5 será configurado 
        - Inicia o micro-ondas
        - O microondas funciona normalmente até o tempo acabar.
        
        Teste 5:
        - O microondas estará com tudo zerado.
        - A porta estará fechada
        - O usuário setará o tempo de 2:50.
        - O usuário aperta clearn com micro ondas ainda desligado
        - O temporizador zera.
        - O usuário digitará o número 1:50 e aperta start
        - O usuário aperta a tecla clearn com o micro ondas ligado
        - O timer zera e o microondas para

        Teste 6:
        - O microndas estará com tudo zerado.
        - O usuário setará o tempo de 2:05. 
        - O usuário aperta start
        - O micro ondas será ligado
        - O usuário tentará mudar o tempo com o micro ondas ligado e não conseguirá
        - O microondas funciona normalmente até o tempo acabar.
    */

    initial begin
        
        // Teste 1

        keypad_tb = 10'b0000000000;
        door_closed_tb = 1;
        stopn_tb = 1;
        clearn_tb = 1;
        startn_tb = 1;

        // Digitando o 4
        #1000;
        keypad_tb = 10'b0000010000;
        #1000;
        keypad_tb = 10'b0000000000;

        // Digitando o 4
        #1000;
        keypad_tb = 10'b0000010000;
        #1000;
        keypad_tb = 10'b0000000000;

        // Digitando o 7
        #1000;
        keypad_tb = 10'b010000000;
        #1000;
        keypad_tb = 10'b0000000000;

        // Ligando o micro ondas
        #1000;
        startn_tb = 0;
        #1000;
        startn_tb = 1;

        // Abrindo a porta
        #1000;
        door_closed_tb = 0;
        #1000;

        // Checkar se o contador pausa quando o usuário abre a porta

         // Fechando a porta
        door_closed_tb = 1;
        #1000;

        //Apertando start novamente

        startn_tb = 0;
        #1000;
        startn_tb = 1;
        #600000;
        
    
        // Teste 2
        keypad_tb = 10'b0000000000;
        door_closed_tb = 0;
        stopn_tb = 1;
        clearn_tb = 1;
        startn_tb = 1;

        // Digitando o 3
        #1000;
        keypad_tb = 10'b0000001000;
        #1000;
        keypad_tb = 10'b0000000000;

        // Digitando o 9
        #1000;
        keypad_tb = 10'b1000000000;
        #1000;
        keypad_tb = 10'b0000000000;

        // Digitando o 2
        #1000;
        keypad_tb = 10'b0000000100;
        #1000;
        keypad_tb = 10'b0000000000;

        //Apertando start
        #1000;
        startn_tb = 0;
        #1000;
        startn_tb = 1;
        
        #1000;

        // Fechando a porta
        door_closed_tb = 1;
        #1000;
        //Apertando start
        startn_tb = 0;
        #1000;
        startn_tb = 1;
        

        //Apertando stop
        #30000;
        stopn_tb = 0;
        #1000;
        stopn_tb = 1;
        
        //Checar se o contador para quando o usuário aperta stop

        // Retomando o micro ondas
        #1000;
        startn_tb = 0;
        #1000;
        startn_tb = 1;
        #600000;

        
        // Teste 3

        keypad_tb = 10'b0000000000;
        door_closed_tb = 1;
        stopn_tb = 1;
        clearn_tb = 1;
        startn_tb = 1;

        // Digitando o 2
        #1000;
        keypad_tb = 10'b0000000100;
        #1000;
        keypad_tb = 10'b0000000000;

        // Digitando o 2
        #1000;
        keypad_tb = 10'b0000000100;
        #1000;
        keypad_tb = 10'b0000000000;

        // Digitando o 5
        #1000;
        keypad_tb = 10'b0000100000;
        //Digitando 5 novamente por descuido
        #20;
        keypad_tb = 10'b0000100000;
        #1000;
        
        // (Checar se o timer está setado corretamente)
        

        //Apertando start novamente
        startn_tb = 0;
        #1000;
        startn_tb = 1;
        #600000;


        
        // Teste 4

        keypad_tb = 10'b0000000000;
        door_closed_tb = 1;
        stopn_tb = 1;
        clearn_tb = 1;
        startn_tb = 1;

        // Digitando o 1
        #1000;
        keypad_tb = 10'b0000000010;
        #1000;
        keypad_tb = 10'b0000000000;

        // Digitando o 5 por 30 segundos
        #1000;
        keypad_tb = 10'b0000100000;
        #30000;
        keypad_tb = 10'b0000000000;

        // Digitando o 6
        #1000;
        keypad_tb = 10'b0001000000;
        #1000;
        keypad_tb = 10'b0000000000;

        //Checar se o contador está configurado corretamente (1:56)

        //Apertando start
        #1000;
        startn_tb = 0;
        #1000;
        startn_tb = 1;
        #600000;
      

        // Teste 5
        
        keypad_tb = 10'b0000000000;
        door_closed_tb = 1;
        stopn_tb = 1;
        clearn_tb = 1;
        startn_tb = 1;

        // Digitando o 2
        #1000;
        keypad_tb = 10'b0000000100;
        #1000;
        keypad_tb = 10'b0000000000;

        // Digitando o 5
        #1000;
        keypad_tb = 10'b0000100000;
        #1000;
        keypad_tb = 10'b0000000000;

        // Digitando o 0
        #1000;
        keypad_tb = 10'b0000000001;
        #1000;
        keypad_tb = 10'b0000000000;


        //Apertando a tecla clear

        #1000;
        clearn_tb = 0;
        #1000;
        clearn_tb = 1;
        #1000;

        //Checar se o temporizador está zerado e o timer done está ativado


        // Digitando o 1
        #1000;
        keypad_tb = 10'b0000000010;
        #1000;
        keypad_tb = 10'b0000000000;

        // Digitando o 5
        #1000;
        keypad_tb = 10'b0000100000;
        #1000;
        keypad_tb = 10'b0000000000;

        // Digitando o 0
        #1000;
        keypad_tb = 10'b0000000001;
        #1000;
        keypad_tb = 10'b0000000000;

        //Apertando start
        #1000;
        startn_tb = 0;
        #1000;
        startn_tb = 1;
        #1000;

        //Aperta clearn com o micro ondas ligado

        #1000;
        clearn_tb = 0;
        #1000;
        clearn_tb = 1;
        #600000;
        //Checar se o timer vai zerar e se o micro ondas vai pausar

        // Teste 6
        
        keypad_tb = 10'b0000000000;
        door_closed_tb = 1;
        stopn_tb = 1;
        clearn_tb = 1;
        startn_tb = 1;

        // Digitando o 2
        #1000;
        keypad_tb = 10'b0000000100;
        #1000;
        keypad_tb = 10'b0000000000;

        // Digitando o 0
        #1000;
        keypad_tb = 10'b0000000001;
        #1000;
        keypad_tb = 10'b0000000000;

        // Digitando o 5
        #1000;
        keypad_tb = 10'b0000100000;
        #1000;
        keypad_tb = 10'b0000000000;

        //Apertando start
        #1000;
        startn_tb = 0;
        #1000;
        startn_tb = 1;
        #1000;

        //Tentando mudar o tempo com micro ondas ligado

         // Digitando o 3
        #1000;
        keypad_tb = 10'b0000001000;
        #1000;
        keypad_tb = 10'b0000000000;

        // Digitando o 5
        #1000;
        keypad_tb = 10'b0000100000;
        #1000;
        keypad_tb = 10'b0000000000;

        // Digitando o 0
        #1000;
        keypad_tb = 10'b0000000001;
        #1000;
        keypad_tb = 10'b0000000000;
        #1000;




        


        


    end
    
endmodule