/*
    1x4 Demux
    1 input, 2 select lines, 4 outputs
*/
`timescale 1ns / 1ps
module demux1_4(
    input [1:0] sel,
    input a,
    output reg y0, y1, y2, y3
    );
    always @(*) begin 
        case(sel)
        // using hex numbers for simplification
            2'h0: {y0, y1, y2, y3} = {a, 3'b0};
            2'h1: {y0, y1, y2, y3} = {1'b0, a, 2'b0};
            2'h2: {y0, y1, y2, y3} = {2'b0, a, 1'b0};
            2'h3: {y0, y1, y2, y3} = {3'b0, a};
        endcase
    end
endmodule
