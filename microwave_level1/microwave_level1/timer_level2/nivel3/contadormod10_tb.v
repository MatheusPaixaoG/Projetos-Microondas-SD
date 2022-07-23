`include "contadormod10.v"
//inclui o módulo do contador no file
module contadormod10_tb();
//vars
reg [3:0] data;
reg loadn, clrn, clk, en;

wire [3:0] ones;
wire tc, zero;

contadormod10 dut (data, loadn, clrn, clk, en, ones, tc, zero);//instancia as varíaveis do contador

initial clk = 0;
always #10 clk = !clk;

initial begin

    assign loadn = 1;
    assign en = 0; 
    assign clrn = 1;
    assign data = 4'b0110;

    #5 assign loadn = 0;

    #5 assign loadn = 1;

    #5 assign en = 1; 

    #400 $finish;
end

initial begin
    $monitor("simtime = %g,data =%b, loadn =%b, clrn =%b, clk =%b, en =%b, ones =%b, tc =%b, zero =%b", $time,data, loadn, clrn, clk, en, ones, tc, zero);
    $dumpfile("contadormod10.vcd");//file para representação de ondas
    $dumpvars(0,contadormod10_tb);
end

endmodule
