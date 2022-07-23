module encoder_dec_to_bcd(input wire [9:0] DEC, input wire EN_N,
                          output reg [3:0] BCD, output wire LOAD_N);

    assign LOAD_N = (EN_N) | (DEC == 10'b0000000000);

    always @(DEC) begin

        if(!EN_N) begin
            casex (DEC)
                10'b0000000001: BCD = 4'b0000;
                10'b000000001x: BCD = 4'b0001;
                10'b00000001xx: BCD = 4'b0010;
                10'b0000001xxx: BCD = 4'b0011;
                10'b000001xxxx: BCD = 4'b0100;
                10'b00001xxxxx: BCD = 4'b0101;
                10'b0001xxxxxx: BCD = 4'b0110;
                10'b001xxxxxxx: BCD = 4'b0111;
                10'b01xxxxxxxx: BCD = 4'b1000;
                10'b1xxxxxxxxx: BCD = 4'b1001;
            default:
                BCD = 4'b0000;
            endcase
        end
    end
endmodule
