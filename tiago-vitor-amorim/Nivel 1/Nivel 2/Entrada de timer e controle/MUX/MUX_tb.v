module MUX_tb;
 
    reg A_tb, B_tb, S_tb;
    wire X_tb;
 
    MUX dut( A_tb, B_tb, S_tb, X_tb);
 
    initial begin
        $dumpfile("MUX_tb.vcd");
        $dumpvars(0, MUX_tb);

        A_tb = 1'b0; B_tb = 1'b0; S_tb = 1'b0; #1
        $display("A = %x, B = %x, S = %x, X = %x", A_tb, B_tb, S_tb, X_tb);
        A_tb = 1'b0; B_tb = 1'b1; S_tb = 1'b0; #1
        $display("A = %x, B = %x, S = %x, X = %x", A_tb, B_tb, S_tb, X_tb);
        A_tb = 1'b1; B_tb = 1'b0; S_tb = 1'b0; #1
        $display("A = %x, B = %x, S = %x, X = %x", A_tb, B_tb, S_tb, X_tb);
        A_tb = 1'b1; B_tb = 1'b1; S_tb = 1'b0; #1
        $display("A = %x, B = %x, S = %x, X = %x", A_tb, B_tb, S_tb, X_tb);
        A_tb = 1'b0; B_tb = 1'b0; S_tb = 1'b1; #1
        $display("A = %x, B = %x, S = %x, X = %x", A_tb, B_tb, S_tb, X_tb);
        A_tb = 1'b0; B_tb = 1'b1; S_tb = 1'b1; #1
        $display("A = %x, B = %x, S = %x, X = %x", A_tb, B_tb, S_tb, X_tb);
        A_tb = 1'b1; B_tb = 1'b0; S_tb = 1'b1; #1
        $display("A = %x, B = %x, S = %x, X = %x", A_tb, B_tb, S_tb, X_tb);
        A_tb = 1'b1; B_tb = 1'b1; S_tb = 1'b1; #1
        $display("A = %x, B = %x, S = %x, X = %x", A_tb, B_tb, S_tb, X_tb);
    end
endmodule