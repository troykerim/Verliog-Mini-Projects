`timescale 1ns / 1ps

module latch_ex3(
    input wire [1:0] state,
    output reg out
);

// Incomplete FSM state coverage
    always @(*) begin
        if (state == 2'b00)
            out = 1'b1;
        // state = 01, 10, 11 are out not assigned 
    end

endmodule