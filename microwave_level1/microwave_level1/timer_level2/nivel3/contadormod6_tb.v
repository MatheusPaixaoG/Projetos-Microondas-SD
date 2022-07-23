`include "contadormod6.v" //inclui o módulo que será testado

module contadormod6_tb();

reg [3:0] data;
reg loadn, clrn, clk, en;

wire [3:0] tens;
wire tc, zero;

//vars

contadormod6 dut(data, loadn, clrn, clk, en, tens, tc, zero);

initial clk = 0;
always #10 clk = !clk;

initial begin

    $dumpfile("contadormod6.vcd");//file para represenação de ondas
    $dumpvars(0,contadormod6_tb);
    
end

initial begin // teste

    assign loadn = 1;
    assign en = 0; 
    assign clrn = 1;
    assign data = 4'b0110;

    #5 assign loadn = 0;

    #5 assign loadn = 1;

    #5 assign en = 1; 

    #400 $finish;
end

endmodule