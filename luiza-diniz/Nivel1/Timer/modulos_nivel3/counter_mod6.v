module counter_mod6 (input wire [3:0] data, input wire loadn, input wire clearn, input wire clock, input wire en, output reg [3:0] digit, output wire tc, output wire zero);

    assign tc = ((digit == 4'b0000) && en);
    assign zero = (digit === 4'b0000 || digit === 4'bXXXX) ? 1'b1 : 1'b0;

    initial begin
        digit = 4'b0000;    
    end
    
    always @ (negedge clearn) begin
        digit <= 4'b0000;
    end

    always @(posedge clock) begin

        if (en) begin
            case (digit)

                4'b1001: digit <= 4'b1000;
                4'b1000: digit <= 4'b0111;
                4'b0111: digit <= 4'b0110;
                4'b0110: digit <= 4'b0101;

                4'b0101: digit <= 4'b0100;
                4'b0100: digit <= 4'b0011;
                4'b0011: digit <= 4'b0010;
                4'b0010: digit <= 4'b0001;
                4'b0001: digit <= 4'b0000;

                4'b0000: digit <= 4'b0101;
                default: digit <= 4'b0000;
            endcase
        end
        else if (!loadn) digit <= data;
    end
endmodule
