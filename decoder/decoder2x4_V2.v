/*
    2x4 Decoder 
    Using always+case blocks
    2-bit input
*/
`timescale 1ns / 1ps
module decoder(
    input a, 
    input b,
    output reg [3:0] out);
    
    always @(a, b) begin
        if (a == 1'b0 && b == 1'b0)
            out = 4'b1110;
        else if (a == 1'b0 && b == 1'b1)
            out = 4'b1101;
        else if (a == 1'b1 && b == 1'b0)
            out = 4'b1011;
        else if (a == 1'b1 && b == 1'b1)
            out = 4'b0111;
        else
            out = 4'bxxxx; // Optional, unreachable
    end
endmodule
