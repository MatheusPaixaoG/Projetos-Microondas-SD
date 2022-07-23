module counter_mod8 (input wire clearn,input wire clock,output reg F);

    reg [2:0] count;

    reg active_count;

    always @(posedge clearn) begin
        active_count = 1'b0;
    end

    always @ (negedge clearn) begin
        count <= 3'b000;
        F <= 1'b0;
        active_count = 1'b1;
    end

    always @(posedge clock) begin
        if (active_count) begin
            case (count)
                3'b000: count <= 3'b001;
                3'b001: count <= 3'b010;
                3'b010: count <= 3'b011;
                3'b011: begin
                    count <= 3'b100;
                    F = 1'b1;
                end
                3'b100: count <= 3'b101;
                3'b101: count <= 3'b110;
                3'b110: count <= 3'b111;
                default: count <= count;
            endcase
        end
    end
endmodule