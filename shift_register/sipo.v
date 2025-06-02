/*
    Shift Register but for parallel
    4-bit, right shift

    AKA a SIPO (Serial in, Paralel Out)
*/
`timescale 1ns / 1ps
module sipo(
    input DIN,
    input CLK,
    input RST,
    output [3:0] DOUT  
    );

    // Internal wires for FF connections
    wire [2:0] Q_INT;

    dff FF1(.D(DIN),      .CLK(CLK), .RST(RST), .Q(DOUT[0]));       // First bit in
    dff FF2(.D(DOUT[0]),  .CLK(CLK), .RST(RST), .Q(DOUT[1]));
    dff FF3(.D(DOUT[1]),  .CLK(CLK), .RST(RST), .Q(DOUT[2]));
    dff FF4(.D(DOUT[2]),  .CLK(CLK), .RST(RST), .Q(DOUT[3]));       // Last bit in
endmodule