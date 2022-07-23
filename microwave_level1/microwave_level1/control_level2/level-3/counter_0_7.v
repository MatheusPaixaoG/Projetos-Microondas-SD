module counter_0_7(input wire CLK, CLEAR, output reg OUT);

    reg [2:0] actual_state = 0;

    always @(posedge CLK or posedge CLEAR) begin

        if(CLEAR)

            actual_state = 0;
        
        else if (actual_state < 3'd7)

            actual_state = actual_state + 1;

    end

    always @(actual_state) begin
        OUT = actual_state >= 3'd4;
    end

endmodule