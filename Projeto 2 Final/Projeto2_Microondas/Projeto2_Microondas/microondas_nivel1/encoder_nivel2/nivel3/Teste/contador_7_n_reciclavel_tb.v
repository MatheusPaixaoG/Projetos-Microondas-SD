`timescale 1ns/1ps
`include "../HDL/contador_7_n_reciclavel.v"

module contador_7_n_reciclavel_tb();

reg Clock_tb, Clear_tb;
wire saida_tb;

contador_7_n_reciclavel UUT (.Clock(Clock_tb),.Clear(Clear_tb),.saida(saida_tb));

always #5 Clock_tb = ~Clock_tb; // Troca o sinal do clock a cada 5ns

always #80 Clear_tb = ~Clear_tb; // Troca o sinal do clear a cada 80ns, para testar o funcionamento

initial begin
    $dumpfile("contador_7_n_reciclavel_tb.vcd");
    $dumpvars;
    Clock_tb = 0;
    Clear_tb = 0;
    #300 $finish;
end

always @(posedge Clock_tb) begin
    $display("Clock_tb = %d | Clear_tb = %d | Saida = %d", Clock_tb, Clear_tb, saida_tb);
end
endmodule