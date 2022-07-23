module sr_latch (
    input wire S,
    input wire R,
    output reg Q
);

initial begin
    Q = 1'b0;
end

always @(S, R) begin
    if (S == 1'b1)
        Q = 1'b1;
    else if (R == 1'b1)
        Q = 1'b0;
end
    
endmodule