module logicQuest (
    input wire startn, stopn, clearn, door_closed, timer_done, 
    output reg S, R
    );
    
    //||=or && = and
    always @(startn, stopn, clearn, door_closed, timer_done) begin
        if(!clearn || !stopn || timer_done || !door_closed) begin
                S   <= 1'b0;
                R <= 1'b1;
                //mag_on = 0
        end
        else if(!startn && door_closed) begin
                S   <= 1'b1;
                R <= 1'b0;
                //mag_on = 1
        end
        else begin
            S   <= 1'b0;
            R <= 1'b0;
        end
    end

endmodule