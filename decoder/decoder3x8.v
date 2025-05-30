/*
    3x8 Decoder
    
    Using 2 2x4 decoders
*/

`timescale 1ns / 1ps
module decoder_top(
    input a,
    input b,
    input c,
    input en,
    output [7:0] out
    );
        // Internal connections
        wire [3:0] y0, y1; // outputs of the two 2x4 muxes

    // Decoder when c = 0, y[3:0]
    decoder d0(
        .en(~c & en),      // enable only if c == 0
        .a(a),
        .b(b),
        .out(y0)
    );

    // Decoder when c = 1, y[7:4]
    decoder d1(
        .en(c & en),       // enable only if c == 1
        .a(a),
        .b(b),
        .out(y1)
    );

    // Combine outputs
    assign out = {y1, y0};
endmodule