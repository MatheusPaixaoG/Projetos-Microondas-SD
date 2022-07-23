`include "../encoder_nivel2/nivel3/HDL/contador_7_n_reciclavel.v"
`include "../encoder_nivel2/nivel3/HDL/divide_freq.v"
`include "../encoder_nivel2/nivel3/HDL/mux2_to_1.v"
`include "../encoder_nivel2/nivel3/HDL/priority_encoder.v"


module encoder (output wire [3:0] D,
                output wire loadn, pgt_1Hz,
                input wire [9:0] teclado,
                input wire enablen, Hz_100_clock
                );

    wire borda_subida, clear, Hz1_clock; // Fios intermediários de dentro do próprio encoder, que 
                                        // servem para conectar os componentes de nível 3 entre si

    // Configurando o priority_encoder            
    priority_encoder codificador_prioritario(D, loadn, teclado, enablen);
    // Configurando o divide_freq
    divide_freq dividido_por_100(Hz_100_clock, Hz_1_clock);
    // Configurando o contador_7_n_reciclavel
    contador_7_n_reciclavel Atraso(Hz_100_clock, loadn, borda_subida);
    // Configurando o mux2_to_1
    mux2_to_1 MUX(pgt_1Hz, borda_subida, Hz_1_clock, enablen); // Recebe Hz_1_clock de divide_freq e 
                                                            // borda_subida de contador_7_n_reciclavel

endmodule