`timescale 1ms/1ps
`include "../HDL/encoder.v"

module encoder_tb(); 

    reg  [9:0] teclado_tb;
    reg enablen_tb, Hz_100_clock_tb; 
    wire [3:0] D_tb;
    wire loadn_tb, pgt_1Hz_tb;

    
    integer i;
    

    encoder enc(.D(D_tb), .loadn(loadn_tb), .pgt_1Hz(pgt_1Hz_tb), .teclado(teclado_tb), .enablen(enablen_tb), .Hz_100_clock(Hz_100_clock_tb));

    initial begin
        $dumpfile("encoder_tb.vcd");
	    $dumpvars(0,encoder_tb);

        enablen_tb = 0; // enablen_tb inicial é 0, então ele já vai ativar, pois é ativo em nível baixo
        Hz_100_clock_tb = 1; // Para testar, o clock inicial foi 1 e ele ficará alternando
        teclado_tb = 10'b0000000000; // Estado inicial do teclado

        for(i = 0; i < 2200; i=i+1) begin
            #5 Hz_100_clock_tb <= ~Hz_100_clock_tb; // Alterna o relógio a cada 50ps
        end
        
    end

    initial begin
        #500 teclado_tb = 10'b0000000000; // Cada um desses é um dígito sendo clicado
        #500 teclado_tb = 10'b0000000001;
        #500 teclado_tb = 10'b0000000000;
        #500 teclado_tb = 10'b0000000010;
        #500 teclado_tb = 10'b0000000000;
        #500 teclado_tb = 10'b0000000100;
        #500 teclado_tb = 10'b0000000000;
        #500 teclado_tb = 10'b0000001000;
        #500 teclado_tb = 10'b0000000000;
        #500 teclado_tb = 10'b0000010000;
        #500 teclado_tb = 10'b0000000000;
        #500 teclado_tb = 10'b0000100000;
        #500 teclado_tb = 10'b0000000000;
        #500 teclado_tb = 10'b0001000000;
        #500 teclado_tb = 10'b0000000000;
        #500 teclado_tb = 10'b0010000000;
        #500 teclado_tb = 10'b0000000000;
        #500 teclado_tb = 10'b0100000000;
        #500 teclado_tb = 10'b0000000000;
        #500 teclado_tb = 10'b1000000000; enablen_tb = 1; // No enablen_tb desativa no final
    end

endmodule