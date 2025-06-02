/*
    Basic Shift Register
    4-bit, right shift
*/
`timescale 1ns / 1ps
module shift_register(
    input DIN,
    input CLK,
    input RST,
    output DOUT
    );

    // Internal Connections between 4 registers (FFs)
    wire [2:0] Q_INT;

    dff FF1(.D(DIN),      .CLK(CLK), .RST(RST), .Q(Q_INT[0]));
    dff FF2(.D(Q_INT[0]), .CLK(CLK), .RST(RST), .Q(Q_INT[1]));
    dff FF3(.D(Q_INT[1]), .CLK(CLK), .RST(RST), .Q(Q_INT[2]));
    dff FF4(.D(Q_INT[2]), .CLK(CLK), .RST(RST), .Q(DOUT));
endmodule
