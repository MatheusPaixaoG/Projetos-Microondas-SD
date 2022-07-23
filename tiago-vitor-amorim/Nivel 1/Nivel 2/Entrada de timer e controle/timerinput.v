`include "Codificador/encoder.v"
`include "Counter_Non_Recycling/counternonrecycling.v"
`include "Div_100/div.v"
`include "MUX/MUX.v"

module timer_input(
    output wire [3:0] D,
    output wire pgt_1Hz,
    output wire loadn,

    input reg [9:0] key,
    input reg clk,
    input reg enablen
);

    wire data_valid, Hz_1, outro;

    encoder U1 (.B(data_valid), .dv(loadn), .A(key), .en(enablen));

    div U2 (.divs(Hz_1), .clk(clk));

    counternonrecycling U3 (.clk(clk), .rst(data_valid), .q(outro));

    MUX U4 (.A(Hz_1), .B(outro), .S(enablen), .X(pgt_1Hz));

endmodule

