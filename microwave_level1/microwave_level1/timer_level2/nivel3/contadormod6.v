//módulo contadormod6
module contadormod6 (
    input wire [3:0] data,
    input wire loadn,
    input wire clrn,
    input wire clk,
    input wire en,

    output reg [3:0] tens,
    output reg tc,
    output wire zero
);//declaração de vars

initial begin
    tc = 0;
end

always @ (negedge clrn)
begin
    tens = 4'b0000;
end

assign zero = (tens == 4'b0000) ? 1'b1 : 1'b0;

always @ (posedge clk)

begin
    if (en) 
        case (tens)
            4'b1001: tens <= 4'b1000;
            4'b1000: tens <= 4'b0111; 
            4'b0111: tens <= 4'b0110; 
            4'b0110: tens <= 4'b0101; 
            4'b0101: tens <= 4'b0100; 
            4'b0100: tens <= 4'b0011; 
            4'b0011: tens <= 4'b0010; 
            4'b0010: tens <= 4'b0001;
            4'b0001: begin 
                tens <= 4'b0000;
                tc <= 1'b1;
            end  
            4'b0000: begin
                tens <= 4'b0101;
                tc <= 1'b0;
            end 
            default: tens <= 4'b0000;
        endcase
    
    else begin 
        tc <= 0;

        if(!loadn)
            tens <= data;

    end
end
    
endmodule
