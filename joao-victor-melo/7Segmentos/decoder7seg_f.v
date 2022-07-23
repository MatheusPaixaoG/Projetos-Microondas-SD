module decoder7seg
    (output reg [6:0] x_segs,
     input wire [3:0] x);

    initial begin
        x_segs <= 7'b0000001; //INICIALIZAR COM 0
    end

    always @(x)
    begin
        case(x) //ATIVO EM NÍVEL BAIXO
        4'b0000 : x_segs = 7'b0000001; //0
        4'b0001 : x_segs = 7'b1001111; //1
        4'b0010 : x_segs = 7'b0010010; //2
        4'b0011 : x_segs = 7'b0000110; //3
        4'b0100 : x_segs = 7'b1001100; //4
        4'b0101 : x_segs = 7'b0100100; //5
        4'b0110 : x_segs = 7'b0100000; //6
        4'b0111 : x_segs = 7'b0001111; //7
        4'b1000 : x_segs = 7'b0000000; //8
        4'b1001 : x_segs = 7'b0000100; //9
        default : x_segs = 7'b1111111; //ENTRADA INVÁLIDA
        endcase
    end
endmodule

module decoder7seg_f
    (output wire [6:0] sec_ones_segs, sec_tens_segs, min_segs,
     input wire [3:0] sec_ones, sec_tens, min);

    decoder7seg N0(.x_segs(sec_ones_segs), .x(sec_ones));
    decoder7seg N1(.x_segs(sec_tens_segs), .x(sec_tens));
    decoder7seg N3(.x_segs(min_segs), .x(min));
endmodule