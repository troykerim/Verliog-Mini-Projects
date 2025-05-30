/*
    8 x 3 Encoder
*/
`timescale 1ns / 1ps
module encoder8x3(
    input en,
    input [7:0] in,
    output [2:0] out
    );
    // internal connections
    wire upper_active = |in[7:4];  // If any of upper bits are active
    wire [1:0] low_out, high_out;

    // Lower half in[3:0]
    encoder4x2 E0 (
        .en(en & ~upper_active),
        .in(in[3:0]),
        .out(low_out)
    );

    // Upper half in[7:4]
    encoder4x2 E1 (
        .en(en & upper_active),
        .in(in[7:4]),
        .out(high_out)
    );

    // if upper is active, combine
    assign out = upper_active ? {1'b1, high_out} : {1'b0, low_out};
endmodule