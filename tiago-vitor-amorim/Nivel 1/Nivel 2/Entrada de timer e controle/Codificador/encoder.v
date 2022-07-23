module encoder (output reg [3:0]B, output reg dv,
input wire [9:0]A, input wire en);
always @ (A, en)
begin
    //recebimento do timer
    if (A==1'b1 & en == 0)begin
         B = 4'b0000;//0
         dv = 1'b0;
         end
    else if (A==2'b10 & en == 0)begin
         B = 4'b0001; //1
         dv = 1'b0;
         end
    else if (A==3'b100 & en == 0)begin
         B = 4'b0010; //2
         dv = 1'b0;
         end
    else if (A==4'b1000 & en == 0)begin
         B = 4'b0011; //3
         dv = 1'b0;
         end
    else if (A==5'b10000 & en == 0)begin
         B = 4'b0100; //4
         dv = 1'b0;
         end
    else if (A==6'b100000 & en == 0)begin
         B = 4'b0101; //5
         dv = 1'b0;
         end
    else if (A==7'b1000000 & en == 0)begin
         B = 4'b0110; //6
         dv = 1'b0;
         end
    else if (A==8'b10000000 & en == 0)begin
         B = 4'b0111; //7
         dv = 1'b0;
         end
    else if (A==9'b100000000 & en == 0)begin
         B = 4'b1000; //8
         dv = 1'b0;
         end
    else if (A==10'b1000000000 & en == 0)begin
         B = 4'b1001; //9
         dv = 1'b0;
         end
    else begin
         B = 4'bXXXX;
         dv = 1'b1; 
         end
end   
endmodule
