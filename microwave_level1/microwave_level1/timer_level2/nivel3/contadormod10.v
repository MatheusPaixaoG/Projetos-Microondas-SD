//contador mod10
//será usado duas vezes no timer
module contadormod10 (
    //variáveis input
    input wire [3:0] data,
    input wire loadn,
    input wire clrn,
    input wire clk,
    input wire en,

    //variáveis input
    output reg [3:0] ones,
    output reg tc,
    output wire zero
);

initial begin
    tc = 0;
end

always @ (negedge clrn)
begin
    ones = 4'b0000;
end

assign zero = (ones == 4'b0000) ? 1'b1 : 1'b0;

always @ (posedge clk)

begin
    if (en) 
        case (ones)
            4'b1001: begin
                ones <= 4'b1000;
                tc <= 1'b0;
            end
            4'b1000: ones <= 4'b0111; 
            4'b0111: ones <= 4'b0110; 
            4'b0110: ones <= 4'b0101; 
            4'b0101: ones <= 4'b0100; 
            4'b0100: ones <= 4'b0011; 
            4'b0011: ones <= 4'b0010; 
            4'b0010: ones <= 4'b0001; 
            4'b0001: begin 
                ones <= 4'b0000;
                tc <= 1'b1;
            end  
            4'b0000: begin
                ones <= 4'b1001;
                tc <= 1'b0;
            end 
            default: ones <= 4'b0000;
        endcase

    else begin
        tc <= 0;

        if(!loadn)
            ones <= data;
        
    end
end
endmodule
