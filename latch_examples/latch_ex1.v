`timescale 1ns / 1ps

module latch_ex1(
    input wire data,
    input wire enable,
    output reg out
);

    always @(*) begin
        if (enable)
            out = data;
        // Missing else (latch will be made)
    end
endmodule