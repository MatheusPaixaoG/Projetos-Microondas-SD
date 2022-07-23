module sr_latch (
    input wire set, reset,
    output reg mag_on
);

//||=or && = and
    always @(set || reset) begin
        if(reset && !set) begin
            mag_on <= 1'b0;
        end
        else if(set && !reset) begin
            mag_on <= 1'b1;
        end
        else if(!set && !reset) begin
            mag_on <= mag_on;
        end
    end
    
endmodule