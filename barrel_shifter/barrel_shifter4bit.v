/*
    4-Bit Barrel Shifter
    2 stages of Muxes needed to shift by 3.
*/
`timescale 1ns / 1ps
module barrel_shifter4bit(
    input [3:0] DIN,
    input [1:0] SEL,
    output [3:0] DOUT
    );
    
    // Internal wires between stages 
    wire [3:0] in;
    
    // Stage 1
    mux2to1 M1(.A(1'b0), .B(DIN[0]), .SEL(SEL[0]), .OUT(in[0]));
    mux2to1 M2(.A(DIN[0]), .B(DIN[1]), .SEL(SEL[0]), .OUT(in[1]));
    mux2to1 M3(.A(DIN[1]), .B(DIN[2]), .SEL(SEL[0]), .OUT(in[2]));
    mux2to1 M4(.A(DIN[2]), .B(DIN[3]), .SEL(SEL[0]), .OUT(in[3]));
    
    
    // Stage 2 (shift by 2 bits)
    mux2to1 M5(.A(1'b0), .B(in[0]), .SEL(SEL[1]), .OUT(DOUT[0]));
    mux2to1 M6(.A(1'b0), .B(in[1]), .SEL(SEL[1]), .OUT(DOUT[1]));
    mux2to1 M7(.A(in[0]), .B(in[2]),   .SEL(SEL[1]), .OUT(DOUT[2]));
    mux2to1 M8(.A(in[1]), .B(in[3]),   .SEL(SEL[1]), .OUT(DOUT[3]));
    
    /*
    SEL = 00 Shift by 0 bits (No change) DIN = 1001, DOUT = 1001
    SEL = 01 Shift by 1 bits             DIN = 1001, DOUT = 0010
    SEL = 10 Shift by 2 bits             DIN = 1001, DOUT = 0100
    SEL = 11 Shift by 3 bits              DIN = 1001, DOUT = 1000
    */

endmodule
