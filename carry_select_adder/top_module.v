/*
    4-bit Carry Select Adder
*/
`timescale 1ns / 1ps
module top_module(A, B, CIN, SUM, CARRY);
    input [3:0] A,B;
    input CIN;
    output [3:0] SUM;
    output CARRY;

    // Internal wires
    wire [3:0] s0,s1;
    wire c0,c1;

    ripple_carry_adder rca1(
        .A(A[3:0]),
        .B(B[3:0]),
        .CIN(1'b0),
        .SUM(s0[3:0]),
        .CARRY(c0));

    ripple_carry_adder rca2(
        .A(A[3:0]),
        .B(B[3:0]),
        .CIN(1'b1),
        .SUM(s1[3:0]),
        .CARRY(c1));
    // Sum Muxes
    mux2to1 #(4) ms0(
        .in0(s0[3:0]),
        .in1(s1[3:0]),
        .sel(CIN),
        .out(SUM[3:0]));
    // Carry Mux
    mux2to1 #(1) mc0(
        .in0(c0),
        .in1(c1),
        .sel(CIN),
        .out(CARRY));
endmodule