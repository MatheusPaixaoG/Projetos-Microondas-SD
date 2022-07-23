module timer_controler_TB;
  reg [0:9] keypad_TB;
  reg enablen_TB;
  wire clk_TB;
  
  wire [0:3] bcd_TB;
  wire loadn_TB;
  wire pgt_1Hz;

  clock clock(.clk(clk_TB)); //simula o clock

  timer_controler enc (.keypad(keypad_TB), .enablen(enablen_TB),.clk_100Hz(clk_TB), .bcd(bcd_TB), .loadn(loadn_TB),.pgt_1Hz(pgt_1Hz));

  initial
    begin
      $dumpfile("timer_controler_TB.vcd");
      $dumpvars(0, timer_controler_TB);
      
      //$monitor("bcd: %d , loadn: %b , pgt: %b",bcd_TB, loadn_TB, pgt_1Hz);
		
      enablen_TB = 1'b0;
      keypad_TB = 10'b0000000001; //0
      #1 keypad_TB = 10'b0000000010; //1
      #10 keypad_TB = 10'b0000000100; //2
      #1 keypad_TB = 10'b0000001000; //3
      #1 keypad_TB = 10'b0000000000; //0
      #10 keypad_TB = 10'b0000010000; //4
      #10 keypad_TB = 10'b0000100000; //5
      #1 keypad_TB = 10'b0000000000; //0
      #1 keypad_TB = 10'b0001000000; //6
      #1 keypad_TB = 10'b0010000000; //7
      #10 keypad_TB = 10'b0100000000; //8
      #1 keypad_TB = 10'b1000000000; //9
      #1 keypad_TB = 10'b1111111111; //INVÁLIDA

      #1 enablen_TB = 1'b1; //ENABLE INATÍVO

      #1;
      #1;

    end
endmodule

module clock(output reg clk);
  initial
    begin
      clk=0;
    end

  always @(clk)
    begin
      #1
      clk<=~clk;
    end
endmodule
