`include "contador_MOD10.v"
module mod10_tb();
    reg clock_tb, clearn_tb, loadn_tb, en_tb;
    reg [3:0] data_tb;
  	wire [3:0] ones_tb;
    wire tc_tb, zero_tb;
    
  mod10 DUT (.clock(clock_tb), .clearn(clearn_tb), .loadn(loadn_tb), .en(en_tb), .data(data_tb), .ones(ones_tb), .tc(tc_tb), .zero(zero_tb));
    
    integer i;
    
    initial 
        begin

            clock_tb = 0; 
            for (i = 0; i < 200; i = i + 1) 
                #500 clock_tb = ~clock_tb;   

        end

    initial
        begin
            
          $dumpfile("mod10_tb.vcd");
          $dumpvars(0,mod10_tb);
          

            clearn_tb = 1;
            en_tb = 0;

            loadn_tb = 0;
            data_tb = 9;
            #1000 loadn_tb = 1;

            #9000;

            en_tb = 1;

            #15000;

            en_tb = 0;

            #5000;

            clearn_tb = 0;

            #5000;

            clearn_tb = 1;

            en_tb = 1;

            #15000;
    
            en_tb = 0;

        end
        
endmodule