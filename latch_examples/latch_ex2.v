`timescale 1ns / 1ps

module latch_ex2(
    input wire [1:0] sel,
    input wire [3:0] a,
    input wire [3:0] b,
    output reg [3:0] out
);

// Not covering all cases within a case block
    always @(*) begin
        case (sel)
            2'b00: out = a;
            2'b01: out = b;
            // sel = 2'b10 or 2'b11 
        endcase
    end

endmodule