module ON_OFF_logic (input wire startn, stopn, clearn, door_closed, timer_done, output reg set, reset);

    always @ (*) begin

        if (!door_closed || !stopn || !clearn || timer_done) begin
            set <= 1'b0;
            reset <= 1'b1;
        end

        else if (!startn && door_closed) begin
            set <= 1'b1;
            reset <= 1'b0;
        end
        else begin
            set <= 1'b0;
            reset <= 1'b0;
        end
    end

endmodule