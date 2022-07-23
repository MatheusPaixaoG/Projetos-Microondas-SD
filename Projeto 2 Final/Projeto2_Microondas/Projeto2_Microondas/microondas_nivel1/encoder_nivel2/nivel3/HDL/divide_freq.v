module divide_freq (input wire clock,
                    output wire Hz1);

    reg [6:0] contador = 7'b0000000; 
    reg freq_1Hz = 0;
    assign Hz1 = freq_1Hz;

    always @(posedge clock) begin
        contador <= contador + 1; // "contador" será incrementado a cada borda positiva do relógio
        if (contador == 7'd99) begin // Quando contador=99, ele terá sido incrementado para 100
            freq_1Hz <= 1; // contador=100 indica que já foram 100 bordas positivas do relógio e se passou 1 segundo
            contador <= 0; // Para reiniciar o divisor de frequência, contador volta a ser 0
        end
        else begin
             freq_1Hz <= 0; // Se "contador" não for 100, então não se passou mais 1 segundo e a saída não pode ser 1
        end
    end 

endmodule