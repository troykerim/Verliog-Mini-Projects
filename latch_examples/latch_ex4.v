`timescale 1ns / 1ps

module latch_ex4(
    input wire a,
    input wire b,
    output reg y
);
// Nested if's with out full coverage
    always @(*) begin
        if (a) begin
            if (b)
                y = 1'b1;
            // b == 0, y not assigned
        end
        // a == 0, not assigned
    end

endmodule