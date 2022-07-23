`include "Timer/modulos_nivel3/counter_mod6.v"
`include "Timer/modulos_nivel3/counter_mod10.v"

module timer (input wire [3:0] data,input wire loadn,input wire clearn,input wire clock,input wire en,output wire [3:0] sec_ones, sec_tens, mins,output wire zero);

    wire en_sec_tens, en_mins;
    wire zero_sec_ones, zero_sec_tens, zero_sec_mins;

    counter_mod10 seconds_ones(.loadn(loadn),.clearn(clearn),.clock(clock),.en(en),.data(data),.tc(en_sec_tens),.zero(zero_sec_ones),.digit(sec_ones));

    counter_mod6 seconds_tens(.loadn(loadn),.clearn(clearn),.clock(clock),.en(en_sec_tens),.data(sec_ones),.tc(en_mins),.zero(zero_sec_tens),.digit(sec_tens));

    counter_mod10 minutes(.loadn(loadn),.clearn(clearn),.clock(clock),.en(en_mins),.data(sec_tens),.zero(zero_sec_mins),.digit(mins));
    
    assign zero = zero_sec_ones && zero_sec_tens && zero_sec_mins;
endmodule
