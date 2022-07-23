module Counter_mod_10(output wire [3:0] ones, 
                      output wire tc,zero, 
                      input wire clk, clearn, EN, loadn,
                      input wire [3:0] data);

  // Registradores para que seja possível realizar a atribuição, que é feita de forma sequencial
  // dentro do bloco always
  reg [3:0] current_state;
  assign ones = current_state;
  // O zero só pode ser 1 quando o estado atual desse contador é 0, ou seja, quando ele tiver
  // chegado em 0
  assign zero = (current_state == 0) ? 1 : 0;
  // O tc só pode ser 1 quando o contador tiver chegado a 0 e o enable for 1
  assign tc = ((current_state == 0)& EN) ? 1 : 0;

  always @(posedge clk)
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