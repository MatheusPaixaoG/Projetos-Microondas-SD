module decoder7seg_TB;
   reg [3:0] x_TB, y_TB, z_TB;
   wire [6:0] x_segs_TB, y_segs_TB, z_segs_TB;

   decoder7seg_f decoder7seg_TB (.min(x_TB), .sec_tens(y_TB), .sec_ones(z_TB),
      .min_segs(x_segs_TB), .sec_tens_segs(y_segs_TB), .sec_ones_segs(z_segs_TB));

   initial
    begin
      $dumpfile("decoder7seg.vcd");
      $dumpvars(0, decoder7seg_TB);

      x_TB = 4'b0000; //0
      y_TB = 4'b0001; //1
      z_TB = 4'b0010; //2

      #1 x_TB = 4'b0001; //1
         y_TB = 4'b0010; //2
         z_TB = 4'b0011; //3

      #1 x_TB = 4'b0010; //2
         y_TB = 4'b0011; //3
         z_TB = 4'b0100; //4

      #1 x_TB = 4'b0011; //3
         y_TB = 4'b0100; //4
         z_TB = 4'b0101; //5

      #1 x_TB = 4'b0100; //4
         y_TB = 4'b0101; //5
         z_TB = 4'b0110; //6

      #1 x_TB = 4'b0101; //5
         y_TB = 4'b0110; //6
         z_TB = 4'b0111; //7

      #1 x_TB = 4'b0110; //6
         y_TB = 4'b0111; //7
         z_TB = 4'b1000; //8

      #1 x_TB = 4'b0111; //7
         y_TB = 4'b1000; //8
         z_TB = 4'b1001; //9

      #1 x_TB = 4'b1000; //8
         y_TB = 4'b1001; //9
         z_TB = 4'b0000; //0

      #1 x_TB = 4'b1001; //9
         y_TB = 4'b0000; //0
         z_TB = 4'b0001; //1

      #1 x_TB = 4'b1111; //INVÁLIDA
         y_TB = 4'b1010; //INVÁLIDA
         z_TB = 4'b1101; //INVÁLIDA

      #1;
    
   end
endmodule