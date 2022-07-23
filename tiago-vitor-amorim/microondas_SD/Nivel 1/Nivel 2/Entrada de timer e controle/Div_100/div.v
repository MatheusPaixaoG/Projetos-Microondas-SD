module div (divs, clk);
 
    input wire clk;

    output wire divs;

    reg fim = 0;
    reg [6:0] reg_count = 0;

    assign divs = fim;
    
    always @ (posedge clk) 
    begin
        reg_count <= reg_count + 1; 
        if (reg_count == 7'b1100011)
        begin
            fim <= 1;
            reg_count <= 0;
        end
        else
        begin
            fim <= 0;
        end        
    end
 
endmodule
