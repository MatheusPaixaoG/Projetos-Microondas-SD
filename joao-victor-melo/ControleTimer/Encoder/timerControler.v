module timerControler (output reg [3:0] bcd, output reg loadn, input wire [0:9] keypad, input wire enablen);
    
    always @(keypad, enablen)
    begin
        case(keypad)
        10'b0000000001:begin
            bcd <= 4'b0000; //0
            loadn <= 1'b0; //ATIVO EM NÍVEL BAIXO
        end
        10'b0000000010:begin
            bcd <= 4'b0001; //1
            loadn <= 1'b0; //ATIVO EM NÍVEL BAIXO
        end
        10'b0000000100:begin
            bcd <= 4'b0010; //2
            loadn <= 1'b0; //ATIVO EM NÍVEL BAIXO
        end
        10'b0000001000:begin
            bcd <= 4'b0011; //3
            loadn <= 1'b0; //ATIVO EM NÍVEL BAIXO
        end
        10'b0000010000:begin
            bcd <= 4'b0100; //4
            loadn <= 1'b0; //ATIVO EM NÍVEL BAIXO
        end
        10'b0000100000:begin
            bcd <= 4'b0101; //5
            loadn <= 1'b0; //ATIVO EM NÍVEL BAIXO
        end
        10'b0001000000:begin
            bcd <= 4'b0110; //6
            loadn <= 1'b0; //ATIVO EM NÍVEL BAIXO
        end
        10'b0010000000:begin
            bcd <= 4'b0111; //7
            loadn <= 1'b0; //ATIVO EM NÍVEL BAIXO
        end
        10'b0100000000:begin
            bcd <= 4'b1000; //8
            loadn <= 1'b0; //ATIVO EM NÍVEL BAIXO
        end
        10'b1000000000:begin  
            bcd <= 4'b1001; //9
            loadn <= 1'b0; //ATIVO EM NÍVEL BAIXO
        end
        default:begin
            bcd <= 4'b1111; //INVÁLIDA
            loadn <= 1'b1; //INATIVO EM NÍVEL ALTO
        end
        endcase

        case(enablen)
            1'b1:begin //ENABLE INATÍVO EM NÍVEL ALTO
                bcd <= 4'b1111; //INVÁLIDA
                loadn <= 1'b1; //INATIVO EM NÍVEL ALTO
            end
        endcase
    end
endmodule