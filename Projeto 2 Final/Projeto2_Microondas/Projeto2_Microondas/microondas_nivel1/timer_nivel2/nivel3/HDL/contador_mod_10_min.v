module Counter_mod_10_min(output wire [3:0] ones, 
                      output wire tc,zero, 
                      input wire clk, clearn, EN, loadn, carry_out,
                      input wire [3:0] data, ones_sec);
  // Registradores para que seja possível realizar a atribuição, que é feita de forma sequencial
  // dentro do bloco always
  reg [3:0] current_state;
  assign ones = current_state;
  // O carry_out serve para indicar ao contador dos minutos que é necessário adicionar 1 unidade
  // para que o resultado mostrado no visor seja o certo
  assign zero = (current_state == 0) ? 1 : 0;
  assign tc = ((current_state == 0)& EN) ? 1 : 0;

  // O próximo always verifica a borda de subida do clock e tanto a borda de subida quanto a de 
  // descida do carry_out, para saber quando ele se torna 1 e quando ele se torna 0, para que 
  // seja possível configurar o valor inicial do contador dos minutos de forma correta
  always @(posedge clk or posedge carry_out or negedge carry_out)
    begin
      if (EN) begin
        if (current_state == 4'b0000) begin
          // Se o contador chegar a zero, reinicia a contagem
          current_state <= 4'b1001;
        end
        else begin
          // Se o contador ainda não for 0, diminui em 1 unidade
          current_state <= current_state - 1;
        end
      end
      else begin
        if (!loadn) begin
          // A verificação do carry_out ocorre na condição de carregar o estado inicial do contador
          if (carry_out == 1)
            // Se o carry_out for 1, ele precisa adicionar 1 aos dados
            current_state <= data + 1;
          else
            // Se o carry_out for 0, ele não adiciona 1 aos dados
            current_state <= data;
        end
      end
    end
  // O próximo always verifica o clear de forma assíncrona, para zerar o contador caso a tecla seja
  // apertada
  always @(negedge clearn) begin
    if (!clearn) begin
      current_state <= 4'b0000;
    end
  end
endmodule