module mux_2to1 (input SEL, D0, D1, output reg OUT);

    always @(SEL or D0 or D1) begin

        if (SEL)
            OUT = D1;
        else
            OUT = D0;
        
    end
    
endmodule