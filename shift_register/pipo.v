`timescale 1ns / 1ps
module pipo(
    input CLK,
    input RST,
    input [3:0] DIN,
    output [3:0] DOUT
);

    dff DFF0 (.D(DIN[0]), .CLK(CLK), .RST(RST), .Q(DOUT[0]));
    dff DFF1 (.D(DIN[1]), .CLK(CLK), .RST(RST), .Q(DOUT[1]));
    dff DFF2 (.D(DIN[2]), .CLK(CLK), .RST(RST), .Q(DOUT[2]));
    dff DFF3 (.D(DIN[3]), .CLK(CLK), .RST(RST), .Q(DOUT[3]));
endmodule