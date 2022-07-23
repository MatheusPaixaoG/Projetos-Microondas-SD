module magnetron_logico (
    input wire startn,
    input wire stopn,
    input wire clearn,
    input wire door_closed,
    input wire timer_done,
    output reg S,
    output reg R
);

initial begin
    S = 1'b0;
    R = 1'b0;
end

always @(startn, stopn, clearn, door_closed, timer_done) begin
    // Se stopn, clearn, ou door_closed é LOW ou timer_done é HIGH,
    // o valor do latch deve ser 0
    if (clearn == 1'b0 || stopn == 1'b0 || door_closed == 1'b0 || timer_done == 1'b1) begin
        S = 1'b0;
        R = 1'b1;
    end
    // Se o valor de startn for LOW, o valor do latch deve ser 1
    else if (startn == 1'b0) begin
        S = 1'b1;
        R = 1'b0;
    end
    // Em outras situações, o latch deve manter seu valor
    else begin
        S = 1'b0;
        R = 1'b0;
    end
end
    
endmodule