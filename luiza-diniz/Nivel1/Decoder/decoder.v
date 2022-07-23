module decoder (input [3:0] sec_ones, sec_tens, mins, output [6:0] ones_saida, tens_saida, mins_saida, mins_tens_saida);
    
    assign mins_saida = (mins === 4'b0000) ? 7'b000_0000 :
                        (mins === 4'b0001) ? 7'b011_0000 :
                        (mins === 4'b0010) ? 7'b110_1101 :
                        (mins === 4'b0011) ? 7'b111_1001 :
                        (mins === 4'b0100) ? 7'b011_0011 :
                        (mins === 4'b0101) ? 7'b101_1011 :
                        (mins === 4'b0110) ? 7'b001_1111 :
                        (mins === 4'b0111) ? 7'b111_0000 :
                        (mins === 4'b1000) ? 7'b111_1111 :
                        (mins === 4'b1001) ? 7'b111_0011 :
                        7'b000_0000;
    
    assign tens_saida = ((sec_tens === 4'b0000 || sec_tens === 4'bXXXX) && (mins === 4'b0000 || mins === 4'bXXXX)) ? 7'b000_0000 : // 0 a esquerda
                        (sec_tens === 4'b0000) ? 7'b111_1110 :
                        (sec_tens === 4'b0001) ? 7'b011_0000 :
                        (sec_tens === 4'b0010) ? 7'b110_1101 :
                        (sec_tens === 4'b0011) ? 7'b111_1001 :
                        (sec_tens === 4'b0100) ? 7'b011_0011 :
                        (sec_tens === 4'b0101) ? 7'b101_1011 :
                        (sec_tens === 4'b0110) ? 7'b001_1111 :
                        (sec_tens === 4'b0111) ? 7'b111_0000 :
                        (sec_tens === 4'b1000) ? 7'b111_1111 :
                        (sec_tens === 4'b1001) ? 7'b111_0011 :
                        7'b000_0000;

    assign ones_saida = ((sec_ones === 4'b0000 || sec_ones === 4'bXXXX) && (sec_tens === 4'b0000 || sec_tens === 4'bXXXX) && (mins === 4'b0000 || mins === 4'bXXXX)) ? 7'b000_0000 : // 0 a esquerda
                        (sec_ones === 4'b0000) ? 7'b111_1110 :
                        (sec_ones === 4'b0001) ? 7'b011_0000 :
                        (sec_ones === 4'b0010) ? 7'b110_1101 :
                        (sec_ones === 4'b0011) ? 7'b111_1001 :
                        (sec_ones === 4'b0100) ? 7'b011_0011 :
                        (sec_ones === 4'b0101) ? 7'b101_1011 :
                        (sec_ones === 4'b0110) ? 7'b001_1111 :
                        (sec_ones === 4'b0111) ? 7'b111_0000 :
                        (sec_ones === 4'b1000) ? 7'b111_1111 :
                        (sec_ones === 4'b1001) ? 7'b111_0011 :
                        7'b000_0000;

    assign mins_tens_saida = 7'b000_0000;
endmodule