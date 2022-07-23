module div_freq_100hz(input wire CLK_IN, output wire CLK_OUT);
    reg [6:0] counter = 0;
    reg out_1hz = 0;

    assign CLK_OUT = out_1hz;


    always @(posedge CLK_IN) begin

        counter <= counter + 1;

        if (counter == 7'd99) begin

            out_1hz <= 1;
            counter <= 0;

        end
        else begin
            out_1hz <= 0;
        end
    end

endmodule
