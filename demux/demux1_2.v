/*
    1x2 Demux
    1 input, 1 select line, 2 outputs
*/
`timescale 1ns / 1ps
module demux1_2(
    input sel,
    input a,
    output y0, y1
    );
    assign {y0,y1} = sel ? {1'b0, a} : {a, 1'b0};
endmodule
